defmodule OASI.SDK.Operations do
  @moduledoc """
  Provides API endpoint related to operations
  """

  @default_client OASI.SDK.Client

  @doc """
  Show an author

  ## Options

    * `include`: Resources to include

  """
  @spec open_api_spex_impl_web_authors_controller_show(String.t(), keyword) ::
          {:ok, OASI.SDK.AuthorResponse.t()} | :error
  def open_api_spex_impl_web_authors_controller_show(slug, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:include])

    client.request(%{
      args: [slug: slug],
      call: {OASI.SDK.Operations, :open_api_spex_impl_web_authors_controller_show},
      url: "/api/authors/#{slug}",
      method: :get,
      query: query,
      response: [{200, {OASI.SDK.AuthorResponse, :t}}],
      opts: opts
    })
  end
end
