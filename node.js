select
  date(days.day) as date,
  0 as count
from
  generate_series(now() - interval '3 month',
  now(),
  "1 day"
) days(day);



var db = require('./core/db');

var orders = db('orders as o')
	.select(
		db.raw('date(o.created_at at time zone 'Europe/Moscow') as date'),
		db.raw('count (*)')
	)
	.where(db.raw('o.created_at > date((now() - interval "3 month 1 day"))'))
	.where(db.raw('o.created_at at time zone "Europe/Moscow" > date((now() - interval "3 month"))'))
	.where(db.raw('o.is_cold = 0'))
	.groupBy('date');

var days = db
	.select(
		db.raw("generate_series(now() - interval '3 month', now(), '1 day') days(day)")
	)
	.then(function (r) {console.log(r)} )



db.select(
	db.raw('date(days.day) as date'),
	db.raw('coalesce(0) as count')
)
	.from(db.raw("generate_series(now() - interval '3 month', now(), '1 day') days(day)"))
	.leftJoin(orders.as('o'), db.raw('date(days.day)'), ' o.date')
	.groupBy('days.day')
	.groupBy('o.count')
	.orderBy('date')
	.then(function (r) {console.log(r)});


var daysSelect = db().select(db.raw(days)).then(function (r) {console.log(r)});
var daysSelect = db.select('*').from(db.raw(days)).then(function (r) {console.log(r)});
var daysSelect = db(db.raw(days)).select('*').then(function (r) {console.log(r)});

days.then(function (r) {
    console.log(r)
  })

