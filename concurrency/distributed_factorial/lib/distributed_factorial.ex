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

    pid1 = spawn_link(SequentialFactorial, :range_fat, [p1])
    pid2 = spawn_link(SequentialFactorial, :range_fat, [p2])

    receive do
      {:msg,contents} -> nil
    end
	end

end
