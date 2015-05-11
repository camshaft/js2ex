defimpl Js2Ex.Compiler.Node, for: ESTree.BlockStatement do
  alias Js2Ex.Compiler.Children

  def compile(node, opts) do
    quote do
      unquote_splicing(Children.compile(node.body, opts))
    end
  end
end