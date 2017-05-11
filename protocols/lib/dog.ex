defmodule Dog do
  defstruct name: "Rex"
end

defimpl Speaker, for: Dog do
  def speak(dog) do
    IO.puts "Ruf Ruf, I'm #{dog.name}"
  end
end
