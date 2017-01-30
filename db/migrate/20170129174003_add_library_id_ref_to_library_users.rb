class AddLibraryIdRefToLibraryUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :library_users, :library.references, :string
  end
end
