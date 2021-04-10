
# Data used in analyses

Taxa are identified to the lowest feasible taxonomic level (typically Order or Family), and taxa with two or fewer occurences were removed. Community composition data is relativized by column maximum to reduce the influence of highly abundant taxa. Univariate data includes taxonic richness at each site, density (per 1/4 m2 in aquatic and per 1 m2 in emerging), Pielou's evenness, Shannon-Weiner, and Simpson's diversity calculated using the `vegan` package. Data included in the procrustes analyses are only those that would have both a juvenile aquatic stage and an adult, winged stage.


## Aquatic
- `benthic_invertebrates_univariate.csv` - univariate measures from the submerged vegetation samples
- `benthic_inverts_relativized.csv` - community composition matrix relativized by column max

## Emerging 
- `emerging_invertebrate_univariate.csv` - univariate measures from the submerged vegetation samples
- `emerging_2018.csv` - site characteristics (vegetation community composition, water temp/depth, and canopy height) and macroinvertebrate community composition matrix relativized by column max

## Procrustes
- `aquatic_procrustes.csv` - community matrix for aquatic invertebrates with an adult flying stage
- `emerging_procrustes.csv` - community matrix for emerging invertebrates with a juvenile aquatic stage
