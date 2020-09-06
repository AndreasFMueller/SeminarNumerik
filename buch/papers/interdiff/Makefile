#
# Makefile -- make file for the paper interdiff
#
# (c) 2020 Prof Dr Andreas Mueller
#

images:	experiment.pdf

experiment.pdf:	experiment.tex spectra.tex
	pdflatex experiment.tex

spectra.tex:	abl.m
	octave abl.m


