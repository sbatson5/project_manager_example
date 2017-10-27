defmodule ProjectManagerExampleWeb.PageController do
  use ProjectManagerExampleWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
