class Message < ApplicationRecord
  after_create_commit { MessageBroadcastJob.perform_later self }

  belongs_to :room
  belongs_to :user
end
