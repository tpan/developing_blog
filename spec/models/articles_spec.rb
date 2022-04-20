require 'rails_helper'

RSpec.describe "Article", type: :model do
  describe "has a  title and body" do
    it "is valid" do
        article = FactoryBot.build(:article, title: "Test title", body: "Body that is more than 10 chars")

        expect(article.valid?).to eql true
    end

    describe "is invalid" do
      it "has a title but no body" do
        article = FactoryBot.build(:article, title: "Test title", body: nil)

        expect(article.valid?).to eql false
      end
  
      it "has a body but no title" do
        article = FactoryBot.build(:article, title: nil, body: "Test body with enough chars")

        expect(article.valid?).to eql false
      end

      it "has a body with too few characters" do
        article = FactoryBot.build(:article, title: "Test title", body: "Test Body")
  
        expect(article.valid?).to eql false
      end
    end
  end
end
