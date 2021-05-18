docker pull mcr.microsoft.com/mssql/server:2019-latest



cd /var
sudo mkdir docker
cd docker
sudo mkdir sql1
cd sql1
sudo mkdir data
sudo mkdir log
sudo mkdir secrets

sudo chmod a+rwx "/var/docker/sql1/data"
sudo chmod a+rwx "/var/docker/sql1/log"
sudo chmod a+rwx "/var/docker/sql1/secrets"

docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=AStrong@Passw0rd" -p 1420:1433 --name sql1 -h sql1 -v "/var/docker/sql1/data:/var/opt/mssql/data" -v "/var/docker/sql1/log:/var/opt/mssql/log" -v "/var/docker/sql1/secrets:/var/opt/mssql/secrets" -d mcr.microsoft.com/mssql/server:2019-latest

docker stop sql1
docker rm sql1




# Write post on how these can make your life hard...

docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=AStrong@Passw0rd" -e "MSSQL_DATA_DIR=/var/docker/sql1/data" -p 1420:1433 --name sql1 -h sql1 -d mcr.microsoft.com/mssql/server:2019-latest -v "/var/docker/sql1/data:/var/opt/mssql/data" -v "/var/docker/sql1/log:/var/opt/mssql/log" -v "/var/docker/sql1/secrets:/var/opt/mssql/secrets"
# to
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=AStrong@Passw0rd" -e "MSSQL_DATA_DIR=/var/docker/sql1/data" -p 1420:1433 --name sql1 -h sql1 -v "/var/docker/sql1/data:/var/opt/mssql/data" -v "/var/docker/sql1/log:/var/opt/mssql/log" -v "/var/docker/sql1/secrets:/var/opt/mssql/secrets" -d mcr.microsoft.com/mssql/server:2019-latest
# to
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=AStrong@Passw0rd" -p 1420:1433 --name sql1 -h sql1 -v "/var/docker/sql1/data:/var/opt/mssql/data" -v "/var/docker/sql1/log:/var/opt/mssql/log" -v "/var/docker/sql1/secrets:/var/opt/mssql/secrets" -d mcr.microsoft.com/mssql/server:2019-latest