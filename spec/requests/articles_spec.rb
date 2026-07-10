require "rails_helper"

RSpec.describe "Articles", type: :request do

  let(:user) { create(:user) }
  let(:category) { create(:category) }

  describe "GET /articles" do
    it "berhasil tampil halaman artikel" do
      get articles_path
      expect(response).to have_http_status(:success)
    end

    it "tampil daftar artikel" do
      create_list(:article, 3, user: user, category: category)
      get articles_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /articles/:id" do
    it "berhasil tampil detail artikel" do
      article = create(:article, user: user, category: category)
      get article_path(article)
      expect(response).to have_http_status(:success)
    end

    it "views_count bertambah saat artikel dibuka" do
      article = create(:article, user: user, category: category)
      expect {
        get article_path(article)
      }.to change { article.reload.views_count }.by(1)
    end
  end

  describe "POST /articles" do
    context "belum login" do
      it "redirect ke halaman login" do
        post articles_path, params: {
          article: { title: "Test", body: "Isi artikel test" }
        }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end