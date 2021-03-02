defmodule StytchEx.MagicLinks do
  @moduledoc """
  Functions for the magic links api
  """
  alias StytchEx.Helpers

  @base_url Application.get_env(:stytch_ex, :base_url, "https://test.stytch.com/v1/")
  @magic_link_url Application.get_env(
                    :stytch_ex,
                    :magic_link_url,
                    "https://example.com/authenticate"
                  )
  @headers [
    {"Content-Type", "application/json"},
    {"Authorization", "Basic #{Helpers.build_auth_token()}"}
  ]

  def login_or_create(email) do
    url = @base_url <> "magic_links/login_or_create"

    data = %{
      email: email,
      login_magic_link_url: @magic_link_url,
      signup_magic_link_url: @magic_link_url
    }

    body = Jason.encode!(data)

    Finch.build(:post, url, @headers, body)
    |> Finch.request(MyFinch)
  end

  def authenticate(token) do
    url = @base_url <> "magic_links/#{token}/authenticate"

    Finch.build(:post, url, @headers)
    |> Finch.request(MyFinch)
  end
end
