insert into leads (type_id, offer_id, geo_id, in_time, out_time, in_id, status_id, out_id)
  select 1, 1, 1, '2017-03-12'::timestamp + (interval '1 minute') * s.i, '2017-03-12'::timestamp + (interval '1 minute') * s.i, 1, 3, 2
  from generate_series(1, 24*60*3) as s(i);

insert into leads (type_id, offer_id, geo_id, in_id, status_id, out_id, in_time, out_time)
  select 1, 1, 1, 1, 3, 2, '2017-03-07'::timestamp + (interval '60 minute') * s.i, '2017-03-07'::timestamp + (interval '60 minute') * s.i
  from generate_series(1, 24) as s(i);

insert into leads (type_id, offer_id, geo_id, in_time, out_time, in_id, status_id, out_id)
  select 1, 1, 1, now(), now(), 1, 3, 2;

insert into leads (type_id, offer_id, geo_id, in_time, status_id)
  select 1, 1, 1, now(), 2;

insert into transactions (time, amount, creator_id, user_id, comment)
  select '2017-02-01'::timestamp + (interval '60 minute') * s.i, s.i, 1, 1, 'comment'
	from generate_series(2, 24) as s(i);

insert into transactions (time, amount, user_id, comment)
  select '2017-03-13'::timestamp + (interval '60 minute') * s.i, s.i, 2, 'comment'
	from generate_series(2, 10) as s(i);

insert into lead_transactions (lead_id, transaction_id)
  select s.i, s.i
	from generate_series(10, 20) as s(i);

insert into transactions (time, amount, user_id, comment)
  select '2017-03-13'::timestamp + (interval '60 minute') * s.i, s.i, 2, 'comment'
	from generate_series(2, 10) as s(i);

TRUNCATE leads CASCADE;

email2@world.com

UPDATE connections SET params = '{"mapLeadStatus": "http://all.requestcatcher.com/update","setStatusUrl": "http://all.requestcatcher.com/update", "notifySoldUrl": "http://a.lr-master.safesocks.ru/notify"}' WHERE id = '2';
UPDATE connections SET params = '{"setStatusUrl": "http://all.requestcatcher.com/update", "notifySoldUrl": "http://a.lr-master.safesocks.ru/notify"}' WHERE id = '2';
UPDATE connections SET params = '{"token": "secccret", "sendLeadUrl": "http://master.crm.safesocks.ru/api/orders"}' WHERE id = '1';

UPDATE users SET token = 'token-from-everad-lr_' WHERE id = '1';

insert into in_rules (offer_id, geo_id, in_id, price, currency_id, national_price)
VALUES (1, 1, 1, 10, 1, 10);


update enums set attrs = '{"comment": "Дубликат", "is_trash": "1", "cancellation_reason": 1}' where id = '15';


	Выгрузку сделать только активных (неудалённых) пользователей.

	Сначала группировать по площадке (groups.type_id = ???), потом по группе (groups.type_id = ???).
CSV:
	ФИО
	Email
	Роли
	Страны
	Группы

select u.id, u.name, u.email, g.name as group, u.countries, gt.name as groups
from users as u
	left join user_groups as ug on u.id = ug.user_id
	left join groups as g on ug.group_id = g.id
	left join group_types as gt on g.type_id = gt.id
where u.is_obsolete = 0 and u.id < 60
ORDER BY gt.name;


insert into user_groups(user_id, group_id) VALUES(1, 5);

insert into groups (name, offer_ids, type_id)
  select 'group: ' || s.i, array[s.i, s.i+1], s.i
	from generate_series(1, 10) as s(i);

\Copy (select u.id, u.name, u.email, g.name as group, u.countries, gt.name as groups from users as u left join user_groups as ug on u.id = ug.user_id left join groups as g on ug.group_id = g.id left join group_types as gt on g.type_id = gt.id where u.is_obsolete = 0 and u.id < 60 ORDER BY gt.name ) To 'active_users.csv' With CSV DELIMITER ';';

 docker cp crm-postgres-1:/active_users.csv active_users.csv

npm run ext
	во втором окне делаешь
	curl -X POST "http://127.0.0.1:3000/api/orders" -d "token=123123123&country_code=ru&out_id=1&offer_id=1&lead_price=200&phone=79230000001& name=AurraSing&address=Hoth&id=51&ip=253.253.253.253&partner_id=12&comment=Kakashka&affiliate_id=2" -v

	curl -X POST "http://127.0.0.1:3000/api/orders" -d "token=token-from-everad-lr_&country_code=ee&out_id=1&offer_id=1&lead_price=200&phone=79230000001&name=AurraSing&address=Hoth&id=51&ip=253.253.253.253&partner_id=100&comment=Kakashka&affiliate_id=17" -v
	curl -X POST "http://127.0.0.1:3000/api/orders" -d "token=secccret&country_code=ee&offer_id=1&lead_price=200&phone=79230000001&name=AurraSing&address=Hoth&id=51&ip=253.253.253.253&partner_id=100&comment=Kakashka&affiliate_id=17" -v
	curl -X POST "http://127.0.0.1:3000/api/orders" -d
		"token=token-from-everad-lr&
		country_code=ee&
		offer_id=1&
		lead_price=200&
		phone=79230000001&
		name=AurraSing&
		address=Hoth&
		id=51&
		ip=253.253.253.253&
		partner_id=100&
		comment=Kakashka&
		affiliate_id=17" -v

	только подставляешь свой country_code
	после запускаешь `
	npm run ts
	`