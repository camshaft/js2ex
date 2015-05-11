defimpl Js2Ex.Compiler.Node, for: ESTree.ThisExpression do
  def compile(_node, _opts) do
    Macro.var(:_this, nil)
  end
end