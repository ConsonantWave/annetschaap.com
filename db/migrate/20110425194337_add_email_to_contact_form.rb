class AddEmailToContactForm < ActiveRecord::Migration
  def self.up
    add_column :contact_forms, :email, :string
  end

  def self.down
    remove_column :contact_forms, :email
  end
end
