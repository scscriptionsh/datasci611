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
url_base = "https://marvel.fandom.com"
base_pages = url_base + ["/wiki/Category:Powers",
                         "/wiki/Category:Female_Characters",
                         "/wiki/Category:Male_Characters",
                         "/wiki/Category:Non-Binary_Characters",
                         "/wiki/Category:Agender_Characters"];
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
