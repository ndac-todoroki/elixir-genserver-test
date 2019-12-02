defmodule GenServerTest.Counter do
  @moduledoc """
  Simple counter w/ reset function
  """

  use GenServer

  defstruct count: 0

  def start_link(_), do: GenServer.start(__MODULE__, [], name: __MODULE__)

  def increment, do: GenServer.cast(__MODULE__, :increment)

  def reset, do: GenServer.cast(__MODULE__, :reset)

  #
  # GenServer implementations
  #

  @impl GenServer
  @spec init(any) :: {:ok, Counter.t()}
  def init(_), do: {:ok, %__MODULE__{}}

  @impl GenServer
  def handle_cast(:increment, %__MODULE__{count: n} = state),
    do: {:noreply, %{state | count: n + 1}}

  @impl GenServer
  def handle_cast(:reset, _), do: {:noreply, %__MODULE__{}}
end
