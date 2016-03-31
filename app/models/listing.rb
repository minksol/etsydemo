class Listing < ActiveRecord::Base
	has_attached_file :image, styles: { medium: "200x>", thumb: "100x100>" }, default_url: "missing.jpg"
	validates_attachment :image, content_type: {content_type: ["image/jpg", "image/jpeg", "image/gif", "image/png"]}	
end
