defmodule HelloSslTest do
  use ExUnit.Case
  doctest HelloSsl

  test "greets the world" do
    assert HelloSsl.hello() == :world
  end
end
