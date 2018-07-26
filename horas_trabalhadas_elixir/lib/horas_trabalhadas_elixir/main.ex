defmodule HorasTrabalhadasElixir.Main do
  @moduledoc """
  Módulo escript principal.
  """

  alias HorasTrabalhadasElixir.Business

  @doc """
  Função escript principal.

  ## Parameters

    - args: Lista com os argumentos da linha de comando
  """
  @spec main([String.t]) :: :ok
  def main(_args) do
    home = System.get_env "HOME"
    filepath = "#{home}/horas-trabalhadas.txt"

    title = "Apropriação"
    header = ["Dia", "Ponto", "Manhã", "Tarde", "Total"]
    data = Business.proccess_file(filepath)

    TableRex.quick_render!(data, header, title)
    |> IO.puts
  end
end
