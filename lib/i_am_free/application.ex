defmodule IAmFree.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      IAmFree.Repo,
      # Start the Telemetry supervisor
      IAmFreeWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: IAmFree.PubSub},
      # Start the Endpoint (http/https)
      IAmFreeWeb.Endpoint
      # Start a worker by calling: IAmFree.Worker.start_link(arg)
      # {IAmFree.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: IAmFree.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    IAmFreeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
