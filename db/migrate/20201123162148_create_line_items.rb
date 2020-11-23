class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.references :cart, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
