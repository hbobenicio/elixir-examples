defmodule Chat.NameServer do
  use GenServer

  # Client API

  def start_link do
    GenServer.start_link(__MODULE__, :ok)
  end

  def list(server_pid) do
    GenServer.call(server_pid, {:list})
  end

  def register(server_pid, chat) when is_chat_info(chat) do
    GenServer.cast(server_pid, {:register, chat})
  end

  # GenServer Callbacks

  def init(:ok) do
    {:ok, []}
  end

  def handle_call({:list}, _from, names) do
    {:reply, names, names}
  end

  def handle_cast({:register, name}, names) do
    {:noreply, names ++ [name]}
  end
end
