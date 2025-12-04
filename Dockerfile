FROM rocker/tidyverse:4.5.1 as base

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      cmake \
      libnode-dev && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /home/rstudio/project
WORKDIR /home/rstudio/project

RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE=renv/.cache

RUN Rscript -e "renv::restore(prompt = FALSE)"

###### DO NOT EDIT STAGE 1 BUILD LINES ABOVE ######
FROM rocker/tidyverse:4.5.1
RUN mkdir /home/rstudio/project
WORKDIR /home/rstudio/project
COPY --from=base /home/rstudio/project .

COPY Makefile .
COPY Cardiovascular.Rmd .
COPY code/ code/

RUN mkdir -p code output raw_data final_report
COPY raw_data/Heart.csv raw_data/

CMD make && mv output/final_report.html final_report/
