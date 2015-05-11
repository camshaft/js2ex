defmodule Js2Ex.Runtime.Object do
  defstruct properties: %{},
            module: nil

  def new({name, properties = %{"constructor" => constructor}}, args) do
    instance = %Js2Ex.Runtime.Object{module: name, properties: properties}
    case apply(constructor, [instance | args]) do
      out when out in [:undefined, nil] ->
        instance
      instance ->
        instance
    end
  end
  def new({name, properties}, _args) do
    %Js2Ex.Runtime.Object{module: name, properties: properties}
  end
end

## TODO
# defimpl Inspect, for: Js2Ex.Runtime.Object do
#   def inspect(obj, opts) do
#   end  
# end