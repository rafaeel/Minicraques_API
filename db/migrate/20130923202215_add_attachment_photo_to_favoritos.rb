class AddAttachmentPhotoToFavoritos < ActiveRecord::Migration
  def self.up  
    add_attachment :favoritos, :photo
  end

  def self.down
    remove_attachment :favoritos, :photo
  end
end
