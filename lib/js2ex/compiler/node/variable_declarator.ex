defimpl Js2Ex.Compiler.Node, for: ESTree.VariableDeclarator do
  alias Js2Ex.Compiler.Node

  def compile(node, opts) do
    quote do
      unquote(node.id |> Node.compile(opts)) = unquote(Node.compile(node.init, opts))
    end
  end
end