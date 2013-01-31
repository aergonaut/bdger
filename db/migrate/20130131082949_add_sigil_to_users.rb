class AddSigilToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sigil, :string
  end
end
