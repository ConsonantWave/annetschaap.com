class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.references :category
      t.string :name_en
      t.string :name_nl
      t.string :image_path_en
      t.string :image_path_nl
      t.text :description_en
      t.text :description_nl

      t.timestamps
    end
  end

  def self.down
    drop_table :galleries
  end
end
