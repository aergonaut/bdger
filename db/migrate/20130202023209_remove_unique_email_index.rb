class RemoveUniqueEmailIndex < ActiveRecord::Migration
  def up
    remove_index :users, column: :email
  end
end
