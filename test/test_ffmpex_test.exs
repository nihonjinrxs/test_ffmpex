defmodule TestFFmpexTest do
  use ExUnit.Case
  doctest TestFFmpex

  @fixture Path.join(__DIR__, "fixtures/test-mpeg.mpg")

  test "generates the correct commands" do
    opts = %{
      type: :"1080p_high",
      input_video: @fixture,
      output_path: "/dev/null"
    }
    cmd = TestFFmpex.encode(opts)

    IO.inspect(cmd)
    IO.inspect(FFmpex.prepare(cmd))

    assert true
  end
end
