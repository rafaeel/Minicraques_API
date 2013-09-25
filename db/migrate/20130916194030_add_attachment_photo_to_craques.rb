class AddAttachmentPhotoToCraques < ActiveRecord::Migration
  def self.up  
    add_attachment :craques, :photo
  end

  def self.down
    remove_attachment :craques, :photo
  end
end
