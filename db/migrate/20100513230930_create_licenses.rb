class CreateLicenses < ActiveRecord::Migration
  def self.up
    create_table :licenses do |t|
      t.string :name_en
      t.string :name_nl
      t.bool :downloadable
      t.text :description_en
      t.text :description_nl

      t.timestamps
    end
  end

  def self.down
    drop_table :licenses
  end
end
