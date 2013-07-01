class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
			t.string :desc
			t.references :question_id
			t.references :user_id
			t.references :option_id 
      t.timestamps
    end
  end
end
