
# Packages -----------------------------------------------------------

library(tidyverse)
library(lubridate)
library(vegan)
library(viridis)



# Load data -----------------------------------------------------------
emerging <- read.csv("Data/Emerging/Procrustes/ermerging_procrustes.csv")

aquatic <- read.csv("Data/Emerging/Procrustes/aquatic_procrustes.csv")


# Aquatic invertebrate data prep ------------------------------------------

# Split into three matrices


# filter the habitat type
aquatic.inv <- aquatic %>% filter(Habitat == "Invaded")
aquatic.unin <- aquatic %>% filter(Habitat == "Uninvaded")
aquatic.trt <- aquatic %>% filter(Habitat == "Treated")

# Remove empty columns
aquatic.inv <- aquatic.inv[, colSums(aquatic.inv != 0) > 0]
aquatic.unin <- aquatic.unin[, colSums(aquatic.unin  != 0) > 0]
aquatic.trt <- aquatic.trt[, colSums(aquatic.trt != 0) > 0]

# Just taxa
aquatic.inv.taxa <- aquatic.inv %>% select(Chironomidae:Leptoceridae)
aquatic.unin.taxa <- aquatic.unin %>% select(Lampyridae:Leptoceridae)
aquatic.trt.taxa <- aquatic.trt %>% select(Chironomidae:Leptoceridae)


# Emerging invertebrate data prep -----------------------------------------

# filter the habitat type
emerg.inv <- emerging %>% filter(Habitat == "Invaded")
emerg.unin <- emerging %>% filter(Habitat == "Uninvaded")
emerg.trt <- emerging %>% filter(Habitat == "Treated")

# Remove empty columns
emerg.inv <- emerg.inv[, colSums(emerg.inv != 0) > 0]
emerg.unin <- emerg.unin[, colSums(emerg.unin  != 0) > 0]
emerg.trt <- emerg.trt[, colSums(emerg.trt != 0) > 0]

# Just taxa
emerg.inv.taxa <- emerg.inv %>% select(Lampyridae:Crambidae)
emerg.unin.taxa <- emerg.unin %>% select(Lampyridae:Crambidae)
emerg.trt.taxa <- emerg.trt %>% select(Phoridae:Leptoceridae)

# Transform the matrices

emerg.inv.h <- decostand(emerg.inv.taxa, "hellinger")
emerg.unin.h <- decostand(emerg.unin.taxa, "hellinger")
emerg.trt.h <- decostand(emerg.trt.taxa, "hellinger")

aq.inv.h <- decostand(aquatic.inv.prop, "hellinger")
aq.unin.h <- decostand(aquatic.unin.prop, "hellinger")
aq.trt.h <- decostand(aquatic.trt.prop, "hellinger")


# Procrustes --------------------------------------------------------------

## Invaded habitat
inv.pro <- protest(emerg.inv.h, aq.inv.h)
summary(inv.pro)

inv.pro$t0 # 0.8937901 Procrustes correlation from non-permuted solution
inv.pro$signif # 0.006 #Significant of permutations (999)

plot(inv.pro)


# Uninvaded habitat

unin.pro <- protest(emerg.unin.h, aq.unin.h)

summary(unin.pro)

unin.pro$t0 # 0.8648073
unin.pro$signif # 0.049


# Treated habitat

trt.pro <- protest(emerg.trt.h, aq.trt.h)
summary(trt.pro)

trt.pro$t0 #0.4854401
trt.pro$signif # 0.647






