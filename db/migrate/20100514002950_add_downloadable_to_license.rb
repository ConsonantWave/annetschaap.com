class AddDownloadableToLicense < ActiveRecord::Migration
  def self.up
    add_column :licenses, :downloadable, :boolean
  end

  def self.down
    remove_column :licenses, :downloadable
  end
end
