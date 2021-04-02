defmodule Navi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Navi.Repo,
      # Start the Telemetry supervisor
      NaviWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Navi.PubSub},
      # Start the Endpoint (http/https)
      NaviWeb.Endpoint
      # Start a worker by calling: Navi.Worker.start_link(arg)
      # {Navi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Navi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    NaviWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
