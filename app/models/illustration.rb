class Illustration < ActiveRecord::Base
  belongs_to :gallery
  has_one :license
  
  validates_presence_of :name_en, :image_file_name, :year, :license_id
  
  has_attached_file :image,
    :styles => { :page => "940>",
                 :gallery => "940x400>",
                 :thumb => "160x160>" },
    :url => "/images/:class/:attachment/:id_:style_:filename",
    :default_url => "/images/defaults/en.jpg"
  
  #validates_attachment_content_type :image,
  #  :content_type => ["image/jpeg", "image/pjpeg"]
    
  localized_field :name, :comment
  
  def previous
    find_from_sort(self[:sorted_order] - 1)
  end
  
  def next
    find_from_sort(self[:sorted_order] + 1)
  end
  
  private
  def find_from_sort(reference)
    Illustration.first(:conditions => { :gallery_id => self[:gallery_id],
                         :sorted_order => reference})
  end
end
