require "rails_helper"

RSpec.describe Category, type: :model do

  describe "Validasi" do
    it "valid dengan nama" do
      category = build(:category)
      expect(category).to be_valid
    end

    it "tidak valid tanpa nama" do
      category = build(:category, name: "")
      expect(category).not_to be_valid
    end

    it "tidak valid dengan nama duplikat" do
      create(:category, name: "Teknologi")
      category = build(:category, name: "Teknologi")
      expect(category).not_to be_valid
    end
  end

  describe "Relasi" do
    it "punya banyak artikel" do
      association = Category.reflect_on_association(:articles)
      expect(association.macro).to eq(:has_many)
    end
  end

end