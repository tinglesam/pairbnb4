class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :reservations
	mount_uploaders :images, ImagesUploader

	searchkick word_start: [:name, :address]

end
