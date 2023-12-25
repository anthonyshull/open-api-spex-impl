defmodule OpenApiSpexImpl.Authors do
  @moduledoc """

  """

  alias OASI.{Author, AuthorResponse, Novel, Serial}

  def get(_) do
    %AuthorResponse{
      data: %Author{
        name: "Charles Dickens",
        type: "author",
        slug: "charles-dickens"
      },
      included: [
        %Novel{
          name: "Hard Times",
          type: "novel",
          slug: "hard-times",
          published: "1854"
        },
        %Serial{
          name: "Bleak House",
          type: "serial",
          slug: "bleak-house",
          beginning: "1852",
          ending: "1853"
        }
      ]
    }
  end
end
