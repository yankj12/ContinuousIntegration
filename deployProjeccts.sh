
echo "开始本次持续集成"
echo `date +'%Y-%m-%d %H:%M:%S'`

echo "开始关闭tomcat"
# 停掉tomcat
cd /home/yan/software/tomcat-9.0.1/bin/
./shutdown.sh
echo "tomcat已经关闭"

echo "准备编译公共依赖包"
# 编译部署公共依赖包

echo "准备编译sso-client公共包"
# 编译安装 sso-client 公共包
cd /home/yan/workspace/sso-client
echo "进入sso-client工作区"
# 更新代码
echo "获取最新代码"
git pull -v --progress origin
# 打包
echo "打包并安装sso-client"
mvn install

echo "sso-client安装结束"
echo "公共依赖包编译部署结束"

echo "准备编译部署ssoweb项目"
# 编译部署ssoweb
# 进入ssoweb工作区
echo "进入ssoweb工作区"
cd /home/yan/workspace/ssoweb
# 更新代码
echo "更新ssoweb代码"
git pull -v --progress origin
# 打包
echo "编译及打包"
mvn package
# 拷贝到服务器工作目录
echo "拷贝安装包到tomcat目录"
cp -R target/ssoweb /home/yan/software/tomcat-9.0.1/webapps/
echo "部署ssoweb项目结束"


echo "准备编译部署workreport项目"
# 编译部署workreport
# 进入workreport工作区
echo "进入workreport工作区"
cd /home/yan/workspace/workreport
# 更新代码
echo "更新workreport代码"
git pull -v --progress origin
# 打包
echo "编译及打包"
mvn package
# 拷贝到服务器工作目录
echo "拷贝安装包到tomcat目录"
cp -R target/workreport /home/yan/software/tomcat-9.0.1/webapps/
echo "部署workreport项目结束"

# 编译部署interview
# 进入interview工作区
echo "进入interview工作区"
cd /home/yan/workspace/interview-hotfix
# 更新代码
echo "更新interview代码"
git pull -v --progress origin
# 打包
echo "编译及打包"
mvn package
# 拷贝到服务器工作目录
echo "拷贝安装包到tomcat目录"
cp -R target/interview /home/yan/software/tomcat-9.0.1/webapps/
echo "部署interview项目结束"

# 启动tomcat
echo "开始启动tomcat"
cd /home/yan/software/tomcat-9.0.1/bin/
./startup.sh
echo "tomcat已经启动"

echo "本次持续集成结束" 
echo `date +'%Y-%m-%d %H:%M:%S'`
