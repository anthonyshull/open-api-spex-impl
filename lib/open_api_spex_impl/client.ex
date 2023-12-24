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
        body
        |> KeyConvert.atomize()
        |> (&Kernel.struct(struct, &1)).()

      {:error, error} ->
        {:error, error}
    end
  end
end
