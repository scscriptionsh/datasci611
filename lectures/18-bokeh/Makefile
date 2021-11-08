.PHONY: bokeh_example
.PHONY: tsne_explorer 

bokeh_example:
	bokeh serve --port ${PORT} --address 0.0.0.0 bokeh-example.py 

tsne_explorer: derived_data/nice_data.csv
	bokeh serve --port ${PORT} --address 0.0.0.0 tsne_explorer.py

derived_data/nice_data.csv: ./source_data/datasets_38396_60978_charcters_stats.csv tidy_data.py
	mkdir -p derived_data
	python3 tidy_data.py

