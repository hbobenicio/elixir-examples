defmodule SequentialFactorial do

  @doc "OBS: not tail recursive. Improve it!"
  def range_fat({x, y}) when (x == y) do
    x
  end

  @doc "OBS: not tail recursive. Improve it!"
  def range_fat({x, y}) when (x < y) do
    y * range_fat({x, y-1})
  end

	def fat(n) do
		tail_fat(1, n)
	end

	def tail_fat(acc, 0) do
		acc
	end

	def tail_fat(acc, n) when n > 0 do
		tail_fat(acc * n, n-1)
	end

end
