class AddUserToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_reference :ideas, :use, foreign_key: true
  end
end
