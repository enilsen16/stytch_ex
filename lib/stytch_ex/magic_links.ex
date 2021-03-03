defmodule StytchEx.MagicLinks do
  @moduledoc """
  Functions for the magic links api
  """
  alias StytchEx.Helpers

  def send_by_email(email) do
    url = Helpers.base_url() <> "magic_links/send_by_email"

    body =
      %{
        email: email,
        magic_link_url: Helpers.magic_link_url()
      }
      |> Jason.encode!()

    Finch.build(:post, url, Helpers.headers(), body)
    |> Finch.request(MyFinch)
  end

  def login_or_create(email) do
    url = Helpers.base_url() <> "magic_links/login_or_create"

    body =
      %{
        email: email,
        login_magic_link: Helpers.magic_link_url(),
        signup_magic_link: Helpers.magic_link_url()
      }
      |> Jason.encode!()

    Finch.build(:post, url, Helpers.headers(), body)
    |> Finch.request(MyFinch)
  end

  def authenticate(token) do
    url = Helpers.base_url() <> "magic_links/#{token}/authenticate"

    Finch.build(:post, url, Helpers.headers())
    |> Finch.request(MyFinch)
  end
end
