require "rails_helper"

RSpec.describe Article, type: :model do

  describe "Validasi" do
    it "valid dengan semua atribut lengkap" do
      article = build(:article)
      expect(article).to be_valid
    end

    it "tidak valid tanpa judul" do
      article = build(:article, title: "")
      expect(article).not_to be_valid
    end

    it "tidak valid jika judul terlalu pendek (kurang dari 3 karakter)" do
      article = build(:article, title: "Ab")
      expect(article).not_to be_valid
    end

    it "tidak valid jika judul terlalu panjang (lebih dari 100 karakter)" do
      article = build(:article, title: "A" * 101)
      expect(article).not_to be_valid
    end

    it "tidak valid tanpa isi" do
      article = build(:article, body: "")
      expect(article).not_to be_valid
    end
  end

  describe "Relasi" do
    it "milik seorang user" do
      association = Article.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it "bisa punya kategori" do
      association = Article.reflect_on_association(:category)
      expect(association.macro).to eq(:belongs_to)
    end
  end

  describe "Views Counter" do
    it "views_count dimulai dari 0" do
      article = create(:article)
      expect(article.views_count).to eq(0)
    end

    it "views_count bertambah saat di-increment" do
      article = create(:article)
      article.increment!(:views_count)
      expect(article.views_count).to eq(1)
    end
  end

end