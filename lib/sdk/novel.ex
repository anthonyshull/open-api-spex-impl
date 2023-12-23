defmodule OASI.SDK.Novel do
  @moduledoc """
  Provides struct and type for a Novel
  """

  @type t :: %__MODULE__{name: String.t(), published: String.t(), slug: String.t()}

  defstruct [:name, :published, :slug]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: {:string, :generic}, published: {:string, :generic}, slug: {:string, :generic}]
  end
end
