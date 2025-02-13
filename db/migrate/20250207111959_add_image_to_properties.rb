class AddImageToProperties < ActiveRecord::Migration[8.0]
  def change
    add_column :properties, :image, :string
  end
end
