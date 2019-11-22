defmodule Jumanpp do
  @moduledoc """
  Documentation for Jumanpp.
  """

  defmodule Token do
    defstruct [:surface, :reading, :headword, :classification, :classification_id, :subclassification, :subclassification_id, :utilization_type, :utilization_type_id, :usage, :usage_id, :semantic_info]
  end

  defmodule TokenDetail do
    defstruct [
      :morphological_id, :parent_morphological_id,
      :start_pos, :end_pos,
      :surface, :representative_notation, :reading, :headword,
      :classification, :classification_id,
      :subclassification, :subclassification_id,
      :utilization_type, :utilization_type_id,
      :usage, :usage_id,
      :semantic_info
    ]
  end

  def parse!(text, is_detail \\ false), do: process_output(is_detail, exec(is_detail, text))

  defp exec(is_detail, text) do
    filepath = "/tmp/#{System.unique_integer}"
    File.write! filepath, text
    output = "jumanpp #{filepath}" <> (if is_detail, do: " -s1", else: "")
              |> to_charlist
              |> :os.cmd
              |> to_string
    File.rm filepath

    output
  end

  defp process_output(is_detail, output), do: process_lines(is_detail, String.split(output, "\n"), [])

  defp process_lines(is_detail, ["EOS" | _], tokens), do: tokens
  defp process_lines(is_detail, [line | lines], tokens) do
    if line =~ ~r/^#/ do
      process_lines(is_detail, lines, tokens)
    else
      process_lines(is_detail, lines, tokens ++ [parse_line(is_detail, line)])
    end
  end

  defp parse_line(is_detail, str) do
    if is_detail do
      [
        _beginning,
        morphological_id, parent_morphological_id,
        start_pos, end_pos,
        surface, representative_notation, reading, headword,
        classification, classification_id,
        subclassification, subclassification_id,
        utilization_type, utilization_type_id,
        usage, usage_id | semantic_info
      ] = String.split(str, ~r/\t/)

      semantic_info = if is_list(semantic_info), do: String.replace(Enum.join(semantic_info, " "), "\"", ""), else: semantic_info

      %TokenDetail{
        morphological_id: morphological_id,
        parent_morphological_id: parent_morphological_id,
        start_pos: start_pos,
        end_pos: end_pos,
        surface: surface,
        representative_notation: representative_notation,
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
    else
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
end
