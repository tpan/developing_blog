require 'rails_helper'

RSpec.describe "Article", type: :model do
  describe "is valid" do
    it "has a  title and body" do
        article = FactoryBot.build(:article, title: "Test title", body: "Test body")
    end
  end

#   describe "is invalid" do

#   end
end
