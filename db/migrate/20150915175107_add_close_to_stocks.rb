class AddCloseToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :close, :float
    remove_column :stocks, :eod_price, :float
  end
end
