module Mutations
  module UserMutations
    def createUser(_obj, args, _ctx)
      User.create!(name: args.user.name)
    end
  end
end

