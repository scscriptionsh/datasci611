from sklearn.manifold import TSNE
import pandas as pd
import numpy as np

data = pd.read_csv("derived_data/powers_for_tsne.csv");

numerical_part = data.drop(columns=["character"]).values;

fit = TSNE(n_components=2, random_state=0).fit_transform(numerical_part);

fitdf = pd.DataFrame(fit,columns=['X1','X2'])

fitdf['character'] = data['character'];

fitdf.to_csv("derived_data/powers_tsne.csv",index=False);
