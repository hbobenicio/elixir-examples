defmodule HorasTrabalhadasElixir.Business do
  @moduledoc """
  Módulo com as Regras de Negócio da Aplicação.
  """
  
  alias HorasTrabalhadasElixir.Utils.TimeUtils

  @space_delimiters [" ", "\t"]

  @doc """
  Realiza o processamento do arquivo de entrada `filepath`.
  """
  @spec proccess_file(String.t) :: [[String.t]]
  def proccess_file(filepath) do
    File.stream!(filepath)
    |> Enum.map(&proccess_line/1)
    # |> Enum.filter(&non_empty_list?/1)
  end

  @doc """
  Realiza o processamento de uma linha/registro do arquivo de entrada.
  """
  @spec proccess_line(String.t) :: [String.t]
  defp proccess_line(line) do

    # Transforma a linha "crua" da entrada vinda do Siscop em
    # um vetor de campos.
    # OBS.: O primeiro campo corresponde ao dia do registro
    [day | fields] = parse_line line

    # Remove os campos que não correspondem a horários
    fields = clear_fields fields

    if fields != [] do
      case fields do
        [h1, h2, h3, h4] ->
          manha = TimeUtils.diferenca_horas(h1, h2)
          tarde = TimeUtils.diferenca_horas(h3, h4)

          {intervalo_manha, intervalo_tarde} = {
            Enum.join([h1, h2], " às "),
            Enum.join([h3, h4], " às ")
          }

          [
            day,
            intervalo_manha <> ", " <> intervalo_tarde,
            TimeUtils.fmt_tempo(manha),
            TimeUtils.fmt_tempo(tarde),
            TimeUtils.fmt_tempo(manha + tarde)
          ]
        
        [h1, h2] ->
          tempo = TimeUtils.diferenca_horas(h1, h2)

          [day, Enum.join(fields, " às "), "...", "...", TimeUtils.fmt_tempo(tempo)]

        [h1] ->
          [day, h1, "?", "?", "?"]
      end

    else
      [day, "", "", "", ""]
    end
  end

  @spec parse_line(String.t) :: [String.t]
  defp parse_line(line) do
    line
    |> String.split(@space_delimiters) # Realiza um split a partir dos espaços em branco
    |> Enum.filter(&non_empty_string?/1) # Filtra os campos que possuem realmente algum valor
    |> Enum.map(&String.trim/1)
  end

  @doc """
  Remove os campos que não possuem ':'
  """
  @spec clear_fields([String.t]) :: [String.t]
  defp clear_fields(fields) do
    fields
    |> Enum.filter(&contains_colon?/1)
    |> Enum.flat_map(&remove_noise/1)
  end

  @spec non_empty_string?(String.t) :: boolean
  defp non_empty_string?(string) do
    string != ""
  end

  defp non_empty_list?(list) do
    list != []
  end

  @spec contains_colon?(String.t) :: boolean
  defp contains_colon?(field) do
    String.contains? field, ":"
  end

  defp remove_noise(input) do
    indexes = all_indexes(input)
    time_from_index(input, indexes)
  end

  defp all_indexes(input, character \\ ":") do
    input
    |> String.codepoints
    |> Enum.with_index
    |> Enum.filter(fn {x, _} -> x == character end)
    |> Enum.map(fn {_, i} -> i end)
    # |> Enum.filter_map(
    #     fn {x, _} -> x == character end,
    #     fn {_, i} -> i end
    # )
  end

  defp time_from_index(input, indexes) do
    Enum.map(indexes, fn x ->
      String.slice(input, x-2..x) <> String.slice(input, x+1..x+2)
    end)
  end
end
