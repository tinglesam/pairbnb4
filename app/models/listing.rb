class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :reservations
	mount_uploader :images, ImagesUploader



end
