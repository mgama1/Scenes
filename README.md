# Scenes
This a simple script that searches for the literal string in the subtitle file then searches for the time stamp pattern using regex 
the time stamp is then fed to ffmpeg to extract only a specific part of the movie  (check https://trac.ffmpeg.org/wiki/Seeking for more information)
Finally the clips are added to an m3u file and played with vlc

## Dependencies
```bash
sudo apt update 
sudo apt install ffmpeg
sudo snap install vlc
```
