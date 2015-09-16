require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  before do
    @doc = FactoryGirl.create(:user, :verified_doctor)
    @valid_attributes = FactoryGirl.attributes_for(:article, writer: @doc)
    @invalid_attributes = FactoryGirl.attributes_for(:article, content: nil)
    sign_in @doc
  end

  describe "GET #index" do
    before do
      @article = FactoryGirl.create(:article)
      get :index
    end

    it "assigns all articles as @articles" do
      expect(assigns(:articles)).to eq([@article])
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Get#index with params' do
    it "assigns only matching articles when the `:q` param is present" do
      2.downto(0) { FactoryGirl.create(:article) }
      @article = FactoryGirl.create(:article)
      get :index, q: @article.content
      expect(assigns(:articles)).to eq([@article])
    end
  end

  describe "GET #show" do
    before do
      @article = FactoryGirl.create(:article)
      @rating = FactoryGirl.create(:rating, article: @article, user: @doc)
      get :show, :id => @article
    end

    it "assigns the requested article as @article" do
      expect(assigns(:article)).to eq(@article)
    end

    it "assigns the requested article's ratting by signed_in user as @rating" do
      expect(assigns(:rating)).to eq(@rating)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    before do
      get :new
    end

    it "assigns a new article as @article" do
      expect(assigns(:article)).to be_a_new(Article)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    before do
      @article = FactoryGirl.create(:article)
      get :edit, id: @article
    end

    it "assigns the requested article as @article" do
      expect(assigns(:article)).to eq(@article)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Article" do
        expect {
          post :create, :article => @valid_attributes
        }.to change(Article, :count).by(1)
      end

      it "assigns a newly created article as @article" do
        post :create, {:article => @valid_attributes}
        expect(assigns(:article)).to be_a(Article)
        expect(assigns(:article)).to be_persisted
      end

      it "redirects to the created article" do
        post :create, {:article => @valid_attributes}
        expect(response).to redirect_to(Article.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved article as @article" do
        post :create, {:article => @invalid_attributes}
        expect(assigns(:article)).to be_a_new(Article)
      end

      it "re-renders the 'new' template" do
        post :create, {:article => @invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      before do
        new_attributes = FactoryGirl.attributes_for(:article, writer: @doc)
        @article = Article.create! @valid_attributes
        @to_format = {
            'id' => @article.id,
            'content' => new_attributes[:content],
            'title' => new_attributes[:title],
            'user_id' => @doc.id
        }
        put :update, {:id => @article.to_param, :article => new_attributes}
      end

      it "assigns the requested article as @article" do
        expect(assigns(:article)).to eq(@article)
      end

      it "redirects to the article" do
        expect(response).to redirect_to(@article)
      end

      it "updates the requested article" do
        @article.reload
        expect(@article.attributes.slice('id', 'content', 'title', 'user_id')).to eq @to_format
      end
    end

    context "with invalid params" do
      before do
        @article = Article.create! @valid_attributes
        put :update, {:id => @article.to_param, :article => @invalid_attributes}
      end

      it "assigns the article as @article" do
        expect(assigns(:article)).to eq(@article)
      end

      it "re-renders the 'edit' template" do
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested article" do
      article = Article.create! @valid_attributes
      expect {
        delete :destroy, {:id => article.to_param}
      }.to change(Article, :count).by(-1)
    end

    it "redirects to the articles list" do
      article = Article.create! @valid_attributes
      delete :destroy, {:id => article.to_param}
      expect(response).to redirect_to(articles_url)
    end
  end

end
