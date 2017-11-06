defmodule ProjectManagerExampleWeb.UserController do
  use ProjectManagerExampleWeb, :controller

  alias ProjectManagerExample.Accounts
  alias ProjectManagerExample.Accounts.User

  action_fallback ProjectManagerExampleWeb.FallbackController

  def create(conn, %{"code" => code, "redirect_uri" => redirect_uri, "client_id" => client_id}) do
    request_body = %{
      "code" => code,
      "redirect_uri" => redirect_uri,
      "client_id" => client_id,
      "client_secret" => "<your client secret here>",
      "scope" => "",
      "grant_type" => "authorization_code"
    } |> Plug.Conn.Query.encode

    headers = %{
      "Content-Type" => "application/x-www-form-urlencoded",
      "X-Requested-With": "XMLHttpRequest"
    }

    case HTTPoison.post("https://accounts.google.com/o/oauth2/token", request_body, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        json(conn, Poison.decode!(body))
      {:error, error} -> IO.inspect(error)
    end
  end
end
