defimpl Js2Ex.Compiler.Node, for: ESTree.MemberExpression do
  alias Js2Ex.Compiler.Node

  def compile(node, opts) do
    quote do
      Dict.get(unquote(Node.compile(node.object, opts)), unquote(property(node.property, node.computed, opts)), :undefined)
    end
  end

  defp property(%ESTree.Literal{} = property, _, opts) do
    Node.compile(property, opts)
  end
  defp property(property, false, _opts) do
    property.name
  end
  defp property(property, true, opts) do
    Node.compile(property, opts)
  end
end