class Comment < ActiveRecord::Base
	belongs_to :post
	
	validates :description,:post_id,presence: true

end
