class Tactics
  def initialize(name)
    @name = name
    @queue = Array.new
  end

  def add_spell_to_queue spell
    @queue.push spell
  end

  def get_name
    @name
  end

  def get_queue
    @queue
  end


end