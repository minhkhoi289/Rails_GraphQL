module Mutations
  class CreatePost < BaseMutation
    field :post, Types::PostType, null: true
    field :errors, [String], null: false

    argument :title, String, required: true
    argument :body, String, required: true

    def resolve(title:, body:)
      post = Post.new(title: title, body: body)
      if post.save
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
    end
  end
end
