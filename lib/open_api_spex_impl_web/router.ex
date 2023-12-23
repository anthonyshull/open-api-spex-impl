defmodule OpenApiSpexImplWeb.Router do
  use OpenApiSpexImplWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
    plug(OpenApiSpex.Plug.PutApiSpec, module: OpenApiSpexImplWeb.ApiSpec)
  end

  scope "/api", OpenApiSpexImplWeb do
    pipe_through(:api)

    get("/authors/:slug", AuthorsController, :show)
  end
end
