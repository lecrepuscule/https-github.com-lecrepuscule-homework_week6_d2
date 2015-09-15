class CreatePortfolioCompositions < ActiveRecord::Migration
  def change
    create_table :portfolio_compositions do |t|
      t.references :portfolio, index: true, foreign_key: true
      t.references :stock, index: true, foreign_key: true
      t.float :weight

      t.timestamps null: false
    end
  end
end
