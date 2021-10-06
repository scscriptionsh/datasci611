from bs4 import BeautifulSoup as bs
from requests import get as get_raw
from hashlib import md5 as hash_
from time import sleep 
import os
import pandas as pd
from dfply import *
from random import randint
import pickle

cachedir = ".hash-cache";
url_base = "https://dc.fandom.com"
base_page = url_base + "/wiki/Category:Powers";
fetch_slowdown = 1; # second



if not os.path.isdir(cachedir):
    os.mkdir(cachedir);

def hash(x):
    return hash_(x.encode("utf-8")).hexdigest();

def hash_loc(x):
    return cachedir + "/" + hash(x)

def read_file(f):
    with open(f,'r') as fd:
        return fd.read();

def write_file(f,content):
    with open(f,'w') as fd:
        fd.write(content);
    return f;

def get(url):
    hl = hash_loc(url);
    if os.path.isfile(hl):
        print("Cache hit. {}".format(url))
        return read_file(hl);
    else:
        print("Cache miss. {}".format(url))
        sleep(fetch_slowdown+randint(0,3));
        content = get_raw(url).content.decode();
        write_file(hl,content);
        return content;

def head(s):
    return s[:10]

powers_enclosure = 'category-page__members'

def get_powers_urls(start_at=base_page):
    soup = bs(get(start_at));
    return [ url_base + a['href'] for a in soup.find(class_=powers_enclosure).find_all("a") ];

def get_list(lst):
    total = len(lst);
    out = [];
    for i in range(total):
        out.append(get(lst[i]));
        print("{0:.2f} % done".format(100.0*i/(total-1)));
    return out;

def extract_universe(s):
    return s[::-1].split('(')[0][::-1][:-1];
        
def get_characters(url,append_to=[]):
    soup = bs(get(url));
    power = soup.find("h1",class_="page-header__title").text.strip();
    done = False;
    while not done:
        links = soup.find_all("a",class_="category-page__member-link");
        for link in links:
            title = link['title'];
            universe = extract_universe(title);
            character = title.replace('('+universe+')','').strip();
            url = link['href'];
            if not ":" in url:
                append_to.append((power, character, universe, url_base + url));
        next_link = soup.find("a",class_="category-page__pagination-next");
        if next_link == None:
            done = True;
        else:
            print('fetching {}'.format(next_link['href']))
            soup = bs(get(next_link['href']));
    return append_to

def get_powers_list(start_at=base_page):
    urls = get_powers_urls(start_at);
    out = [];
    for url in urls:
        out = get_characters(url,out);
    return pd.DataFrame(out,columns=["power","character","universe","url"])

powers = None;
if os.path.isfile("powers.csv"):
    powers = pd.read_csv("powers.csv");
else:
    powers = get_powers_list()
    powers.to_csv("powers.csv",index=False);

def character_info_hash_loc(url):
    return hash_loc(url) + ".character.pickle";
    
def get_character_info_raw(url):
    out = [];
    soup = bs(get(url));
    full_name = soup.find("h1",class_="page-header__title").text.strip();
    universe = extract_universe(full_name);
    character = full_name.replace('('+universe+')','').strip();
    infobox = soup.find("aside",class_="portable-infobox");
    if infobox == None:
        return [];
    else:        
        for datum in infobox.find_all("div",class_="pi-data"):
            name = datum.find(class_="pi-data-label").text.strip();
            value = datum.find(class_="pi-data-value").text.strip();
            out.append((character, universe, name, value));
        return out;

def get_character_info(url, append_to=[]):
    hl = character_info_hash_loc(url);
    if os.path.isfile(hl):
        with open(hl,'rb') as f:
            data = pickle.load(f);
            return append_to + data;
    else:
        data = get_character_info_raw(url);
        with open(hl,'wb') as f:
            pickle.dump(data, f, pickle.HIGHEST_PROTOCOL);
        return append_to + data;

def get_character_page_length(url):
    out = [];
    body = get(url);
    soup = bs(body);
    full_name = soup.find("h1",class_="page-header__title").text.strip();
    universe = extract_universe(full_name);
    character = full_name.replace('('+universe+')','').strip();
    return [character, universe, len(body)]

def get_all_character_page_data(urls):
    data = [ get_character_page_length(url) for url in urls ];
    return pd.DataFrame(data,columns=["character","universe","page_length"]);

def get_all_character_info(urls):
    out = [];
    i = 0;
    n = len(urls)*1.0;
    for url in urls:
        out = get_character_info(url,append_to=out);
        print("{0:.2f} Done".format((i*100.0)/(n-1)));
        i = i + 1;
    return pd.DataFrame(out,columns=["character","universe","property_name","value"]);

character_data = None;
if os.path.isfile("character-data.csv"):
    character_data = pd.read_csv("character-data.csv");
else:
    character_data = get_all_character_info(unique_urls);
    character_data.to_csv("character-data.csv",index=False);

character_page_data = None;
if os.path.isfile("character-page-data.csv"):
    character_page_data = pd.read_csv("character-page-data.csv");
else:
    character_page_data = get_all_character_page_data(unique_urls);
    character_page_data.to_csv("character-page-data.csv",index=False);

