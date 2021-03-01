defmodule StytchExTest do
  use ExUnit.Case
  doctest StytchEx

  test "greets the world" do
    assert StytchEx.hello() == :world
  end
end
