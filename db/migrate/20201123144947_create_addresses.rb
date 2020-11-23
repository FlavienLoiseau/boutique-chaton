class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street_number
      t.string :street
      t.string :zip_code
      t.string :city
      t.string :country
      t.references :user, index: true

      t.timestamps
    end
  end
end
