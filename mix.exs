defmodule Combinatorics.MixProject do
  use Mix.Project

  def project do
    [
      app: :combinatorics,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Hex
      description: "Combinatoric utilities for Elixir",
      package: package(),

      # Docs
      source_url: "https://github.com/joshnuss/combinatorics",
      homepage_url: "http://github.com/joshnuss/combinatorics",
      docs: [
        main: "Combinatorics",
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/joshnuss/combinatorics"},
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.19", only: :dev, runtime: false}
    ]
  end
end
