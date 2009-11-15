require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  should_have_many :comments
  
end
