class Trade < ActiveRecord::Base
  belongs_to :client
  belongs_to :portfolio
end
