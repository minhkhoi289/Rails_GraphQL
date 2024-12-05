namespace :graphql do
  namespace :schema do
    desc 'Dumps the IDL schema into app/graphql/schema.graphql'
    task dump: :environment do
      # Get the schema IDL
      schema_definition = RailsGraphqlSchema.to_definition
      # Write it to a file
      Rails.root.join('app/graphql/schema.graphql').write(schema_definition)
      puts 'Schema dumped into app/graphql/schema.graphql'
    end
  end
end
