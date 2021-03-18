defmodule ContrxirApiWeb.Schema do
  use Absinthe.Schema

  import_types ContrxirApiWeb.Schema.Types.PartTypes

  alias ContrxirApiWeb.Schema.Resolvers

  query do
    @desc "Get all parts"
    field :parts, list_of(:part) do
      resolve &Resolvers.Part.list_parts/3
    end

    @desc "Get a user of the blog"
    field :part, :part do
      arg :id, non_null(:id)
      resolve &Resolvers.Part.find_part/3
    end
  end

  mutation do
    @desc "Create a part"
    field :create_part, type: :part do
      arg :name, non_null(:string)
      arg :document_id, non_null(:string)
      arg :document_type, non_null(:string)
      arg :address, :string
      arg :birthdate, :date

      resolve &Resolvers.Part.create_part/3
    end

    @desc "Update a part"
    field :update_part, type: :part do
      arg :id, non_null(:id)
      arg :name, non_null(:string)
      arg :document_id, non_null(:string)
      arg :document_type, non_null(:string)
      arg :address, :string
      arg :birthdate, :date

      resolve &Resolvers.Part.update_part/3
    end
  end
end
