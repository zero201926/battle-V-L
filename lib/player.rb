class Player
  attr_reader :name, :hit_points
  attr_accessor :HP, :hit_points
  DEFAULT_HIT_POINTS = 60


  def initialize(name, hit_points = DEFAULT_HIT_POINTS)
    @name = name
    @hit_points = hit_points
  end

  def hit_points
    DEFAULT_HIT_POINTS
  end

  def attack(player)
    p player
    player.receive_damage
  end

  def receive_damage
    p @hit_points
    @hit_points -= 10
    p @hit_points
  end

end