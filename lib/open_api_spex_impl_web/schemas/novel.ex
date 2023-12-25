defmodule OpenApiSpexImplWeb.Schemas.Novel do
  @moduledoc """

  """

  require OpenApiSpex

  alias OpenApiSpex.Schema

  OpenApiSpex.schema(%{
    description: "A narrative of book length",
    type: :object,
    properties: %{
      name: %Schema{type: :string, description: "The novel's name"},
      type: %Schema{type: :string, description: "The type of object this is", default: "novel"},
      slug: %Schema{
        type: :string,
        description: "A unique identifier based on the novel's name",
        pattern: ~r/^\b[(a-z)+]*[-][(a-z)+]*\b$/
      },
      published: %Schema{
        type: :string,
        description: "The year the novel was first published",
        pattern: ~r/\d{4}/
      }
    },
    required: [:name, :slug, :published],
    example: %{
      "name" => "Hard Times",
      "slug" => "hard-times",
      "published" => "1854"
    }
  })
end
