#run project

BRANCH=1 docker-compose up --build

#hosts insert
127.0.0.1       1.crm.loc
127.0.0.1       wh.1.crm.loc


#???
server {
       listen 80;
       server_name ~^crm.*$;
       location / {
               proxy_pass http://unix:/var/run/crm-staging/master/nginx.sock:;
       }
}
server {
       listen 80;
       server_name ~^(?<app>.+)\.(?<branch>.+)\.crm\.(?<domain>.+)$;
       location /crm {
               return 301 $scheme://$branch.crm.$domain;
       }
       location / {
               proxy_pass http://unix:/var/run/crm-staging/$branch/nginx.sock:;
               proxy_set_header Host $app.crm.$domain;
       }
}
server {
       listen 80;
       server_name ~^(?<branch>.+)\.crm\.(?<domain>.+)$;
       location /delivery/return-order-products {
               return 301 $scheme://wh.$host/#/return-order-products;
       }
       location / {
               proxy_pass http://unix:/var/run/crm-staging/$branch/nginx.sock:;
               proxy_set_header Host crm.$domain;
       }
}

#clear cache
sudo rm /var/run/crm-staging/1/nginx.sock
clear_crm.sh

#entry parametrs
login: god@li.ke
pas: god@li.ke

#connect to vpn on staging
apt-get install openvpn
tar -xvf maxvovk.tar
cp maxvovk.conf /etc/openvpn/
systemctl reenable openvpn
systemctl start openvpn

http://465.crm.safesocks.ru

ssh ya@crm.safesocks.ru
http://master.crm.safesocks.ru/mq/#/queues

##docker
docker exec -it crm-postgres-1 psql crm crm

##???
set crm.current_user_id=1;



##
#CURL
curl http://1.crm.loc/api/orders -d "token=secccret&phone=88005556734&country_code=ro&landing_id=5&price=9955"

#роль админа / натсройки / прочие натсройки / поля Задержка отправки RO, ч

#роль главный менеджер / заказы / назначить менеджера / godlike
#роль менеджер / обработка / редактировать - подтверждено / заполнить все поля  / добавить товар / Сохранить

добавить товар на склад:
1. Продукты на складе / добавить продукт по стране
2. Склад / найти продукт и принять на склад (поле в дороге на против продукта, ввести колво и поставить галочку в строке продукта в колонке в дороге)
