class AddAdmin < ActiveRecord::Migration
  def self.up
    User.create!(name: 'SUPERADMIN',
                 email: 'admin@example.com',
                 admin: true,
                 password: 'password1')
  end
end
