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
