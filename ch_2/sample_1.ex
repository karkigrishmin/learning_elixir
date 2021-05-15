# function
# the return value of function is the return value of its last expression
# there is no explicit return in elixir
defmodule Geometry do
  def rectangle_area(a, b) do
    a * b
  end
end

# function can also be defined in a single line if a function definition is short
defmodule Geometry.V2 do
  def square_area(a), do: a * a
end

# Pipline operator(|>)
# It is used to place the result of previous function call as the first argument
# of next call.
defmodule PiplineExample do
  def rectangle_area(a, b) do
    a * b
  end

  def area(a) do
    rectangle_area(a, a)
    |> IO.puts()
  end
end

# function arity
# It denotes the number of arguments a fuction receives
# two functions with the same name but different arities are two different functions
defmodule ArityExample do
  # this area function is denoted as ArityExample.area/1
  def area(a) do
    area(a, a)
  end

  # this area function is denoted as ArityExample.area/2
  def area(a, b) do
    a * b
  end
end

# elixir also allows us to specify default values for a function arguments
# by using \\ operator followed by default value
defmodule DefaultValueExample do
  def sum(a, b \\ 2) do
    a + b
  end
end

# function visibility
defmodule TestPrivate do
  # this double function is public and can be called from anywhere
  # In elixir terminology, this function is said to be exported
  def double(a) do
    sum(a, a)
  end

  # this sum function is private and can be used only inside this module
  defp sum(a, b) do
    a + b
  end
end

# Imports
# we can import other module into our own module where we want to use functions
# from that other module
defmodule MyModule do
  import IO

  def my_function do
    puts("we can use puts instead of IO.puts")
  end
end

# alias
# It can be used to reference a module under a different name
defmodule AliasExample do
  alias IO, as: MyIO

  def use_alias_module do
    MyIO.puts("giving another name for IO as MyIO")
  end
end

# type system
# Numbers, atoms, atoms as booleans
defmodule NumbersExample do
  def sum do
    a = 5
    b = 2
    a + b
  end

  def div_example do
    a = 7
    b = 3
    # returns integer value ie.2, but 7/3 gives float value i.e. 2.5
    div(a, b)
  end

  def remainder_example do
    # returns remainder i.e 1
    rem(7, 3)
  end
end

# atoms
# atoms consists of two parts- text and value
# text is the character after colon and text is stored in atom table at runtime
# value is the reference of the atom table that is stored in the variable
defmodule AtomsExample do
  def print_atom do
    a = :an_atom
    # we can use this syntax for spaces in our atom name
    b = :"an atom with spaces"
    # a
    b
  end
end

# aliases-another syntax for atom constants
defmodule AnotherAtomSyntax do
  def another_syntax_for_atom do
    a = AnAtom
    # at compile time it's transformed into :"Elixir.AnAtom"
    a == :"Elixir.AnAtom"
  end

  def test_atom do
    a = AnAtom
    # when we use alias, elixir implicitly adds Elixir. prefix to its text and
    # inserts and atom there
    a == Elixir.AnAtom
  end
end

# atoms as booleans
# there is no dedicated boolean type in elixir so we use :true and :false atoms
# as booleans
# elixir also allows us to reference these atoms without colon- true and false
defmodule BooleanAtomsExample do
  def example_1 do
    a = true
    b = false
    # returns true
    a
    # returns false
    b
  end

  def example_2 do
    # returns false
    true and false
    # returns true
    true or false
    # returns false
    not true
  end
end

# Nil
# another atom i.e :nil or nil
# elixirs short circuit operators- ||, &&, and !
defmodule ShortCircuitOperatorExample do
  def example_1 do
    # returns first expression that is not falsy value, so here it returns 5
    nil || 5 || false || true
    # returns last expression if there are no any truthy value
    nil || false || false
  end

  def example_2 do
    # returns first expression if it is not truthy
    nil && true
    # returns second expression if the first expression is truthy
    true && false
  end
end
