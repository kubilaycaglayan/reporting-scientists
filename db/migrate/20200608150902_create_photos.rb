class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.integer :user_id, foreign_key: true

      t.timestamps
    end
    add_foreign_key :photos, :users
    add_column :photos, :image_type, :string, limit: 7, null: false, default: 'profile'
  end
end
