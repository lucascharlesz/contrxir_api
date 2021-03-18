defmodule ContrxirApi.Repo.Migrations.CreateParts do
  use Ecto.Migration

  def change do
    create table(:parts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :document_id, :string
      add :birthdate, :date
      add :address, :string
      add :document_type, :string

      timestamps()
    end

  end
end
