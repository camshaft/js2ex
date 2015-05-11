defimpl Js2Ex.Compiler.Node, for: ESTree.UnaryExpression do
  alias Js2Ex.Compiler.Node

  def compile(node, opts) do
    arg = Node.compile(node.argument, opts)
    operator(node.operator, arg)
  end

  defp operator("!", arg) do
    quote do
      Js2Ex.Runtime.Op.not(unquote(arg))
    end
  end
end