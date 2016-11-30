class AddDescriptionToAuthors < ActiveRecord::Migration[5.0]
  def change
    add_column :authors, :description, :text
  end
end
