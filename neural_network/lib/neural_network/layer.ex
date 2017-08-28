defmodule NeuralNetwork.Layer do
  defstruct [elements: []]

  alias NeuralNetwork.Perceptron

  @behaviour NeuralNetwork.Behaviours.Evaluable

  def eval(layer, input) when is_list(input) do
    for perceptron <- layer.elements do
      perceptron |> Perceptron.eval(input)
    end
  end
end

# defimpl NeuralNetwork.Protocols.Evaluable, for: NeuralNetwork.Layer do
#   alias NeuralNetwork.Perceptron
#
#   def eval(layer, input) when is_list(input) do
#     for perceptron <- layer.elements do
#       perceptron |> Perceptron.eval(input)
#     end
#   end
# end
