defmodule Chat.NameServer do
  use GenServer

  @name :name_server

  # Client API

  def start_link do
    GenServer.start_link(__MODULE__, :ok, name: @name)
  end

  def list do
    GenServer.call(@name, {:list})
  end

  def register(chat) do
    GenServer.cast(@name, {:register, chat})
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
