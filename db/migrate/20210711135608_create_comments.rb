class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :commentable, polymorphic: true, null: false
      t.text :content
      t.datetime :deleted_at
      t.timestamps
    end
    add_index :comments, :deleted_at
  end
end
