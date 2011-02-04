class License < ActiveRecord::Base
  has_many :galleries
  has_many :illustrations
  localized_field :name, :description
end
