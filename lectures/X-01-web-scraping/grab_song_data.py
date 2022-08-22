import tmbg;
import json;

song_infos = json.loads(tmbg.read_file("derived_data/song-urls.json"));

def get_extended_song_data(song_info):
    try:
        data = tmbg.get_song_data(song_info['url']);
        data['album'] = song_info['album'];
        return data;
    except Exception as e:
        print("Error with {} ({})".format(song_info['url'], e));
        return None;

out = [];
for info in song_infos:
    o = get_extended_song_data(info);
    if o != None:
        out.append(o);

tmbg.write_file("derived_data/song-data.json",json.dumps(out));
