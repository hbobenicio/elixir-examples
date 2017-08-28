defmodule NeuralNetwork.Perceptron do
  defstruct [weights: [], threshold: 0.0, activation_function: nil]

  alias NeuralNetwork.Perceptron
  alias NeuralNetwork.Utils

  @behaviour NeuralNetwork.Behaviours.Evaluable

  def new(:and, size) do
    weights = List.duplicate 1, size
    %Perceptron{weights: weights, threshold: 2}
  end

  def new(:or, size) do
    weights = List.duplicate 1, size
    %Perceptron{weights: weights, threshold: 1}
  end

  def eval(perceptron, input) when is_list(input) do
    output = Utils.dot_product input, perceptron.weights

    if output >= perceptron.threshold do
      1
    else
      0
    end
  end
end

# defimpl NeuralNetwork.Protocols.Evaluable, for: NeuralNetwork.Perceptron do
#   alias NeuralNetwork.Utils
#
#   def eval(perceptron, input) when is_list(input) do
#     output = Utils.dot_product input, perceptron.weights
#
#     if output >= perceptron.threshold do
#       1
#     else
#       0
#     end
#   end
# end
