class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.integer :buying_id

      t.timestamps
    end

    add_index :carts, :buying_id
  end
end
