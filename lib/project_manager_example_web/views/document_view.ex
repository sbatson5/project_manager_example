defmodule ProjectManagerExampleWeb.DocumentView do
  use ProjectManagerExampleWeb, :view
  use JaSerializer.PhoenixView

  attributes [:name, :published, :content, :view_count, :published]

  has_one :project,
    include: false,
    serializer: ProjectManagerExampleWeb.ProjectView
end
