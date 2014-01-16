require './Classes/Spell'

class Spellbook
  def initialize

    @spells = Array.new

  end

  def learn_new_spell(spell)
    @spells.push spell
  end

  def forgot_spell(spell)
    @spells.delete_at spell
  end

  def lvl_up_spell(spell)
    @spells[spell].lvlUp
  end

  def get_spells_print
    puts '+++SPELLBOOK+++'
    puts @spells.to_s
    puts '+++END OF SPELLBOOK+++'
  end

  def get_spells
    @spells
  end

  def get_spell(name)
    @spells.select { |a| a==name }
  end
end