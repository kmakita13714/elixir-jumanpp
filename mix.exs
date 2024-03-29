defmodule Jumanpp.MixProject do
  use Mix.Project

  def project do
    [
      app: :jumanpp,
      version: "0.2.0",
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  defp description do
    """
    Library for using JUMAN++ in Elixir.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Ko-ichi MAKITA"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/kmakita13714/elixir-jumanpp"}
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
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end
