require 'rails_helper'
require 'spec_helper'

RSpec.describe PlayersController, type: :controller do
    
    #let(:valid_attributes) {{ playerId: 'MyString', name: 'MyString', hand: 'MyString', country: 'GER', birthday: 'MyString', isocodeid: isocode.id}}
    #describe 'GET #show' do
    #    it 'returns a success response' do
    #       Player.create! valid_attributes
    #        get :new, params: {:id => 1}
    #        expect(response).to be_successful
    #   end
    #end


    #it "renders the index template for player" do
    #    get :index
    #    expect(response).to render_template("index")
    #end


    describe "GET Players Root" do
        # https://relishapp.com/rspec/rspec-rails/v/3-8/docs/routing-specs/route-to-matcher 
        it "routes  /players " do
            expect(:get => "/players").to route_to(:controller => "players", :action => "index")
        end
    end


    describe "GET individual player details" do
        # https://relishapp.com/rspec/rspec-rails/v/3-8/docs/routing-specs/route-to-matcher 
        it "routes  /players/id " do
            expect(:get => "/players/id").to route_to(:controller => "players", :action => "show", "id"=>"id")
        end
    end

end