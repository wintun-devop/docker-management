### Create Docker Custom Network
- list docker networks
```
docker network ls
```
- Docker custom network creation
```
docker network create CUSTOM_NETWORK_NAME
```
- Check network detail for each docker network
```
docker network inspect NETWORK_ID
```

### Mysql Contain on Custom Docker Network(not port export)
```
docker run --name learn-mysql-8-0-40 --network mynet-1 -e MYSQL_ROOT_PASSWORD=YourRootPassword -d mysql:latest
```
### Mysql Contain on Custom Docker Network(with port export)
```
docker run --name learn-mysql-8-0-40 --network mynet-1 -e MYSQL_ROOT_PASSWORD=YourRootPassword -p 3306:3306 -d mysql:latest
```
- check running conntainer
```
docker ps -a
```
- connect mysql docker
```
docker exec -it MysqlContainerID mysql -u root -p
```
### phpmyadmin
```
docker run --name mysqlwebadmin01 -e PMA_HOST=your_mysql_container_hostname --network CUSTOM-NETWORK -p 8080:80 -d phpmyadmin
```

### Mysql 8.4.3 and AssocitedPHPMyadmin
```
docker run --name dev-mysql-8-4-3 --network mynet-1 -e MYSQL_ROOT_PASSWORD=Abc123Abc123 -p 3306:3306 -d mysql:8.4.3
```
```
docker run --name PhpMyadmin-dev-mysql-8-4-3 -e PMA_HOST=dev-mysql-8-4-3 --network mynet-1 -p 8081:80 -d phpmyadmin
```
### Acces to Docker
- direct access to docker container shell
```
docker exec -it your_container_id_or_name /bin/bash
```
- read only file access 
```
docker exec your_container_id_or_name cat /path/to/file
```

### To enter mysql docker conntainer
```
docker exec -it Your_Container_ID mysql -u your_db_user -p
```
### Build Docker File
```
docker build -t my-image-name .
```
```
docker run -d -p 8080:80 --network my-custom-net --name my-container my-image-name
```

### docker volumes
- create docker volume to custom location
```
docker volume create --driver local --opt type=none --opt o=bind --opt device="G:/docker_volumes/myvol" myvol
```

### PHP 8.4 with apache custom volume
- create cutom docker volume
```
docker volume create --driver local --opt type=none --opt o=bind --opt device="D:/docker_volumes/php84" php84
```
- docker image
```
docker pull php:8.4-apache
```
- run container with custom volume and custom location
```
docker run -d --name php84_app1 --network mynet-1 -p 8082:80 -v D:/docker_volumes/php84/app1/src:/var/www/html php:8.4-apache
```
```
docker exec php84_app1 php -m | findstr /R "mysqli pdo_mysql"
```
```
docker exec php84_app1 php -m | Select-String 'mysqli|pdo_mysql'
```
```
docker exec php84_app1 bash -c "php -m | grep -E 'mysqli|pdo_mysql'"
```


###
```
Get-Item "C:\Users\cloud-wintun\AppData\Local\Docker\wsl\disk\docker_data.vhdx" | Select-Object Length
```
```
Optimize-VHD -Path "C:\Users\cloud-wintun\AppData\Local\Docker\wsl\disk\docker_data.vhdx" -Mode Full
```


### Msql with phpmyadmin
- only one time require
```
docker network create dev-net-1
```
- docker 8 lts
```
docker pull mysql:8.4.6
```
- phpmyadmin latest
```
docker pull phpmyadmin
```
- mysql8.4.6lts with custom data volume
```
docker run --name dev-mysql-8-4-6 --network dev-net-1 -e MYSQL_ROOT_PASSWORD=Abc123Abc123 -p 3307:3306 -v D:\docker_volumes\mysql846-data:/var/lib/mysql -d mysql:8.4.6
```
```
docker run --name phpMyadmin4mysql846 -e PMA_HOST=dev-mysql-8-4-6 --network dev-net-1 -p 8083:80  -d phpmyadmin
```

### Status Check
```
docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Networks}}"
```
