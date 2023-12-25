defmodule OpenApiSpexImplWeb.Schemas.Author do
  @moduledoc """

  """

  require OpenApiSpex

  alias OpenApiSpex.Schema

  OpenApiSpex.schema(%{
    description: "A published writer",
    type: :object,
    properties: %{
      name: %Schema{type: :string, description: "The author's name"},
      type: %Schema{type: :string, description: "The type of object this is", default: "author"},
      slug: %Schema{
        type: :string,
        description: "A unique identifier based on the author's name",
        pattern: ~r/[(a-z)-]+/
      }
    },
    required: [:name, :slug],
    example: %{
      "name" => "Charles Dickens",
      "slug" => "charles-dickens"
    }
  })
end
