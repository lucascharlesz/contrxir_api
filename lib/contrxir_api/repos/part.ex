defmodule ContrxirApi.Repos.Part do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "parts" do
    field :address, :string
    field :birthdate, :date
    field :document_id, :string
    field :document_type, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(part, attrs) do
    part
    |> cast(attrs, [:name, :document_id, :birthdate, :address, :document_type])
    |> validate_required([:name, :document_id, :document_type])
  end
end
