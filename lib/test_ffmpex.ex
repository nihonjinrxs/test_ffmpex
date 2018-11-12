defmodule TestFFmpex do
  @moduledoc """
  Documentation for TestFFmpex.
  """

  @doc """
  This module contains functions used to test the construction of various ffmpeg commands using the Elixir FFmpex package.

  ## Examples

      iex> %{type: :"1080p_high", input_video: "/some/file.mp4", output_path: "/dev/null"} |> TestFFmpex.encode |> FFmpex.prepare
      {"/usr/local/bin/ffmpeg", ["-y", "-i", "/some/file.mp4", "-pix_fmt", "yuv420p", "-coder", "1","-g", "48", "-maxrate", "4000k", "-bufsize", "2850k", "-an", "-f", "mp4", "-aspect", "16:9", "-pass", "1","-codec:v", "libx264", "-preset:v", "slow", "-profile:v", "high", "-b:v", "3850k", "/dev/null"]}

  """
  import FFmpex
  use FFmpex.Options

  def encode(%{
    type: :"1080p_high",
    input_video: input_path,
    output_path: output_path
  }) do
    command =
      FFmpex.new_command
      |> add_global_option(option_y())
      |> add_input_file(input_path)
      |> add_output_file(output_path)
        |> add_stream_specifier(stream_type: :video)
          |> add_stream_option(option_b("3850k"))
          |> add_stream_option(option_profile("high"))
          |> add_stream_option(option_preset("slow"))
          |> add_stream_option(option_codec("libx264"))
        |> add_file_option(option_pass(1))
        |> add_file_option(option_aspect("16:9"))
        |> add_file_option(option_f("mp4"))
        |> add_file_option(option_an())
        |> add_file_option(option_bufsize("2850k"))
        |> add_file_option(option_maxrate("4000k"))
        |> add_file_option(option_g(48))
        |> add_file_option(option_coder(1))
        |> add_file_option(option_pix_fmt("yuv420p"))
    command
  end
end
