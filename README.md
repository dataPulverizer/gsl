# D bindings for GSL (GNU Scientific Library)

This library was configured to run with GSL 2.1. See the  [website](https://www.gnu.org/software/gsl/). At the moment all the items from the C GSL library are ported, but no specific D framework has been implemented and so the library is very much "as is" from the C library.

## Basic examples

```
#!/usr/bin/env dub
/+ dub.json:
{
    "name": "testgsl",
    "dependencies": {"gsl": "~>0.1.8"}
}
+/

/*
*  Compile example:
*  dub run --single testgsl.d
*/

import std.range : iota, array;
import std.stdio : writeln;
import gsl.randist : gsl_ran_gaussian_pdf;
import gsl.cdf : gsl_cdf_gaussian_P;
import gsl.statistics : gsl_stats_mean, gsl_stats_variance, gsl_stats_sd, gsl_stats_absdev;

void main(){
	double[] x;
	writeln("PDF, x = 0: ", gsl_ran_gaussian_pdf(0, 1));
	writeln("CDF, x = 0: ", gsl_cdf_gaussian_P (0, 1));

	writeln("CDF, x = -1.96: ", gsl_cdf_gaussian_P (-1.96, 1));
	writeln("CDF, x = 1.96: ", gsl_cdf_gaussian_P (1.96, 1));

	double[10] some_numbers = iota(1., 11., 1.).array();
	writeln("\n", gsl_stats_mean(some_numbers.ptr, 1, some_numbers.length));
	writeln(gsl_stats_sd(some_numbers.ptr, 1, some_numbers.length));
	writeln(gsl_stats_variance(some_numbers.ptr, 1, some_numbers.length));
	writeln(gsl_stats_absdev(some_numbers.ptr, 1, some_numbers.length));
}
```
The library was transformed using the [dstep](https://github.com/jacob-carlborg/dstep) tool.
