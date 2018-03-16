

cd /home/yan/software/tomcat-9.0.1/bin/
./shutdown.sh

cd /home/yan/workspace/interview-hotfix
git pull -v --progress origin
mvn package
cp -R target/interview /home/yan/software/tomcat-9.0.1/webapps/
cd /home/yan/software/tomcat-9.0.1/bin/

./startup.sh 
