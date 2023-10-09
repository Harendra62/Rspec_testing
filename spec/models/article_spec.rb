require 'rails_helper'

RSpec.describe Article, type: :model do
 context 'validations' do
    it 'will create a article when all fields are correct' do
      article = create(:article)
    # article = Article.create(name: "", body: "sfgts")
    expect(article.id).to eq(Article.last.id)
    end
    it 'will raise error when name is not present or blank' do
      article = build(:article, name: "")
    # article = Article.create(name: "", body: "sfgts")
    article.save
    expect(article.id).to eq(nil)
    expect(article.errors[:name]).to eq(["can't be blank"])
    end

    it 'will raise error when body is not present or blank' do
      article = build(:article, body: "")
    article.save
    expect(article.id).to eq(nil)
    expect(article.errors[:body]).to eq(["can't be blank"])
    end

    it 'will raise error when body and name is not present or blank' do
      article = build(:article, name: "" , body: "")
      article.save
      expect(article.id).to eq(nil)
      expect(article.errors[:name]).to eq(["can't be blank"])
      expect(article.errors[:body]).to eq(["can't be blank"])
    end
  end
end
