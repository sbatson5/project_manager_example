defmodule ProjectManagerExample.Management.Project do
  use Ecto.Schema
  import Ecto.Changeset
  alias ProjectManagerExample.Management.Project


  schema "projects" do
    field :description, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Project{} = project, attrs) do
    project
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
