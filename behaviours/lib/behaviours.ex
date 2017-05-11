defmodule Behaviours do
  @moduledoc """
    Behaviours provide a way to:
      * define a set of functions that have to be implemented by a module;
      * ensure that a module implements all the functions in that set.

    If you have to, you can think of behaviours like interfaces in object oriented languages like Java:
    a set of function signatures that a module has to implement.

    Protocols handle polymorphism at the data/type level whereas Behaviours provide it at the module level.
  """

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
