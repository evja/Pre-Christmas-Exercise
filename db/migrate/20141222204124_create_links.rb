class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.text :url
      t.boolean :votes

      t.timestamps
    end
  end
end
