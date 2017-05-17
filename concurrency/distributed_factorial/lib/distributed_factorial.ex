defmodule DistributedFactorial do

  def partition(0) do
    {{0, 0}, {0, 0}}
  end

  def half_partition(n) do
    middle = div(n, 2)
    {{0, middle}, {middle + 1, n}}
  end

  def fat(0), do: 1

	def fat(n) do
    Process.flag(:trap_exit, true)

    {p1, p2} = half_partition(n)

    t1 = Task.async(SequentialFactorial, :range_fat, [p1])
    t2 = Task.async(SequentialFactorial, :range_fat, [p2])

    f1 = Task.await(t1)
    f2 = Task.await(t2)

    f1 * f2
	end

end
