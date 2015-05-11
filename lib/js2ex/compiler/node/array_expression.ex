defimpl Js2Ex.Compiler.Node, for: ESTree.ArrayExpression do
  alias Js2Ex.Compiler.Children

  def compile(node, opts) do
    ## TODO maybe we shouldn't use a linked-list?
    {:__block__, [], [Children.compile(node.elements, opts)]}
  end
end