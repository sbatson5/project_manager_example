defmodule ProjectManagerExampleWeb.ProjectView do
  use ProjectManagerExampleWeb, :view
  use JaSerializer.PhoenixView

  attributes [:title, :description]
end
