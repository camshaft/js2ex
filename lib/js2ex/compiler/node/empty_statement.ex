defimpl Js2Ex.Compiler.Node, for: ESTree.EmptyStatement do
  alias Js2Ex.Compiler.Node

  def compile(_node, _opts) do
    []
  end
end