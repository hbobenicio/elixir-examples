defmodule PlugExamplesTest do
  use ExUnit.Case
  doctest PlugExamples

  test "greets the world" do
    assert PlugExamples.hello() == :world
  end
end
