class Address < ApplicationRecord
    has_one :user

    validates_presence_of :street_number, :street, :zip_code, :city, :country
end
