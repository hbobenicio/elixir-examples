defmodule Dumb do
  @behaviour Speaker
  
  # noop
  # Whatever module that defines a behaviour but does not implement it
  # returns a warning to the compiler like:
  #
  #    warning: undefined behaviour function speak/1 (for behaviour Speaker)
end