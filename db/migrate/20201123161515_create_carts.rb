class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.references :user, index: true

      t.timestamps
    end
  end
end
