defmodule Funcoes do
  @moduledoc """
  Exercicios sobre funções
  """

  @doc """
  Recebe um numero
  Retorna `true` se o numero for 0 e `false` em caso contrario

  Example:

  iex> Funcoes.is_zero(0)
  true

  iex> Funcoes.is_zero(2)
  false

  iex> Funcoes.is_zero(-1)
  false
  """
  def is_zero(num) do
	num == 0
  end

  def is_zero(num) do
	false
  end
  @doc """
  Recebe um valor que poder ser uma lista, um numero, um mapa ou uma tupla
  Retorna "lista", "numero", "mapa" ou "tupla" dependendo do tipo de data do argumento

  Example:

  iex> Funcoes.type([])
  "lista"

  iex> Funcoes.type(0)
  "numero"

  iex> Funcoes.type(3.2)
  "numero"

  iex> Funcoes.type(%{})
  "mapa"

  iex> Funcoes.type({})
  "tupla"
  """
  def type(v) when is_list(v) do "lista" end
  def type(v) when is_number(v) do "numero" end
  def type(v) when is_float(v) do "numero" end
  def type(v) when is_map(v) do "mapa" end
  def type(v) when is_tuple(v) do "tupla" end
  @doc """
  Recebe dois numeros
  Retorna o maior dos dois números recebidos

  Example:

  iex> Funcoes.max(1, 2)
  2

  iex> Funcoes.max(1, 1)
  1

  iex> Funcoes.max(2, 1)
  2

  iex> Funcoes.max(2, -1)
  2

  iex> Funcoes.max(-2, -1)
  -1
  """
  def max(a, b) when a > b, do: a
  def max(a, b), do: b

  @doc """
  Recebe uma função e um número
  Retorna o resultado da função quando invocada com o número como parametro

  Example:

  iex> Funcoes.call(fn n -> n + 2 end, 1)
  3

  iex> Funcoes.call(fn n -> n * 2 end, 2)
  4

  iex> Funcoes.call(fn n -> n - 1 end, 1)
  0
  """
  def call(f, n) do
    f.(n)
  end
end
