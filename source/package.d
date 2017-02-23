/** GSL bindings for D.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl;
import gsl.blas;
import gsl.block;
import gsl.bspline;
import gsl.cblas;
import gsl.cdf;
import gsl.chebyshev;
import gsl.check_range;
import gsl.combination;
import gsl.complex;
import gsl.constants;
import gsl.deriv;
import gsl.dht;
import gsl.diff;
import gsl.eigen;
import gsl.errno;
import gsl.fft;
import gsl.fit;
import gsl.histogram;
import gsl.integration;
import gsl.interpolation;
import gsl.linalg;
import gsl.machine;
import gsl.math;
import gsl.matrix;
import gsl.min;
import gsl.minmax;
import gsl.mode;
import gsl.monte;
import gsl.multifit;
import gsl.multilarge;
import gsl.multimin;
import gsl.multiroots;
import gsl.multiset;
import gsl.nan;
import gsl.ntuple;
import gsl.odeiv2;
import gsl.odeiv;
import gsl.permutation;
import gsl.poly;
import gsl.pow_int;
import gsl.precision;
import gsl.qrng;
import gsl.randist;
import gsl.rng;
import gsl.roots;
import gsl.rstat;
import gsl.siman;
import gsl.sort;
import gsl.spblas;
import gsl.spmatrix;
import gsl.statistics;
import gsl.sum;
import gsl.sys;
import gsl.vector;
import gsl.wavelet;


import std.math: pow, round;
T round_dp(T)(T x, int dp = 0){
    T factor = pow(10, dp + 1);
    x *= factor;
    x += 1.;
    x /= 10.;
    factor /= 10.;
    return round(x)/factor;
}


unittest
{
	import std.stdio : writefln;
	import gsl.randist : gsl_ran_gaussian_pdf;
	import gsl.cdf : gsl_cdf_gaussian_P;
	assert(round_dp(gsl_ran_gaussian_pdf (0 , 1.), 7) == 0.3989423);
	assert(gsl_cdf_gaussian_P (0 , 1.) == 0.5);
	assert(round_dp(gsl_cdf_gaussian_P (-1.96 , 1.), 7) == 0.0249979);
	assert(round_dp(gsl_cdf_gaussian_P (1.96, 1.), 7) == 0.9750021);
}

unittest
{
	////
	import std.stdio : writefln;
	import std.range : iota, array;
	import gsl.statistics : gsl_stats_mean, gsl_stats_variance, gsl_stats_sd, gsl_stats_absdev;
	double[10] some_numbers = iota(1., 11., 1.).array();
	assert(round_dp(gsl_ran_gaussian_pdf (0 , 1.), 7) == 0.3989423);
	assert(gsl_stats_mean(some_numbers.ptr, 1, some_numbers.length) == 5.5);
	assert(round_dp(gsl_stats_sd(some_numbers.ptr, 1, some_numbers.length), 7) == 3.0276504);
	assert(round_dp(gsl_stats_variance(some_numbers.ptr, 1, some_numbers.length), 7) == 9.1666667);
	assert(gsl_stats_absdev(some_numbers.ptr, 1, some_numbers.length) == 2.5);
}


int main(){
    import std.range : iota, array;
    import std.stdio : writeln;

	writeln("testing ...");
	
    return 0;
}
