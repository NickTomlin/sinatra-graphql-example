module DynamicResolver
  def self.call(type, field, obj, args, ctx)
    type_module = Object.const_get(type.name)

    case type.to_s
    when "Query", "Mutation"
      # handle top level queries
      type_module.public_send(field.name, obj, args, ctx)
    else
      # as we resolve types to application objects,
      # interrogate them with messages that correspond
      # to the fields defined in our SDL.
      obj.public_send(field.name)
    end
  end
end
