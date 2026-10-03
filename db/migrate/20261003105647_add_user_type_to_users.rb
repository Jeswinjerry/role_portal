class AddUserTypeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_type, :string,
               default: "student", null: false

    add_index :users, :user_type,
              unique: true,
              where: "user_type = 'admin'",
              name: "index_users_only_one_admin"
  end
end