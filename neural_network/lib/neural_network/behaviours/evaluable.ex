defmodule NeuralNetwork.Behaviours.Evaluable do
  @callback eval(struct, list(number)) :: any
end
