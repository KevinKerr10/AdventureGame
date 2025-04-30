#!/bin/bash

# Player and Enemy Stats
declare -A Player_Stats=( [hp]=15 [attack]=3 )
declare -A Goblin=( [hp]=5 [attack]=1 )
declare -A GiantBat=( [hp]=10 [attack]=2 )

echo "Welcome to the Ultimate Adventure Game!"
echo "Choose a class: mage, fighter, or rogue."
read class

case "$class" in
  mage)
    cat mage.txt
    ;;
  fighter)
    cat fighter.txt
    ;;
  rogue)
    cat rogue.txt
    ;;
  *)
    echo "Invalid class."
    exit 1
    ;;
esac

echo "Now choose a location to explore: forest, castle, or cave."
read location

if [ "$location" = "forest" ]; then
  cat forest.txt
  echo "Your journey through the forest was uneventful until you saw a small house."
  echo "Would you like to walk towards it? (yes/no)"
  read answer

  if [ "$answer" = "yes" ]; then
    echo "You slowly make your way over. You look inside, but no one appears to be there."
    echo "You creak open the door and see a chest. It doesn’t look harmful, so you open it and find a sword!"
    echo "As you’re leaving, a goblin appears!"
    echo "The goblin slashes at you!"
    Player_Stats[hp]=$(( Player_Stats[hp] - Goblin[attack] ))
    echo "You took damage! Your HP is now ${Player_Stats[hp]}."
  else
    echo "you left the forest completely unharmed"
  fi

elif [ "$location" = "castle" ]; then
  cat castle.txt

elif [ "$location" = "cave" ]; then
  cat cave.txt
  echo "But wait..."
  cat monster.txt

  if [ "$class" = "mage" ]; then
    echo 'You have 1 spell: "basic wand attack" – it does 5 damage.'
    echo "Type 'basic wand attack' to attack the GiantBat:"
    read spell

    if [ "$spell" = "basic wand attack" ]; then
      GiantBat[hp]=$(( GiantBat[hp] - 5 ))
      echo "The GiantBat has ${GiantBat[hp]} HP left!"
    else
      echo "That spell didn't work!"
    fi

    echo "The GiantBat attacked you!"
    echo "But you managed to dodge at the last moment!"

    echo "Would you like to attack it again? (yes/no)"
    read answer

    if [ "$answer" = "yes" ]; then
      GiantBat[hp]=$(( GiantBat[hp] - 5 ))
      echo "You killed it!"
      echo "Just as you're about to leave, you find a fireball scroll and learn a new spell!"
    fi
  fi

else
  echo "Invalid location."
  exit 1
fi