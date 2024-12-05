module Types
  class PostStatusEnum < Types::BaseEnum
    description "Status of a post"

    value "DRAFT", "Post is not published yet"
    value "PUBLISHED", "Post is visible to readers"
    value "ARCHIVED", "Post has been archived"
  end
end
