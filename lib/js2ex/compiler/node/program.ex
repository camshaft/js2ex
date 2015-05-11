defimpl Js2Ex.Compiler.Node, for: ESTree.Program do
  alias Js2Ex.Compiler.Children

  def compile(node, opts) do
    quote do
      defmodule unquote(Js2Ex.resolve(opts[:file])) do
        unquote_splicing(Children.compile(node.body, opts))
      end
    end
  end
end