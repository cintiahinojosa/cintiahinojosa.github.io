## ---- BASICS
pacman::p_load(
  knitr, kableExtra
  , tidyverse, tidyr, magrittr
  , dplyr # names() dplyr# as_tibble()
  , ggplot2
  , psych, psychTools
  , papaja
  , sjPlot #sjPlot# view_df()
  , ltm #ltm# cronbach.alpha()
  , caret, afex, tufte
  , broom
  , interactions
  , car
  , rmdfiltr
)

## ---- READ
pacman::p_load(
  qualtRics # read_survey()
  , haven # read_spss(), labelled(), as_factor()
  , utils # read.csv()  write.csv()
  # , foreign # read.dta(), read.spss()
  # , readstata13, readxl, read_excel
  # , rtiffs
  # , viewenhance
  # , DataEditR
)

## ---- LABELS
pacman::p_load(
  sjlabelled, labelled
  # , surveytoolbox
  # , tinylabels
)

## ---- ANALYSIS
pacman::p_load(
  apastats
  , rstatix
  , emmeans
  , ggExtra, ggfortify, ggeffects, ggsci, ggsignif
  , Metrics # eval models
  # , finalfit
  # , bwrappers
)

## ---- PLOTS
pacman::p_load(
  ggExtra, ggfortify, ggcorrplot, ggeffects, ggsci, ggsignif, ggstatsplot
  # , gghalves, gginference, ggiraph, ggiraphExtra, ggpmisc, ggrepel
  , sjPlot, sjmisc
  , grid, gridExtra
  , corrgram
  # , introdataviz
  # , DiagrammeR
  # , flexdashboard
  # , lattice, latticeExtra
  # , latex2exp
  # , patchwork
) 

## ---- OUTPUT
pacman::p_load(
  codebook
  # , DT
  , rempsyc # ggsave()
  , summarytools, table1
  , frequency
  , descr, DescTools
  , apaTables
  , table1
  , flextable
  , flexplot
  , xtable
  # , htmlTable
  # , gtsummary
  # , epiDisplay # tab1 for pretty, easy frequency tables,
  # , papeR
  # , reactable, visualize
  # , corx
)

## ---- MEDIATION
pacman::p_load(
  mediation
  # , psych
  # , jtools # get_
  # , lavaan, mma
  # , lme4
  # , nlme, rstanarm
  # , robmed
  # , processr
  # , QuantPsyc
)

## ---- PCA
# pacman::p_load(VIF, GPArotation, FactoMineR, factoextra, Factoshiny, nFactors)

## ---- TEXTANALYSIS
# pacman::p_load(
# SADCAT, quanteda, stringr
# )

## ---- PUBLISH
pacman::p_load(
  tinytex
  , citr
  # , printr  # prints latex tables for table1() (?)
  # , tippy
)
library("pandocfilters")
# papaja::r_refs("r-references.bib")
# papaja::r_refs("dissertation-proposal-bib.bib")
# library(bookdown)
# library(rticles)
# library(pagedown)
# library(thesisdown)
# library(magick)

## ---- WRITING
#install.packages("hunspell")
#devtools::install_github("nevrome/wellspell.addin") # spellcheck() gramcheck()
#devtools::install_github("nevrome/LanguageToolR")
#LanguageToolR::lato_quick_setup()

## ---- OTHER
#pacman::p_load(formatR, esquisse, beepr, webshot, moderndive)
