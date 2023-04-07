defmodule NoizuOpenAITest do
  use ExUnit.Case
  doctest NoizuOpenAI

  test "greets the world" do
    assert NoizuOpenAI.hello() == :world
  end
end
