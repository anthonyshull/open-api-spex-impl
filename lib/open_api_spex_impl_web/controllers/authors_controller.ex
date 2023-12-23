defmodule OpenApiSpexImplWeb.AuthorsController do
  @moduledoc """

  """

  use OpenApiSpex.ControllerSpecs

  use OpenApiSpexImplWeb, :controller

  alias OpenApiSpex.Schema

  alias OpenApiSpexImpl.Schemas.AuthorResponse

  operation(:show,
    summary: "Show an author",
    parameters: [
      slug: [in: :path, description: "Author id", type: :string, example: "charles-dickens"],
      include: [
        in: :query,
        description: "Resources to include",
        type: %Schema{
          description: "Information you would like included about the author",
          type: :array,
          items: %Schema{enum: ["novels", "serials"], type: :string}
        },
        explode: false
      ]
    ],
    responses: [
      ok: {"Author response", "application/json", AuthorResponse}
    ]
  )

  def show(conn, _) do
    json(conn, %{})
  end
end
