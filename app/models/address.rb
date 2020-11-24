class Address < ApplicationRecord
    belongs_to :user

    validates_presence_of :street_number, :street, :zip_code, :city, :country
end
