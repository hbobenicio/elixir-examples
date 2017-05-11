defmodule Cat do
  @behaviour Speaker

  def speak(something) do
    IO.puts "Meooww, #{something}"
  end
end