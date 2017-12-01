defmodule ProjectManagerExampleWeb.UserController do
  use ProjectManagerExampleWeb, :controller

  alias ProjectManagerExample.Management
  alias ProjectManagerExample.Management.User

  action_fallback ProjectManagerExampleWeb.FallbackController

  def index(conn, _params) do
    users = Management.list_users()
    render(conn, "index.json", users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Management.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Management.get_user!(id)

    with {:ok, %User{} = user} <- Management.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Management.get_user!(id)
    with {:ok, %User{}} <- Management.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
