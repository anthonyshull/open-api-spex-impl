defmodule OpenApiSpexImpl.Renderer do
  @moduledoc """

  """

  use OpenAPI.Renderer

  alias OpenAPI.Processor.Operation

  def render_operation_function(state, %Operation{function_name: function_name} = operation) do
    OpenAPI.Renderer.render_operation_function(
      state,
      %Operation{operation | function_name: trim_function_name(function_name)}
    )
  end

  def render_operation_spec(state, %Operation{function_name: function_name} = operation) do
    OpenAPI.Renderer.render_operation_spec(
      state,
      %Operation{operation | function_name: trim_function_name(function_name)}
    )
  end

  defp trim_function_name(function_name) do
    function_name
    |> Atom.to_string()
    |> String.replace_leading("open_api_spex_impl_web_", "")
    |> String.replace("_controller", "")
    |> String.to_atom()
  end
end
