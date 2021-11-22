import tmbg;
import json;

data = tmbg.get_album_list("http://tmbw.net/wiki/Discography");

json_string = json.dumps(data);

tmbg.write_file("derived_data/albums.json",json_string);
