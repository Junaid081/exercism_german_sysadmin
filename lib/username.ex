defmodule Username do

    def sanitize([head | tail]) when head == ?ä do
    'ae' ++ sanitize(tail)
    end
    def sanitize([head | tail]) when head == ?ö do
    'oe' ++ sanitize(tail)
    end
    def sanitize([head | tail]) when head == ?ü do
    'ue' ++ sanitize(tail)
    end
    def sanitize([head | tail]) when head == ?ß do
    'ss' ++ sanitize(tail)
    end
  def sanitize([head | tail]) do
      case check_sanitization(head) do
        true -> [head] ++ sanitize(tail) 
        _ -> sanitize(tail)
      end
  end
  def sanitize([]) do
    []
  end
  defp check_sanitization(head) do
    ((head >= ?a) && (head <= ?z)) || head == ?_
  end

end
