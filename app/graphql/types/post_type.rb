module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :body, String, null: false
    field :status, Types::PostStatusEnum, null: false
    field :likes_count, Integer, null: false
    field :comments_count, Integer, null: false
    field :comments, [Types::CommentType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def comments_count
      object.comments.count
    end
  end
end
