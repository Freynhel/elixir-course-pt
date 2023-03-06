defmodule Tarefas.CLI do
	def main(comms) do
		path_file = Path.join(File.cwd!(), "tasks.txt")
		File.write(path_file, "", [:append])

		data =
			File.read!(path_file)
			|> decode()
			|> process(comms)
			|> encode()

		File.write(path_file, data)
	end

	def decode(string) do
		string
		|> String.split("\n")
		|> Enum.filter(fn string -> "" != String.trim(string) end)
		|> Enum.map(fn string -> String.split(string, ",") end)
		|> Enum.map(fn [desc, status] -> {desc, status} end)
	end

	def process(tasks, []) do
		tasks
		|> Enum.reject(&completed?/1)
		|> Enum.each(&print/1)
	end

	def process(tasks, ["todas"]) do
		process(tasks, [])

		IO.puts("")
		IO.puts("-- Completed Tasks --")

		tasks
		|> Enum.filter(&completed?/1)
		|> Enum.each(&print/1)
		tasks
	end

	def process(tasks, [desc_new_task]) do
	  new_task = {desc_new_task, "Uncompleted"}
	  tasks ++ [new_task]
	end

	defp completed?({_desc, status}) do
		status == "Completed"
	end

	defp print({desc, _status}) do
	  IO.puts(desc)
	end

	def encode(tasks) do
		tasks
		|> Enum.map(fn {desc, status} -> [desc, status] end)
		|> Enum.map(fn list -> Enum.join(list, ",") end)
		|> Enum.concat([""])
		|> Enum.join("\n")
	end
end
