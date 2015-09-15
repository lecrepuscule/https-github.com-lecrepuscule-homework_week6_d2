class Client < ActiveRecord::Base
  has_many :trades
  has_many :portfolios, through: :trades
  has_many :stocks, through: :portfolios
end
