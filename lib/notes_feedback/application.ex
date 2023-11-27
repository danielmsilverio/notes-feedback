defmodule NotesFeedback.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      NotesFeedbackWeb.Telemetry,
      NotesFeedback.Repo,
      {DNSCluster, query: Application.get_env(:notes_feedback, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: NotesFeedback.PubSub},
      # Start a worker by calling: NotesFeedback.Worker.start_link(arg)
      # {NotesFeedback.Worker, arg},
      # Start to serve requests, typically the last entry
      NotesFeedbackWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NotesFeedback.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NotesFeedbackWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
