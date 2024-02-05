
class Robot
  attr_reader :name

  @@names = []

  def initialize
    Kernel.srand 1000
    @name = valid_name
    @@names << @name
  end

  def generate_name
    ("A".."Z").to_a.sample(2).join + ("0".."9").to_a.sample(3).join
  end

  def valid_name
    potential_name = generate_name
    while @@names.include?(potential_name)
      potential_name = generate_name
    end
    potential_name
  end

  def reset
    @@names.delete(name)
    @name = valid_name
  end
end
