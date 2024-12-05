# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :posts, [Types::PostType], null: false,
      description: "Returns a list of posts"

    field :post, Types::PostType, null: true do
      description "Find a post by ID"
      argument :id, ID, required: true
    end

    def posts
      Post.all
    end

    def post(id:)
      Post.find_by(id: id)
    end
  end
end
