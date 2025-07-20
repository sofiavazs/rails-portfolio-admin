class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :url
      t.string :github
      t.json :tags

      t.timestamps
    end
  end
end
