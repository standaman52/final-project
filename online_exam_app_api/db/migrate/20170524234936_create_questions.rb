class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      t.string :name
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :option4
      t.string :correctanswer
      t.integer :score

      t.timestamps
    end
  end
end
