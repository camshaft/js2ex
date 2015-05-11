defimpl Js2Ex.Compiler.Node, for: ESTree.ExpressionStatement do
  alias Js2Ex.Compiler.Node

  def compile(node, opts) do
    Node.compile(node.expression, opts)
  end
end