class RemoveUserFromLineItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :line_items, :user_id
    add_reference :line_items, :product, foreign_key: true
  end
end
