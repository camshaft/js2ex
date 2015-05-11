defimpl Js2Ex.Compiler.Node, for: ESTree.Literal do
  def compile(node, opts) do
    Macro.escape(node.value)
  end
end