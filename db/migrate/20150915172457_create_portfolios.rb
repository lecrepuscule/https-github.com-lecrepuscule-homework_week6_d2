class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :name
      t.float :divisor

      t.timestamps null: false
    end
  end
end
