class StarSystem
  attr_reader :name, :planets

  def initialize(name, planets)
    @name = name
    @planets = planets
  end

  def planet_names()
    for planet in @planets # this is too complex. Simplify it.
      planet_names = @planets.map { |planet| planet.name }
    end
    return planet_names
  end

  def get_planet_by_name(name)
    return @planets.find { |planet| planet.name == name }
  end

  def get_largest_planet()
    return @planets.max_by { |planet| planet.diameter }
  end

  def get_smallest_planet()
    return @planets.min_by { |planet| planet.diameter}
  end

  def get_planets_with_no_moons()
    return @planets.find_all { |planet| planet.number_of_moons == 0 }
  end

  def get_planets_with_more_moons(number)
    array_of_planets_with_more_moons = @planets.find_all { |planet| planet.number_of_moons > number }
    return array_of_planets_with_more_moons.map { |planet| planet.name }
  end

  #My original solution to get_number_of_planets_closer worked, but was too complex. I've commented out the original solution
  def get_number_of_planets_closer_than(distance)
    # array_of_closer_planets = @planets.find_all { |planet| planet.distance_from_sun < distance}
    # return array_of_closer_planets.length
    return @planets.count { |planet| planet.distance_from_sun < distance}
  end

  def get_total_number_of_moons()
    #for planet in @planets
    total_number_of_moons = @planets.map { |planet| planet.number_of_moons }
    return total_number_of_moons.reduce { |subtotal, number| subtotal + number }
    #end
  end

  #we are expecting an array of planet names. This should be sorted by distance from the sun.
  #So, the first task is to somehow access the planet.distance_from_sun variable, sort by this variable, then create a reduced array of the planet names.
  def get_planet_names_sorted_by_increasing_distance_from_sun()
    sorted_planets_by_distance = @planets.sort_by { |planet| planet.distance_from_sun }
    return sorted_planets_by_distance.map { |planet| planet.name}
  end
  #I can't get the solution to pass. It returns only the first name (Mercury). Hang on - once I added in the next test, everything passes!

def get_planet_names_sorted_by_size_decreasing()
  planets_sorted_by_size = @planets.sort_by { |planet| planet.diameter }
  planets_sorted_by_size_decreasing = planets_sorted_by_size.reverse
  planets_sorted_by_size_decreasing.map { |planet| planet.name }

end




end
