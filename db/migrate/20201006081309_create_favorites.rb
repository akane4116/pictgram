class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :user_integer
      t.integer :topic_id

      t.timestamps
    end
  end
end
