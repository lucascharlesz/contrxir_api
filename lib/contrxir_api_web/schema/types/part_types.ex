
defmodule ContrxirApiWeb.Schema.Types.PartTypes do
  use Absinthe.Schema.Notation

  import_types Absinthe.Type.Custom

  object :part do
    field :id, :id
    field :address, :string
    field :birthdate, :date
    field :document_id, :string
    field :document_type, :string
    field :name, :string
    field :created_at, :datetime
    field :updated_at, :datetime
  end
end
