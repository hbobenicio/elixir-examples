defmodule Protocols do
  @moduledoc """
    Protocols are a mechanism to achieve polymorphism in Elixir.
    Dispatching on a protocol is available to any data type as long as it implements the protocol.
    Protocols handle polymorphism at the data/type level.
    Protocols handle polymorphism at the data/type level whereas Behaviours provide it at the module level.
  """

  def main do
    Speaker.speak %Dog{}
    Speaker.speak %Cat{}
  end

end
