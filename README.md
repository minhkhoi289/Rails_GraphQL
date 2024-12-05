# Rails GraphQL Demo

A demo Rails API showcasing GraphQL implementation with various features including queries, mutations, enums, and complexity management.

## Features

- **Posts and Comments**: Basic blog structure with posts and comments
- **GraphQL Types**: Demonstrates object types, enums, and relationships
- **Queries**: Fetch posts and comments with various fields
- **Mutations**: Create/update posts and add likes
- **Enum Types**: Post status management (DRAFT/PUBLISHED/ARCHIVED)
- **Query Complexity**: Implementation of query depth and complexity limits
- **Field-level Complexity**: Custom complexity calculation for fields

## Prerequisites

- Ruby 3.1.2
- Rails 6.1.7
- PostgreSQL

## Setup

1. **Clone the repository**

  ```
   git clone <repository-url>
   cd rails-graphql
  ```

2. **Install dependencies**

  ```
   bundle install
  ```

3. **Database setup**

  ```
   rails db:create
   rails db:migrate
   rails db:seed
  ```

## GraphQL Schema

### Types

- **Post**: Main blog post type
- **Comment**: Comment type for posts
- **PostStatusEnum**: Enum for post status

### Queries

- **Fetch all posts**

 ```
  query {
    posts {
      id
      title
      body
      status
      likesCount
      commentsCount
      comments {
        content
      }
    }
  }
 ```

- **Fetch single post**

 ```
  query {
    post(id: "1") {
      title
      status
      comments {
        content
      }
    }
  }
 ```

### Mutations

- **Create a new post**

 ```
  mutation {
    createPost(input: {
      title: "New Post"
      body: "Post content"
    }) {
      post {
        id
        title
        status
      }
      errors
    }
  }
 ```

- **Update post status**

 ```
  mutation {
    updatePostStatus(input: {
      id: "1"
      status: PUBLISHED
    }) {
      post {
        id
        status
      }
      errors
    }
  }
 ```

- **Like a post**

 ```
  mutation {
    likePost(input: {
      id: "1"
    }) {
      post {
        id
        likesCount
      }
      errors
    }
  }
 ```

## Query Complexity

The API implements complexity limits to prevent abuse:

- Maximum query depth: 10
- Maximum complexity: 200
- Field-level complexity calculation

  Example of complexity calculation:

 ```
  field_complexity ->(ctx, args, child_complexity) {
    child_complexity + 1
  }
 ```

## Development

- **Start the Rails server**

 ```
  rails server
 ```

- **Access GraphiQL interface**

  Visit [http://localhost:3000/graphiql](http://localhost:3000/graphiql) to interact with the API using GraphiQL interface

## API Endpoints

- **GraphQL endpoint**: `POST /api/v1/graphql`
- **GraphiQL interface (development)**: `GET /graphiql`

## Sample Data

The seed data includes:

- A published post with comments
- A draft post without comments
- An archived post without comments

You can reset the sample data anytime with:

```
rails db:seed
```

## License

This project is licensed under the MIT License.
