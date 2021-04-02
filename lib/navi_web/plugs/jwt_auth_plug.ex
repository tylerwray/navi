defmodule NaviWeb.JwtAuthPlug do
  @behaviour Plug
  import Plug.Conn

  alias NaviWeb.Token

  def init(opts), do: opts

  def call(conn, _) do
    header =
      conn
      |> get_req_header("authorization")
      |> List.first()

    case verify_token(header) do
      {:ok, _} -> conn
      _ -> put_unauthenticated(conn)
    end
  end

  defp verify_token("Bearer " <> token) do
    Token.verify_and_validate(token)
  end

  defp verify_token(_) do
    {:error, :invalid_header}
  end

  defp put_unauthenticated(conn) do
    conn
    |> send_resp(401, "Unauthenticated")
    |> halt()
  end
end
