defmodule ContrxirApiWeb.Schema.Resolvers.Part do
  alias ContrxirApi.{Repo, Part}
  import Ecto.Query, only: [from: 2]

  def list_parts(_parent, _args, _resolution) do
    {:ok, Repo.all(Part)}
  end

  def find_part(_parent, %{id: id}, _resolution) do
    case Repo.get(Part, id) do
      nil -> {:error, "Part ID #{id} not found!"}
      part -> {:ok, part}
    end
  end

  def create_part(_parent, params, _resolution) do
    part_changeset = Part.changeset(%ContrxirApi.Part{}, params)

    case Repo.insert(part_changeset) do
      {:ok, part} -> { :ok, part }
      {:error, changeset} -> {:error, "Failed on creating #{changeset}"}
    end
  end

  def update_part(_parent, %{id: id} = params, _resolution) do
    part_changeset = Repo.get(Part, id)
                      |> Part.changeset(params)

    case Repo.update(part_changeset) do
      {:ok, part} -> { :ok, part }
      {:error, changeset} -> {:error, "Failed on updating #{changeset}"}
    end
  end
end
