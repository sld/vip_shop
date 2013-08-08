class CreateCartProducts < ActiveRecord::Migration
  def change
    create_table :cart_products do |t|
      t.integer :cart_id
      t.integer :product_id
      t.integer :quantity, :default => 1

      t.timestamps
    end

    add_index :cart_products, :cart_id
  end
end
