require File.dirname(__FILE__) + '/../spec_helper'

describe CommentsController do
  
  describe "Creating a new comment" do

    # before(:each) do 
    #   @current_user = mock_model(User, :id => 1)
    #   controller.stub!(:current_user).and_return(@current_user)     
    #   @post = mock_model(Post, :id => 1)
    #   @current_user.stub!(:posts).and_return(@post)
    #   
    # end

    # it "should create a new post" do
    #   @post.should_receive(:create).with("title"=> "test","body" => "test").and_return(@post) 
    #   @post.should_receive(:save).and_return(true)     
    #   post :create, :post => {:title => "test", :body => "test"}
    #   flash[:notice].should match('Post was successfully created.')
    #   response.should redirect_to("/posts/#{@post.id}")
    # end

  end
  
end
