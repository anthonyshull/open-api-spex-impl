defmodule OpenApiSpexImpl.Decoder do
  @moduledoc """

  """

  def decode(body: body, response: response, status: status) do
    case get_type(response, status) do
      {:ok, type} ->
        do_decode(body, type)

      error ->
        error
    end
  end

  defp get_type(types, status) do
    if res = Enum.find(types, fn {c, _} -> c == status end) do
      {:ok, elem(res, 1)}
    else
      {:error, :not_found}
    end
  end

  defp do_decode(nil, _), do: nil
  defp do_decode("", :null), do: nil
  defp do_decode(value, {:string, :date}), do: Date.from_iso8601!(value)
  defp do_decode(value, {:string, :date_time}), do: DateTime.from_iso8601(value) |> elem(1)
  defp do_decode(value, {:string, :time}), do: Time.from_iso8601!(value)
  defp do_decode(value, {:union, types}), do: do_decode(value, choose_union(value, types))

  defp do_decode(value, [type]), do: Enum.map(value, &do_decode(&1, type))

  defp do_decode(%{} = value, {module, type}) do
    fields = module.__fields__(type)

    for {field_name, field_type} <- fields, reduce: struct(module, value) do
      decoded_value ->
        case Map.fetch(value, to_string(field_name)) do
          {:ok, field_value} ->
            decoded_field_value = do_decode(field_value, field_type)
            struct(decoded_value, [{field_name, decoded_field_value}])

          :error ->
            decoded_value
        end
    end
  end

  defp do_decode(value, _type), do: value

  defp choose_union(nil, [_type, :null]), do: :null
  defp choose_union(nil, [:null, _type]), do: :null
  defp choose_union(_value, [type, :null]), do: type
  defp choose_union(_value, [:null, type]), do: type

  defp choose_union(%{"type" => type}, types) do
    Enum.find(types, fn {possible_type, _} ->
      Atom.to_string(possible_type) |> String.split(".") |> List.last() |> String.downcase() ==
        type
    end)
  end
end
