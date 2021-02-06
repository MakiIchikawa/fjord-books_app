# frozen_string_literal: true

class AddUniqueIndexToUsers < ActiveRecord::Migration[6.1]
  def change
    add_index :users, %i[email uid], unique: true
  end
end
