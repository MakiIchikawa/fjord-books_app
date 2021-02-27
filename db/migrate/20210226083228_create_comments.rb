# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :created_by, null: false, foreign_key: { to_table: :users }
      t.references :commentable, polymorphic: true

      t.timestamps
    end
  end
end
