defmodule OpenApiSpexImpl.Schemas.AuthorResponse do
  @moduledoc """

  """

  require OpenApiSpex

  alias OpenApiSpex.Schema

  alias OpenApiSpexImplWeb.Schemas.{Author, Novel, Serial}

  OpenApiSpex.schema(%{
    description: "Response schema for single author",
    type: :object,
    properties: %{
      data: Author,
      included: %Schema{
        description: "Included information about the author",
        type: :array,
        items: %Schema{
          anyOf: [
            Novel,
            Serial
          ]
        }
      }
    },
    example: %{
      "data" => %{
        "name" => "Charles Dickens",
        "slug" => "charles-dickens"
      },
      "included" => [
        %{
          "name" => "Hard Times",
          "slug" => "hard-times",
          "published" => "1854"
        },
        %{
          "name" => "Bleak House",
          "slug" => "bleak-house",
          "beginning" => "1852",
          "ending" => "1853"
        }
      ]
    }
  })
end
