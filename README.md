# Using R and Python to interact with databases

Just a couple of notebooks providing examples of interacting with databases, namely DuckDB, using R and python.


## Notebooks

There are two notebooks in this repo, and associated html files, that represent very similar work flows in both languages:

- `python_example.ipynb` (`python_example.html`)
- `r_example.qmd` (`r_example.html`)

Note that the `download_data.R` and `populate_databases.R` scripts were used to initialize the `data/` folder, including the database file, `data/database/example.duckdb`.


## Reproducibility

I did not make the R environment reproducible, but do have some notes on the python side of things.

### Python 

Note that there are three files of varying specificity for reproducing the python environments:

`enivironment_flexible.yml`: Contains just the packages that I installed (no dependencies).

```bash
conda env export --from-history > environment_flexible.yml
```

`environment.yml`: Contains all the packages and dependencies.

```bash
conda env export > environment.yml
```

`spec-file.txt`: Contains the exact packages and repos used.

```bash
conda list --explicit > spec-file.txt
```