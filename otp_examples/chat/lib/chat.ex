defmodule Chat do
  @moduledoc """
  The Chat Application
  """
  use Application

  def start(_type, _args) do
    Chat.Supervisor.start_link
  end
end
