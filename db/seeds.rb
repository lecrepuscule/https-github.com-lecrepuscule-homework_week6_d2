# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Fabricator(:client) do
  name {Faker::Name.name}
  cash_balance {Random.new.rand(1..50000)}
end

Fabricator(:portfolio) do
  name {Faker::Commerce.department}
  divisor {10}
end

10.times {Fabricate(:client)}
10.times {Fabricate(:portfolio)}

yc = YahooFinance::Client.new
stock_data = yahoo_client.quotes(yahoo_client.symbols_by_market('us', 'nasdaq'), [:symbol, :name, :close])

stock_data.each do |stock|
  Stock.create(symbol: stock.symbol, name: stock.name, exchange: "nasdaq", close: stock.close)
end

