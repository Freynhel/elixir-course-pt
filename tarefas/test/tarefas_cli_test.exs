defmodule Tarefas.CLITest do
	use ExUnit.Case
	import ExUnit.CaptureIO
	doctest Tarefas.CLI

	describe "decode/1" do
		test "Convert a task list into a string" do
			input = [
				{"Task 1", "Uncompleted"},
				{"Task 2", "Uncompleted"},
				{"Task 3", "Completed"}
			]

			expected_output =
			"""
			Task 1,Uncompleted
			Task 2,Uncompleted
			Task 3,Completed
			"""

			assert expected_output == Tarefas.CLI.encode(input)
		end
	end

	describe "process/2" do
		test "When second arg is empty, outputs a task list with uncompleted tasks" do
			input = [
				{"Task 1", "Uncompleted"},
				{"Task 2", "Uncompleted"},
				{"Task 3", "Completed"}
			]

			expected_output =
			"""
			Task 1
			Task 2
			"""

			assert expected_output == capture_io(fn -> Tarefas.CLI.process(input, []) end)
		end

		test "When second arg is ['todas'], outputs a task list with all tasks" do
			input = [
				{"Task 1", "Uncompleted"},
				{"Task 2", "Uncompleted"},
				{"Task 3", "Completed"}
			]

			expected_output =
			"""
			Task 1
			Task 2

			-- Completed Tasks --
			Task 3
			"""

			assert expected_output == capture_io(fn -> Tarefas.CLI.process(input, ["todas"]) end)
		end

		test "task 4" do
			desc_new_task = "Task 4"

			input = [
				{"Task 1", "Uncompleted"},
				{"Task 2", "Uncompleted"},
				{"Task 3", "Completed"}
			]

			expected_output = [
				{"Task 1", "Uncompleted"},
				{"Task 2", "Uncompleted"},
				{"Task 3", "Completed"},
				{desc_new_task, "Uncompleted"}
			]

			assert expected_output == Tarefas.CLI.process(input, [desc_new_task])
		end
	end

	describe "encode/1" do
		test "Convert a string into a task list" do
			expected_output = [
				{"Task 1", "Uncompleted"},
				{"Task 2", "Uncompleted"},
				{"Task 3", "Completed"}
			]

			input =
			"""
			Task 1,Uncompleted
			Task 2,Uncompleted
			Task 3,Completed
			"""

			assert expected_output == Tarefas.CLI.decode(input)
		end
	end
end
