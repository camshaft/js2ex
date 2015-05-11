defimpl Js2Ex.Compiler.Node, for: ESTree.MethodDefinition do
  alias Js2Ex.Compiler.Children
  alias Js2Ex.Compiler.Node

  def compile(node, opts) do
    fun = node.value
    fun = %{fun | params: [%ESTree.Identifier{name: "_this"} | fun.params]}
    {node.key.name, Node.compile(fun, opts)}
  end
end