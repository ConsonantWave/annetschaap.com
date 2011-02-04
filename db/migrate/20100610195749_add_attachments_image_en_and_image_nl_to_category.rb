class AddAttachmentsImageEnAndImageNlToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :image_en_file_name, :string
    add_column :categories, :image_en_content_type, :string
    add_column :categories, :image_en_file_size, :integer
    add_column :categories, :image_en_updated_at, :datetime
    add_column :categories, :image_nl_file_name, :string
    add_column :categories, :image_nl_content_type, :string
    add_column :categories, :image_nl_file_size, :integer
    add_column :categories, :image_nl_updated_at, :datetime
    remove_column :categories, :image_path_en
    remove_column :categories, :image_path_nl
  end

  def self.down
    remove_column :categories, :image_en_file_name
    remove_column :categories, :image_en_content_type
    remove_column :categories, :image_en_file_size
    remove_column :categories, :image_en_updated_at
    remove_column :categories, :image_nl_file_name
    remove_column :categories, :image_nl_content_type
    remove_column :categories, :image_nl_file_size
    remove_column :categories, :image_nl_updated_at
    add_column :categories, :image_path_en, :string
    add_column :categories, :image_path_nl, :string
  end
end
