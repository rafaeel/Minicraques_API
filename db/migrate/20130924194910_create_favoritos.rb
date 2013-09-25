class CreateFavoritos < ActiveRecord::Migration
  def change
    create_table :favoritos do |t|
      t.string :name
      t.string :nationality
      t.string :photo_url

      t.timestamps
    end
  end
end
