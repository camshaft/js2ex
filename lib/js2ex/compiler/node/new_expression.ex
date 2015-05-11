defimpl Js2Ex.Compiler.Node, for: ESTree.NewExpression do
  alias Js2Ex.Compiler.Node
  alias Js2Ex.Compiler.Children
  alias Js2Ex.Compiler.Utils

  def compile(node, opts) do
    quote do
      Js2Ex.Runtime.Object.new(unquote(Node.compile(node.callee, opts) |> Utils.to_module), unquote(Children.compile(node.arguments, opts)))
    end
  end
end