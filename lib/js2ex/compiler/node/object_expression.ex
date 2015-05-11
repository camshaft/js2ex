defimpl Js2Ex.Compiler.Node, for: ESTree.ObjectExpression do
  alias Js2Ex.Compiler.Children

  def compile(node, opts) do
    {:%{}, [], Children.compile(node.properties, opts)}
  end
end