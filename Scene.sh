echo "Enter query"
read query

mapfile -t my_array < <(grep -iB1 "$query" *.srt  | grep -o '[0-9][0-9]:[0-9][0-9]:[0-9][0-9]')
if ! [ -d ./scenes ]
then

	mkdir scenes
fi
for ((i=0,j=0;i< ${#my_array[@]} ;i+=2,j+=1));
do
        #echo ${my_array[i]}
	ffmpeg -noaccurate_seek -ss ${my_array[i]} -i "Iron.Man.3.2013.1080p.UHD.BluRay.x265.HDR.DD5.1-Pahe.in.mkv" -to 00:00:20 -c copy -y -avoid_negative_ts 1 scenes/scene$j.mp4
	echo "scene$j.mp4" >> scenes/playlist.m3u
done
if [ -f scenes/playlist.m3u ]
then

	vlc scenes/playlist.m3u
else
	echo "no matched query found"

fi


	

rm -r scenes 
