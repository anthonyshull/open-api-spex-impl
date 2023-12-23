defmodule OASI.AuthorResponse do
  @moduledoc """
  Provides struct and type for a AuthorResponse
  """
  use OpenApiSpexImpl.Schema

  @type t :: %__MODULE__{
          data: OASI.Author.t() | nil,
          included: [OASI.Novel.t() | OASI.Serial.t()] | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {OASI.Author, :t}, included: [union: [{OASI.Novel, :t}, {OASI.Serial, :t}]]]
  end
end
