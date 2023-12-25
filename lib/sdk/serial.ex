defmodule OASI.Serial do
  @moduledoc """
  Provides struct and type for a Serial
  """
  use OpenApiSpexImpl.Schema

  @type t :: %__MODULE__{
          beginning: String.t(),
          ending: String.t() | nil,
          name: String.t(),
          slug: String.t(),
          type: String.t() | nil
        }

  defstruct [:beginning, :ending, :name, :slug, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      beginning: {:string, :generic},
      ending: {:string, :generic},
      name: {:string, :generic},
      slug: {:string, :generic},
      type: {:string, :generic}
    ]
  end
end
