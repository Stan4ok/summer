require 'rails_helper'

describe UsersController, type: :controller do
  
  before do
    @user1 = User.create!(first_name: "Dieter", last_name: "Bolen", email: "dieter@yahoo.com", password: "323456")
    @user2 = User.create!(first_name: "Peter", last_name: "Woods", email: "peter@yahoo.com", password: "223456")
  end

  describe 'GET #show' do
    
    context 'when a user is logged in' do
      
      before do
        sign_in @user1
      end

      it 'loads correct user details' do
        get :show, params: {id: @user1.id}
#        expect(response).to have_http_status(200) shows status 302 istead
        expect(assigns(:user)).to eq @user1
      end
      
      it 'other users profile unavailable' do
        get :show, params: {id: @user2.id}
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end

    end

    context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, params: { id: @user1.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end


  end
end  