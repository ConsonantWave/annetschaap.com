class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name_en
      t.string :name_nl
      t.string :image_path_en
      t.string :image_path_nl
      t.text :content_en
      t.text :content_nl

      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
