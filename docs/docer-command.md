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

### Mysql Contain on Custom Docker Network
```
docker run --name learn-mysql-8-0-40 --network mynet-1 -e MYSQL_ROOT_PASSWORD=YourRootPassword -d mysql:latest
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