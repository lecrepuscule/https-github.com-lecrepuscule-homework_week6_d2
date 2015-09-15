class Stock < ActiveRecord::Base
  has_many :portfolio_compositions
  has_many :portfolios, through: :portfolio_compositions
end
