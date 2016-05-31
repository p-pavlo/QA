class ChangeAnswerColumnToString < ActiveRecord::Migration
  def up
    change_column :questions, :answer, :string
  end

  def down
    change_column :questions, :answer, :boolean
  end
end
