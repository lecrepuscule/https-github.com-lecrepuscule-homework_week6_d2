class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.references :client, index: true, foreign_key: true
      t.references :portfolio, index: true, foreign_key: true
      t.integer :quantity
      t.float :traded_price
      t.integer :deal_id

      t.timestamps null: false
    end
  end
end
