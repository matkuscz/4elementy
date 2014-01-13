require './Classes/Spellbook'
require './Classes/Tactics'

class Player
  def initialize(name, tactics, params)
    @name = name
    @lvl = 1
    @xp = 0
    if params[:hp] != nil
      @hp = params[:hp]
    else
      @hp = 10
    end

    @spell_book = Spellbook.new
    @inventory = Array.new
    @tactics = tactics


  end

  def get_player_info
    puts '*** PLAYER INFO CARD ***'
    puts "Name: #{@name.to_s}"
    puts "Level: #{@lvl.to_s}"
    puts "XP: #{@xp.to_s}"
    puts "HP: #{@hp.to_s}"
    puts get_spells
    puts get_inventory_status
    get_tactics_print

    puts '*** END OF PLAYER INFO CARD ***'
  end

  def prepare_spells_for_fight(spell_queue)
    @spell_book = spell_queue

  end

  def learn_spell(spell)
    @spell_book.learn_new_spell spell
  end

  def upgrade_spell(spell)
    @spell_book.lvl_up_spell spell
  end

  def get_spells
    @spell_book.get_spells_print
  end

  def drink_a_beer
    puts '...DrUnKeD PaNdA...'
  end

  def get_inventory_status
    puts '*** INVENTORY ***'
    puts @inventory.to_s
    puts '*** END OF INVENTORY ***'
  end

  def set_tactics(tactic)
    @tactics = tactic
  end

  def get_tactics
    @tactics
  end

  def get_tactics_print
    puts "Chosen strategy is: #{@tactics.get_name}"
  end

  def lower_hp amount
    @hp -= amount
  end

  def get_hp
    @hp
  end

  def get_name
    @name
  end


end