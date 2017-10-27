defmodule ProjectManagerExample.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :title, :string
      add :description, :text

      timestamps()
    end

  end
end
