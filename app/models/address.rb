class Address < ActiveRecord::Base
	belongs_to :location, dependent: :destroy
end
