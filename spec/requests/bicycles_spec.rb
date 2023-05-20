# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BicyclesController, type: :request do
  let(:signed_in_user) { FactoryBot.create(:user) }
  let!(:bicycle) { FactoryBot.create(:bicycle) }
  
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(signed_in_user)
  end

  describe 'GET #index' do
    context 'not authenticated' do
      before { get "/bicycles/" }
      it { debugger }
      it { expect(response).to have_http_status(:unauthorized) }
      
    end

    # context 'successful fetch' do
    #   before { get "/bicycles/" }
      
    #   it { debugger }
    #   it { expect(response).to have_http_status(:ok) }
    # end
  end
end