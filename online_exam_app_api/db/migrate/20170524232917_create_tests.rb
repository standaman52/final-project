class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
      t.string :name
      t.string :description
      t.integer :numberofquestion
      t.datetime :begindate
      t.datetime :enddate

      t.timestamps
    end
  end
end
