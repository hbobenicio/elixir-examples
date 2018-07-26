defmodule Mix.Tasks.Start do
  @moduledoc """
  Task Mix que inicia o programa
  """
  use Mix.Task

  @shortdoc "Simplesmente executa o programa"
  def run(_) do
    HorasTrabalhadasElixir.Main.main []
  end
end
