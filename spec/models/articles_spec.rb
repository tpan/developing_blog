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

  describe '#to_param' do
    context 'given an article that exists in the database' do
      let(:article) {create(:article, attributes_for(:article, id: 1, title: "lets-get-this-bread"))}
      it 'returns the slug' do

        expect(article.to_param).to eq "1-lets-get-this-bread"
      end
    end

    context 'given an article that does NOT exist in the database' do
      let(:article) {build(:article)}

      it 'returns nil' do
        expect(article.to_param).to be_nil
      end
    end
  end

  describe '#set_slug' do
    context 'given an article that has a string title' do
      let(:article) {create(:article, attributes_for(:article, title: "jakes right sheesh"))}
      it 'returns the parameterized slug' do
        expect(article.slug).to eq "jakes-right-sheesh"
      end
    end

    context 'given an article that has a title with numbers' do
      let(:article) {create(:article, attributes_for(:article, title: 420))}
      it 'returns the parameterized slug' do
        expect(article.slug).to eq "420"
      end
    end    
  end
end
