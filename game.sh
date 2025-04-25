stats
declare -A GiantBat
GiantBat[hp]=10
GiantBat[attack]=2

echo "Welcome to the Ultimate Adventure Game!"
echo "Choose a class."
echo "You can choose from one of these 3 classes: mage, fighter and rogue. Type in your choice."
read class  

if [ "$class" = "mage" ]; then
  cat mage.txt
elif [ "$class" = "fighter" ]; then
  cat fighter.txt
elif [ "$class" = "rogue" ]; then
  cat rogue.txt
else
  echo "Invalid class."
fi

echo "Now choose a location to explore: forest, castle or cave. Type in your choice"
read location

if [ "$location" = "forest" ]; then 
  cat forest.txt

elif [ "$location" = "castle" ]; then   
  cat castle.txt

elif [ "$location" = "cave" ]; then    
  cat cave.txt
  echo "But wait..."
  cat monster.txt
  
  if [ "$class" = "mage" ]; then
    echo 'you have 1 spell, "basic wand attack" - it does 5 damage.' 
    echo "Type 'basic wand attack' to attack the GiantBat:"
    read spell
    
    if  [ "$spell" = "basic wand attack" ]; then
      GiantBat[hp]=$((GiantBat[hp]-5))
      echo "The GiantBat has ${GiantBat[hp]} HP left!"
    else 
      echo "That spell didn't work!"
    fi
  fi
    
else
  echo "Invalid location."
fi



