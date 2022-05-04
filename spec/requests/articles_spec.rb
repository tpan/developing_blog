require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "GET article index" do
    let(:article) { create(:article, attributes_for(:article))}

    it "returns success with the articles index template" do
      get articles_path

      expect(response).to have_rendered(:index)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /articles/:id" do
    
    let(:article) { create(:article, attributes_for(:article))}

    it "returns success with the article/:id show template" do
      get article_path(article)

      expect(response).to have_rendered(:show)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /articles/new" do
    it "returns success with the articles/new template" do
      get new_article_path

      expect(response).to have_rendered(:new)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /articles" do
    context "with valid parameters" do
      it "successfully creates an article" do
        post articles_path, params: {article: attributes_for(:article)}

        expect(response).to redirect_to(article_path(Article.last))
        expect(response).to have_http_status(:found)
      end
    end

    context "with invalid parameters" do
      it "responds with unprocessable entity" do
        post articles_path, params: {article: {title: "", body: "Foo"}}

        expect(response).to have_rendered(:new)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT /articles/:id" do
    context "with valid parameters" do
      let(:article) { create(:article, attributes_for(:article))}

      context "when the article exists" do
        it "successfully updates the article" do 
          put article_path(article), params: {article: attributes_for(:article) }
          
          expect(response).to have_http_status(:found)
        end
      end
    end

    context "with invalid parameters" do
      let(:article) { create(:article, attributes_for(:article))}

      it "throws an exception and responds with unprocessable entity" do 
        put article_path(article), params: {article: attributes_for(:article, :no_body) }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /articles/:id" do
    let!(:article) { create(:article, attributes_for(:article))}

    it "reduces articles count by 1" do
      expect{delete article_path(article)}.to change{Article.count}.by(-1)

      expect(response).to have_http_status(:found)
    end
  end
end
