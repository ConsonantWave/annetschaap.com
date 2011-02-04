class AddYearAndLicenseToGalleries < ActiveRecord::Migration
  def self.up
    add_column :galleries, :year, :integer
    add_column :galleries, :license_id, :integer
  end

  def self.down
    remove_column :galleries, :year
    remove_column :galleries, :license_id
  end
end
