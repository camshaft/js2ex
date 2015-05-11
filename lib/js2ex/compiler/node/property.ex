defimpl Js2Ex.Compiler.Node, for: ESTree.Property do
  alias Js2Ex.Compiler.Node

  def compile(node, opts) do
    {node.key.name, Node.compile(node.value, opts)}
  end
end