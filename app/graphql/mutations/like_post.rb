module Mutations
  class LikePost < BaseMutation
    field :post, Types::PostType, null: true
    field :errors, [String], null: false

    argument :id, ID, required: true

    def resolve(id:)
      post = Post.find_by(id: id)

      if post
        post.increment!(:likes_count)
        {
          post: post,
          errors: []
        }
      else
        {
          post: nil,
          errors: ["Post not found"]
        }
      end
    end
  end
end
