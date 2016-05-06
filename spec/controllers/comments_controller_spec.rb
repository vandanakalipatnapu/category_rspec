require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
	describe "testing for comment" do
		let(:valid_attributes){
				{title:"hello",description:"hello how are you",category:"scientific"}
			}

			let(:invalid_attributes){
				{title:nil,description:nil,category:nil}
			}

			let(:comment_valid_attributes){
				{description: "haiiii"}
			}

			let(:comment_invalid_attributes){
				{description:nil,post_id:nil}
			}


		describe "GET new" do	
			it "creates a new comment" do
				post = Post.create!(valid_attributes)
				get :new,{:post_id => post.id}
				expect(assigns(:comment)).to be_a_new(Comment)
			end 
		end

		# describe "GET show" do
		# 	it "assigns required comment as @comment" do
		# 		post = Post.create(valid_attributes)
		# 		comment = post.comments.create(description: "haiiii",post_id: post.id)
		# 		# expect(post.comments.count).to eq(1)
		# 		get :show,{:post_id => post.id,:id => comment.to_param}
		# 	    expect(assigns(:comment)).to eq(comment)
		# 	end
		# end

		# describe "GET index" do
		# 	it "assigns all comments to @comments" do
		# 		post = Post.create!(valid_attributes)
		# 		comment = post.comments.create!(description: "haiiii",post_id: post.id)
		# 		get :index,{:post_id => post.id}
		# 		expect(assigns(:comments)).to eq([comment])
		# 	end
		# end

		# describe "GET edit" do
		# 	it "assigns required comment to @comment" do
		# 		post = Post.create!(valid_attributes)
		# 		comment = post.comments.create!(description: "haiiii",post_id: post.id)
		# 		get :edit,{:post_id => post.id,:id => comment }
		# 		expect(assigns(:comment)).to eq(comment)
		# 	end
		# end

		describe "POST create" do
			describe "with valid_attributes" do
				it "creates a comment" do
	        post1 = Post.create(valid_attributes)
	        expect{
	        post :create, {post_id: post1.id, :comment => comment_valid_attributes}}.to change(Comment, :count).by(1)
	      end

	      it "assigns to @comment" do
					post1 = Post.create(valid_attributes)
					post :create,{:post_id => post1.id,:comment => comment_valid_attributes}
					expect(assigns(:comment)).to be_a(Comment)
				end

				it "redirect to index path" do
					post1 = Post.create(valid_attributes)
					post :create,{:post_id => post1.id,:comment => comment_valid_attributes}
					expect(response).to redirect_to(posts_path)
				end
			end

			describe "with invalid_attributes" do
				it "assigns newly created post but unsaved post as @comment" do
					post1 = Post.create(valid_attributes)
					post :create,{:post_id => post1.id,:comment => comment_invalid_attributes}
					expect(assigns(:comment)).to be_a_new(Comment)
				end

				it "render to new" do
					post1 = Post.create(valid_attributes)
					post :create,{:post_id => post1.id,:comment => comment_invalid_attributes}
					expect(response).to render_template("new")
				end
			end
		end

		 describe "destroying a comment" do
         	it "destroys comment" do
	            post1 = Post.create(valid_attributes)
	            comment = post1.comments.create(description:"goood", post_id:post1.id)
	            expect{
	            delete :destroy, {post_id: post1.id, :id => comment}
	            }.to change(Comment, :count).by(-1)
        	end
        end


    
	end
end
