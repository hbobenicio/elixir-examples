defmodule Dog do
  @behaviour Speaker

  def speak(something) do
    IO.puts "Ruf Ruf, #{something}"
  end
end