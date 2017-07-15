require 'rails_helper'

describe OrdersController, type: :controller do
  before do
    @product = FactoryGirl.create(:product)
    @user1 = FactoryGirl.create(:user)
#    @user1 = User.create!(first_name: "Dieter", last_name: "Bolen", email: "dieter@yahoo.com", password: "323456")
#    @product = Product.create!(name: "Blue Sky Bike", price: 300, image_url: "image.jpg")
    @order = Order.create!(user_id: @user1.id, product_id: @product.id)
  end
  
  describe "GET #index" do

    context "User logged in" do
      before do
        sign_in @user1
      end
      
      it "renders the index template" do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(response).to render_template('index')
      end
    end

    context 'User is not logged in' do

      it 'redirects to login' do
        get :index
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

  end
end  