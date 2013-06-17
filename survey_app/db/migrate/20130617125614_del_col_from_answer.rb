class DelColFromAnswer < ActiveRecord::Migration
  def up
  end

  def down
  	drop_table :answer
	end
end
