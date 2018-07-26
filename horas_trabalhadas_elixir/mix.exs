defmodule HorasTrabalhadasElixir.Mixfile do
  use Mix.Project

  def project do
    [
      app: :horas_trabalhadas_elixir,
      version: "0.1.0",
      elixir: "~> 1.6",
      escript: [
        main_module: HorasTrabalhadasElixir.Main
      ],
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),

      # Docs
      name: "Horas Trabalhadas (Elixir)"
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      extra_applications: [:logger, :table_rex]
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:table_rex, "~> 0.10"}, # https://github.com/djm/table_rex
      {:ex_doc, "~> 0.18.0", only: :dev, runtime: false},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false}
    ]
  end
end
