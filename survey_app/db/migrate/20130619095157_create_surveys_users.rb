class CreateSurveysUsers < ActiveRecord::Migration
  def change
    create_table :surveys_users ,id: false do |t|
			t.integer :user_id
			t.integer :survey_id
      t.timestamps
    end
  end
end
