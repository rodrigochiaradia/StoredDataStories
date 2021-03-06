library(tidyverse)
library(readxl)
library(janitor)
library(here)
library(dplyr)
library(reticulate)

path_to_data <- here('data', 'Khan_Chemosphere_229_8.xlsx')

df <-
  readxl::read_xlsx(path_to_data, sheet = 'Daphnia Dataset')  %>%
  data.frame() %>%
  janitor::clean_names()

names(df)

df <- df %>%
  select(cas_number, canonical_smiles, p_ec50_mol_l_daphnia) %>%
  rename('CAS' = 'cas_number',
         'SMILES' = 'canonical_smiles',
         'pEC50' = 'p_ec50_mol_l_daphnia')

