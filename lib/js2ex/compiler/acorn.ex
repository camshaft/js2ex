defmodule Js2Ex.Compiler.Acorn do
  def transform(%{"type" => type} = node) do
    struct format_name(type), (Enum.map(node, &recurse/1) |> :maps.from_list)
  end

  defp recurse({key, value}) when is_map(value) do
    {String.to_atom(key), transform(value)}
  end
  defp recurse({key, value}) when is_list(value) do
    {String.to_atom(key), Enum.map(value, &transform/1)}
  end
  defp recurse({key, value}) do
    {String.to_atom(key), value}
  end

  ## some of the names don't line up with acorn and ESTree
  defp format_name("ConditionalExpression") do
    ESTree.ConditionalStatement
  end
  defp format_name("ExportNamedDeclaration") do
    ESTree.ExportDeclaration
  end
  defp format_name(type) do
    Module.concat("ESTree", type)
  end
end