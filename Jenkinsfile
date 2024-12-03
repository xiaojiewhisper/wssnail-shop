pipeline {
  agent {
    kubernetes {
      label 'maven'
    }
  }

  stages {
    stage('checkout scm') {
      agent none
      steps {
        git(url: 'http://192.168.139.184:9000/shop/wssnail-shop.git', credentialsId: 'git-user-pwd', changelog: true, poll: false, branch: "$BRANCH")
      }
    }

    stage('unit test') {
      agent none
      steps {
          sh 'cd wssnail-shop-parent &&   mvn clean package -Dmaven.test.skip=true  '
      }
    }

//     stage('sonarqube analysis') {
//       agent none
//       steps {
//         withCredentials([string(credentialsId : "$SONAR_CREDENTIAL_ID" ,variable : 'SONAR_TOKEN' )]) {
//           withSonarQubeEnv('sonarqube') {
//               sh """
//                for service_path in \$(echo \${SERVICE} |sed  's/,/ /g') ; do
//                    service_name=\${service_path#*/}
//                    service_name=\${service_name#*/}
//                    cd \${service_path}
//                    echo "go to path:\${pwd}"
//                    mvn sonar:sonar -Dsonar.projectKey=\${service_name}
//                    echo "mvn sonar:sonar -Dsonar.projectKey=\${service_name}"
//
//                    cd \${WORKSPACE}
//                    echo " go to path : \${WORKSPACE}"
//                    done
//                """
//           }
//         }
//
//         timeout(time: 1, unit: 'HOURS') {
//           waitForQualityGate true
//         }
//
//       }
//     }

    stage('build & push') {
      agent none
      steps {
      sh 'chmod -R 777 . && deploy/copy.sh'
        withCredentials([usernamePassword(passwordVariable : "DOCKER_PASSWORD" ,usernameVariable : "DOCKER_USERNAME",credentialsId : "$DOCKER_CREDENTIAL_ID",)]){
           sh """
            echo "\${DOCKER_PASSWORD}" | docker login \${REGISTRY} -u  "\${DOCKER_USERNAME}" --password-stdin

            for service_path in \$(echo \${SERVICE} |sed 's/,/ /g'); do
                  service_name=\${service_path#*/}
                  service_name=\${service_name#*/}
                  cd deploy/\${service_name}/build

                  if test "\${DOCKERHUB_NAMESPACE}" = "\${DOCKERHUB_NAMESPACE_SNAPSHOT}"; then
                          echo "DOCKERHUB_NAMESPACE is snapshot...."
                          docker build -f Dockerfile -t \${REGISTRY}/\${DOCKERHUB_NAMESPACE}/\${service_name}:SNAPSHOT-\$BUILD_NUMBER .
                          docker push \${REGISTRY}/\${DOCKERHUB_NAMESPACE}/\${service_name}:SNAPSHOT-\${BUILD_NUMBER}
                      else
                          docker build -f Dockerfile -t \${REGISTRY}/\${DOCKERHUB_NAMESPACE}/\${service_name}:SNAPSHOT-\$BUILD_NUMBER .
                          echo "DOCKERHUB_NAMESPACE is release...."
                  fi
                  cd \${WORKSPACE}
             done

             """
        }
      }
    }

    stage('push latest') {
      agent none
      steps {
          sh """
             for service_path in \$(echo \$SERVICE |sed 's/,/ /g'); do
                service_name=\${service_path#*/}
                service_name=\${service_name#*/}
                cd deploy/\${service_name}/build

                docker tag \${REGISTRY}/\${DOCKERHUB_NAMESPACE}/\${service_name}:SNAPSHOT-\${BUILD_NUMBER} \${REGISTRY}/\${DOCKERHUB_NAMESPACE}/\${service_name}:latest
                docker push \${REGISTRY}/\${DOCKERHUB_NAMESPACE}/\${service_name}:latest

                cd \${WORKSPACE}
                done
            """
      }
    }

    stage('deploy to dev') {
      agent none
      when {
          expression {
            return params.TAG_NAME =~ /snapshot.*/
          }
        }
      steps {
        input(id: 'deploy-to-dev', message: 'deploy to dev?')
            sh """
              for service_path in \$(echo \$SERVICE |sed 's/,/ /g'); do
                service_name=\${service_path#*/}
                service_name=\${service_name#*/}
                cd deploy/\${service_name}

                sed -i\'\' "s#REGISTRY#\${REGISTRY}#" deployment.yaml
                sed -i\'\' "s#DOCKERHUB_NAMESPACE#\${DOCKERHUB_NAMESPACE}#" deployment.yaml
                sed -i\'\' "s#APP_NAME#\${service_name}#" deployment.yaml
                sed -i\'\' "s#BUILD_NUMBER#\${BUILD_NUMBER}#" deployment.yaml
                sed -i\'\' "s#REPLICAS#\${REPLICAS}#" deployment.yaml

                kubectl create cm \${service_name}-yml --dry-run=\'client\' -o yaml --from-file=build/target/bootstrap.yml -n ks-wssnail-shop-dev > \${service_name}-configmap.yml

                kubectl apply -f .

                cd \${WORKSPACE}
                done
            """
      }
    }

    stage('push with tag') {
      agent none
      when {
        expression {
          return params.TAG_NAME =~ /v.*/
        }

      }
      steps {
        input(id: 'release-image-with-tag', message: 'release image with tag?')
        withCredentials([usernamePassword(credentialsId : 'git-user-pwd' ,passwordVariable : 'GIT_PASSWORD' ,usernameVariable : 'GIT_USERNAME' ,)]) {
          sh 'git config --global user.email "snail" '
          sh 'git config --global user.name "snail" '
          sh 'git tag -a ${TAG_NAME} -m "${TAG_NAME}" '
          sh 'git push http://${GIT_USERNAME}:${GIT_PASSWORD}@${GIT_REPO_URL}/${GIT_ACCOUNT}/${APP_NAME}.git --tags --ipv4'
        }

        sh """
        for service_path in \$(echo \$SERVICE |sed 's/,/ /g'); do
            service_name=\${service_path#*/}
            service_name=\${service_name#*/}

            docker tag \${REGISTRY}/\${DOCKERHUB_NAMESPACE}/\${service_name}:SNAPSHOT-${BUILD_NUMBER} ${REGISTRY}/\${DOCKERHUB_NAMESPACE}/\${service_name}:${TAG_NAME}
            docker push \${REGISTRY}/\${DOCKERHUB_NAMESPACE}/\${service_name}:${TAG_NAME}
            cd \${WORKSPACE}
            done
        """
      }
    }

    stage('deploy to production') {
      agent none
      when {
        expression {
          return params.TAG_NAME =~ /v.*/
        }
      }

      steps {
              input(id: 'deploy-to-production', message: 'deploy to production?')
                  sh """
                    for service_path in \$(echo \$SERVICE |sed 's/,/ /g'); do
                      service_name=\${service_path#*/}
                      service_name=\${service_name#*/}
                      cd deploy/\${service_name}/prod

                      sed -i\'\' "s#REGISTRY#\${REGISTRY}#" deployment.yaml
                      sed -i\'\' "s#DOCKERHUB_NAMESPACE#\${DOCKERHUB_NAMESPACE}#" deployment.yaml
                      sed -i\'\' "s#APP_NAME#\${service_name}#" deployment.yaml
                      sed -i\'\' "s#BUILD_NUMBER#\${BUILD_NUMBER}#" deployment.yaml
                      sed -i\'\' "s#REPLICAS#\${REPLICAS}#" deployment.yaml
                      sed -i\'\' "s#TAG_NAME#\${TAG_NAME}#" deployment.yaml

                      kubectl create cm \${service_name}-yml --dry-run=\'client\' -o yaml --from-file=../build/target/bootstrap.yml -n ks-wssnail-shop > \${service_name}-configmap.yml
                      kubectl apply -f .

                      cd \${WORKSPACE}
                      done
                  """
           }
    }
  }
  environment {
    APP_NAME = 'wssnail-shop'
    DOCKER_CREDENTIAL_ID = 'harbor-user-pwd'
    REGISTRY = '192.168.139.184:8899'
    GIT_REPO_URL = '192.168.139.184:9000'
    GIT_CREDENTIAL_ID = 'git-user-pwd'
    GIT_ACCOUNT = 'shop'
    SONAR_CREDENTIAL_ID = 'sonarqube-token'
    KUBECONFIG_CREDENTIAL_ID = '30629742-ddae-4c80-a3ad-5807ffc6ff5a'
    DOCKERHUB_NAMESPACE_SNAPSHOT='snapshot'
    DOCKERHUB_NAMESPACE_RELEASE='release'
  }

  parameters {
    extendedChoice name: 'SERVICE', defaultValue:'none', description: '请选择要部署的服务', multiSelectDelimiter:',',type: 'PT_CHECKBOX', value: 'wssnail-shop-parent/shop-gateway,wssnail-shop-parent/shop-uaa,wssnail-shop-parent/shop-commodity,wssnail-shop-parent/shop-order',descriptionPropertyValue:'网关服务,用户中心,商品服务,订单服务'
    choice(name: 'DOCKERHUB_NAMESPACE', choices: ['snapshot', 'release'], description: '请选择部署到哪个镜像仓库')
    choice(name: 'REPLICAS', choices: ['1', '3', '5', '7'], description: '请选择构建后的副本数')
    gitParameter  name :'BRANCH', branchFilter: 'origin/(.*)',defaultValue:'master',description:'请选择要发布的分支',type:'PT_BRANCH'
    string(name: 'TAG_NAME', defaultValue: 'snapshot', description: '部署版本：必须以 v 开头，例如：v1、v1.0.0')
  }

}