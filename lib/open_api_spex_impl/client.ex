defmodule OpenApiSpexImpl.Client do
  @moduledoc """

  """

  @client Tesla.client([
            {
              Tesla.Middleware.BaseUrl,
              System.get_env("OASI_HOST", "http://localhost:4000")
            },
            Tesla.Middleware.JSON
          ])

  def request(%{
        method: method,
        query: query,
        response: [{200, {struct, :t}}],
        url: url
      }) do
    case Tesla.request(@client, method: method, query: query, url: url) do
      {:ok, %Tesla.Env{body: body}} ->
        map = Map.new(body, fn {k, v} -> {String.to_atom(k), v} end)
        Kernel.struct(struct, map)

      {:error, error} ->
        {:error, error}
    end
  end
end
