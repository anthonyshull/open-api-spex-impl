defmodule OASI.SDK.Serial do
  @moduledoc """
  Provides struct and type for a Serial
  """
  use OpenApiSpexImpl.Schema

  @type t :: %__MODULE__{
          beginning: String.t(),
          ending: String.t() | nil,
          name: String.t(),
          slug: String.t()
        }

  defstruct [:beginning, :ending, :name, :slug]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      beginning: {:string, :generic},
      ending: {:string, :generic},
      name: {:string, :generic},
      slug: {:string, :generic}
    ]
  end
end
