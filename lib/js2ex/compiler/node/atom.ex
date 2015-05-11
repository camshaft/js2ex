defimpl Js2Ex.Compiler.Node, for: Atom do
  def compile(nil, _) do
    nil
  end
end