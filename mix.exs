defmodule Js2Ex.Mixfile do
  use Mix.Project

  def project do
    [app: :js2ex,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:estree, "~> 1.0.0"},
     {:poison, "~> 1.1.0"},
     {:rl, github: "camshaft/rl", only: :dev}]
  end
end
