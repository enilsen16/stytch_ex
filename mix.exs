defmodule StytchEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :stytch_ex,
      version: "0.1.0",
      elixir: "~> 1.11",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {StytchEx.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:finch, "~> 0.6"},
      {:jason, "~> 1.0"}
    ]
  end
end
