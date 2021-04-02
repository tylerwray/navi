defmodule NaviWeb.LinkTokenControllerTest do
  use NaviWeb.ConnCase, async: true

  test "POST /api/link_token", %{conn: conn} do
    expect(Navi.MockPlaid, :create_link_token, fn _ ->
      {:ok, %{link_token: "link-sandbox-123xxx"}}
    end)

    body =
      conn
      |> put_auth_token()
      |> post("/api/link_token")
      |> json_response(201)

    assert body == %{"data" => %{"link_token" => "link-sandbox-123xxx"}}
  end
end
