class AddUserIdToJuice < ActiveRecord::Migration[5.0]
  def change
    add_column :juices, :user_id, :integer, index: true
  end
end
