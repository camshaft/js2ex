defimpl Js2Ex.Compiler.Node, for: ESTree.ConditionalStatement do
  alias Js2Ex.Compiler.Node

  def compile(node, opts) do
    quote do
      if Js2Ex.Runtime.Op.truthy(unquote(Node.compile(node.test, opts))) do
        unquote(Node.compile(node.consequent, opts))
      else
        unquote(Node.compile(node.alternate, opts))
      end
    end
  end
end