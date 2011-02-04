class Gallery < ActiveRecord::Base
  belongs_to :category
  has_many :illustrations, :dependent => :destroy
  has_one :license
  
  validates_presence_of :name_en, :year, :license_id
  
  before_update :update_illustrations
  
  has_attached_file :icon_en,
    :styles => { :original => "150x150" },
    :url => "/images/:class/:attachment/:id_:filename"
  has_attached_file :icon_nl,
    :styles => { :original => "150x150" },
    :url => "/images/:class/:attachment/:id_:filename"
  #validates_attachment_content_type :icon_en,
  #  :content_type => ["image/jpeg", "image/pjpeg"]
  #validates_attachment_content_type :icon_nl,
  #  :content_type => ["image/jpeg", "image/pjpeg"]
  
  localized_field :name, :icon, :description
  
  def update_illustrations
    year_changed = self.year_changed?
    license_changed = self.license_id_changed?
    if year_changed or license_changed
      illustrations.each do |ill|
        if year_changed
          ill.year = self.year
        end
        if license_changed
          ill.license_id = self.license_id
        end
        ill.save
      end
    end
  end
end
