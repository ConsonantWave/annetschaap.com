class Category < ActiveRecord::Base
  has_many :galleries, :dependent => :destroy
  
  validates_presence_of :name_en
  validates_uniqueness_of :name_en
  
  has_attached_file :image_en,
    :styles => { :original => "940x400>" },
    :url => "/images/:class/:attachment/:id_:filename"
  has_attached_file :image_nl,
    :styles => { :original => "940x400>" },
    :url => "/images/:class/:attachment/:id_:filename"
  #validates_attachment_content_type :image_en,
  #  :content_type => ["image/jpeg", "image/pjpeg"]
  #validates_attachment_content_type :image_nl,
  #  :content_type => ["image/jpeg", "image/pjpeg"]
  
  localized_field :name, :image, :content
end
