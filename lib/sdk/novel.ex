defmodule OASI.Novel do
  @moduledoc """
  Provides struct and type for a Novel
  """
  use OpenApiSpexImpl.Schema

  @type t :: %__MODULE__{
          name: String.t(),
          published: String.t(),
          slug: String.t(),
          type: String.t() | nil
        }

  defstruct [:name, :published, :slug, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      name: {:string, :generic},
      published: {:string, :generic},
      slug: {:string, :generic},
      type: {:string, :generic}
    ]
  end
end
