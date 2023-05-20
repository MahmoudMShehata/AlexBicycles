require 'rails_helper'

RSpec.describe  Admin::BicyclesController do
  let(:signed_in_user) { FactoryBot.create(:user) }
  # let!(:bicycle) { FactoryBot.create(:bicycle) }
  
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(signed_in_user)
  end

  describe "GET index" do
  # before { get '/api/v1/job_posts', headers: auth_headers_for(account), params: { latitude: latitude, longitude: longitude } }
    # before { get '/admin/bicycles/', params:  { model: "The fastest catastrophe", price: 100 } }
    # it "assigns signed_in_user" do
    #   # user = User.create(name: “Test user”)
    #   get admin_bicycles_path
    #   expect(response).to have_http_status(:success)
    # end
    
    it "returns a successful response" do
      # get '/admin/bicycles/', params:  { model: "The fastest catastrophe", price: 100 }
      # debugger
      # expect(response).to have_http_status(:found)
      # expect(Bicycle.count).to eq(1)
      expect { post admin_bicycles_path, params: { model: 'A new article', price: 100 } }.to change{ Bicycle.count }.by(1)
    end
  end
end
