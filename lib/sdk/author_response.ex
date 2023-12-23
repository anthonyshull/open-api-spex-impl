defmodule OASI.SDK.AuthorResponse do
  @moduledoc """
  Provides struct and type for a AuthorResponse
  """

  @type t :: %__MODULE__{
          data: OASI.SDK.Author.t() | nil,
          included: [OASI.SDK.Novel.t() | OASI.SDK.Serial.t()] | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {OASI.SDK.Author, :t},
      included: [union: [{OASI.SDK.Novel, :t}, {OASI.SDK.Serial, :t}]]
    ]
  end
end
