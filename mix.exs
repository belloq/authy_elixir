defmodule Authy.Mixfile do
  use Mix.Project

  def project do
    [
      app: :authy_elixir,
      version: "1.0.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.3"},
      {:poison, "~> 4.0"},
      {:ex_doc, "~> 0.18.0", only: :dev},
      {:exvcr, "~> 0.10", only: :test}
    ]
  end

  defp description do
    """
      An Authy library for Elixir.
    """
  end

  defp package do
    [
      files: ~w(mix.exs README.md lib),
      maintainers: ["belloq"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/belloq/authy_elixir"
      }
    ]
  end
end
