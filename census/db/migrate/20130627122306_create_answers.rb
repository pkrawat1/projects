class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :user
      t.references :option
      t.references :question
      t.references :survey
      t.timestamps
    end
  end
end
