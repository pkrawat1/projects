class CreateQanswers < ActiveRecord::Migration
  def change
    create_table :qanswers do |t|
      t.string :desc
      t.integer :question_id
      t.integer :user_id
      t.integer :option_id
      t.timestamps
    end
  end
end
