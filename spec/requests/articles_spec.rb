require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "GET article index" do
    it "returns a 200 with the articles index template" do
      get articles_path

      expect(response).to have_rendered(:index)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /articles/new" do
    it "returns a 200 with the articles/new template" do
      get new_article_path

      expect(response).to have_rendered(:new)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /articles" do
    it "returns a 200 with the articles/new template" do
      get new_article_path

      expect(response).to have_rendered(:new)
      expect(response).to have_http_status(:success)
    end
  end
end
