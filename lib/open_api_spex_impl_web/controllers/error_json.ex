defmodule OpenApiSpexImplWeb.ErrorJSON do
  def render(_, _) do
    %{errors: %{detail: "Internal Server Error"}}
  end
end
