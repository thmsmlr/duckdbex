defmodule Duckdbex.MixProject do
  use Mix.Project

  @version "0.4.0"
  @duckdb_version "1.5.1"

  def project do
    [
      app: :duckdbex,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: description(),
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:elixir_make] ++ Mix.compilers(),
      make_targets: ["all"],
      make_clean: ["clean"],
      # Docs
      name: "Duckdbex",
      source_url: "https://github.com/AlexR2D2/duckdbex/",
      homepage_url: "https://github.com/AlexR2D2/duckdbex/",
      docs: docs()
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  def application do
    [
      extra_applications: [:logger, :public_key]
    ]
  end

  defp deps do
    [
      {:elixir_make, "~> 0.8", runtime: false},
      {:dialyxir, "~> 1.4", only: :dev, runtime: false},
      {:ex_doc, "~> 0.34", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      files: ~w(
        lib
        c_src
        bin
        .formatter.exs
        Makefile*
        mix.exs
        checksum.exs
        README.md
        LICENSE
      ),
      name: "duckdbex",
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/AlexR2D2/duckdbex",
        "Changelog" => "https://github.com/AlexR2D2/duckdbex/blob/main/CHANGELOG.md"
      }
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: [
        "README.md": [title: "Duckdbex"],
        "CHANGELOG.md": []
      ],
      source_ref: "v#{@version}",
      source_url: "https://github.com/AlexR2D2/duckdbex"
    ]
  end

  defp description do
    "An Elixir DuckDB library"
  end

  def duckdb_version, do: @duckdb_version
end
