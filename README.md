# chuckModules

My collection of Chuck modules for live performance.

These are synced to the period (I think of it as the masterClock):
.5::second => dur T; //sync to masterClock/period
T - (now % T) => now;

I either advance time in while loop conditions or advance them like this:
.25::T => now;
