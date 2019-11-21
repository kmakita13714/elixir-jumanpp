defmodule Jumanpp do
  @moduledoc """
  Documentation for Jumanpp.
  """

  defmodule Token do
    defstruct [:surface, :reading, :headword, :classification, :classification_id, :subclassification, :subclassification_id, :utilization_type, :utilization_type_id, :usage, :usage_id, :semantic_info]
  end

  def parse!(text), do: process_output(exec(text))

  defp exec(text) do
    filepath = "/tmp/#{System.unique_integer}"
    File.write! filepath, text
    output = "jumanpp #{filepath}"
              |> to_char_list
              |> :os.cmd
              |> to_string
    File.rm filepath

    output
  end

  defp process_output(output), do: process_lines(String.split(output, "\n"), [])

  defp process_lines(["EOS" | _], tokens), do: tokens
  defp process_lines([line | lines], tokens), do: process_lines(lines, tokens ++ [parse_line(line)])

  defp parse_line(str) do
    [surface, reading, headword, classification, classification_id, subclassification, subclassification_id, utilization_type, utilization_type_id, usage, usage_id | semantic_info] = String.split(str, ~r/\s+/)

    semantic_info = if is_list(semantic_info), do: String.replace(Enum.join(semantic_info, " "), "\"", ""), else: semantic_info

    %Token{
      surface: surface,
      reading: reading,
      headword: headword,
      classification: classification,
      classification_id: classification_id,
      subclassification: subclassification,
      subclassification_id: subclassification_id,
      utilization_type: utilization_type,
      utilization_type_id: utilization_type_id,
      usage: usage,
      usage_id: usage_id,
      semantic_info: semantic_info,
    }
  end
end
