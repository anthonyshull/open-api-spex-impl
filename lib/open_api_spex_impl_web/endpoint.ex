defmodule OpenApiSpexImplWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :open_api_spex_impl

  plug(Plug.RequestId)
  plug(Plug.Telemetry, event_prefix: [:phoenix, :endpoint])

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()
  )

  plug(Plug.MethodOverride)
  plug(Plug.Head)
  plug(OpenApiSpexImplWeb.Router)
end
