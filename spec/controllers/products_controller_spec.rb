require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe "GET #index" do
    context "with params[:q]" do
      it "populates an array matching the searchparam" do
        superbike = create(:product, name: "Superbike")
        badbike = create(:product, name: "Badbike")
        get :index, params: {q: "bad"}
        expect(assigns(:products)).to match_array([badbike])
      end

      it "render the :index template" do
        get :index, params: {q: "bad"}
        expect(response).to render_template :index
      end
    end

    context "without params[q:]" do
      it "populates an array with all products" do 
        superbike = create(:product, name: "Superbike")
        badbike = create(:product, name: "Badbike")
        get :index
        expect(assigns(:products)).to match_array([superbike, badbike])
      end

      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe "GET #new" do
    it "assigns a new Product to @product" do 
      get :new
      expect(assigns(:product)).to be_a_new(Product)
    end

    it "renders the :new template" do 
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested product to @product" do
      product = create(:product)
      get :edit, params: {id: product}
      expect(assigns(:product)).to eq product
    end

    it "renders the :edit template" do
      product = create(:product)
      get :edit, params: {id: product}
      expect(response).to render_template :edit
    end
  end

  #redis server has to run!!!
  describe "GET #show" do 
    it "renders the :show template" do
      product = create(:product)
      get :show, params: {id: product}
      expect(response).to render_template :show
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new product in the database" do
        expect{
          post :create, params: {product: attributes_for(:product)}
        }.to change(Product, :count).by(1)
      end

      it "redirects to products#show" do
        post :create, params: {product: attributes_for(:product)}
        expect(response).to redirect_to product_path(assigns[:product])
      end
    end

    context "with invalid attributes" do
      it "does not save the new product in the database" do
        expect{
          post :create, params: {product: attributes_for(:product, name: nil)}
        }.not_to change(Product, :count)
      end

      it "re-renders the new: template" do
        post :create, params: {product: attributes_for(:product, name: nil)}
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH #update" do
    before do
      @product = create(:product,
        name: "Bike123")
    end

    context "valid attributes" do
      it "locates the requested @product" do
        patch :update, params: {id: @product, product: attributes_for(:product)}
        expect(assigns(:product)).to eq(@product)
      end

      it "changes @product's attributes" do
        patch :update, params: {id: @product,
                  product: attributes_for(:product,
                    name: "Superbike",
                    colour: "white")}
        @product.reload
        expect(@product.name).to eq("Superbike")
        expect(@product.colour).to eq("white")
      end

      it "redirects to the updated contact" do
        patch :update, params: {id: @product, product: attributes_for(:product)}
        expect(response).to redirect_to @product
      end
    end

    context "with invalid attributes" do
      it "does not change the product's attributes" do
        patch :update, params: {id: @product, 
                  product: attributes_for(:product, name: nil)}
        @product.reload
        expect(@product.name).to eq("Bike123")
      end

      it "re-renders the :edit template" do
        patch :update, params: {id: @product, product: attributes_for(:product, name: nil)}
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    before do 
      @product = create(:product)
    end

    it "deletes the product" do
      expect{
        delete :destroy, params: {id: @product}
      }.to change(Product, :count).by(-1)
    end

    it "redirects to products#index" do
      delete :destroy, params: {id: @product}
      expect(response).to redirect_to products_url
    end
  end
end