require 'rails_helper'
require 'spec_helper'

# Instruction from: http://geekhmer.github.io/blog/2014/07/30/test-routes-with-rspec-in-ruby-on-rails/
RSpec.describe LivetennisnewsController, type: :controller do
  describe "Tests on  to Livetennisdata controller" do
    
    it "routes /livetennisnews/news to livetennis#news" do
        expect(get: "/livetennisnews/news").to route_to(
        controller: "livetennisnews",
        action: "news"
      )
    end
  end
end