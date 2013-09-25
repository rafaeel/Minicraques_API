class Favorito < ActiveRecord::Base
  attr_accessible :name, :nationality, :photo_url, :photo_data, :photo 
  attr_accessor :photo_data, :photo

  def decode_photo_data
  # if the icon_image_data is set
  # decode it and handle by controller method
   
  	if self.photo_data.present?
    	data = StringIO.new(Base64.decode64(self.photo_data))
    	data.class.class_eval {attr_accessor :original_filename, :content_type}
    	data.original_filename = self.id.to_s+".jpeg"
    	data.content_type = "image/jpeg"
   
    	return data
  	end
	end
end
