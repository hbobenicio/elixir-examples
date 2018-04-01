defmodule PlugExamples do
  @moduledoc """
  Example using Plug and Cowboy, following the ElixirSchool tutorial:
  https://elixirschool.com/en/lessons/specifics/plug/
  """
  use Application
  require Logger

  @doc """
  Starts the Application and its Supervisor.
  """
  def start(_type, _args) do
    children = [
      # the third argument will be passed to PlugExamples.Plugs.HelloWorldPlug.init/1
      Plug.Adapters.Cowboy.child_spec(:http, PlugExamples.Router, [], port: 8080)
    ]

    Logger.info("Starting the application")

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
