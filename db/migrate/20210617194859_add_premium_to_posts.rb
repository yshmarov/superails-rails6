class AddPremiumToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :premium, :boolean, default: false
  end
end
