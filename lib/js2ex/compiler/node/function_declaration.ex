defimpl Js2Ex.Compiler.Node, for: ESTree.FunctionDeclaration do
  alias Js2Ex.Compiler.Node
  alias Js2Ex.Compiler.Children

  def compile(node, opts) do
    quote do
      unquote(node.id |> Node.compile(opts) |> elem(0)) = fn(unquote_splicing(Children.compile(node.params, opts))) ->
        unquote(Node.compile(node.body, opts))
      end
    end
  end
end