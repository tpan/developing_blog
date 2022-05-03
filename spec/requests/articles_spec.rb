require 'rails_helper'

RSpec.describe "Articles", type: :request do

  before(:all) do
    FactoryBot.create(:article)
  end

  describe "GET article index" do
    it "returns success with the articles index template" do
      get articles_path

      expect(response).to have_rendered(:index)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /articles/:id" do
    it "returns success with the articles index template" do
      get article_path(1)

      expect(response).to have_rendered(:show)
      expect(response).to have_http_status(:success)
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
        post articles_path, :params => {:article => {:title => Faker::Hipster.sentence(word_count: 3), :body => Faker::Hipster.paragraph}}

        expect(response).to have_http_status(:found)
      end
    end

    context "with invalid parameters" do
      it "responds with unprocessable entity" do
        post articles_path, :params => {:article => {:title => "", :body => "Foo"}}

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT /articles/:id" do
    context "with valid parameters" do
      it "successfully updates the article" do 
        put article_path(1), :params => {:article => {:title => Faker::Hipster.sentence(word_count:3), :body => Faker::Hipster.paragraph}}
        expect(response).to have_http_status(:found)
      end
    end

    context "with invalid parameters" do
      it "throws an exception and responds with unprocessable entity" do 
        put article_path(1), :params => {:article => { :title => nil, :body => nil }}

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /articles/:id" do
    it "reduces articles count by 1" do
      expect{delete article_path(1)}.to change{Article.count}.by(-1)

      expect(response).to have_http_status(:found)
    end
  end
end
