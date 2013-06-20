class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
			t.string :desc
  		#t.references :Survey
  		t.integer :survey_id
      t.timestamps
    end
  end
end
