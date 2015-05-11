defmodule Js2Ex.Compiler.Utils do
  ## TODO get this working
  defmacro jsquote(node, body) do
    quote line: line(node), bind_quoted: [
      body: Macro.escape(body, unquote: true)
    ] do
      unquote(body[:do])
    end
  end

  def line(node) do
    1
  end

  def to_module(var, opts \\ []) do
    if opts[:file] do
      Js2Ex.resolve(opts[:file]) |> Module.concat(elem(var, 0))
    else
      var
    end
  end
end