class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table :admins do |t|
      t.string :login, :null => false
      t.string :crypted_password, :null => false
      t.string :password_salt, :null => false
      t.string :persistence_token, :null => false
      t.datetime :current_login_at
      t.datetime :last_login_at
      t.timestamps
    end
  end

  def self.down
    drop_table :admins
  end
end
