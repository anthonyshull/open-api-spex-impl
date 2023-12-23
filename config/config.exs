# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :open_api_spex_impl,
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :open_api_spex_impl, OpenApiSpexImplWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Phoenix.Endpoint.Cowboy2Adapter,
  render_errors: [
    formats: [json: OpenApiSpexImplWeb.ErrorJSON],
    layout: false
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :logger, level: :warning

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Set the mime type for JSON:API
config :mime, :extensions, %{
  "json" => "application/vnd.api+json"
}

config :oapi_generator,
  default: [
    output: [
      base_module: OASI,
      default_client: OpenApiSpexImpl.Client,
      location: "./lib/sdk",
      schema_use: OpenApiSpexImpl.Schema
    ],
    naming: [
      default_operation_module: SDK
    ],
    renderer: OpenApiSpexImpl.Renderer
  ]

config :tesla, adapter: Tesla.Adapter.Hackney

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
