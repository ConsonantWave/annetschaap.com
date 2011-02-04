class AddSortedOrderToIllustrations < ActiveRecord::Migration
  def self.up
    add_column :illustrations, :sorted_order, :integer, :null => false, :default => 0
    add_index :illustrations, :sorted_order
  end

  def self.down
    remove_index :illustrations, :sorted_order
    remove_column :illustrations, :sorted_order
  end
end
