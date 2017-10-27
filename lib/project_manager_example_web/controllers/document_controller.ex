defmodule ProjectManagerExampleWeb.DocumentController do
  use ProjectManagerExampleWeb, :controller

  alias ProjectManagerExample.Management
  alias ProjectManagerExample.Management.Document

  action_fallback ProjectManagerExampleWeb.FallbackController

  def index(conn, _params) do
    documents = Management.list_documents()
    render(conn, "index.json-api", data: documents)
  end

  def create(conn, %{"document" => document_params}) do
    with {:ok, %Document{} = document} <- Management.create_document(document_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", document_path(conn, :show, document))
      |> render("show.json-api", data: document)
    end
  end

  def show(conn, %{"id" => id}) do
    document = Management.get_document!(id)
    render(conn, "show.json-api", data: document)
  end

  def update(conn, %{"id" => id, "document" => document_params}) do
    document = Management.get_document!(id)

    with {:ok, %Document{} = document} <- Management.update_document(document, document_params) do
      render(conn, "show.json-api", data: document)
    end
  end

  def delete(conn, %{"id" => id}) do
    document = Management.get_document!(id)
    with {:ok, %Document{}} <- Management.delete_document(document) do
      send_resp(conn, :no_content, "")
    end
  end
end
