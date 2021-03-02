defmodule StytchEx.Helpers do
  @username Application.get_env(:stytch_ex, :username, "")
  @password Application.get_env(:stytch_ex, :password, "")

  def build_auth_token() do
    Base.encode64("#{@username}:#{@password}")
  end
end
