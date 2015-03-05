# docker-phpbb
---
	┌───────────────┐     ┌───────────────┐                               
	│               │     │               │                               
	│mysql_datastore◀━━━━━▶     mysql     |                 
	│               │     │               │                              
	└───────────────┘     └───────△───────┘   ┌──────────────────┐        
	                              │           │                  │   HTTP 
	                              │           │      nginx       ├────◎   
	                              │           │                  │        
	┌───────────────┐     ┌───────▽───────┐   └─────────△────────┘        
	│               │     │               │             │                 
	│nginx_datastore◀━━━━━▶    php-fpm    ◁─────────────┘                 
	│               │     │               │                               
	└───────────────┘     └───────────────┘                               
	                                                                      
	                                                                      
	◀━━━━━━━━▶  volumes-from                                              
	                                                                      
	◁────────▷  link                                                      	
---

Дополнение к <a href="http://blog.derz.co/posts/2015/02/27/chast-11-docker-vvedenie/" target="_blank">серии статей</a> о запуске phpBB с помощью docker.

### Краткое содержание.

Необходимо склонировать репозиторий. Все дальнейшие действия выполнять в корне репозитория.

* Создание контейнеров.  
  * docker build -t mysql_datastore mysql_datastore/  
  * docker build -t nginx_datastore nginx_datastore/  
  * docker build -t php-fpm php-fpm/  
  * docker build -t nginx nginx/  
  * docker pull mysql  

* Запуск контейнеров  
  * docker run --name mysql_datastore mysql_datastore true  
  * docker run --name nginx_datastore nginx_datastore true  
  * docker run --name mysql --volumes-from mysql_datastore \  
  -e MYSQL_ROOT_PASSWORD=YourRootPass -e MYSQL_DATABASE=phpBB \  
  -e MYSQL_USER=phpBBuser -e MYSQL_PASSWORD=PhpbbDbPass -d mysql  
  * docker run --name php-fpm --link mysql:mysql \  
  --volumes-from nginx_datastore -d php-fpm  
  * docker run --name nginx --privileged --link php-fpm:php-fpm \  
  --volumes-from nginx_datastore -p 80:80 -d nginx  

