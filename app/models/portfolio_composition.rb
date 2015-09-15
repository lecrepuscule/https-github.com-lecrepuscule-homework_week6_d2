class PortfolioComposition < ActiveRecord::Base
  belongs_to :portfolio
  belongs_to :stock
end
