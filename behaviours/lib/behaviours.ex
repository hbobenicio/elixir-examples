defmodule Behaviours do

  def main do
    Cat.speak "Hello"
    Dog.speak "Hello"

    try do
      Dumb.speak "Hello"
    rescue
      _e in UndefinedFunctionError -> IO.puts("Dumbs won't speak")
    end
  end
end
