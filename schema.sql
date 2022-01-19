-- Creating tables for inbound_tourism
CREATE TABLE inbound_tourism(
			 country varchar PRIMARY KEY NOT NULL,
			 year int,
			 personal float,
			 business float, 
			 total float,
			 africa float,
			 americas float,
			 east_asia_and_pacific float,
			 europe float,
			 middle_east float,
			 south_asia float,
			 others float
)

-- Creating tables for world_indicators
CREATE TABLE world_indicators(
			 birth_rate float,
			 country varchar PRIMARY KEY NOT NULL,
			 gdp float,
			 health_exp_percent_gdp float,
			 health_exp_per_capita float,
			 infant_mortality_rate float,
			 internet_usage float,
			 life_expectancy_female float,
			 life_expectancy_male float,
			 mobile_phone_usage float,
			 no_of_records int,
			 population_0_to_14 float,
			 population_15_to_64 float,
			 population_65_plus float,
			 population_total float,
			 population_urban float,
			 region varchar,
			 tourism_inbound float,
			 tourism_outbound float,
			 year int,
			 header varchar
);
