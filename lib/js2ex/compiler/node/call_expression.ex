defimpl Js2Ex.Compiler.Node, for: ESTree.CallExpression do
  alias Js2Ex.Compiler.Node
  alias Js2Ex.Compiler.Children

  def compile(node, opts) do
    quote do
      unquote(Node.compile(node.callee, opts)).(unquote_splicing(Children.compile(node.arguments, opts)))
    end
  end
end