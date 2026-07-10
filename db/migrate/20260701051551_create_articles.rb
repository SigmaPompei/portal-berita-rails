class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title      # kolom judul (teks pendek)
      t.text :body         # kolom isi (teks panjang)

      t.timestamps         # otomatis buat kolom created_at & updated_at
    end
  end
end