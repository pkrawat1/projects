class Modify < ActiveRecord::Migration
  def up
  end

  def down
  	remove_column :answers ,:question_id_id
  	remove_column :answers ,:question_id_id
  	add_column :answers ,:question_id
  	add_column :answers ,:question_id
	end
end
