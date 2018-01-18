class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :type
      t.string :name
      t.string :email
      t.integer :phone
      t.integer :sex
      t.text :city_code
      t.integer :age

      t.timestamps
    end
  end
end
