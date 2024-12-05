# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_post, mutation: Mutations::CreatePost
    field :like_post, mutation: Mutations::LikePost
    field :update_post_status, mutation: Mutations::UpdatePostStatus
  end
end
