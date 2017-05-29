defmodule Chat.ChatInfo do
  defstruct pid: nil, name: "Unknown"

  def is_chat_info(%ChatInfo{}), do: true
  def is_chat_info(_), do: false
end
