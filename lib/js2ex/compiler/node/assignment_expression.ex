defimpl Js2Ex.Compiler.Node, for: ESTree.AssignmentExpression do
  alias Js2Ex.Compiler.Children
  alias Js2Ex.Compiler.Node

  def compile(node, opts) do
    ## TODO
    left = node.left |> Node.compile(opts)
    right = node.right |> Node.compile(opts)
    quote do
      unquote(left) = Js2Ex.Runtime.Assignment.put_in(unquote(left), unquote(right))
    end
    nil
  end
end