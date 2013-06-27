class SurveysUsers < ActiveRecord::Migration
  def change
    create_table :surveys_users ,id: false do |t|
			t.references :user
			t.references :survey
      t.timestamps
    end
  end
end
