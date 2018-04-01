defmodule Chat.ChannelList do
  use Agent

  def start_link(_options) do

    # The initial state is an empty channel list
    channel_list = []

    Agent.start_link(fn -> channel_list end, [name: __MODULE__])
  end

  def list do
    Agent.get(__MODULE__, &(&1)) # Use the identity function
  end

  def register_channel(channel) do
    # TODO Add validation: already registered!
    Agent.update __MODULE__, fn channel_list -> [channel] ++ channel_list end
  end
end
