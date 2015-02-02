class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :user
      t.string :name
      t.string :type
      t.string :link

      t.timestamps
    end
  end
end
