defmodule OpenApiSpexImpl.Authors do
  @moduledoc """

  """

  alias OASI.SDK.{Author, AuthorResponse, Novel, Serial}

  def get(_) do
    %AuthorResponse{
      data: %Author{
        name: "Charles Dickens",
        slug: "charles-dickens"
      },
      included: [
        %Novel{
          name: "Hard Times",
          slug: "hard-times",
          published: "1854"
        },
        %Serial{
          name: "Bleak House",
          slug: "bleak-house",
          beginning: "1852",
          ending: "1853"
        }
      ]
    }
  end
end
