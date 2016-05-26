class Trip < ActiveRecord::Base
	has_many :location
end
