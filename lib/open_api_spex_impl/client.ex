defmodule OpenApiSpexImpl.Client do
  @moduledoc """

  """

  alias OpenApiSpexImpl.Decoder

  @host System.get_env("OASI_HOST", "http://localhost:4000")
  @client Tesla.client([
            {Tesla.Middleware.BaseUrl, @host},
            Tesla.Middleware.JSON
          ])

  def request(%{
        method: method,
        query: query,
        response: response,
        url: url
      }) do
    case Tesla.request(@client, method: method, query: query, url: url) do
      {:ok, %Tesla.Env{body: body, status: status}} ->
        Decoder.decode(body: body, response: response, status: status)

      {:error, error} ->
        {:error, error}
    end
  end
end
