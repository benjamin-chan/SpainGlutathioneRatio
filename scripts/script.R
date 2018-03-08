setwd("~/Projects/SpainGlutathioneRatio")

library(checkpoint)
checkpoint("2018-01-01", use.knitr = TRUE)

Sys.time0 <- Sys.time()

sink(file.path("output", "script.log"))
files <- c("header.yaml",
           "preamble.Rmd",
           "importData.Rmd")
f <- file("master.Rmd", open = "w")
for (i in 1:length(files)) {
    x <- readLines(file.path("scripts", files[i]))
    writeLines(x, f)
}
close(f)
library(knitr)
library(rmarkdown)
opts_chunk$set(echo = FALSE, fig.path = "figures/", dpi = 300)
knit("master.Rmd", output = "docs/SpainGlutathioneRatio.md")
pandoc("docs/SpainGlutathioneRatio.md", format = "docx")
file.remove("master.Rmd")
sink()

sink("output/session.log")
list(completionDateTime = Sys.time(),
     executionTime = Sys.time() - Sys.time0,
     sessionInfo = sessionInfo())
sink()
