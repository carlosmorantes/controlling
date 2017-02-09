class CreateAmazons < ActiveRecord::Migration
  def change
    create_table :amazons do |t|
      t.decimal :bank_dollar_price
      t.decimal :trm_dollar_price
      t.float :tc_percentage
      t.float :iva
      t.float :customs_duty
      t.decimal :price_lb
      t.float :insurance
      t.float :profit
      t.decimal :minimum_profit
      t.float :commission

      t.timestamps null: false
    end
  end
end
