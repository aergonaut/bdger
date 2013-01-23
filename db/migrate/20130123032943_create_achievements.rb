class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.integer :badge_id
      t.integer :user_id
      t.text :body
      t.string :short_hash
      t.string :slug

      t.timestamps
    end

    add_index :achievements, :slug, unique: true
    add_index :achievements, :short_hash, unique: true
  end
end
