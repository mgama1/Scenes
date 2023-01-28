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
	ffmpeg -noaccurate_seek -ss ${my_array[i]} -i Iron.Man.2.2010.1080p.BrRip.x264.YIFY.mp4 -to 00:00:20 -c copy -y -avoid_negative_ts 1 scenes/scene$j.mp4
	echo "scene$j.mp4" >> scenes/playlist.m3u
done

vlc scenes/playlist.m3u
#rm scenes/playlist.m3u
rm -r scenes
