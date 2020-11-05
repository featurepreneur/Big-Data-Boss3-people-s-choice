class AddVotedToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :voted, :boolean
  end
end
