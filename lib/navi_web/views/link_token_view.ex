defmodule NaviWeb.LinkTokenView do
  use NaviWeb, :view

  def render("create.json", %{link_token: link_token}) do
    %{data: %{link_token: link_token}}
  end
end
