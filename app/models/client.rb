class Client < ActiveRecord::Base
  has_many :trades
  has_many :portfolios, through: :trades
end
