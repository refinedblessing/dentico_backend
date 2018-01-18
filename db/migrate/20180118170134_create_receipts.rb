class CreateReceipts < ActiveRecord::Migration[5.1]
  def change
    create_table :receipts do |t|
      t.integer :payment_type, default: 0
      t.decimal :cost
      t.references :appointment, foreign_key: true

      t.timestamps
    end
  end
end
