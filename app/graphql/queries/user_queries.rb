module Queries
  module UserQueries
    def users(_obj, _args, _ctx)
      User.all
    end

    def user(_obj, args, _ctx)
      User.find(args.userId)
    end
  end
end
