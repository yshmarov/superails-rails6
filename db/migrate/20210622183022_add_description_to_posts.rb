class AddDescriptionToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :description, :text
  end
end
