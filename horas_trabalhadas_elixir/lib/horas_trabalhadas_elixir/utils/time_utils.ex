defmodule HorasTrabalhadasElixir.Utils.TimeUtils do
  @moduledoc """
  Utilitário para tratamento de cálculos que envolvem tempo.
  """

  @spec diferenca_horas(number, number) :: number
  def diferenca_horas(h1, h2) do
    entrada = parse_horas_em_minutos(h1)
    saida = parse_horas_em_minutos(h2)
    
    hours_from_minutes(saida - entrada)
  end

  @doc """
  Converte horas em minutos.

  ## Exemplos

      iex> minutes_from_hours 1
      60.0
  """
  @spec minutes_from_hours(number) :: number
  def minutes_from_hours(hours) do
  	hours * 60.0
  end

  @doc """
  Converte minutos em horas (numérico).

  ## Exemplos

      iex> hours_from_minutes 60
      1.0
  """
  @spec hours_from_minutes(number) :: number
  def hours_from_minutes(minutes) do
  	minutes / 60.0
  end

  @doc """
  Converte minutos em horas (String).

  ## Exemplos

      iex> parse_horas_em_minutos "01:30"
      90.0
  """
  @spec parse_horas_em_minutos(String.t) :: number
  def parse_horas_em_minutos(strHora) do
    [horas, minutos] = strHora
      |> String.split(":")
      |> Enum.map(&String.to_integer/1)

  	minutes_from_hours(horas) + minutos
  end

  @doc """
  Trunca o número em apenas 2 casas decimais e
  formata-o para apresentação como um valor temporal.

  ## Exemplos

      iex> fmt_tempo 3.1415
      "3.14"

      iex> fmt_tempo 3.149
      "3.14"
  """
  @spec fmt_tempo(number) :: String.t
  def fmt_tempo(tempo) when is_number(tempo) do
    tempo
    |> Float.floor(2)
    |> to_string
  end

end
