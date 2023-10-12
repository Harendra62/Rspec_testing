require 'rails_helper'

RSpec.describe ArticlesController, type: :request do
    describe "GET /index" do
          before(:each) do
            @article = Article.create(name: "First Article", body: "body")
          end
          context "Get all articles" do
            it 'return all articles' do
              get "/articles"
              expect(response).to have_http_status(200)
              res = JSON response.body
              expect(res.count).to eq(Article.count)
            end
            it 'raise error when index is not present' do 
             Article.destroy_all
             get "/articles"
             expect(response).to have_http_status(404)
             res = JSON response.body
             expect(res["message"]).to eq("not found")
            end
          end
          context "Get an articles" do
            it 'return a articles for show article api' do
              get "/articles/#{@article.id}"
              expect(response).to have_http_status(200)
              res = JSON response.body
              expect(res["id"]).to eq(@article.id)
            end
            it 'raise error when passing wrong id' do
              get "/articles/0"
              expect(response).to have_http_status(404)
              res = JSON response.body
              expect(res["message"]).to eq("not found")
            end
          end
          context "Create article" do
            it 'return a articles for show article api' do
              pre_article_count = Article.count
              post "/articles", params: {article: {name: "title", body: "body"}}
              expect(response).to have_http_status(201)
              res = JSON response.body
              expect(Article.count).to eq(pre_article_count+1)
            end
            it 'raise error when pass wrong arguments' do
              post "/articles", params: {article: {name: "", body: ""}}
              expect(response).to have_http_status(422)
            end
          end

          context "Update article" do
            it 'update the fields of article' do
              patch "/articles/#{@article.id}", params: {article: {name: "1 name"}}
              expect(response).to have_http_status(200)
              res = JSON response.body
              expect(Article.find(@article.id).name).to eq("1 name")
            end
            it 'raise error when pass wrong arguments' do
              patch "/articles/#{@article.id}", params: {article: {name: ""}}
              expect(response).to have_http_status(422)
            end
           end
          context "Get an articles" do
            it 'return a articles for show article api' do
              delete "/articles/#{@article.id}"
              expect(response).to have_http_status(200)
              expect(Article.find_by_id(@article.id)).to eq(nil)
            end
          end
    end
end