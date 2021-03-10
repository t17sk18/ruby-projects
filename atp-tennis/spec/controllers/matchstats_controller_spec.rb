require 'rails_helper'
require 'spec_helper'

# Instruction from: http://geekhmer.github.io/blog/2014/07/30/test-routes-with-rspec-in-ruby-on-rails/
RSpec.describe MatchstatsController, type: :controller do
  describe "routing to matchstats" do
    it "routes /matchstats to matchstats#index" do
      expect(get: "/matchstats").to route_to(
        controller: "matchstats",
        action: "index"
      )
    end

    it "routes /matchstats/1 to matchstats#show" do
      expect(get: "/matchstats/1").to route_to(
        controller: "matchstats",
        action: "show",
        id: "1"
      )
    end

    it "routes /matchstats/new to matchstats#new" do
      expect(get: "/matchstats/new").to route_to(
        controller: "matchstats",
        action: "new"
      )
    end

    it "routes /matchstats to matchstats#create" do
      expect(post: "/matchstats").to route_to(
        controller: "matchstats",
        action: "create"
      )
    end

    it "routes /matchstats/1/edit to matchstats#edit" do
      expect(get: "/matchstats/1/edit").to route_to(
        controller: "matchstats",
        action: "edit",
        id: "1"
      )
    end

    it "routes /matchstats/1 to matchstats#update" do
      expect(put: "/matchstats/1").to route_to(
        controller: "matchstats",
        action: "update",
        id: "1"
      )
    end

    it "routes /matchstats/1 to matchstats#destroy" do
      expect(delete: "/matchstats/1").to route_to(
        controller: "matchstats",
        action: "destroy",
        id: "1"
      )
    end
  end
end