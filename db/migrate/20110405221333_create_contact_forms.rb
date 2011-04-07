class CreateContactForms < ActiveRecord::Migration
  def self.up
    create_table :contact_forms do |t|
      t.text :content
      t.timestamps
    end
  end

  def self.down
    drop_table :contact_forms
  end
end
