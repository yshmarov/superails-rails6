ed# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
* 

letter opener on cloud9
```
printenv
export BROWSER=/dev/null
export LAUNCHY_DRY_RUN=true
```

create stripe prices
```
Stripe::Product.create(name: 'superails')

Stripe::Price.create(
  product: product,
  currency: 'usd',
  unit_amount: 900,
  recurring: {
    interval: 'month'
  },
  lookup_key: 'pro_monthly'
)

Stripe::Price.create(
  product: product,
  currency: 'usd',
  unit_amount: 9000,
  recurring: {
    interval: 'year'
  },
  lookup_key: 'pro_yearly'
)
```
