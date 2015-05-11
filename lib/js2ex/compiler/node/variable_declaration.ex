defimpl Js2Ex.Compiler.Node, for: ESTree.VariableDeclaration do
  alias Js2Ex.Compiler.Children

  def compile(node, opts) do
    Children.compile(node.declarations, opts)
  end
end