insert into leads (type_id, offer_id, geo_id, in_time, out_time, in_id, status_id, out_id)
  select 1, 1, 1, '2017-02-15'::timestamp + (interval '1 minute') * s.i, '2017-02-15'::timestamp + (interval '1 minute') * s.i, 1, 3, 2
  from generate_series(1, 24*60*3) as s(i);


insert into leads (type_id, offer_id, geo_id, in_id, status_id, out_id, in_time, out_time)
  select 1, 1, 1, 1, 3, 2, '2017-02-27'::timestamp + (interval '60 minute') * s.i, '2017-02-28'::timestamp + (interval '60 minute') * s.i
  from generate_series(1, 24) as s(i);

TRUNCATE leads CASCADE;

email2@world.com


insert into in_rules (offer_id, geo_id, in_id, price, currency_id, national_price)
VALUES (1, 1, 1, 10, 1, 10);
