class AddUserIdRefToLibraryUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :library_users, :user.references, :string
  end
end
