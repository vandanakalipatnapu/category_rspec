require 'rails_helper'

RSpec.describe PostsController, type: :controller do
	
	#posts
	describe "posts controller" do
		let(:valid_attributes){
			{title:"hello",description:"hello how are you",category:"scientific"}
		}

		let(:invalid_attributes){
			{title:nil,description:nil,category:nil}
		}

		#new
		describe "GET new" do
			it"assigns a new post as @post" do
				get :new,{}
				expect(assigns(:post)).to be_a_new(Post)
			end
		end

		#index
		describe "GET index" do
			it "assigns all posts as @posts" do
				
				post = Post.create!(valid_attributes)
				post1 = Post.create(title:"hai",description:"hai fine thank you",category:"telecommunication")
				post.save
				get :index,{}
				expect(assigns(:posts)).to eq([post,post1])
			end
		end

		#show
		describe "GET show" do
			it "assigns required post as @post" do
				post = Post.create!(valid_attributes)
				get :show,{:id => post.to_param}
				expect(assigns(:post)).to eq(post)
			end
		end

		describe "GET edit" do
			it"assigns required post as @post" do
				post = Post.create!(valid_attributes)
				get :edit,{:id => post.to_param}
				expect(assigns(:post)).to eq(post)
			end
		end

		#create
		describe "POST create" do
			describe "with valid_attributes" do
				it "creates a new post"do
					expect{
						post :create,{:post => valid_attributes}
					}.to change(Post,:count).by(1)
				end

				it "assigns to @post" do
					post :create,{:post => valid_attributes}
					expect(assigns(:post)).to be_a(Post)
				end

				it "redirect to index path" do
				post :create,{:post => valid_attributes}
					expect(response).to redirect_to(posts_path)
				end
			end

			describe "with invalid_attributes" do
				it "assigns newly created post but unsaved post as @post" do
					post :create,{:post => invalid_attributes}
					expect(assigns(:post)).to be_a_new(Post)
				end

				it "render to new" do
				post :create,{:post => invalid_attributes}
					expect(response).to render_template("new")
				end
			end
		end

		#update
		describe "PUT update" do
			describe "with valid_attributes" do
				let(:new_valid_attributes){
					{title: "hai",description: "hello",category: "scientific"}
				}

				it "is updates to required attributes"do
					post = Post.create!(valid_attributes)
					put :update,{:id => post,:post => new_valid_attributes}
					post.reload
					expect(post.title).to eq(new_valid_attributes[:title])
					expect(post.description).to eq(new_valid_attributes[:description])
					expect(post.category).to eq(new_valid_attributes[:category])	
				end

				it "assigns required post to @post" do
					post = Post.create!(valid_attributes)
					put :update,{:id => post,:post => new_valid_attributes}
					expect(assigns(:post)).to eq(post)
				end

				it"redirect to index" do
					post = Post.create!(valid_attributes)
					put :update,{:id => post,:post => new_valid_attributes}
					expect(response).to redirect_to(posts_path)
				end
			end

			describe "with invalid_attributes" do
				
				it "assigns but not updated to new_valid_attributes" do
					post = Post.create!(valid_attributes)
					put :update,{:id => post,:post => invalid_attributes}
					expect(assigns(:post)).to eq(post)
				end

				it "render to edit" do
					post = Post.create!(valid_attributes)
					put :update,{:id => post,:post => invalid_attributes}
					expect(response).to render_template("edit")
				end
			end
		end

		#delete
		describe "DELETE destroy" do
	  	it "destroy the required post" do
	  		post = Post.create!(valid_attributes)
	  			expect {
	        delete :destroy, {:id => post}
	      }.to change(Post, :count).by(-1)
	  	end

	  	it "redirect to index" do
	  		post = Post.create!(valid_attributes)
	  		delete :destroy,{:id => post}
	  		expect(response).to redirect_to(posts_path)
	  	end
	  end
	end

end
