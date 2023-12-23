import Config

config :open_api_spex_impl, OpenApiSpexImplWeb.Endpoint, http: [port: 4000]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime

config :open_api_spex, :cache_adapter, OpenApiSpex.Plug.NoneCache
