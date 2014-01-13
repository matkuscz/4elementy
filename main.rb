require './Classes/Player'
require './Classes/Tactics'
require './Classes/FightController'

class Main
  # Big bang
  puts '#########################################################################################'
  puts '#                                                                                       #'
  puts '#                                          .                                            #'
  puts '#                                         /|\                                           #'
  puts '#                                      a Game by                                        #'
  puts '#                                         \|/                                           #'
  puts '#                                          .                                            #'
  puts '#                                                                                       #'
  puts '#                             ~= Karlos & Matka & Suchos =~                             #'
  puts '#                                                                                       #'
  puts '#                                                                                       #'
  puts '#########################################################################################'
  puts '#                                                                                       #'
  puts '#########################################################################################'
  puts '#   _   ___   _______  ___      _______  __   __  _______  __    _  _______  _______    #'
  puts '#  | | |   | |       ||   |    |       ||  |_|  ||       ||  |  | ||       ||       |   #'
  puts '#  | |_|   | |    ___||   |    |    ___||       ||    ___||   |_| ||_     _||  _____|   #'
  puts '#  |       | |   |___ |   |    |   |___ |       ||   |___ |       |  |   |  | |_____    #'
  puts '#  |___    | |    ___||   |___ |    ___||       ||    ___||  _    |  |   |  |_____  |   #'
  puts '#      |   | |   |___ |       ||   |___ | ||_|| ||   |___ | | |   |  |   |   _____| |   #'
  puts '#      |___| |_______||_______||_______||_|   |_||_______||_|  |__|  |___|  |_______|   #'
  puts '#                                                                                       #'
  puts '#########################################################################################'
  puts '#                              version | 0.001 alpha | loaded                           #'
  puts '#########################################################################################'





  # Prepare world
    puts 'Preparing world'

    # Prepare default spell
      knife = Spell.new('Knife', damage: 1, absorb: 0)

    # Prepare default queue
      puts 'Preparing default fight tactic for default player'
      tactic_default = Tactics.new( 'default' )
      tactic_default.add_spell_to_queue(knife)
      tactic_default.add_spell_to_queue(knife)
      tactic_default.add_spell_to_queue(knife)
      tactic_default.add_spell_to_queue(knife)
      tactic_default.add_spell_to_queue(knife)
      puts tactic_default.inspect

    puts 'World Created + '

  # Create player
    puts 'Creating player'
    john = Player.new('John', tactic_default, hp: 10)
    puts '.'




  # Spawn player



  # Show player profile
    john.get_player_info
    puts 'Drinking a beer'
    john.drink_a_beer


  # Show player inventory
    john.get_inventory_status

  puts 'Player and inventory working'
  puts 'Lets prepare spells'

  # Learn player spells
    # Create spell - Fireball
    puts 'Creating first spell: Fireball'
    fireball = Spell.new('Fireball', damage: 3, absorb: 1)
    puts fireball.to_s

    # Create spell - Wall
    puts 'Creating second spell: Wall'
    wall = Spell.new('Wall', damage: 0, absorb: 6)
    puts wall.to_s

    # Create spell - Skeleton attack
    puts 'Creating third spell: Skeleton attack'
    skeleton_attack = Spell.new('Skeleton attack', damage: 2, absorb: 0)


    ## Create spellbook for player
    ##puts 'Creating player spellbook'
    ##knizka = Spellbook.new
    ##puts knizka.to_s

    # Show spellbook
    john.get_spells

    # Add first spell to spellbook
    puts 'Learning new spell'
    john.learn_spell fireball

    # Add second spell to spellbook
    puts 'Learning new spell'
    john.learn_spell wall


  # Show spellbook
    john.get_spells



  puts '+Preparing for fight'
  # Set player fighting tactics (queue)
    # Prepare queue
    puts 'Preparing fight tactic for player'
    tactic_fireball_spam = Tactics.new( 'fbspam' )
    tactic_fireball_spam.add_spell_to_queue(fireball)
    tactic_fireball_spam.add_spell_to_queue(fireball)
    tactic_fireball_spam.add_spell_to_queue(fireball)
    tactic_fireball_spam.add_spell_to_queue(fireball)
    tactic_fireball_spam.add_spell_to_queue(fireball)
    puts tactic_fireball_spam.inspect

    # Assign tactics to player
    john.set_tactics(tactic_fireball_spam)


  # Send player to fight
  puts 'Starting fight engine'

    # Prepare enemy
      # If enemy != player -> generate monster equal to player level -> put you to arena
      # If enemy == player -> put both players to arena

        # For now, enemy == player == monster
        # Generating second player, learn him spell, prepare tactic for him bind it with him
        puts 'Preparing enemy'
        skeleton = Player.new('skeleton', tactic_default, hp: 6)
        skeleton.learn_spell(skeleton_attack)
        tactic_skeleton = Tactics.new( 'skele' )
        tactic_skeleton.add_spell_to_queue(skeleton_attack)
        tactic_skeleton.add_spell_to_queue(skeleton_attack)
        tactic_skeleton.add_spell_to_queue(skeleton_attack)
        tactic_skeleton.add_spell_to_queue(skeleton_attack)
        tactic_skeleton.add_spell_to_queue(skeleton_attack)
        skeleton.set_tactics(tactic_skeleton)
        puts '.'




    # Create fight entry summary


    # Create arena
    arena = FightController.new

    # Let that shit happen ... :)
    arena.fight(john, skeleton)



  # Calculate result

  # Calculate drop

  # Show result & drop

  # Apply result & drop

  # Show player inventory

  # Show player profile


end