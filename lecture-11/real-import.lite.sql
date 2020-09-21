drop table if exists powers_matrix;
create table powers_matrix (
name text,
agility integer,
accelerated_healing integer,
lantern_power_ring integer,
dimensional_awareness integer,
cold_resistance integer,
durability integer,
stealth integer,
energy_absorption integer,
flight integer,
danger_sense integer,
underwater_breathing integer,
marksmanship integer,
weapons_master integer,
power_augmentation integer,
animal_attributes integer,
longevity integer,
intelligence integer,
super_strength integer,
cryokinesis integer,
telepathy integer,
energy_armor integer,
energy_blasts integer,
duplication integer,
size_changing integer,
density_control integer,
stamina integer,
astral_travel integer,
audio_control integer,
dexterity integer,
omnitrix integer,
super_speed integer,
possession integer,
animal_oriented_powers integer,
weapon_based_powers integer,
electrokinesis integer,
darkforce_manipulation integer,
death_touch integer,
teleportation integer,
enhanced_senses integer,
telekinesis integer,
energy_beams integer,
magic integer,
hyperkinesis integer,
jump integer,
clairvoyance integer,
dimensional_travel integer,
power_sense integer,
shapeshifting integer,
peak_human_condition integer,
immortality integer,
camouflage integer,
element_control integer,
phasing integer,
astral_projection integer,
electrical_transport integer,
fire_control integer,
projection integer,
summoning integer,
enhanced_memory integer,
reflexes integer,
invulnerability integer,
energy_constructs integer,
force_fields integer,
self_sustenance integer,
anti_gravity integer,
empathy integer,
power_nullifier integer,
radiation_control integer,
psionic_powers integer,
elasticity integer,
substance_secretion integer,
elemental_transmogrification integer,
technopath_cyberpath integer,
photographic_reflexes integer,
seismic_power integer,
animation integer,
precognition integer,
mind_control integer,
fire_resistance integer,
power_absorption integer,
enhanced_hearing integer,
nova_force integer,
insanity integer,
hypnokinesis integer,
animal_control integer,
natural_armor integer,
intangibility integer,
enhanced_sight integer,
molecular_manipulation integer,
heat_generation integer,
adaptation integer,
gliding integer,
power_suit integer,
mind_blast integer,
probability_manipulation integer,
gravity_control integer,
regeneration integer,
light_control integer,
echolocation integer,
levitation integer,
toxin_and_disease_control integer,
banish integer,
energy_manipulation integer,
heat_resistance integer,
natural_weapons integer,
time_travel integer,
enhanced_smell integer,
illusions integer,
thirstokinesis integer,
hair_manipulation integer,
illumination integer,
omnipotent integer,
cloaking integer,
changing_armor integer,
power_cosmic integer,
biokinesis integer,
water_control integer,
radiation_immunity integer,
vision_telescopic integer,
toxin_and_disease_resistance integer,
spatial_awareness integer,
energy_resistance integer,
telepathy_resistance integer,
molecular_combustion integer,
omnilingualism integer,
portal_creation integer,
magnetism integer,
mind_control_resistance integer,
plant_control integer,
sonar integer,
sonic_scream integer,
time_manipulation integer,
enhanced_touch integer,
magic_resistance integer,
invisibility integer,
sub_mariner integer,
radiation_absorption integer,
intuitive_aptitude integer,
vision_microscopic integer,
melting integer,
wind_control integer,
super_breath integer,
wallcrawling integer,
vision_night integer,
vision_infrared integer,
grim_reaping integer,
matter_absorption integer,
the_force integer,
resurrection integer,
terrakinesis integer,
vision_heat integer,
vitakinesis integer,
radar_sense integer,
qwardian_power_ring integer,
weather_control integer,
vision_x_ray integer,
vision_thermal integer,
web_creation integer,
reality_warping integer,
odin_force integer,
symbiote_costume integer,
speed_force integer,
phoenix_force integer,
molecular_dissipation integer,
vision_cryo integer,
omnipresent integer,
omniscient integer
);

.mode csv 
.import source_data/superheroes_power_matrix.headless.csv powers_matrix

drop table if exists hero_powers;
create table hero_powers (
name text,
power text,
has integer);

insert into hero_powers select
name, 'agility' as power, agility as has from powers_matrix;
insert into hero_powers select
name, 'accelerated_healing' as power, accelerated_healing as has from powers_matrix;
insert into hero_powers select
name, 'lantern_power_ring' as power, lantern_power_ring as has from powers_matrix;
insert into hero_powers select
name, 'dimensional_awareness' as power, dimensional_awareness as has from powers_matrix;
insert into hero_powers select
name, 'cold_resistance' as power, cold_resistance as has from powers_matrix;
insert into hero_powers select
name, 'durability' as power, durability as has from powers_matrix;
insert into hero_powers select
name, 'stealth' as power, stealth as has from powers_matrix;
insert into hero_powers select
name, 'energy_absorption' as power, energy_absorption as has from powers_matrix;
insert into hero_powers select
name, 'flight' as power, flight as has from powers_matrix;
insert into hero_powers select
name, 'danger_sense' as power, danger_sense as has from powers_matrix;
insert into hero_powers select
name, 'underwater_breathing' as power, underwater_breathing as has from powers_matrix;
insert into hero_powers select
name, 'marksmanship' as power, marksmanship as has from powers_matrix;
insert into hero_powers select
name, 'weapons_master' as power, weapons_master as has from powers_matrix;
insert into hero_powers select
name, 'power_augmentation' as power, power_augmentation as has from powers_matrix;
insert into hero_powers select
name, 'animal_attributes' as power, animal_attributes as has from powers_matrix;
insert into hero_powers select
name, 'longevity' as power, longevity as has from powers_matrix;
insert into hero_powers select
name, 'intelligence' as power, intelligence as has from powers_matrix;
insert into hero_powers select
name, 'super_strength' as power, super_strength as has from powers_matrix;
insert into hero_powers select
name, 'cryokinesis' as power, cryokinesis as has from powers_matrix;
insert into hero_powers select
name, 'telepathy' as power, telepathy as has from powers_matrix;
insert into hero_powers select
name, 'energy_armor' as power, energy_armor as has from powers_matrix;
insert into hero_powers select
name, 'energy_blasts' as power, energy_blasts as has from powers_matrix;
insert into hero_powers select
name, 'duplication' as power, duplication as has from powers_matrix;
insert into hero_powers select
name, 'size_changing' as power, size_changing as has from powers_matrix;
insert into hero_powers select
name, 'density_control' as power, density_control as has from powers_matrix;
insert into hero_powers select
name, 'stamina' as power, stamina as has from powers_matrix;
insert into hero_powers select
name, 'astral_travel' as power, astral_travel as has from powers_matrix;
insert into hero_powers select
name, 'audio_control' as power, audio_control as has from powers_matrix;
insert into hero_powers select
name, 'dexterity' as power, dexterity as has from powers_matrix;
insert into hero_powers select
name, 'omnitrix' as power, omnitrix as has from powers_matrix;
insert into hero_powers select
name, 'super_speed' as power, super_speed as has from powers_matrix;
insert into hero_powers select
name, 'possession' as power, possession as has from powers_matrix;
insert into hero_powers select
name, 'animal_oriented_powers' as power, animal_oriented_powers as has from powers_matrix;
insert into hero_powers select
name, 'weapon_based_powers' as power, weapon_based_powers as has from powers_matrix;
insert into hero_powers select
name, 'electrokinesis' as power, electrokinesis as has from powers_matrix;
insert into hero_powers select
name, 'darkforce_manipulation' as power, darkforce_manipulation as has from powers_matrix;
insert into hero_powers select
name, 'death_touch' as power, death_touch as has from powers_matrix;
insert into hero_powers select
name, 'teleportation' as power, teleportation as has from powers_matrix;
insert into hero_powers select
name, 'enhanced_senses' as power, enhanced_senses as has from powers_matrix;
insert into hero_powers select
name, 'telekinesis' as power, telekinesis as has from powers_matrix;
insert into hero_powers select
name, 'energy_beams' as power, energy_beams as has from powers_matrix;
insert into hero_powers select
name, 'magic' as power, magic as has from powers_matrix;
insert into hero_powers select
name, 'hyperkinesis' as power, hyperkinesis as has from powers_matrix;
insert into hero_powers select
name, 'jump' as power, jump as has from powers_matrix;
insert into hero_powers select
name, 'clairvoyance' as power, clairvoyance as has from powers_matrix;
insert into hero_powers select
name, 'dimensional_travel' as power, dimensional_travel as has from powers_matrix;
insert into hero_powers select
name, 'power_sense' as power, power_sense as has from powers_matrix;
insert into hero_powers select
name, 'shapeshifting' as power, shapeshifting as has from powers_matrix;
insert into hero_powers select
name, 'peak_human_condition' as power, peak_human_condition as has from powers_matrix;
insert into hero_powers select
name, 'immortality' as power, immortality as has from powers_matrix;
insert into hero_powers select
name, 'camouflage' as power, camouflage as has from powers_matrix;
insert into hero_powers select
name, 'element_control' as power, element_control as has from powers_matrix;
insert into hero_powers select
name, 'phasing' as power, phasing as has from powers_matrix;
insert into hero_powers select
name, 'astral_projection' as power, astral_projection as has from powers_matrix;
insert into hero_powers select
name, 'electrical_transport' as power, electrical_transport as has from powers_matrix;
insert into hero_powers select
name, 'fire_control' as power, fire_control as has from powers_matrix;
insert into hero_powers select
name, 'projection' as power, projection as has from powers_matrix;
insert into hero_powers select
name, 'summoning' as power, summoning as has from powers_matrix;
insert into hero_powers select
name, 'enhanced_memory' as power, enhanced_memory as has from powers_matrix;
insert into hero_powers select
name, 'reflexes' as power, reflexes as has from powers_matrix;
insert into hero_powers select
name, 'invulnerability' as power, invulnerability as has from powers_matrix;
insert into hero_powers select
name, 'energy_constructs' as power, energy_constructs as has from powers_matrix;
insert into hero_powers select
name, 'force_fields' as power, force_fields as has from powers_matrix;
insert into hero_powers select
name, 'self_sustenance' as power, self_sustenance as has from powers_matrix;
insert into hero_powers select
name, 'anti_gravity' as power, anti_gravity as has from powers_matrix;
insert into hero_powers select
name, 'empathy' as power, empathy as has from powers_matrix;
insert into hero_powers select
name, 'power_nullifier' as power, power_nullifier as has from powers_matrix;
insert into hero_powers select
name, 'radiation_control' as power, radiation_control as has from powers_matrix;
insert into hero_powers select
name, 'psionic_powers' as power, psionic_powers as has from powers_matrix;
insert into hero_powers select
name, 'elasticity' as power, elasticity as has from powers_matrix;
insert into hero_powers select
name, 'substance_secretion' as power, substance_secretion as has from powers_matrix;
insert into hero_powers select
name, 'elemental_transmogrification' as power, elemental_transmogrification as has from powers_matrix;
insert into hero_powers select
name, 'technopath_cyberpath' as power, technopath_cyberpath as has from powers_matrix;
insert into hero_powers select
name, 'photographic_reflexes' as power, photographic_reflexes as has from powers_matrix;
insert into hero_powers select
name, 'seismic_power' as power, seismic_power as has from powers_matrix;
insert into hero_powers select
name, 'animation' as power, animation as has from powers_matrix;
insert into hero_powers select
name, 'precognition' as power, precognition as has from powers_matrix;
insert into hero_powers select
name, 'mind_control' as power, mind_control as has from powers_matrix;
insert into hero_powers select
name, 'fire_resistance' as power, fire_resistance as has from powers_matrix;
insert into hero_powers select
name, 'power_absorption' as power, power_absorption as has from powers_matrix;
insert into hero_powers select
name, 'enhanced_hearing' as power, enhanced_hearing as has from powers_matrix;
insert into hero_powers select
name, 'nova_force' as power, nova_force as has from powers_matrix;
insert into hero_powers select
name, 'insanity' as power, insanity as has from powers_matrix;
insert into hero_powers select
name, 'hypnokinesis' as power, hypnokinesis as has from powers_matrix;
insert into hero_powers select
name, 'animal_control' as power, animal_control as has from powers_matrix;
insert into hero_powers select
name, 'natural_armor' as power, natural_armor as has from powers_matrix;
insert into hero_powers select
name, 'intangibility' as power, intangibility as has from powers_matrix;
insert into hero_powers select
name, 'enhanced_sight' as power, enhanced_sight as has from powers_matrix;
insert into hero_powers select
name, 'molecular_manipulation' as power, molecular_manipulation as has from powers_matrix;
insert into hero_powers select
name, 'heat_generation' as power, heat_generation as has from powers_matrix;
insert into hero_powers select
name, 'adaptation' as power, adaptation as has from powers_matrix;
insert into hero_powers select
name, 'gliding' as power, gliding as has from powers_matrix;
insert into hero_powers select
name, 'power_suit' as power, power_suit as has from powers_matrix;
insert into hero_powers select
name, 'mind_blast' as power, mind_blast as has from powers_matrix;
insert into hero_powers select
name, 'probability_manipulation' as power, probability_manipulation as has from powers_matrix;
insert into hero_powers select
name, 'gravity_control' as power, gravity_control as has from powers_matrix;
insert into hero_powers select
name, 'regeneration' as power, regeneration as has from powers_matrix;
insert into hero_powers select
name, 'light_control' as power, light_control as has from powers_matrix;
insert into hero_powers select
name, 'echolocation' as power, echolocation as has from powers_matrix;
insert into hero_powers select
name, 'levitation' as power, levitation as has from powers_matrix;
insert into hero_powers select
name, 'toxin_and_disease_control' as power, toxin_and_disease_control as has from powers_matrix;
insert into hero_powers select
name, 'banish' as power, banish as has from powers_matrix;
insert into hero_powers select
name, 'energy_manipulation' as power, energy_manipulation as has from powers_matrix;
insert into hero_powers select
name, 'heat_resistance' as power, heat_resistance as has from powers_matrix;
insert into hero_powers select
name, 'natural_weapons' as power, natural_weapons as has from powers_matrix;
insert into hero_powers select
name, 'time_travel' as power, time_travel as has from powers_matrix;
insert into hero_powers select
name, 'enhanced_smell' as power, enhanced_smell as has from powers_matrix;
insert into hero_powers select
name, 'illusions' as power, illusions as has from powers_matrix;
insert into hero_powers select
name, 'thirstokinesis' as power, thirstokinesis as has from powers_matrix;
insert into hero_powers select
name, 'hair_manipulation' as power, hair_manipulation as has from powers_matrix;
insert into hero_powers select
name, 'illumination' as power, illumination as has from powers_matrix;
insert into hero_powers select
name, 'omnipotent' as power, omnipotent as has from powers_matrix;
insert into hero_powers select
name, 'cloaking' as power, cloaking as has from powers_matrix;
insert into hero_powers select
name, 'changing_armor' as power, changing_armor as has from powers_matrix;
insert into hero_powers select
name, 'power_cosmic' as power, power_cosmic as has from powers_matrix;
insert into hero_powers select
name, 'biokinesis' as power, biokinesis as has from powers_matrix;
insert into hero_powers select
name, 'water_control' as power, water_control as has from powers_matrix;
insert into hero_powers select
name, 'radiation_immunity' as power, radiation_immunity as has from powers_matrix;
insert into hero_powers select
name, 'vision_telescopic' as power, vision_telescopic as has from powers_matrix;
insert into hero_powers select
name, 'toxin_and_disease_resistance' as power, toxin_and_disease_resistance as has from powers_matrix;
insert into hero_powers select
name, 'spatial_awareness' as power, spatial_awareness as has from powers_matrix;
insert into hero_powers select
name, 'energy_resistance' as power, energy_resistance as has from powers_matrix;
insert into hero_powers select
name, 'telepathy_resistance' as power, telepathy_resistance as has from powers_matrix;
insert into hero_powers select
name, 'molecular_combustion' as power, molecular_combustion as has from powers_matrix;
insert into hero_powers select
name, 'omnilingualism' as power, omnilingualism as has from powers_matrix;
insert into hero_powers select
name, 'portal_creation' as power, portal_creation as has from powers_matrix;
insert into hero_powers select
name, 'magnetism' as power, magnetism as has from powers_matrix;
insert into hero_powers select
name, 'mind_control_resistance' as power, mind_control_resistance as has from powers_matrix;
insert into hero_powers select
name, 'plant_control' as power, plant_control as has from powers_matrix;
insert into hero_powers select
name, 'sonar' as power, sonar as has from powers_matrix;
insert into hero_powers select
name, 'sonic_scream' as power, sonic_scream as has from powers_matrix;
insert into hero_powers select
name, 'time_manipulation' as power, time_manipulation as has from powers_matrix;
insert into hero_powers select
name, 'enhanced_touch' as power, enhanced_touch as has from powers_matrix;
insert into hero_powers select
name, 'magic_resistance' as power, magic_resistance as has from powers_matrix;
insert into hero_powers select
name, 'invisibility' as power, invisibility as has from powers_matrix;
insert into hero_powers select
name, 'sub_mariner' as power, sub_mariner as has from powers_matrix;
insert into hero_powers select
name, 'radiation_absorption' as power, radiation_absorption as has from powers_matrix;
insert into hero_powers select
name, 'intuitive_aptitude' as power, intuitive_aptitude as has from powers_matrix;
insert into hero_powers select
name, 'vision_microscopic' as power, vision_microscopic as has from powers_matrix;
insert into hero_powers select
name, 'melting' as power, melting as has from powers_matrix;
insert into hero_powers select
name, 'wind_control' as power, wind_control as has from powers_matrix;
insert into hero_powers select
name, 'super_breath' as power, super_breath as has from powers_matrix;
insert into hero_powers select
name, 'wallcrawling' as power, wallcrawling as has from powers_matrix;
insert into hero_powers select
name, 'vision_night' as power, vision_night as has from powers_matrix;
insert into hero_powers select
name, 'vision_infrared' as power, vision_infrared as has from powers_matrix;
insert into hero_powers select
name, 'grim_reaping' as power, grim_reaping as has from powers_matrix;
insert into hero_powers select
name, 'matter_absorption' as power, matter_absorption as has from powers_matrix;
insert into hero_powers select
name, 'the_force' as power, the_force as has from powers_matrix;
insert into hero_powers select
name, 'resurrection' as power, resurrection as has from powers_matrix;
insert into hero_powers select
name, 'terrakinesis' as power, terrakinesis as has from powers_matrix;
insert into hero_powers select
name, 'vision_heat' as power, vision_heat as has from powers_matrix;
insert into hero_powers select
name, 'vitakinesis' as power, vitakinesis as has from powers_matrix;
insert into hero_powers select
name, 'radar_sense' as power, radar_sense as has from powers_matrix;
insert into hero_powers select
name, 'qwardian_power_ring' as power, qwardian_power_ring as has from powers_matrix;
insert into hero_powers select
name, 'weather_control' as power, weather_control as has from powers_matrix;
insert into hero_powers select
name, 'vision_x_ray' as power, vision_x_ray as has from powers_matrix;
insert into hero_powers select
name, 'vision_thermal' as power, vision_thermal as has from powers_matrix;
insert into hero_powers select
name, 'web_creation' as power, web_creation as has from powers_matrix;
insert into hero_powers select
name, 'reality_warping' as power, reality_warping as has from powers_matrix;
insert into hero_powers select
name, 'odin_force' as power, odin_force as has from powers_matrix;
insert into hero_powers select
name, 'symbiote_costume' as power, symbiote_costume as has from powers_matrix;
insert into hero_powers select
name, 'speed_force' as power, speed_force as has from powers_matrix;
insert into hero_powers select
name, 'phoenix_force' as power, phoenix_force as has from powers_matrix;
insert into hero_powers select
name, 'molecular_dissipation' as power, molecular_dissipation as has from powers_matrix;
insert into hero_powers select
name, 'vision_cryo' as power, vision_cryo as has from powers_matrix;
insert into hero_powers select
name, 'omnipresent' as power, omnipresent as has from powers_matrix;
insert into hero_powers select
name, 'omniscient' as power, omniscient as has from powers_matrix;

drop table if exists comics;
create table comics (
comic_id integer, 
title text,
issueNumber integer,
description text);

.mode csv
.import source_data/comics.headless.csv comics

drop table if exists marvel_characters;
create table marvel_characters (
id integer,
name text,
alignment text,
gender text,
eye_color text,
race text,
hair_color text,
publisher text,
skin_color text,
height real,
weight real
);

.mode csv
.import source_data/marvel_characters_info.headless.csv marvel_characters

drop table if exists marvel_dc_characters;
create table marvel_dc_characters (
id integer,
name text,
identity text,
alignment text,
eye_color text,
hair_color text,
gender text,
status text,
appearances text,
first_appearance text,
year integer,
universe text);

.mode csv
.import source_data/marvel_dc_characters.headless.csv marvel_dc_characters

drop table if exists id_name;
create table id_name (
id integer,
name text
);

.mode csv
.import source_data/characters.headless.csv id_name

drop table if exists character_comic;
create table character_comic (
comic_id integer,
character_id integer
);

.mode csv
.import source_data/charactersToComics.csv character_comic

drop table if exists character_stats;
create table character_stats (
name text,
alignment text,
intelligence integer,
strength integer, 
speed integer,
durability integer,
power integer, 
combat integer, 
total integer);

.mode csv
.import source_data/character_stats.csv character_stats
