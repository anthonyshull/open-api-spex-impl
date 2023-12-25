# OpenApiSpexImpl

This example application defines a OAS 3 then generates an SDK based on the outputted spec.

```elixir
%> mix deps.get
%> mix openapi.spec.yaml --spec OpenApiSpexImplWeb.ApiSpec
%> mix api.gen default openapi.yaml
%> iex -S mix phx.server

iex> OASI.SDK.authors_show("charles-dickens", include: ["novels", "serials"])
%OASI.AuthorResponse{
  data: %OASI.Author{
    name: "Charles Dickens",
    slug: "charles-dickens",
    type: "author"
  },
  included: [
    %OASI.Novel{
      name: "Hard Times",
      published: "1854",
      slug: "hard-times",
      type: "novel"
    },
    %OASI.Serial{
      beginning: "1852",
      ending: "1853",
      name: "Bleak House",
      slug: "bleak-house",
      type: "serial"
    }
  ]
}
```