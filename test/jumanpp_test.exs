defmodule JumanppTest do
  use ExUnit.Case
  doctest Jumanpp

  test "parse a sentence into tokens" do
    [token1, token2 | _] = tokens = Jumanpp.parse! "行こうか"

    assert length(tokens) == 2

    assert token1.surface == "行こう"
    assert token1.reading == "いこう"
    assert token1.headword == "行く"
    assert token1.classification == "動詞"
    assert token1.classification_id == "2"

    assert token2.surface == "か"
    assert token2.reading == "か"
    assert token2.headword == "か"
    assert token2.classification == "助詞"
    assert token2.classification_id == "9"


    [token1, token2 | _] = tokens = Jumanpp.parse! "行こうか", true

    assert length(tokens) == 2

    assert token1.morphological_id == "1"
    assert token1.surface == "行こう"
    assert token1.reading == "いこう"
    assert token1.headword == "行く"
    assert token1.classification == "動詞"
    assert token1.classification_id == "2"

    assert token2.morphological_id == "2"
    assert token2.surface == "か"
    assert token2.reading == "か"
    assert token2.headword == "か"
    assert token2.classification == "助詞"
    assert token2.classification_id == "9"
  end
end
