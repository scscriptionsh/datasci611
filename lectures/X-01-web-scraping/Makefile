.PHONY: clean

clean:
	rm -f derived_data/*

derived_data/albums.json: grab_albums.py tmbg.py
	mkdir -p derived_data
	python3 grab_albums.py

derived_data/song-urls.json: grab_song_urls.py tmbg.py derived_data/albums.json
	mkdir -p derived_data
	python3 grab_song_urls.py

derived_data/song-data.json: grab_song_data.py tmbg.py derived_data/song-urls.json
	mkdir -p derived_data
	python3 grab_song_data.py
