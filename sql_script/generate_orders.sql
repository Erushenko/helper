\connect crm;

set crm.current_user_id = 1;

insert into orders(
	phone, 
	country, 
	landing_id, 
	status,
	created_at, 

	status_invalid_at,
	status_invalid_by,

	first_status_confirmed_at,
	status_confirmed_by,

	status_canceled_at,
	status_canceled_by,

	status_rejected_at,
	status_rejected_by
)
	select 
		case 
			when mod(s.i, 5) = 1 then '+79602805025'
			when mod(s.i, 5) = 2 then '+380989693327'
			when mod(s.i, 5) = 3 then '+77078278999'
			when mod(s.i, 5) = 4 then '+40761331008'
			when mod(s.i, 5) = 0 then '+66819597084'
		end as phone,
		case 
			when mod(s.i, 5) = 1 then 'Россия'
			when mod(s.i, 5) = 2 then 'Украина'
			when mod(s.i, 5) = 3 then 'Казахстан'
			when mod(s.i, 5) = 4 then 'Румыния'
			when mod(s.i, 5) = 0 then 'Таиланд'
		end as country, 
		case
			when mod(s.i, 102) between 14 and 20 then 2
			when mod(s.i, 102) in (21, 25, 26, 31, 32, 33, 35, 36, 50, 53, 54, 55, 62, 70, 85) then 2
			when mod(s.i, 102) != 0 then mod(s.i, 102)
			else 1
		end as landing_id,
		case 
			when mod(s.i, 10) = 0 then 'некорректный'
			when mod(s.i, 10) = 1 then 'подтверждено'
			when mod(s.i, 10) = 2 then 'отправлено'
			when mod(s.i, 10) = 3 then 'ожидается выкуп'
			when mod(s.i, 10) = 4 then 'выкуплено'
			when mod(s.i, 10) = 5 then 'не выкуплено'
			when mod(s.i, 10) = 6 then 'оплачено'
			when mod(s.i, 10) = 7 then 'продан'
			when mod(s.i, 10) = 8 then 'отменено'
			when mod(s.i, 10) = 9 then 'отказ'
		end as status,

		now() - interval '5 days' as created_at,

		case when mod(s.i, 10) = 0 then now() - interval '4 days' end as status_invalid_at,
		case when mod(s.i, 10) = 0 then 61 end as status_invalid_by,

		case when mod(s.i, 10) = 1 then now() - interval '4 days 6 hours' end as first_status_confirmed_at,
		case when mod(s.i, 10) = 1 then 62 end as status_confirmed_by,
		
		case when mod(s.i, 10) = 8 then now() - interval '4 days 5 hours' end as status_canceled_at,
		case when mod(s.i, 10) = 8 then 63 end as status_canceled_by,
		
		case when mod(s.i, 10) = 9 then now() - interval '3 days' end as status_rejected_at,
		case when mod(s.i, 10) = 9 then 68 end as status_rejected_by

	from generate_series(1, 10000) as s(i);


insert into user_groups(user_id, group_id) values
	(61, 5),
	(62, 6),
	(63, 7),
	(68, 5);
