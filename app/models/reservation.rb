class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing
	has_one :purchase

	searchkick
end