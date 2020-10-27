.PHONY: power_explorer
.PHONY: clean

clean:
	rm derived_data/*.csv

derived_data/clean_stats.csv: tidy_data.R\
 ./source_data/datasets_38396_60978_charcters_stats.csv
	Rscript tidy_data.R 

power_explorer: derived_data/clean_stats.csv
	Rscript power_explorer.R ${PORT}
