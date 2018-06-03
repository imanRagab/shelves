class Book < ApplicationRecord
    enum transcation: {"Sell" => 0, "Free Share" =>1,"Exchange" =>2,"Sell By Bids" =>4}
    
    #### Relations ####
belongs_to :category
belongs_to :user
has_many :book_images, :dependent => :destroy

<<<<<<< HEAD
    #### accept apload multiple images
    accepts_nested_attributes_for :book_images, :allow_destroy => true
=======
    #### Search For Books by name & description ####
def self.search(search)
    where("name LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%") 
end

    #### Mount image uploader
mount_uploaders :images, ImageUploader

   
>>>>>>> f3018588ccebe1625d34e834907a896a1728c516

    #### accept upload multiple images
    # accepts_nested_attributes_for :book_images,:reject_if => lambda { |t| t['image'].nil? }, :allow_destroy => true
    accepts_nested_attributes_for :book_images
end


