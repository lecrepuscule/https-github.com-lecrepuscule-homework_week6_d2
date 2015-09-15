class Portfolio < ActiveRecord::Base
  has_many :portfolio_compositions
  has_many :trades
  has_many :stocks, through: :portfolio_compositions
  has_many :clients, through: :trades
end
