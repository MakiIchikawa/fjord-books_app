# frozen_string_literal: true

class AddUniqueIndexToUsers < ActiveRecord::Migration[6.1]
  def change
    add_index :users, %i[provider uid], unique: true, where: 'provider != null'
  end
end
