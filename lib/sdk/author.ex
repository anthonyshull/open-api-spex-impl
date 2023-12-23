defmodule OASI.Author do
  @moduledoc """
  Provides struct and type for a Author
  """
  use OpenApiSpexImpl.Schema

  @type t :: %__MODULE__{name: String.t(), slug: String.t()}

  defstruct [:name, :slug]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: {:string, :generic}, slug: {:string, :generic}]
  end
end
