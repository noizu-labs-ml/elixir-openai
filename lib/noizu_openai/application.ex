defmodule NoizuLabs.OpenAI.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      NoizuLabs.OpenAIWeb.Telemetry,
      # Start the Ecto repository
      # NoizuLabs.OpenAI.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: NoizuLabs.OpenAI.PubSub},
      # Start Finch
      {Finch, name: NoizuLabs.OpenAI.Finch},
      # Start the Endpoint (http/https)
      NoizuLabs.OpenAIWeb.Endpoint
      # Start a worker by calling: NoizuLabs.OpenAI.Worker.start_link(arg)
      # {NoizuLabs.OpenAI.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NoizuLabs.OpenAI.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NoizuLabs.OpenAIWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
