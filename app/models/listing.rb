class Listing < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :image, styles: { medium: "200x>", thumb: "100x100>" }, default_url: "missing.jpg"
	else
		has_attached_file :image, styles: { medium: "200x>", thumb: "100x100>" }, default_url: "missing.jpg",
			:storage => :dropbox,
		    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
		    :path => ":style/:id_:filename"
	    	validates_attachment :image, content_type: {content_type: ["image/jpg", "image/jpeg", "image/gif", "image/png"]}	
	end
	
	validates :name, :description, :price, presence: true
	validates :price, numericality: {greater_than:0}
	validates_attachment_presence :image
	validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)
	belongs_to :user
end
