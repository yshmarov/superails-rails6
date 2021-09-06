class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :commentable, polymorphic: true, null: false
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :comments, :deleted_at
  end
end
