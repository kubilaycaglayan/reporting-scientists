class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.integer :follower_id, foreign_key: true
      t.integer :followed_id, foreign_key: true

      t.timestamps
    end
    add_foreign_key :followings, :users, column: :follower_id
    add_foreign_key :followings, :users, column: :followed_id
    add_index(:followings, [:follower_id, :followed_id], unique: true)
  end
end
