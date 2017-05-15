defmodule Concurrency.CalculatorProcess do
  def add(x, y) do
    IO.puts x + y
  end
end

defmodule Concurrency.Processes do
  def main do
    spawn Concurrency.CalculatorProcess, :add, [2, 3]
  end
end
