defmodule OtpExamples.EchoServer do

	def start do
		spawn_link(&listening_loop/0)
	end

	defp listening_loop do
		receive do
			{:msg, content} -> IO.puts content
		end

		listening_loop()
	end

end

