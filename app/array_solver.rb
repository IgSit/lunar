class ArraySolver
  def initialize
    @divisor = 3
  end

  def solve_array(array)
    @array = array
    @steps = 6

    make_divisible
    make_biggest_possible
    @array
  end

  private

  def make_biggest_possible
    while @steps >= @divisor
      idx, change = get_best_number_idx_and_change
      @array[idx] += change
      @steps -= @divisor
    end
  end

  def get_best_number_idx_and_change
    result_idx = 0
    result_change = 0

    @array.each_with_index do |number, idx|
      possible_change = get_possible_change(number)
      if possible_change > result_change
        result_change = possible_change
        result_idx = idx
      end
    end

    [result_idx, result_change]
  end

  def get_possible_change(number)
    magnitude_change = get_magnitude(number)
    current_number = number

    (1..@divisor).each do
      while (current_number / magnitude_change) % 10 == 9
        magnitude_change /= 10
        if magnitude_change == 0
          return 0
        end
      end

      current_number += magnitude_change
    end

    current_number - number
  end

  def make_divisible
    @array.collect! do |number|
      addition_component = get_magnitude(number)

      while number.digits.sum % 3 != 0
        addition_component = adjust_magnitude(number, addition_component)
        number += addition_component
        @steps -= 1
      end

      number
    end
  end

  def get_magnitude(number)
    10 ** (number.digits.count - 1)
  end

  def adjust_magnitude(number, addition_component)
    if number / addition_component == 9
      addition_component /= 10
    end
    addition_component
  end
end
