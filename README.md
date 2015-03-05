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
  * docker pull mysql  
  * docker build -t php-fpm php-fpm/  
  * docker build -t nginx nginx/  

