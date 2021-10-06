PHONY: clean
PHONY: all

clean:
	rm derived_data/*

derived_data/powers.csv derived_data/characters.csv: source_data/powers.csv\
 source_data/character-data.csv\
 cleanup.R util.R
	Rscript cleanup.R

derived_data/prime_earth_powers.csv derived_data/prime_earth_characters.csv:\
 derived_data/powers.csv derived_data/characters.csv\
 just_earth_prime.R
	Rscript just_earth_prime.R

derived_data/powers_for_tsne.csv: derived_data/prime_earth_powers.csv
	Rscript tsne_prep.R

derived_data/powers_tsne.csv: derived_data/powers_for_tsne.csv
	python3 tsne.py

