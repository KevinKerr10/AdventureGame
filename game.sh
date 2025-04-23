echo "Welcome to the Ultimate Adventure Game!"
echo "Choose a class."
read class
if [ "$class" == "mage" ]; then
  cat mage.txt
elif [ "$class" == "fighter" ];then
  cat fighter.txt
elif [ "$class" == "rogue" ];then
  cat rogue.txt
echo "Now choose a location to explore: forest, castle or cave."
read location
if [ "$location" == "forest" ]; then 
  cat forest.txt
elif ["$location" == "castle"]; then
  cat castle.txt
elif ["$location" == "cave"]; then
  cat cave.txt
  echo "But wait..."
  cat monster.txt
else
  echo "invalid location."
fi
