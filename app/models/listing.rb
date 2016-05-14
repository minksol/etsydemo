class Listing < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :image, styles: { medium: "200x>", thumb: "100x100>" }, default_url: "missing.jpg"
	else
		has_attached_file :image, styles: { medium: "200x>", thumb: "100x100>" }, default_url: "missing.jpg",
			:storage => :dropbox,
		    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
		    :path => ":style/:id_:filename"
	end
	validates_attachment :image, content_type: {content_type: ["image/jpg", "image/jpeg", "image/gif", "image/png"]}	
end
