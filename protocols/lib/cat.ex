defmodule Cat do
  defstruct name: "Kitty"
end

defimpl Speaker, for: Cat do
  def speak(cat) do
    IO.puts "Meooww, I'm #{cat.name}"
  end
end
