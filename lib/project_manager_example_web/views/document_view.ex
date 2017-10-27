defmodule ProjectManagerExampleWeb.DocumentView do
  use ProjectManagerExampleWeb, :view
  use JaSerializer.PhoenixView

  attributes [:name, :published, :content, :view_count, :published, :project_id]
end
