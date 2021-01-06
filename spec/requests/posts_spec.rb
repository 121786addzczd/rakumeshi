require 'rails_helper'
describe PostsController, type: :request do

  before do
    @post = FactoryBot.create(:post)
    @tag = @post.tags
  end

  describe "GET #index" do
    it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do
      get posts_path
      expect(response.status).to eq 200
    end
    it "indexアクションにリクエストするとレスポンスに投稿済みの投稿のテキストが存在する" do
      get posts_path
      expect(response.body).to include @post.content
    end
    it "indexアクションにリクエストするとレスポンスに投稿検索フォームが存在する" do
      get posts_path
      expect(response.body).to include "キーワードから探す"
    end
    describe "GET #show" do
      it "showアクションにリクエストすると正常にレスポンスが返ってくる" do
        get post_path(@post)
        expect(response.status).to eq 200
      end
      it "showアクションにリクエストするとレスポンスに投稿済みの投稿のテキストが存在する" do
        get post_path(@post)
        expect(response.body).to include @post.user.nickname
      end
    end
  end
end
