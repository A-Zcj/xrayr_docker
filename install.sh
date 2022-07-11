#!/bin/bash
rm -fr /etc/Xrayr
git clone https://github.com/A-Zcj/xrayr_docker /etc/Xrayr && cd /etc/Xrayr
sleep 5s
file="./config.yml"
link="http://127.0.0.1:667"
docker_compose_file="./docker-compose.yml"
#输入信息
read -p "请输入容器名：" docker_name
read -p "请输入面板地址：" apihost
read -p "请输入前端面板KEY："  apikey
read -p "请输入节点ID：" nodeid


#写入信息
sed -i "s|$link|$apihost|" $file
sed -i "s|123|$apikey|" $file
sed -i "s|41|$nodeid|" $file
sed -i "s|ooom|$docker_name|" $docker_compose_file

echo "配置完成"
echo "正在启动XrayR Docker Compose" && docker-compose up -d


 
