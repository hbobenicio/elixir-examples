defmodule Chat.Supervisor do
  @moduledoc """
  The Chat Supervisor
  """
  use Supervisor

  # API

  def start_link do
    Supervisor.start_link(__MODULE__, :ok, [name: __MODULE__])
  end

  # CALLBACKS

  def init(:ok) do
    children = [
      Chat.ChannelList # Calls Chat.ChannelList.start_link/1 with []
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

end
