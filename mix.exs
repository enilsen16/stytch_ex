defmodule StytchEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :stytch_ex,
      build_embedded: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      elixir: "~> 1.11",
      name: "StytchEx",
      source_url: "https://github.com/enilsen16/stytch_ex"
      start_permanent: Mix.env() == :prod,
      version: "0.1.0",
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {StytchEx.Application, []}
    ]
  end

  defp description() do
    "Unofficial client library for the Stytch passwordless auth service."
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:finch, "~> 0.6"},
      {:jason, "~> 1.0"}
    ]
  end
end
