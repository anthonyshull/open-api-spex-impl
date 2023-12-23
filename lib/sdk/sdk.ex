defmodule OASI.SDK do
  @moduledoc """
  Provides API endpoint related to sdk
  """

  @default_client OpenApiSpexImpl.Client

  @doc """
  Show an author

  ## Options

    * `include`: Resources to include

  """
  @spec authors_show(String.t(), keyword) :: {:ok, OASI.AuthorResponse.t()} | :error
  def authors_show(slug, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:include])

    client.request(%{
      args: [slug: slug],
      call: {OASI.SDK, :authors_show},
      url: "/api/authors/#{slug}",
      method: :get,
      query: query,
      response: [{200, {OASI.AuthorResponse, :t}}],
      opts: opts
    })
  end
end
