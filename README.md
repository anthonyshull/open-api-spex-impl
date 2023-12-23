# OpenApiSpexImpl

This example application defines a OAS 3 then generates an SDK based on the outputted spec.

```
%> mix deps.get
%> mix openapi.spec.yaml --spec OpenApiSpexImplWeb.ApiSpec
%> mix api.gen default openapi.yaml
%> iex -S mix phx.server

%> curl "http://localhost:4000/api/authors/charles-dickens?included=novels,serials"
```