require File.dirname(__FILE__) + '/../spec_helper'

describe Comment do
  should_belong_to :post
  should_belong_to :user
  should_validate_presence_of :body
end