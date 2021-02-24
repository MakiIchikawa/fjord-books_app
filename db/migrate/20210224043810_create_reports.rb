# frozen_string_literal: true

class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.text :title
      t.text :content
      t.references :created_by, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
