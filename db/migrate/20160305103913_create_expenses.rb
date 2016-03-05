class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.date :date
      t.decimal :price
      t.string :article
      t.text :note

      t.timestamps null: false
    end
  end
end
