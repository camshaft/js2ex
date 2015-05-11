defimpl Js2Ex.Compiler.Node, for: ESTree.ExportDeclaration do
  alias Js2Ex.Compiler.Node
  alias Js2Ex.Compiler.Children

  def compile(node, opts) do
    compile_declaration(node.declaration, opts)
  end

  defp compile_declaration(%ESTree.VariableDeclaration{declarations: declarations}, opts) do
    declarations
    |> Enum.map(fn(var) ->
      quote do
        def unquote({Node.compile(var.id, opts) |> elem(0), [], nil}) do
          unquote(Node.compile(var.init, opts))
        end
      end
    end)
  end
  defp compile_declaration(%ESTree.FunctionDeclaration{} = node, opts) do
    quote do
      def unquote({Node.compile(node.id, opts) |> elem(0), [], Children.compile(node.params, opts)}) do
        unquote(Node.compile(node.body, opts))
      end
    end
  end
end