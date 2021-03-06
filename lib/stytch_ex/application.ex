defmodule StytchEx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Finch, name: MyFinch}
      # Starts a worker by calling: StytchEx.Worker.start_link(arg)
      # {StytchEx.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StytchEx.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
