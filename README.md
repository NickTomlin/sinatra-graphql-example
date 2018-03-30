Sinatra Graphql Example
===

A quick and dirty implementation of an [SDL](https://blog.graph.cool/graphql-sdl-schema-definition-language-6755bcb9ce51) based GraphQL api in [Sinatra](http://sinatrarb.com/). Props to @kyledetella for the idea and most of the hard work in Rails land :smile:.

Getting Started
---

```
docker-compose up
# initialize DB state
docker-compose exec web bash -c "bundle exec rake db:create && bundle exec rake db:migrate"
```

By default, the application listens at `localhost:3020`, you can hit this with `curl` if you love pain or use [graphiql-app](https://github.com/skevy/graphiql-app).

Structure
---

The SDL lives at [schema.graphql](app/graphql/schema.graphql). The Mutation and Query modules are defined in `app/graphql/mutation.rb` and `app/graphql/query.rb` and split out into individual typed modules in `app/graphql/mutations` and `app/graphql/queries` respectively.

Tests
---

There are none! There may never be! Live in freedom!

Contributing
---

1. Make your changes
2. Test against the graphqil app or hit `/graphql` via curl
3. If everything is golden open a PR
