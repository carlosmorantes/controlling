# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Expense.create(date: '2016-01-03', article: 'REWE', price: 23.45)
Expense.create(date: '2016-01-03', article: 'DM', price: 34, note: 'Forum')
Expense.create(date: '2016-02-03', article: 'Cafe', price: 6.80)
Expense.create(date: '2016-03-03', article: 'N-K', price: 6.20)
Expense.create(date: '2016-03-05', article: 'Artz', price: 46.20, note: 'Beim Kempten')
Expense.create(date: '2016-03-07', article: 'Essen', price: 4.20)
Expense.create(date: '2016-04-03', article: 'REWE', price: 19.16, note: 'WOche-6')
