#!/bin/bash

# 网关
if [ -f "wssnail-shop-parent/shop-gateway/target/classes/bootstrap.yml" ]; then
  echo 'copying shop-gateway to build path...'
  mkdir -p deploy/shop-gateway/build/target/
  cp wssnail-shop-parent/shop-gateway/target/shop-gateway.jar deploy/shop-gateway/build/target/
  cp wssnail-shop-parent/shop-gateway/target/classes/bootstrap.yml deploy/shop-gateway/build/target/
#  cd deploy/shop-gateway/build/target/
#  find . -type f -exec echo {} \;
fi

# 用户
if [ -f "wssnail-shop-parent/shop-uaa/target/classes/bootstrap.yml" ]; then
  echo 'copying shop-uaa to build path...'
  mkdir -p deploy/shop-uaa/build/target/
  cp wssnail-shop-parent/shop-uaa/target/shop-uaa.jar deploy/shop-uaa/build/target/
  cp wssnail-shop-parent/shop-uaa/target/classes/bootstrap.yml deploy/shop-uaa/build/target/
#  cd deploy/shop-uaa/build/target/
#  find . -type f -exec echo {} \;
fi

# 商品
if [ -f "wssnail-shop-parent/shop-commodity/target/classes/bootstrap.yml" ]; then
  echo 'copying shop-commodity to build path...'
  mkdir -p deploy/shop-commodity/build/target/
  cp wssnail-shop-parent/shop-commodity/target/shop-commodity.jar deploy/shop-commodity/build/target/
  cp wssnail-shop-parent/shop-commodity/target/classes/bootstrap.yml deploy/shop-commodity/build/target/
#  cd deploy/shop-commodity/build/target/
#  find . -type f -exec echo {} \;
fi

# 订单
if [ -f "wssnail-shop-parent/shop-order/target/classes/bootstrap.yml" ]; then
  echo 'copying shop-order to build path...'
  mkdir -p deploy/shop-order/build/target/
  cp wssnail-shop-parent/shop-order/target/shop-order.jar deploy/shop-order/build/target/
  cp wssnail-shop-parent/shop-order/target/classes/bootstrap.yml deploy/shop-order/build/target/
#  cd deploy/shop-order/build/target/
#  find . -type f -exec echo {} \;
fi
