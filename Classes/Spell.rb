class Spell
  def initialize(name, params)
    @name = name
#      @stats[:damage] = {fire: 0, earth: 0, air: 0, water: 0}
#      @stats[:absorb] = {fire: 0, earth: 0, air: 0, water: 0}


    @damage = params[:damage]
    @absorb = params[:absorb]

    # @damage = { fire: 0, earth: 0, air: 0, water: 0 }
    # @absorb = { fire: 0, earth: 0, air: 0, water: 0 }


  end

  def create(params)
    @name = params[:name]
#      @stats[:damage] = {fire: 0, earth: 0, air: 0, water: 0}
#      @stats[:absorb] = {fire: 0, earth: 0, air: 0, water: 0}


    @damage = params[:damage]
    @absorb = params[:absorb]

    # @damage = { fire: 0, earth: 0, air: 0, water: 0 }
    # @absorb = { fire: 0, earth: 0, air: 0, water: 0 }


  end

  def get_spell_description
    @name.to_s + ' - Damage: ' + @damage.to_s + ' Absorb: ' + @absorb.to_s
  end

  def get_spell_damage
    @damage
  end

  def get_spell_absorbtion
    @absorb
  end

  def get_spell_name
    @name
  end

  private

  def set_spell_damage

  end


end