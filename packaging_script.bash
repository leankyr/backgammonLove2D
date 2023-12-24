cd Secondary_Client/ || exit
pwd
zip -9 -r backgammon.love .
mv backgammon.love ../love-11.4-win64/
cd ../love-11.4-win64/ || exit
pwd
cat love.exe backgammon.love > backgammon.exe
cd ../
pwd
zip -9 -r backgammon-win64.zip love-11.4-win64/