defmodule NeuralNetwork.Utils do

  @doc ~S"""
  Calculates the Dot Product between `l1` and `l2`.

  ## Examples

      iex> NeuralNetwork.Utils.dot_product [10], [10]
      100

      iex> NeuralNetwork.Utils.dot_product [1, 2], [1, 2]
      5
  """
  @spec dot_product([number], [number]) :: number
  def dot_product(l1, l2) when is_list(l1) and is_list(l2) do
    dot_product_impl 0, l1, l2
  end

  defp dot_product_impl(acc, [], []) do
    acc
  end

  defp dot_product_impl(acc, [x | xs], [y | ys]) do
    dot_product_impl(acc + x * y, xs, ys)
  end

  @spec compare(number, number) :: boolean
  def compare(x, y, epsilon \\ 0.0000001) do
    abs(x - y) <= epsilon
  end

end
