defimpl Js2Ex.Compiler.Node, for: ESTree.FunctionExpression do
  alias Js2Ex.Compiler.Node
  alias Js2Ex.Compiler.Children

  def compile(node, opts) do
    quote do
      fn(unquote_splicing(Children.compile(node.params, opts))) ->
        unquote(Node.compile(node.body, opts))
      end
    end
  end
end