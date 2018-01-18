class CreateReceipts < ActiveRecord::Migration[5.1]
  def change
    create_table :receipts do |t|
      t.integer :type
      t.decimal :cost
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
