defmodule ProjectManagerExample.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :name, :string

      timestamps()
    end

  end
end
