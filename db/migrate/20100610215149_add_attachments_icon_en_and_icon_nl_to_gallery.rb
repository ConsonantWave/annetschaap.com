class AddAttachmentsIconEnAndIconNlToGallery < ActiveRecord::Migration
  def self.up
    add_column :galleries, :icon_en_file_name, :string
    add_column :galleries, :icon_en_content_type, :string
    add_column :galleries, :icon_en_file_size, :integer
    add_column :galleries, :icon_en_updated_at, :datetime
    add_column :galleries, :icon_nl_file_name, :string
    add_column :galleries, :icon_nl_content_type, :string
    add_column :galleries, :icon_nl_file_size, :integer
    add_column :galleries, :icon_nl_updated_at, :datetime
    remove_column :galleries, :image_path_en
    remove_column :galleries, :image_path_nl
  end

  def self.down
    remove_column :galleries, :icon_en_file_name
    remove_column :galleries, :icon_en_content_type
    remove_column :galleries, :icon_en_file_size
    remove_column :galleries, :icon_en_updated_at
    remove_column :galleries, :icon_nl_file_name
    remove_column :galleries, :icon_nl_content_type
    remove_column :galleries, :icon_nl_file_size
    remove_column :galleries, :icon_nl_updated_at
    add_column :galleries, :image_path_en, :string
    add_column :galleries, :image_path_nl, :string
  end
end
