# frozen_string_literal: true

class DeleteComfirmationitemToUser < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :confirmation_token, :string
    change_column :users, :confirmed_at, :datetime
    change_column :users, :confirmation_sent_at, :datetime
    change_column :users, :unconfirmed_email, :string
  end

  def down
    change_column :users, :confirmation_token, :string
    change_column :users, :confirmed_at, :datetime
    change_column :users, :confirmation_sent_at, :datetime
    change_column :users, :unconfirmed_email, :string
  end
end
