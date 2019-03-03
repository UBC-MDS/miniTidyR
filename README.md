# R Mini Tidy Package : `miniTidyR`

### Contributors:
- Huijue Chen (`huijuechen`)
- Luo Yang (`lyiris22`)
- Orphelia Ellogne (`ellognea`)

### Summary
We re-implemented R’s <a href="https://tidyr.tidyverse.org/reference/gather.html"> gather </a>,<a href="https://tidyr.tidyverse.org/reference/spread.html"> spread </a>, and <a href="https://tidyr.tidyverse.org/reference/drop_na.html"> drop_na </a> functions that exist in the `tidyverse` package.

Our functions are called `my_gather` , `my_spread` and `my_dropna`:

- `my_gather()` : Transform a data from wide to long by combining columns. For selected columns, put the columns names into a column of keys, and the values into a column of values.
- `my_spread()` : Transform a data from long to wide.  Select a ‘key’ column whose content will be the names of the new columns. Select a ‘value’ column whose content will be the values of the new columns.
- `my_dropna()` : Remove rows that contain `NA` values from a data frame.

### Installation
To install `miniTidyR` run :  `devtools::install_github("miniTidyR")`

### Functions usage examples

#### `my_dropna`

![](images/my_dropna.PNG)

####`my_gather`:

![](images/my_gather.PNG)

#### `my_spread` :

![](images/my_spread.PNG)

### Branch coverage

![](images/coverage.PNG)

### Test result
