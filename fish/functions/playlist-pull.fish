function playlist-pull
    yt-dlp -cix --audio-format mp3 --audio-quality 0 $argv
end
