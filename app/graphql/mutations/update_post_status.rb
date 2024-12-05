module Mutations
  class UpdatePostStatus < BaseMutation
    field :post, Types::PostType, null: true
    field :errors, [String], null: false

    argument :id, ID, required: true
    argument :status, Types::PostStatusEnum, required: true

    def resolve(id:, status:)
      post = Post.find_by(id: id)

      if post
        if post.update(status: status)
          {
            post: post,
            errors: []
          }
        else
          {
            post: nil,
            errors: post.errors.full_messages
          }
        end
      else
        {
          post: nil,
          errors: ["Post not found"]
        }
      end
    end
  end
end
