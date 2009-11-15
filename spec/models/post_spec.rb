require File.dirname(__FILE__) + '/../spec_helper'

describe Post do  
  should_validate_presence_of :body, :title
  should_belong_to :user
  should_have_many :comments
end