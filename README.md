# Data for finding gender by names

Lincoln A. Mullen | lincoln@lincolnmullen.com | http://lincolnmullen.com

This repository contains the data for identifying gender by birth name
by two different methods. The generated data is intended for my R
package [gender][] which will provide functions for encoding gender.

One method is [Mark Kantrowitz's name corpus][], which contains 7,579
unique names. The raw lists of names are in the `kantrowitz` directory.
The script `kantrowitz.r` generates a usable data frame stored in
`kantrowitz.csv` or `kantrowitz.rda`.

A better method is the to use the [Social Security Administration's baby
names by year][], which contains 91,320 unique names from people born
between 1880 and 2012. (See also the [Social Security Administration's
baby names by year and state][].) Furthermore, this data includes the
number of males and females born with those names. Thus not only is it
possible to identify gender as name use varies over time, it is also
possible to calculate the proportion of male and females with a
particular name. The raw data is stored in the `ssa` directory. The
script `ssa.r` generates a usable data frame stored in
`ssa_national.csv` or `ssa_national.rda`.

Created in collaboration with [Cameron Blevins][].

## License

MIT License, <http://lmullen.mit-license.org/>

  [gender]: https://github.com/lmullen/gender
  [Mark Kantrowitz's name corpus]: http://www.cs.cmu.edu/afs/cs/project/ai-repository/ai/areas/nlp/corpora/names/0.html
  [Social Security Administration's baby names by year]: http://catalog.data.gov/dataset/baby-names-from-social-security-card-applications-national-level-data
  [Social Security Administration's baby names by year and state]: http://catalog.data.gov/dataset/baby-names-from-social-security-card-applications-data-by-state-and-district-of-
  [Cameron Blevins]: http://www.cameronblevins.org/
