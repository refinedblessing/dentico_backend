class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :user_type, default: 0
      t.string :name
      t.string :email, index: true
      t.string :phone
      t.integer :sex
      t.integer :age

      t.timestamps
    end
  end
end
