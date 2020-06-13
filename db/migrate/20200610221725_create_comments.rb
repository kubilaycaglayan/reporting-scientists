class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :opinion_id
      t.text :content, null: false

      t.timestamps
    end
    add_foreign_key :comments, :users, column: :user_id
    add_foreign_key :comments, :opinions, column: :opinion_id
  end
end
