defmodule Navi.Plaid do
  @moduledoc """
  A wrapper module around the plaid library
  to centralize all API calls and mock them easily
  with Mox.
  """

  alias Plaid.LinkToken

  @callback create_link_token(map()) ::
              {:ok, LinkToken.CreateResponse.t()} | {:error, Plaid.Error.t()}
  def create_link_token(params) do
    LinkToken.create(params, get_config())
  end

  defp get_config do
    Application.get_env(:navi, __MODULE__)
  end
end
