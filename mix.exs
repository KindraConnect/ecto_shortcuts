defmodule EctoShortcuts.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ecto_shortcuts,
      version: "0.1.6",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: "A collection of Ecto query shortcuts",
      name: "EctoShortcuts",
      docs: [source_url: "https://github.com/KindraConnect/ecto_shortcuts"]
    ]
  end

  defp package do
    [
      name: :ecto_shortcuts,
      files: ~w(mix.exs README.md CHANGELOG.md lib),
      maintainers: ["Misha Conway"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/KindraConnect/ecto_shortcuts"}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/lib", "test/migrations"]
  defp elixirc_paths(_), do: ["lib"]

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :ecto]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:ecto, ">= 2.0.4"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:mariaex, ">= 0.0.0", only: :test}
    ]
  end
end
