class Portfolio < ActiveRecord::Base
  has_many :portfolio_compositions
  has_many :trades
  has_many :stocks, through: :portfolio_compositions
  has_many :clients, through: :trades


  def value
    compositions = self.stocks
    compositions.inject(0) do |value, stock|
      value += stock.last
    end
  end

  def value_on_close
    compositions = self.stocks
    compositions.inject(0) do |value, stock|
      value += stock.close
    end
  end


end
