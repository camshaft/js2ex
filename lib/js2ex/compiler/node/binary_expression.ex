defimpl Js2Ex.Compiler.Node, for: ESTree.BinaryExpression do
  alias Js2Ex.Compiler.Node

  def compile(node, opts) do
    args = [
      Node.compile(node.left, opts),
      Node.compile(node.right, opts)
    ]
    operator(node.operator, args)
  end

  defp operator("+", args) do
    quote do
      Js2Ex.Runtime.Op.add(unquote_splicing(args))
    end
  end
end