.6::second => dur T; //sync to masterClock/period
T - (now % T) => now;

//Separate stereo signals (L/R independent)
SinOsc s => NRev rev => dac.left; //pipe sin to dac LEFT
TriOsc s2 => NRev rev2 => dac.right; //pipe sin to dac RIGHT
.6 => s.gain;
.6 => s2.gain;
.3 => rev.gain => rev2.gain;
.09 => rev.mix => rev2.mix;

[ 0, 2, 4 ] @=> int scale[]; //define scale array
//[ 0, 2, 4, 0, 7, 9 ] @=> int scale2[]; //define scale array

do {
    scale[ Math.random2(0,1) ] => float freq; //note class
    //scale2[ Math.random2(0,1) ] => float freq;
    Std.mtof( 21.0 + (Math.random2(2,4) * 16 + freq) ) => s.freq; //final freqs
    Std.mtof( 21.0 + (Math.random2(2,4) * 12 + freq) ) => s2.freq;

    .25::T => now; //advance time
} while( true );
