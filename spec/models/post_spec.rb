require 'rails_helper'

RSpec.describe Post, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  #title
  describe "test for title" do
  	it "is invalid without title" do
  		expect(Post.new(title:nil)).to_not be_valid
  	end

  	it "is invalid without uniqueness" do
  		post = Post.create(title:"hello",description:"hello how are you")
  		expect(Post.new(title:"hai",description:"hello how are you",category:"scientific")).to be_valid
  	end

  	it "is invali without given format" do
  		post = Post.create(title:"hello",description:"hello how are you",category:"scientific")
  		expect(post.title).to match(/\A[a-zA-Z|\s|\.|\,]+\z/)
  	end
  end

  #description
  describe "test for description" do
  	it "is invalid without description" do
  		expect(Post.new(title:"hello",description:nil,category:"scientific")).to_not be_valid
  	end
  end

  #category
  describe "test for category" do
  	it "is invalid without category" do
  		expect(Post.new(title:"hello",description:"hello how are you",category:nil)).to_not be_valid
  	end

  	it "is invalid without uniqueness" do
  		post = Post.create(title:"hello",description:"hello how are you",category:"telecommunication")
  		expect(Post.new(title:"hai",description:"hello how are you",category:"scientific")).to be_valid
  	end
  end
end
