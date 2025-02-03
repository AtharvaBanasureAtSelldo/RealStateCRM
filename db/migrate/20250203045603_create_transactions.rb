class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.integer :property_id
      t.integer :user_id
      t.integer :client_id
      t.decimal :price
      t.string :status

      t.timestamps
    end
  end
end
