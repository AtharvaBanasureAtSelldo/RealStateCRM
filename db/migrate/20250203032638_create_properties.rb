class CreateProperties < ActiveRecord::Migration[8.0]
  def change
    create_table :properties do |t|
      t.string :title
      t.string :address
      t.decimal :price
      t.integer :agent_id

      t.timestamps
    end
  end
end
