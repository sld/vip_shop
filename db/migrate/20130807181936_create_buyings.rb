class CreateBuyings < ActiveRecord::Migration
  def change
    create_table :buyings do |t|
      t.integer :user_id

      t.timestamps
    end

    add_index :buyings, :user_id
    add_index :buyings, :created_at
  end
end
