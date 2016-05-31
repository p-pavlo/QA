class ChangeResponseColumnToString < ActiveRecord::Migration
  def up
    change_column :user_responses, :response, :string
  end

  def down
    change_column :user_responses, :response, :boolean
  end
end
