defmodule OpenApiSpexImpl.MixProject do
  use Mix.Project

  def project do
    [
      app: :open_api_spex_impl,
      version: "0.1.0",
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {OpenApiSpexImpl.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:dns_cluster, "~> 0.1.1"},
      {:hackney, "1.20.1"},
      {:jason, "1.4.1"},
      {:key_convert, "0.5.0"},
      {:oapi_generator, "0.1.0-rc.3"},
      {:open_api_spex, "3.18.1"},
      {:phoenix, "1.7.10"},
      {:plug_cowboy, "2.6.1"},
      {:tesla, "1.8.0"},
      {:ymlr, "4.2.0"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get"]
    ]
  end
end
