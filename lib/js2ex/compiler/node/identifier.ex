defimpl Js2Ex.Compiler.Node, for: ESTree.Identifier do
  def compile(node, opts) do
    node.name |> String.to_atom |> Macro.var(nil)
  end
end