defmodule OpenApiSpexImplWeb.Schemas.Serial do
  @moduledoc """

  """

  require OpenApiSpex

  alias OpenApiSpex.Schema

  OpenApiSpex.schema(%{
    description: "A published writer.",
    type: :object,
    properties: %{
      name: %Schema{type: :string, description: "The serial's name"},
      slug: %Schema{
        type: :string,
        description: "A unique identifier based on the serial's name",
        pattern: ~r/^\b[(a-z)+]*[-][(a-z)+]*\b$/
      },
      beginning: %Schema{
        type: :string,
        description: "The year the serial began publishing",
        pattern: ~r/\d{4}/
      },
      ending: %Schema{
        type: :string,
        description: "The year the serial finished publishing",
        pattern: ~r/\d{4}/
      }
    },
    required: [:name, :slug, :beginning],
    example: %{
      "name" => "Bleak House",
      "slug" => "bleak-house",
      "beginning" => "1852",
      "ending" => "1853"
    }
  })
end
