defmodule Mix.Tasks.Install do
  @moduledoc """
  Task Mix que instala localmente o binário escript que invoca este programa
  """
  use Mix.Task

  @shortdoc "Instala o binário escript em $HOME/bin"
  def run(_) do
    home = System.get_env "HOME"
    filename = "horas_trabalhadas_elixir"
    installation_path = "#{home}/bin/#{filename}"
    
    Mix.Shell.cmd "cp #{filename} #{installation_path}", fn (stdout) ->
      IO.puts stdout
      exit {:shutdown, 1}
    end

    IO.puts "Binário instalado com sucesso em #{installation_path}."
  end
end
