class CreateDefaultUsers < ActiveRecord::Migration
  def self.up
    User.create!(
      name: 'User1',
      email: 'user1@example.com',
      role: "user",
      password: 'password1'
    )

    User.create!(
      name: 'Doctor1',
      email: 'doc1@example.com',
      role: "doctor",
      password: 'password1'
    )

    User.create!(
      name: 'SUPERADMIN',
      email: 'admin@example.com',
      role: "admin",
      password: 'password1'
    )
  end
end
