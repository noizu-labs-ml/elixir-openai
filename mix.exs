defmodule Noizu.OpenAI.MixProject do
  use Mix.Project

  def project do
    [
      app: :noizu_labs_open_ai,
      name: "Noizu Labs: OpenAI",
      version: "0.1.0",
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {
        Noizu.OpenAI.Application,
        [
        ]
      },
      extra_applications: [:logger, :finch, :jason]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:finch, "~> 0.15"},
      {:jason, "~> 1.2"},
      {:mimic, "~> 1.0.0", only: :test}

      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
