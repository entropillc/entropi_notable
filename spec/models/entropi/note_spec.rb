require 'spec_helper'

describe Entropi::Note do
  before(:each) do
    @note = Entropi::Note.new
  end

  it "should require a title to be under 100 characters" do
    @note.title = "A"*101
    @note.should have(1).errors_on(:title)
    @note.title = "A"*100
    @note.should have(0).errors_on(:title)
  end

  it "should require a body" do
    @note.should have(1).errors_on(:body)
    @note.body = "Text in the body"
    @note.should have(0).errors_on(:body)
  end

  it "should require a user" do
    @note.should have(1).errors_on(:user_id)
    @note.user_id = 1
    @note.should have(0).errors_on(:user_id)
  end

  it "should require a notable_id" do
    @note.should have(1).errors_on(:notable_id)
    @note.notable_id = 1
    @note.should have(0).errors_on(:notable_id)
  end

  it "should require a notable_type" do
    @note.should have(1).errors_on(:notable_type)
    @note.notable_type = "ExampleModel"
    @note.should have(0).errors_on(:notable_type)
  end
end