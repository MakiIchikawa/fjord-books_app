# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  belongs_to :commentable, polymorphic: true
end
