class Client < ActiveRecord::Base
  has_many :trades
  has_many :portfolios, through: :trades
  has_many :stocks, through: :portfolios

  def trade_portfolio(portfolio_id, quantity, deal_id)
    portfolio = Portfolio.find(portfolio_id)
    cash_flow = portfolio.value
    self.cash_balance -= (cash_flow* quantity.to_f)
    self.update(cash_balance: self.cash_balance)
    trade = self.trades.new(quantity: quantity, traded_price: cash_flow, deal_id: deal_id, portfolio: portfolio)
    trade.save
  end

  def total_pnl
    holding_portfolios = self.portfolios
    holding_portfolios.inject(0) do |total_pnl, portfolio|
      total_pnl += pnl(portfolio)
    end
  end

  def pnl portfolio
    portfolio.value_on_close * position(portfolio) - traded_value(portfolio)
  end

  def traded_value portfolio
    trades_on_portfolio = self.trades.where(portfolio_id: portfolio.id)
    trades_on_portfolio.inject(0) {|sum, trade| sum += (trade.quantity * trade.traded_price)}
  end

  def position portfolio
    trades_on_portfolio = self.trades.where(portfolio_id: portfolio.id)
    trades_on_portfolio.inject(0) {|position, trade| position += trade.quantity }
  end 

end
