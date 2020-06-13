class CreateOpinions < ActiveRecord::Migration[6.0]
  def change
    create_table :opinions do |t|
      t.integer :author_id, foreign_key: true
      t.text :text

      t.timestamps
    end
    add_foreign_key :opinions, :users, column: :author_id
  end
end
