import bokeh as bk
import pandas as pd
import numpy as np
from sklearn.manifold import TSNE
from bokeh.io import curdoc
from bokeh.layouts import column, row, gridplot
from bokeh.models import ColumnDataSource, Slider, TextInput
from bokeh.plotting import figure

from pandasql import sqldf

def alignment_to_color(a):
    return ({"good":"cyan","bad":"magenta"})[a];

dfq = lambda q: sqldf(q, globals())

nice_data = pd.read_csv("derived_data/nice_data.csv");
nice_data = dfq("select * from nice_data where Alignment in ('good','bad')")

stats_to_consider = "Intelligence Strength Speed Durability Power Combat".split(" ")
numerical_parts = nice_data[stats_to_consider];

perplexity_value = 5.0;
early_exaggeration_value = 20.0;
learning_rate_value = 100.0;

tsne = TSNE(n_components=2, perplexity=perplexity_value, early_exaggeration=early_exaggeration_value, learning_rate=learning_rate_value);
projection = pd.DataFrame(tsne.fit_transform(numerical_parts),columns=['P1','P2']);
nice_data['P1'] = projection['P1'];
nice_data['P2'] = projection['P2'];
nice_data['color'] = [alignment_to_color(a) for a in nice_data['Alignment']];

source = bk.models.ColumnDataSource(data=nice_data);

# set up sliders


perplexity = Slider(title="Perplexity",value=12.0, start=5.0, end=50.0, step=1.0);
early_exaggeration = Slider(title="Early Exag.",value=20.0, start=5.0, end=50.0);
learning_rate = Slider(title="Learning Rate",value=10.0, start=100.0, end=1000.0);

controls = column(perplexity, early_exaggeration, learning_rate);

TOOLS="pan,wheel_zoom,box_select,lasso_select,reset";
small_plot_size = 150;
plot_pr = bk.plotting.figure(plot_width=400, 
                             plot_height=400, 
                             tools=TOOLS, 
                             x_axis_label="P1", 
                             y_axis_label="P2", 
                             title="TSNE");
sp = plot_pr.scatter('P1', 'P2',source=source,fill_color='color');
pa = bk.plotting.figure(plot_width=small_plot_size, 
                             plot_height=small_plot_size, 
                             tools=TOOLS, 
                             x_axis_label="Intelligence", 
                             y_axis_label="Strength", 
                             title="Str vs Int");
pa.scatter('Intelligence','Strength',source=source,fill_color='color');
pb = bk.plotting.figure(plot_width=small_plot_size, 
                             plot_height=small_plot_size, 
                             tools=TOOLS, 
                             x_axis_label="Speed", 
                             y_axis_label="Durability", 
                             title="Dur vs Spd");
pb.scatter('Speed','Durability',source=source,fill_color='color');
pc = bk.plotting.figure(plot_width=small_plot_size, 
                             plot_height=small_plot_size, 
                             tools=TOOLS, 
                             x_axis_label="Power", 
                             y_axis_label="Combat", 
                             title="Cbt vs Pow");
pc.scatter('Power','Combat',source=source,fill_color='color');

pl = gridplot([pa,pb,pc],ncols=1, merge_tools=True)
p = gridplot([plot_pr,pl],ncols=2, merge_tools=True)

curdoc().add_root(row(controls, p));

cordoc().add_root(row(column(perplexity, 
                             early_exaggeration, 
                             learning_rate),
                     gridplot([plot_pr,
                              gridplot([pa, pb, pc], ncols=2, merge_tools=True)],
                             merge_tools=True)))

cache = {};



def update(attr, old, new):
    global perplexity_value
    global learning_rate_value
    global early_exaggeration_value
    if(attr=="perplexity"): 
        perplexity_value = new;
    if(attr=="learning_rate"):
        learning_rate_value = new;
    if(attr=="early_exaggeration"):
        early_exaggeration_value = new;
        
    cache_key = "{}:{}:{}".format(perplexity_value, learning_rate_value,early_exaggeration_value);

    numerical_parts = pd.DataFrame(sp.data_source.data)[stats_to_consider];
    
    if(cache_key in cache):
        r = cache[cache_key];
    else:
        tsne = TSNE(n_components=2, 
                perplexity=perplexity_value, 
                early_exaggeration=early_exaggeration_value, 
                learning_rate=learning_rate_value,
                init=pd.DataFrame(sp.data_source.data)[['P1','P2']].values);
        r = pd.DataFrame(tsne.fit_transform(numerical_parts),columns=['P1','P2']);
        cache[cache_key] = r;
        
    sp.data_source.data['P1'] = r['P1'];
    sp.data_source.data['P2'] = r['P2'];

for w in [perplexity, early_exaggeration, learning_rate]:
    w.on_change('value_throttled', update);


