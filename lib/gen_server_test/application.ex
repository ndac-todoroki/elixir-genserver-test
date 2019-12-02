defmodule GenServerTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  alias GenServerTest.Counter

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: GenServerTest.Worker.start_link(arg)
      # {GenServerTest.Worker, arg}
      {Counter, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GenServerTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
