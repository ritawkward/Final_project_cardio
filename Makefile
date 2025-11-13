all: output/final_report.html

output/data_clean.rds: code/00_code.R
	Rscript code/00_code.R

output/table_one.rds: code/01_descriptive.R output/data_clean.rds
	Rscript code/01_descriptive.R

output/figure2_plot.png: code/02_graphical.R output/data_clean.rds
	Rscript code/02_graphical.R

output/model_table.rds: code/03_regression.R output/data_clean.rds
	Rscript code/03_regression.R

output/final_report.html: code/04_render_report.R Cardiovascular.Rmd \
                          output/table_one.rds output/figure2_plot.png output/model_table.rds
	Rscript code/04_render_report.R

.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"

clean:
	rm -f output/*.rds
	rm -f output/*.png
	rm -f output/*.html
	