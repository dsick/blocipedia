require 'rails_helper'

RSpec.describe WikisController, type: :controller do

  let(:my_user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:my_wiki) { create(:wiki, user: my_user) }

  context "guest" do
    describe "GET show" do
      it "returns http success" do
        get :show, id: my_wiki.id
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        get :show, id: my_wiki.id
        expect(response).to render_template :show
      end

      it "assigns my_wiki to @wiki" do
        get :show, id: my_wiki.id
        expect(assigns(:post)).to eq(my_wiki)
      end
    end

    describe "GET new" do
      it "returns http redirect" do
        get :new, wiki_id: my_wiki.id
        expect(response).to redirect_to(sign_in_path)
      end
    end

    describe "POST create" do
      it "returns http redirect" do
        post :create, wiki_id: my_wiki.id, wiki: {title: Faker::Lorem.words, body: Faker::Lorem.paragraph}
        expect(response).to redirect_to(sign_in_path)
      end
    end

    describe "GET edit" do
      it "returns http redirect" do
        get :edit, id: my_wiki.id
        expect(response).to redirect_to(sign_in_path)
      end
    end

    describe "PUT update" do
      it "returns http redirect" do
        new_title = Faker::Lorem.words
        new_body = Faker::Lorem.paragraph

        put :update,  id: my_wiki.id, wiki: {title: new_title, body: new_body}
        expect(response).to redirect_to(sign_in_path)
      end
    end

    describe "DELETE destroy" do
      it "returns http redirect" do
        delete :destroy, id: my_wiki.id
        expect(response).to redirect_to(sign_in_path)
      end
    end
  end

end
