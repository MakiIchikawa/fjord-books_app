# frozen_string_literal: true

class ChangeEmailToAllowNull < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :email, :string, null: true # null: trueを明示する必要がある
  end

  def down
    change_column :users, :email, :string, null: false
  end
end
