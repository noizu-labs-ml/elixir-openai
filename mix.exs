defmodule Noizu.OpenAI.MixProject do
  use Mix.Project

  def project do
    [
      app: :noizu_labs_open_ai,
      name: "Noizu Labs: OpenAI",
      description: description(),
      package: package(),
      version: "0.1.3",
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [
        plt_file: {:no_warn, "priv/plts/project.plt"}
      ],
      test_coverage: [
        summary: [
          threshold: 40
        ],
        ignore_modules: [
        ]
      ]
    ]
  end


  defp description() do
    "OpenAI Wrapper"
  end

  defp package() do
    [
      licenses: ["MIT"],
      links: %{
        project: "https://github.com/noizu-labs/elixir-openai",
        noizu_labs: "https://github.com/noizu-labs",
        noizu_labs_machine_learning: "https://github.com/noizu-labs-ml",
        noizu_labs_scaffolding: "https://github.com/noizu-labs-scaffolding",
        developer_github: "https://github.com/noizu"
      }
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    dev_apps = if Mix.env() in [:dev] do
      [:ex_doc]
    else
      []
    end

    test_apps = if Mix.env() in [:test] do
      [:junit_formatter]
    else
      []
    end

    [
      mod: {
        Noizu.OpenAI.Application,
        [
        ]
      },
      extra_applications: [:logger, :finch, :jason] ++ dev_apps ++ test_apps
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:junit_formatter, "~> 3.3", only: [:test]},
      {:ex_doc, "~> 0.28.3", only: [:dev, :test], optional: true, runtime: false}, # Documentation Provider
      {:finch, "~> 0.15"},
      {:jason, "~> 1.2"},
      {:mimic, "~> 1.0.0", only: :test},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:sweet_xml, "~> 0.7", only: :test}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
