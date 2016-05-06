class Post < ActiveRecord::Base
	has_many :comments

	validates :title,presence:true,uniqueness:true,format:{with:/\A[a-zA-Z|\s|\.|\,]+\z/,message:"enter valid title"}
	validates :description,presence:true
	validates :category,presence:true,uniqueness:true
end
