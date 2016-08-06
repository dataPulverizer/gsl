/** GSL bindings for D.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl;
import gsl.headers.blas;
import gsl.headers.block;
import gsl.headers.bspline;
import gsl.headers.cblas;
import gsl.headers.cdf;
import gsl.headers.chebyshev;
import gsl.headers.check_range;
import gsl.headers.combination;
import gsl.headers.complex;
import gsl.headers.constants;
import gsl.headers.deriv;
import gsl.headers.dht;
import gsl.headers.diff;
import gsl.headers.eigen;
import gsl.headers.errno;
import gsl.headers.fft;
import gsl.headers.fit;
import gsl.headers.histogram;
import gsl.headers.integration;
import gsl.headers.interpolation;
import gsl.headers.linalg;
import gsl.headers.machine;
import gsl.headers.math;
import gsl.headers.matrix;
import gsl.headers.min;
import gsl.headers.minmax;
import gsl.headers.mode;
import gsl.headers.monte;
import gsl.headers.multifit;
import gsl.headers.multilarge;
import gsl.headers.multimin;
import gsl.headers.multiroots;
import gsl.headers.multiset;
import gsl.headers.nan;
import gsl.headers.ntuple;
import gsl.headers.odeiv2;
import gsl.headers.odeiv;
import gsl.headers.permutation;
import gsl.headers.poly;
import gsl.headers.pow_int;
import gsl.headers.precision;
import gsl.headers.qrng;
import gsl.headers.randist;
import gsl.headers.rng;
import gsl.headers.roots;
import gsl.headers.rstat;
import gsl.headers.siman;
import gsl.headers.sort;
import gsl.headers.spblas;
import gsl.headers.spmatrix;
import gsl.headers.statistics;
import gsl.headers.sum;
import gsl.headers.sys;
import gsl.headers.vector;
import gsl.headers.wavelet;


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
	import gsl.headers.randist : gsl_ran_gaussian_pdf;
	import gsl.headers.cdf : gsl_cdf_gaussian_P;
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
	import gsl.headers.statistics : gsl_stats_mean, gsl_stats_variance, gsl_stats_sd, gsl_stats_absdev;
	double[10] some_numbers = iota(1., 11., 1.).array();
	assert(round_dp(gsl_ran_gaussian_pdf (0 , 1.), 7) == 0.3989423);
	assert(gsl_stats_mean(some_numbers.ptr, 1, some_numbers.length) == 5.5);
	assert(round_dp(gsl_stats_sd(some_numbers.ptr, 1, some_numbers.length), 7) == 3.0276504);
	assert(round_dp(gsl_stats_variance(some_numbers.ptr, 1, some_numbers.length), 7) == 9.1666667);
	assert(gsl_stats_absdev(some_numbers.ptr, 1, some_numbers.length) == 2.5);
}