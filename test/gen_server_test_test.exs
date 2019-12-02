defmodule GenServerTestTest do
  use ExUnit.Case
  doctest GenServerTest

  test "greets the world" do
    assert GenServerTest.hello() == :world
  end
end
