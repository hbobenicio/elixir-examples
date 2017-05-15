defmodule OtpGenServer.MyServer do
  use GenServer

  ### GenServer Callback API

  @doc """
    GenServer.init/1 callback
  """
  def init(state) do
    {:ok, state}
  end

  def handle_call(:list_users, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:register_user, user}, state) do
    {:noreply, state ++ [user]}
  end

  ### Client API

  @doc """
    Starts the server holding the `state` info
  """
  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def list_users do
    GenServer.call(__MODULE__, :list_users)
  end

  def register_user(user) do
    GenServer.cast(__MODULE__, {:register_user, user})
  end

end
