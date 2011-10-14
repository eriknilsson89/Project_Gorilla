require 'spec_helper'

describe PagesController do
  render_views
  
  before(:each) do
    @base_title = "The Gorilla Project"
  end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
    it "should have the right title" do
      get 'index'
      response.should have_selector('title', :content => "#{@basetitle} | Start")
    end
  end

  describe "GET 'kontakt'" do
    it "should be successful" do
      get 'kontakt'
      response.should be_success
    end
    it "should have the right title" do
      get 'kontakt'
      response.should have_selector("title",
                                    :content => "#{@basetitle} | Kontakt")
    end
  end

  describe "GET 'om'" do
    it "should be successful" do
      get 'om'
      response.should be_success
    end
    it "should have the right title" do
      get 'om'
      response.should have_selector('title', :content => "#{@basetitle} | Om oss")
    end
  end
  

end
