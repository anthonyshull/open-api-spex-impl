# OpenApiSpexImpl

This example application defines a OAS 3 then generates an SDK based on the outputted spec.

```
%> mix deps.get
%> mix openapi.spec.yaml --spec OpenApiSpexImplWeb.ApiSpec
%> mix api.gen default openapi.yaml
%> iex -S mix phx.server

iex> OASI.SDK.authors_show("charles-dickens", include: ["novels", "serials"])
%OASI.AuthorResponse{
  data: %{"name" => "Charles Dickens", "slug" => "charles-dickens"},
  included: [
    %{"name" => "Hard Times", "published" => "1854", "slug" => "hard-times"},
    %{
      "beginning" => "1852",
      "ending" => "1853",
      "name" => "Bleak House",
      "slug" => "bleak-house"
    }
  ]
}
```