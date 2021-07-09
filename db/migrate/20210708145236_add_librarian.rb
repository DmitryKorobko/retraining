class AddLibrarian < ActiveRecord::Migration[6.1]
  def change
    User.create! do |u|
      u.email          = 'admin@admin.com'
      u.password       = 'password'
      u.first_name     = 'Librarian'
      u.last_name      = 'Admin'
      u.librarian_role = true
    end
  end
end
