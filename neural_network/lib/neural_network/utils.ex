defmodule NeuralNetwork.Utils do

  @doc ~S"""
  Calculates the Dot Product between `l1` and `l2`.

  ## Examples

      iex> NeuralNetwork.Utils.dot_product [10], [10]
      100

      iex> NeuralNetwork.Utils.dot_product [1, 2], [1, 2]
      5
  """
  @spec dot_product(list(number), list(number)) :: number
  def dot_product(l1, l2) when is_list(l1) and is_list(l2) do
    dot_product_impl 0, l1, l2
  end

  @doc """
  Tail recursive implementation for `NeuralNetwork.Utils.dot_product/2`
  Base case
  """
  defp dot_product_impl(acc, [], []) do
    acc
  end

  @doc """
  Tail recursive implementation for `NeuralNetwork.Utils.dot_product/2`
  General case
  """
  defp dot_product_impl(acc, [x | t1], [y | t2]) do
    dot_product_impl(acc + x * y, t1, t2)
  end

end
