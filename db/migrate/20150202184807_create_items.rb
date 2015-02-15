class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :user
      t.string :name
      t.string :media_type
      t.string :link
      t.string :rotten_score
      t.boolean :on_netflix

      t.timestamps
    end
  end
end
