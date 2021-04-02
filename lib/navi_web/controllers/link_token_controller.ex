defmodule NaviWeb.LinkTokenController do
  use NaviWeb, :controller

  alias Navi.Account

  def create(conn, _params) do
    {:ok, link_token} = Account.create_link_token()

    conn
    |> put_status(:created)
    |> render("create.json", link_token: link_token)
  end
end
