defmodule Navi.Repo do
  use Ecto.Repo,
    otp_app: :navi,
    adapter: Ecto.Adapters.Postgres
end
