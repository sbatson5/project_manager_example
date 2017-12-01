defmodule ProjectManagerExample.Management.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias ProjectManagerExample.Management.User


  schema "users" do
    field :screen_name, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:screen_name])
    |> validate_required([:screen_name])
  end
end
