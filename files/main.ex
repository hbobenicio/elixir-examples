#!/usr/bin/env elixir

defmodule Main do
  def read_file(path) do
    buffer_size = 100
    File.stream!(path) |> Stream.chunk(buffer_size) |> Enum.each(fn chunk ->
      IO.puts chunk
    end)
  end
end

Main.read_file "./input.txt"
