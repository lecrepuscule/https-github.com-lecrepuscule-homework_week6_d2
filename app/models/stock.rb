class Stock < ActiveRecord::Base
  has_many :portfolio_compositions
  has_many :portfolios, through: :portfolio_compositions
  has_many :clients, through: :portfolios

  def last
    yahoo_client = YahooFinance::Client.new
    yahoo_client.quotes([self.symbol],[:last_trade_price]).first.last_trade_price.to_f
  end


end
