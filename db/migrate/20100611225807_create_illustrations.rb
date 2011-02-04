class CreateIllustrations < ActiveRecord::Migration
  def self.up
    create_table :illustrations do |t|
      t.references :gallery
      t.string :name_en
      t.string :name_nl
      t.text :comment_en
      t.text :comment_nl
      t.integer :date
      t.references :license

      t.timestamps
    end
  end

  def self.down
    drop_table :illustrations
  end
end
