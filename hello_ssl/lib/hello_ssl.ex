defmodule HelloSsl do
  require Logger

  @spec main([String.t()]) :: :ok
  def main([host, port]) do
    IO.puts("host = #{host}, port = #{port}")
  end

  def download_certs() do
    host = "erlang.org"
    port = 443

    opts = [
      log_level: :all,
      cacertfile: "/etc/ssl/certs/ca-certificates.crt",
      server_name_indication: String.to_charlist(host),
    ]

    timeout = :infinity
    :ssl.connect(host, port, opts, timeout)
  end
end
