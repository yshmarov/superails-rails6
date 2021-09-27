[![Rails Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop-rails)

credentials.yml example
```
google:
  id: 123
  secret: 123

development:
  github:
    id: 123
    secret: 123
  stripe:
    id: pk_test_123
    secret: sk_test_123
    webhook: whsec_123
production:
  github:
    id: 123
    secret: 123
  stripe:
    id: pk_test_123
    secret: sk_test_123
    webhook: whsec_123
aws:
  ses:
    id: 123
    secret: 123
```

re-calculate counter cache (post has many comments, comments_count)
```
Post.find_each { |u| Post.reset_counters(u.id, :comments) }
```

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