defimpl Js2Ex.Compiler.Node, for: ESTree.ReturnStatement do
  alias Js2Ex.Compiler.Node

  def compile(node, opts) do
    node.argument |> Node.compile(opts)
  end
end