require 'rails_helper'

RSpec.describe Comment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
	#comments
	describe "validations for comments" do
	  	describe "test for description" do
	  		it "is invalid without description" do
	  			expect(Comment.new(description: nil)).to_not be_valid
	  		end

	  		it "description is required" do
	  			expect(Comment.new(description: "good", post_id: 1)).to be_valid
	  		end
	  	end
	end

	#associations
	describe "validations for associations" do
		it "post has_many comments" do
			post = Post.create!(title: "hai",description: "hello",category: "scientific")
			comment = Comment.create!(description: "nice",post_id: post.id)
			expect(post.comments.count).to eq(1)
		end

		it "comment belongs_to post" do
			post = Post.create!(title: "hai",description: "hello",category: "scientific")
			comment = Comment.create!(description: "nice",post_id: post.id)
			expect(comment.post).to eq(post)
		end
	end

	


end
