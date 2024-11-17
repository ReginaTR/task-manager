class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :url
      t.string :status
      t.text :description

      t.timestamps
    end
  end
end
