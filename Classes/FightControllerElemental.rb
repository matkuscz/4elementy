class FightControllerElemental
  def initialize
    puts 'The arena is now ready !!!'
  end

  def calculate_enemy player

  end

  def fight somebody, someone
    puts '*Battle dance*'

    @player_a = somebody
    @player_b = someone

    @battle_status = Hash.new

    puts '+++!!!WE HAVE A FIGHT HERE!!!+++'
    puts '+Champion A -> Mr.:'
    puts @player_a.get_player_info
    puts '+ VS Champion B -> Mr.:'
    puts @player_b.get_player_info
    puts '++LET THE BATTLE BEGIN++'


    # Get spell queues for both players

    @ta = @player_a.get_tactics
    @qa = @ta.get_queue.clone

    @tb = @player_b.get_tactics
    @qb = @tb.get_queue.clone

    puts "Player queues ready: \n #{@qa.to_s} \n #{@qb.to_s}"

    # Start a fight
      # Prepare time slots
      @turns = Array.new()
      @turns.push(1)
      @turns.push(2)
      @turns.push(3)
      @turns.push(4)
      @turns.push(5)

      puts "We have this time scheme : #{@turns.to_s}"

    @turns.each do |turn|



    unless @battle_status[:dead_flag]


      # Round X
      puts ">> TURN #{turn} Begins ! <<"
      # Get Player A - First spell from queue
      @spell_a = @qa.pop
      @spell_b = @qb.pop

     puts 'Spells to clash:'
      puts "Player #{@player_a.get_name} >> " + @spell_a.get_spell_description
      puts "Player #{@player_b.get_name} >> " + @spell_b.get_spell_description

        # Calculate damage from player's A spell, to player B
          # Get damage of fire element of spell A and lower it equal to absorbtion of fire element of spell B
          @dmg_a_fire = @spell_a.get_spell_fire_dmg - @spell_b.get_spell_fire_absorb
          @dmg_a_earth = @spell_a.get_spell_earth_dmg - @spell_b.get_spell_earth_absorb
          @dmg_a_water = @spell_a.get_spell_water_dmg - @spell_b.get_spell_water_absorb
          @dmg_a_wind = @spell_a.get_spell_wind_dmg - @spell_b.get_spell_wind_absorb

          @dmg_b_fire = @spell_b.get_spell_fire_dmg - @spell_a.get_spell_fire_absorb
          @dmg_b_earth = @spell_b.get_spell_earth_dmg - @spell_a.get_spell_earth_absorb
          @dmg_b_water = @spell_b.get_spell_water_dmg - @spell_a.get_spell_water_absorb
          @dmg_b_wind = @spell_b.get_spell_wind_dmg - @spell_a.get_spell_wind_absorb

          puts "Damage to player #{@player_a.get_name}"
          puts "#{@spell_a.get_spell_name} >>> Dmg: #{@spell_a.get_spell_damage} VS #{@spell_b.get_spell_name} >>> Abs: #{@spell_b.get_spell_absorbtion}"
          puts "Fire #{@dmg_a_fire}"
          puts "Earth #{@dmg_a_earth}"
          puts "Water #{@dmg_a_water}"
          puts "Wind #{@dmg_a_wind}"


      # Calculate damage from player's B spell, to player A
        # Get damage of B spell and lower it equal to A absorbtion
        @dmg_b = @spell_b.get_spell_damage - @spell_a.get_spell_absorbtion
        puts "#{@spell_b.get_spell_name} >>> Dmg: #{@spell_b.get_spell_damage} VS #{@spell_a.get_spell_name} >>> Abs: #{@spell_a.get_spell_absorbtion}"
        puts "Damage to player #{@player_b.get_name}"
        puts "Fire #{@dmg_b_fire}"
        puts "Earth #{@dmg_b_earth}"
        puts "Water #{@dmg_b_water}"
        puts "Wind #{@dmg_b_wind}"


        # Propagate change of HP to players
        # A_hp -= B_dmg && B_hp -= A_dmg
        puts '> Boom, Ka-Boom'
        @player_a.lower_hp(@dmg_b_fire)
        @player_a.lower_hp(@dmg_b_earth)
        @player_a.lower_hp(@dmg_b_water)
        @player_a.lower_hp(@dmg_b_wind)
        @player_b.lower_hp(@dmg_a_fire)
        @player_b.lower_hp(@dmg_a_earth)
        @player_b.lower_hp(@dmg_a_water)
        @player_b.lower_hp(@dmg_a_wind)


        # Report new hp status
        puts '>Survivors status: '
        puts "#{@player_a.get_name} > #{@player_a.get_hp} HP"
        puts "#{@player_b.get_name} > #{@player_b.get_hp} HP"

     # End turn
       # Check for dead players
       if @player_a.get_hp <= 0 || @player_b.get_hp <= 0
         # We have a dead body sir ...
         puts 'We have a dead body sir ... :( '
         @battle_status[:dead_flag] = true
       end

        # Check victory conditions
        # Check dead flag
          if @battle_status[:dead_flag]
            # Are both player dead ? If so, call a DRAW
           if @player_a.get_hp <= 0 && @player_b.get_hp <= 0
             puts '>>> THE BATTLE IS DRAW -> WE HAVE NO WINNER'
             # Break -> END THE BATTLE

           # Is player A alive and player B dead ? A WINS
           elsif @player_a.get_hp > 0 && @player_b.get_hp <= 0
             puts ">>> #{@player_a.get_name} WINS THE BATTLE"
             # Break -> END THE BATTLE

            # Is player B alive and player A dead ? B WINS
           elsif @player_b.get_hp > 0 && @player_a.get_hp <= 0
             puts ">>> #{@player_b.get_name} WINS THE BATTLE"
           # Break -> END THE BATTLE

           # Else its a BUG and we call a DRAW :) THIS SHOULD NEVER HAPPEN, IF IT DOES, PLS EMAIL ME
           else
             puts '>>> THE BATTLE IS DRAW -> WE HAVE NO WINNER'
             puts 'BUT WE HAVE SERIOUS CONSISTENCY PROBLEM !!! PLS EMAIL ME IF U SEE THIS :)'
           # Break -> END THE BATTLE
           end
         end

      puts ">> TURN #{turn} has ended <<"
      puts '----------------------------'
    end
    end
  end

end