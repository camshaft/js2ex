defmodule Js2Ex do
  def compile(ast, opts \\ []) do
    Js2Ex.Compiler.Node.compile(ast, opts)
  end

  def from_file(file, opts) do
    {out, 0} = System.cmd("node", ["./js_src/parse.js", file])
    ast = Poison.decode!(out)
    # |> IO.inspect
    |> Js2Ex.Compiler.Acorn.transform
    |> compile(Keyword.put_new(opts, :file, file))

    ast
    # |> IO.inspect
    |> Macro.to_string
    |> IO.puts

    ast
    |> Code.eval_quoted([], file: file)
  end

  def resolve(file) do
    ## TODO check #{file}.js #{file}/index.js
    file
    |> Path.expand
    |> Path.relative_to_cwd
    |> Path.basename(".js")
    |> Path.split
    |> Enum.map(&String.capitalize/1)
    |> Enum.into(["JS"])
    |> Module.concat
  end
end
