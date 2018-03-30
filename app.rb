require 'sinatra/activerecord'
require 'sinatra/base'
require 'sinatra/json'
require 'graphql'

require_relative 'app/models/user'
require_relative 'app/graphql/dynamic_resolver'
require_relative 'app/graphql/query'
require_relative 'app/graphql/mutation'

$stdout.sync = true

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  SCHEMA_DEFINITION = File.open(File.expand_path('app/graphql/schema.graphql', __dir__)).read

  get '/' do
    json message: "You should point graphiql (https://github.com/graphql/graphiql) to http://localhost:#{request.port}/graphql"
  end

  post '/graphql' do
    body = JSON.parse(request.body.read)
    variables = body['variables']
    query = body['query']
    operation_name = body['operationName']

    # this typically holds
    # any request level metadata
    # like authentication or session information
    context = {}

    built_schema = GraphQL::Schema.from_definition(SCHEMA_DEFINITION, default_resolve: DynamicResolver)
    result = built_schema.execute(query, variables: variables, context: context, operation_name: operation_name)

    json result
  end
end
