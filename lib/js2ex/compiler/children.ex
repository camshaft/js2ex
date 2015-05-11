defmodule Js2Ex.Compiler.Children do
  def compile(children, opts) do
    Enum.reduce(children, [], fn(child, acc) ->
      case Js2Ex.Compiler.Node.compile(child, opts) do
        quoted when is_list(quoted) ->
          :lists.reverse(quoted) ++ acc
        quoted ->
          [quoted | acc]
      end
    end) |> :lists.reverse
  end
end