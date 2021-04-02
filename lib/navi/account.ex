defmodule Navi.Account do
  @moduledoc """
  Account context dealing with:

    * Linking accounts

  """

  @plaid Application.get_env(:navi, :plaid, Navi.Plaid)

  def create_link_token do
    params = %{
      client_name: "Plaid Test App",
      language: "en",
      country_codes: ["US"],
      user: %{
        client_user_id: "1"
      },
      products: ["auth", "transactions"],
      webhook: "https://example.com/webhook"
    }

    with {:ok, %{link_token: link_token}} <- @plaid.create_link_token(params) do
      {:ok, link_token}
    end
  end
end
