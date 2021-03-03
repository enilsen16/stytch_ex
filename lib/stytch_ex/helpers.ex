defmodule StytchEx.Helpers do
  def base_url(), do: Application.get_env(:stytch_ex, :base_url, "https://test.stytch.com/v1/")

  def magic_link_url() do
    Application.get_env(
      :stytch_ex,
      :magic_link_url,
      "https://example.com/authenticate"
    )
  end

  def headers() do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Basic #{build_auth_token()}"}
    ]
  end

  defp username() do
    Application.get_env(:stytch_ex, :username, "")
  end

  defp password() do
    Application.get_env(:stytch_ex, :password, "")
  end

  defp build_auth_token(), do: Base.encode64("#{username()}:#{password()}")
end
