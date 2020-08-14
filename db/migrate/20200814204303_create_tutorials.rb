class CreateTutorials < ActiveRecord::Migration[6.0]
  def change
    create_table :tutorials do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
