from requests import get as get_raw
from hashlib import md5 as hash_raw
import os
from time import sleep
from bs4 import BeautifulSoup as bs

def hash(s):
    return hash_raw(s.encode()).hexdigest()


cachedir = "lecture_scrape_cache"
if not os.path.isdir(cachedir):
    os.mkdir(cachedir);
    
def to_cache_name(url):
    return "./{}/{}".format(cachedir, hash(url));

def read_file(s):
    with open(s,'r') as fd:
        return fd.read();
    
def write_file(s, content):
    with open(s,'w') as fd:
        fd.write(content)
    return s;

verbose = True;

def get(url):
    cache_name = to_cache_name(url);
    if os.path.isfile(cache_name):
        if verbose:
            print("Cache hit: {}".format(url));
        return read_file(cache_name);
    else:
        if verbose:
            print("Cache miss: {}".format(url));
        content = get_raw(url).content.decode();
        write_file(cache_name, content);
        return content;
    
get_delay = 1; # second
def get(url):
    cache_name = to_cache_name(url);
    if os.path.isfile(cache_name):
        print("Cache hit: {}".format(url));
        return read_file(cache_name);
    else:
        print("Cache miss: {}".format(url));
        sleep(get_delay);
        content = get_raw(url).content.decode();
        write_file(cache_name, content);
        return content;
    
def parse_html(html):
    return bs(html);

def get_document(url):
    return parse_html(get(url));

def get_song_table(url):
    doc = get_document(url);
    return doc.find("table",class_="lyricstable");

def get_song_data(url):
    tbl = get_song_table(url);
    out = {};
    lyrics = tbl.find("div",class_="lyrics-table").text.strip().split("\n");
    tds = tbl.find_all("td", attrs={"style":"text-align:right;"})
    out["title"] = tds[0].text.strip();
    out["by"] = tds[1].text.strip().split(":")[1];
    out["year"] = tds[2].text.strip().split(":")[1];
    out["lyrics"] = lyrics;
    return out

def get_album_list(url):
    doc = get_document(url);
    discog_table = doc.find("table", id = "discog");
    rows = discog_table.find_all("tr");
    def process_row(row):
        vals = row.find_all("td");
        year = vals[0].text.strip();
        album_url = vals[1].find("a")['href']
        title = vals[1].text.strip();
        return {"year":int(year), "title":title, "url":"http://tmbw.net"+album_url};
    return [ process_row(row) for row in rows if len(row.find_all("td")) >= 2 ];

def scrape_lyrics_pages(url):
    doc = get_document(url);
    out = [];
    for link in doc.find_all("a"):
        if link.has_key("href") and "wiki/Lyrics:" in link['href']:
            out.append("http://tmbw.net"+link['href']);
    return out;

def scrape_tmbg_lyrics(discog_url):
    albums = get_album_list(discog_url);
    output = [];
    for album in albums:
        url = album['url'];
        tracks = scrape_lyrics_pages(url);
        for track in tracks:
            try:
                data = get_song_data(track);
                data['album'] = album['title'];
                output.append(data);
            except Exception as e:
                print("Ran into an error on {} ({})".format( track, e))
    return output;
