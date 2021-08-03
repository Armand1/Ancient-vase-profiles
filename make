.PHONY: all

all: something

src/R/assemble profiles.R\
	Rscript $<
