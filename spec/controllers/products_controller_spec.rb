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

  context 'POST #create' do
    it 'an invalid product is not created, products#create page' do
      product = FactoryGirl.build(:product, name: "")
      expect(product).not_to be_valid
      expect(response).to have_http_status(200)
    end
  end

  context "DELETE #destroy" do
    before do
      @product = FactoryGirl.create(:product)
      @user1 = User.create!(first_name: "Dieter", last_name: "Bolen", email: "dieter@yahoo.com", password: "323456", admin: true)
      sign_in @user1
    end

    it "admin can delete product" do
      expect(delete :destroy, params: {:id => @product} ).to redirect_to(products_url)
    end 
  end

  context "PUT #update/:price" do
    before do
      @product = FactoryGirl.create(:product)
      @user = User.create!(first_name: "Dieter", last_name: "Bolen", email: "dieter@yahoo.com", password: "323456", admin: true)
      sign_in @user
    end

    it "updates product name" do
      attr = { :name => "new bike", :image_url => @product.image_url, :id => @product.id, :price => @product.price }
      put :update, params: { :id => @product.id, :product => attr }
      @product.reload
      expect(@product.name).to eq "new bike"
    end
  end

end