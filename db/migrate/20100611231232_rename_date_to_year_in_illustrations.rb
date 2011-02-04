class RenameDateToYearInIllustrations < ActiveRecord::Migration
  def self.up
    rename_column :illustrations, "date", "year"
  end

  def self.down
    rename_column :illustrations, "year", "date"
  end
end
