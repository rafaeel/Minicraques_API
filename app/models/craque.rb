class Craque < ActiveRecord::Base
  attr_accessible :name, :nationality, :photo

  has_attached_file :photo, :styles => { :original => "250x250>", :thumb => "100x100>" }
end
