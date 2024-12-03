//package com.wssnail.code.v2;
//
//import com.baomidou.mybatisplus.core.exceptions.MybatisPlusException;
//import com.baomidou.mybatisplus.core.toolkit.StringPool;
//import com.baomidou.mybatisplus.generator.AutoGenerator;
//import com.baomidou.mybatisplus.generator.InjectionConfig;
//import com.baomidou.mybatisplus.generator.config.*;
//import com.baomidou.mybatisplus.generator.config.converts.MySqlTypeConvert;
//import com.baomidou.mybatisplus.generator.config.po.TableInfo;
//import com.baomidou.mybatisplus.generator.config.rules.DateType;
//import com.baomidou.mybatisplus.generator.config.rules.DbColumnType;
//import com.baomidou.mybatisplus.generator.config.rules.IColumnType;
//import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
//import org.apache.commons.lang3.StringUtils;
//
//import java.util.ArrayList;
//import java.util.List;
//import java.util.Scanner;
//
//// 演示例子，执行 main 方法控制台输入模块表名回车自动生成对应项目目录中
//public class CodeGenerator {
//
//    /**
//     * <p>
//     * 读取控制台内容
//     * </p>
//     */
//    public static String scanner(String tip) {
//        Scanner scanner = new Scanner(System.in);
//        StringBuilder help = new StringBuilder();
//        help.append("请输入" + tip + "：");
//        System.out.println(help.toString());
//        if (scanner.hasNext()) {
//            String ipt = scanner.next();
//            if (StringUtils.isNotBlank(ipt)) {
//                return ipt;
//            }
//        }
//        throw new MybatisPlusException("请输入正确的" + tip + "！");
//    }
//
//    public static void main(String[] args) {
//        // 代码生成器
//        AutoGenerator mpg = new AutoGenerator();
//
//        // 全局配置
//        GlobalConfig gc = new GlobalConfig();
//        String projectPath = System.getProperty("user.dir");
//        System.out.println(projectPath);
//        //设置生成目录的位置
//        gc.setOutputDir("D://111");
//        //作者的名字
//        gc.setAuthor("snail");
//        gc.setOpen(false);
//        //实体属性 Swagger2 注解
//        gc.setSwagger2(true);
//        //设置生成service文件的格式，放置前面多出一个I
//        gc.setServiceName("%sService");
////        //设置生成serviceimpl文件的格式，放置前面多出一个I
//        gc.setServiceImplName("%sServiceImpl");
//        gc.setControllerName("%sController");
//        gc.setDateType(DateType.ONLY_DATE);
//        mpg.setGlobalConfig(gc);
//
//
//        // 数据源配置
//        DataSourceConfig dsc = new DataSourceConfig();
//        dsc.setTypeConvert(new MySqlTypeConvertCustom());
//        //设置连接数据库的url
//        dsc.setUrl("jdbc:mysql://127.0.0.1:3306/shop-order?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai");
//        // dsc.setSchemaName("public");
//        dsc.setDriverName("com.mysql.jdbc.Driver");
//        dsc.setUsername("root");
//        dsc.setPassword("root");
//        mpg.setDataSource(dsc);
//
//        // 包配置
//        PackageConfig pc = new PackageConfig();
//        pc.setModuleName("wssnail");
//        pc.setParent("com");
//        mpg.setPackageInfo(pc);
//
//
//        // 自定义配置
//        InjectionConfig cfg = new InjectionConfig() {
//            @Override
//            public void initMap() {
//                // to do nothing
//            }
//        };
//
//        // 如果模板引擎是 velocity
//        String templatePath = "/templates/mapper.xml.vm";
//
//        // 自定义输出配置
//        List<FileOutConfig> focList = new ArrayList<>();
//        // 自定义配置会被优先输出
//        focList.add(new FileOutConfig(templatePath) {
//            //将xml文件自动生成到resources的mapper中
//            @Override
//            public String outputFile(TableInfo tableInfo) {
//                // 自定义输出文件名 ， 如果你 Entity 设置了前后缀、此处注意 xml 的名称会跟着发生变化！！
//                return projectPath + "/src/main/resources/mapper/"
//                        + "/" + tableInfo.getEntityName() + "Mapper" + StringPool.DOT_XML;
//            }
//        });
//        cfg.setFileOutConfigList(focList);
//        mpg.setCfg(cfg);
//        // 配置模板
//        TemplateConfig templateConfig = new TemplateConfig();
//        templateConfig.setXml(null);
//        mpg.setTemplate(templateConfig);
//
//        // 策略配置
//        StrategyConfig strategy = new StrategyConfig();
//        strategy.setNaming(NamingStrategy.underline_to_camel);
//        strategy.setColumnNaming(NamingStrategy.underline_to_camel);
//        strategy.setEntityLombokModel(true);
//        strategy.setRestControllerStyle(true);
//        //去除表前缀
//        strategy.setTablePrefix("tb_");
//
//        mpg.setStrategy(strategy);
//        mpg.execute();
//    }
//
//}
//class MySqlTypeConvertCustom extends MySqlTypeConvert implements ITypeConvert {
//    @Override
//    public IColumnType processTypeConvert(GlobalConfig globalConfig, String fieldType) {
//        String t = fieldType.toLowerCase();
//        if (t.contains("tinyint")) {
//            return DbColumnType.INTEGER;
//        }
//        return super.processTypeConvert(globalConfig, fieldType);
//    }
//}
