defimpl Js2Ex.Compiler.Node, for: ESTree.ClassDeclaration do
  alias Js2Ex.Compiler.Node
  alias Js2Ex.Compiler.Utils

  def compile(node, opts) do
    name = Node.compile(node.id, opts)
    mod = name |> Utils.to_module(opts)
    quote do
      defp unquote(name |> Utils.to_module) do
        {unquote(mod), unquote(Node.compile(node.body, opts))}
      end
    end
  end
end