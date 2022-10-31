echo -e "\e[32mThe Script works on the proviso that you:
Are getting your videos from https://steamdeckrepo.com
That you right click the video you wanted and clicked Copy Video Location to provide the web link below:  \e[0m"

sleep 2

read -p 'What is the weblink of your video? ' weblink
read -p 'What file name would you like it to be saved under in /home/deck/videos? ' filename


mkdir -p /home/deck/.steam/root/config/uioverrides/movies

curl $weblink --output /home/deck/Videos/$filename

read -p 'Do you want this to be your boot video now? (y/n)' setvideo

if [ $setvideo = "y" ];
then
  cp /home/deck/Videos /home/deck/.steam/root/config/uioverrides/movies/deck_startup.webm && echo -e '\e[32mDone\e[0m'

elif [ $setvideo = "n" ];
then
  echo -e "\e[32mWhen you want this to be your boot video copy the file to /home/deck/.steam/root/config/uioverrides/movies with the name deck_startup.webm\e[0m"

else
  echo -e "\e[31mSomething went wrong, please make sure you chose y/n\e[0m"

fi
