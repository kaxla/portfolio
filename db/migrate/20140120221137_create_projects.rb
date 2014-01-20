class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :Name
      t.text :Technologies

      t.timestamps
    end
  end
end
