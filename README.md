# Mini Tidy Package for R

### Contributors:
- Orphelia Ellogne (`ellognea`)
- Huijue Chen (`huijuechen`)
- Luo Yang (`lyiris22`)

### Summary
For this project we would like to re-implement R’s `gather`, `spread` and `drop_na` functions, which exists in the `tidyverse` package. Our functions would have similar or simpler features compared to these functions. We will give them the following names, respectively.

- `my_gather()` : Make data from wide to long by combining columns. For selected columns, put the columns names into a column of keys, and the values into a column of values.
- `my_spread()` : Separate existing columns into multiple columns.  Select a ‘key’ column whose content will be the names of the new columns. Select a ‘value’ column whose content will be the values of the new columns.
- `my_dropna()` : Remove the entire rows that contain `NA` values from a dataframe.

To test these functions , our package will include an additonal function that create a small dataframe with two columns.

Our functions were inspired from the following functions that exist in the `tidyverse` package:
- [`tidyverse.gather`](https://tidyr.tidyverse.org/reference/gather.html)
- [`tidyverse.spread`](https://tidyr.tidyverse.org/reference/spread.html)
- [`tidyverse.drop_na`](https://tidyr.tidyverse.org/reference/drop_na.html)
