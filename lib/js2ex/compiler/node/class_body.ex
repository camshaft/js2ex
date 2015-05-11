defimpl Js2Ex.Compiler.Node, for: ESTree.ClassBody do
  alias Js2Ex.Compiler.Children

  def compile(node, opts) do
    {:%{}, [], Children.compile(node.body, opts)}
  end
end