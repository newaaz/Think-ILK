require 'rails_helper'

RSpec.describe PropertiesController, type: :controller do
  let(:owner)     { create(:partner) }
  let(:category)  { create(:category) }
  let(:town)      { create(:town) }
  let(:property)  { create(:property, owner: owner, town: town, category: category) }

  describe 'GET #index' do
    let(:properties)  { create_list(:property, 3) }

    before { get :index    }

    it 'populates an array of all properties' do         
      expect(assigns(:properties)).to match_array(properties)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: property } }

    it 'assigns requested property to @property' do
      expect(assigns(:property)).to eq property
    end

    it 'render show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do    
    context 'Authenticated partner' do
      before { sign_in(owner) }

      before { get :new }

      it 'assigns a new Property to @property' do
        expect(assigns(:property)).to be_a_new(Property)
      end
  
      it 'render new view' do
        expect(response).to render_template :new
      end
    end

    context 'Unauthenticated partner' do
      before { get :new }

      it 'redirect to sign_in' do
        expect(response).to redirect_to new_partner_session_path
      end
    end
  end

  describe 'GET #edit' do
    context 'Authenticated partner' do
      before { sign_in(owner) }
      
      before { get :edit, params: { id: property } }

      it 'assigns requested property to @property' do
        expect(assigns(:property)).to eq property
      end
  
      it 'render edit view' do
        expect(response).to render_template :edit
      end
    end  

    context 'Unauthenticated partner' do
      before { get :edit, params: { id: property } }
      it 'redirect to sign_in' do
        expect(response).to redirect_to new_partner_session_path
      end
    end

    context 'Another partner tries edit property' do
      it 'Another partner tries edit property'
    end

  end

  describe 'POST #create' do
    context 'Authenticated partner' do
      before { sign_in(owner) }

      context 'with valid attributes' do
        it 'saves new property in DB' do
          expect { post :create, params: { property: attributes_for(:property, category_id: category, town_id: town) } }.to change(Property, :count).by(1)
        end
  
        it 'redirect to show view' do
          post :create, params: { property: attributes_for(:property, category_id: category, town_id: town) }
          expect(response).to redirect_to assigns(:property)
        end
      end
  
      context 'with invalid attributes' do
        it 'does not save the property in DB' do
          expect { post :create, params: { property: attributes_for(:property, :invalid) } }.to_not change(Property, :count)      
        end
  
        it 're-renders new view' do
          post :create, params: { property: attributes_for(:property) }
          expect(response).to render_template :new
        end
      end
    end

    context 'Unauthenticated partner' do
      it 'does not save the property in DB' do
        expect { post :create, params: { property: attributes_for(:property) } }.to_not change(Property, :count)      
      end

      it 'redirect to sign_in' do
        post :create, params: { property: attributes_for(:property, category_id: category, town_id: town) }
        expect(response).to redirect_to new_partner_session_path
      end
    end    
  end

  describe 'PATCH #update' do
    before { sign_in(owner) }
  
    context 'with valid attributes' do
      before { patch :update, params: { id: property, property: { title: 'new title', address: 'new address', category_id: category, town_id: town } } }

      it 'assigns the requested property to @property' do
        expect(assigns(:property)).to eq property
      end

      it 'changes property attributes' do
        property.reload
        expect(property.title).to eq 'new title'
        expect(property.address).to eq 'new address'
      end

      it 'redirect to show view' do
        expect(response).to redirect_to property
      end
    end

    context 'with invalid attributes' do
      before { patch :update, params: { id: property, property: attributes_for(:property, :invalid, title: 'new_title') } }

      it 'does not change property attributes' do
        property.reload

        expect(property.title).to eq "Hotel 'Alexandra'"
        expect(property.address).to eq 'Lenina 15'
      end

      it 'render edit view' do
        expect(response).to render_template :edit
      end
    
    end

    context 'UNAUTHENTICATED partner tries UPDATE property' do
      it 'Another partner tries UPDATE property'
    end

    context 'Another partner tries UPDATE property' do
      it 'Another partner tries UPDATE property'
    end
  end

  describe 'DELETE #destroy' do
    let!(:property) { create(:property, owner: owner) }
    
    context 'Authenticated partner' do
      before { sign_in(owner) }

      context 'valid owner' do
        it 'deletes the property from DB' do
          expect { delete :destroy, params: { id: property } }.to change(Property, :count).by(-1)
        end

        it 'redirect to root path' do
          delete :destroy, params: { id: property }
          expect(response).to redirect_to root_path
        end
      end

      context 'invalid owner' do
        it 'does not deletes the property from DB'
      end
    end

    context 'Unauthenticated partner' do
      it 'does not deletes the property from DB'
    end

  end
end
