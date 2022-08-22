from bs4 import BeautifulSoup as bs
from requests import get as get_raw
from hashlib import md5 as hash_
from time import sleep 
import os
import pandas as pd
from random import randint
import pickle

cachedir = ".hash-cache";
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

def get_soup(url):
    return bs(get(url))

def head(s):
    return s[:10]

def ensure_soup(s):
    if isinstance(s,str):
        return bs(get(s));
    else:
        return s;

def ensure_full_url(base, url):
    if url[:4] == 'http':
        return url;
    else:
        return base + url;


def category_page_next(url_base, soup):
    soup = ensure_soup(soup);
    element = soup.find("a",class_="category-page__pagination-next");
    if element:
        return ensure_full_url(url_base, element['href']);
    else:
        return None;

def get_character_links_on_page(url_base, soup):
    soup = ensure_soup(soup);
    elements = soup.find_all("a",class_="category-page__member-link");
    return [url_base + element['href'] for element in elements if element.has_key('href')]

def get_category_links_on_page(url_base, soup):
    soup = ensure_soup(soup);
    elements = soup.find_all("a",class_="category-page__member-link");
    return [url_to_category_name(element['href']) for element in elements if element.has_key('href') and 'Category' in element['href']]

def pull_characters_from_category(category_name):
    url_base = "https://dc.fandom.com"
    base_page = url_base + "/wiki/Category:{}".format(category_name);
    page = get_soup(base_page);
    next_url = category_page_next(url_base, page);
    urls = get_character_links_on_page(url_base, page);
    while next_url:
        page = get_soup(next_url);
        next_url = category_page_next(url_base, page);
        urls.extend(get_character_links_on_page(url_base, page));
    return list(set(urls));

def url_to_category_name(url):
    return url.split(':')[-1];

def pull_categories_from_category(category_name):
    url_base = "https://dc.fandom.com"
    base_page = url_base + "/wiki/Category:{}".format(category_name);
    page = get_soup(base_page);
    next_url = category_page_next(url_base, page);
    urls = get_category_links_on_page(url_base, page);
    while next_url:
        page = get_soup(next_url);
        next_url = category_page_next(url_base, page);
        urls.extend(get_category_links_on_page(url_base, page));
    return list(set(urls));

properties = ['Good_Characters','Bad_Characters','Neutral_Characters',
              'Female_Characters','Genderless_Characters',
              'Intersex_Characters','Male_Characters','Transgender_Characters',
              'Non-binary_Characters'];
properties.extend(pull_categories_from_category("Powers"));

def collect_characters_by_category(categories):
    dataframes = [];
    for cat in categories:
        characters = pull_characters_from_category(cat);
        df = pd.DataFrame({"category":cat,"character":characters});
        dataframes.append(df);
    return pd.concat(dataframes, ignore_index=True);

data = collect_characters_by_category(properties);

data.to_csv("derived_data/power-gender.csv", index=False)
