defmodule Conreality.MixProject do
  use Mix.Project

  @name "Conreality SDK"
  @version File.read!("VERSION") |> String.trim()
  @github "https://github.com/conreality/conreality.ex"
  @bitbucket "https://bitbucket.org/conreality/conreality.ex"
  @homepage "https://sdk.conreality.org/elixir/"

  def project do
    [
      # See: https://hexdocs.pm/mix/Mix.Project.html
      app: :conreality_sdk,
      version: @version,
      deps: deps(),
      aliases: aliases(),

      # See: https://hexdocs.pm/mix/Mix.Tasks.Compile.html
      compilers: Mix.compilers(),
      build_embedded: Mix.env() == :prod,

      # See: https://hexdocs.pm/mix/Mix.Tasks.App.Start.html
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,

      # See: https://hexdocs.pm/ex_doc/Mix.Tasks.Docs.html
      name: @name,
      source_url: @github,
      homepage_url: @homepage,
      description: description(),
      docs: [
        source_ref: @version,
        main: "readme",
        extras: [
          "README.md": [title: @name],
          "CHANGES.md": [title: "Changelog"]
        ]
      ],

      # See: https://github.com/parroty/excoveralls
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],

      # See: https://hex.pm/docs/publish
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description do
    """
    Conreality Software Development Kit (SDK) for Elixir.
    """
  end

  defp deps do
    # See: https://hexdocs.pm/mix/Mix.Tasks.Deps.html
    [
      {:drylib, ">= 0.0.0"},
      {:grpc, "~> 0.3.0-alpha.2"},
      {:protobuf, "~> 0.5.4"},
      {:credo, "~> 0.10", only: [:dev, :test]},
      {:dialyxir, "~> 0.5", only: [:dev, :test]},
      {:earmark, "~> 1.2", only: :dev},
      {:ex_doc, "~> 0.19", only: :dev},
      {:excoveralls, "~> 0.10", only: :test}
    ]
  end

  defp aliases do
    []
  end

  defp package do
    # See: https://hex.pm/docs/publish
    [
      name: "conreality",
      files: ~w(lib mix.exs CHANGES.md README.md UNLICENSE VERSION),
      maintainers: ["Conreality.org"],
      licenses: ["Public Domain"],
      links: %{"GitHub" => @github, "Bitbucket" => @bitbucket}
    ]
  end
end
