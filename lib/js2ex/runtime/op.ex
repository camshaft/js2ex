defmodule Js2Ex.Runtime.Op do
  def add(a, b) do
    to_string(a) <> to_string(b)
  end

  falsy = [
    0, nil, :undefined, false
  ]

  for val <- falsy do
    def not(unquote(val)), do: true
  end
  def not(_), do: false

  for val <- falsy do
    def truthy(unquote(val)), do: false
  end
  def truthy(_), do: true
end