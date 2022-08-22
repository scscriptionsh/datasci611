import tmbg;
import json;

albums = json.loads(tmbg.read_file("derived_data/albums.json"))

song_urls = [];

for album in albums:
    url = album['url'];
    urls = tmbg.scrape_lyrics_pages(url);
    for sub_url in urls:
        song_urls.append({"album":album["title"], "url":sub_url});

tmbg.write_file("derived_data/song-urls.json", json.dumps(song_urls));

    
