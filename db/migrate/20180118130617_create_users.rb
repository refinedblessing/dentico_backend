class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :type, default: 0
      t.string :name
      t.string :email, index: true
      t.integer :phone
      t.integer :sex
      t.integer :age

      t.timestamps
    end
  end
end
