require 'rails_helper'
describe ProductsController, :type => :controller do
  context 'GET #index' do
    
    before do
      get :index
    end

    it 'loads correctly and renders the index template' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template('index')
    end



  end

end