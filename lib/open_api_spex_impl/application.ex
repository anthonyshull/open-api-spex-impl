defmodule OpenApiSpexImpl.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {DNSCluster,
       query: Application.get_env(:open_api_spex_impl, :dns_cluster_query) || :ignore},
      OpenApiSpexImplWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: OpenApiSpexImpl.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    OpenApiSpexImplWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
