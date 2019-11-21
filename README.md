# Jumanpp

A rudimentary Elixir wrapper for [JUMAN++](http://nlp.ist.i.kyoto-u.ac.jp/EN/?JUMAN++)

> JUMAN++ (a Japanese Morphological Analyzer)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `jumanpp` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:jumanpp, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/jumanpp](https://hexdocs.pm/jumanpp).

### Usage

```elixir
Jumanpp.parse! "これを使いたかったですか？"
# =>
[
  %Jumanpp.Token{
    classification: "指示詞",
    classification_id: "7",
    headword: "これ",
    reading: "これ",
    semantic_info: "NIL",
    subclassification: "名詞形態指示詞",
    subclassification_id: "1",
    surface: "これ",
    usage: "*",
    usage_id: "0",
    utilization_type: "*",
    utilization_type_id: "0"
  },
  %Jumanpp.Token{
    classification: "助詞",
    classification_id: "9",
    headword: "を",
    reading: "を",
    semantic_info: "NIL",
    subclassification: "格助詞",
    subclassification_id: "1",
    surface: "を",
    usage: "*",
    usage_id: "0",
    utilization_type: "*",
    utilization_type_id: "0"
  },
  %Jumanpp.Token{
    classification: "動詞",
    classification_id: "2",
    headword: "使う",
    reading: "つかい",
    semantic_info: "代表表記:使う/つかう",
    subclassification: "*",
    subclassification_id: "0",
    surface: "使い",
    usage: "基本連用形",
    usage_id: "8",
    utilization_type: "子音動詞ワ行",
    utilization_type_id: "12"
  },
  %Jumanpp.Token{
    classification: "接尾辞",
    classification_id: "14",
    headword: "たい",
    reading: "たかった",
    semantic_info: "代表表記:たい/たい",
    subclassification: "形容詞性述語接尾辞",
    subclassification_id: "5",
    surface: "たかった",
    usage: "タ形",
    usage_id: "8",
    utilization_type: "イ形容詞アウオ段",
    utilization_type_id: "18"
  },
  %Jumanpp.Token{
    classification: "助動詞",
    classification_id: "5",
    headword: "です",
    reading: "です",
    semantic_info: "NIL",
    subclassification: "*",
    subclassification_id: "0",
    surface: "です",
    usage: "基本形",
    usage_id: "2",
    utilization_type: "無活用型",
    utilization_type_id: "26"
  },
  %Jumanpp.Token{
    classification: "助詞",
    classification_id: "9",
    headword: "か",
    reading: "か",
    semantic_info: "NIL",
    subclassification: "終助詞",
    subclassification_id: "4",
    surface: "か",
    usage: "*",
    usage_id: "0",
    utilization_type: "*",
    utilization_type_id: "0"
  },
  %Jumanpp.Token{
    classification: "特殊",
    classification_id: "1",
    headword: "？",
    reading: "？",
    semantic_info: "NIL",
    subclassification: "記号",
    subclassification_id: "5",
    surface: "？",
    usage: "*",
    usage_id: "0",
    utilization_type: "*",
    utilization_type_id: "0"
  }
]
```
