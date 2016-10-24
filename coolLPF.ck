// credit goes to youTuber Kijjasak Triyanond
// https://www.youtube.com/watch?v=IkbjktiF52k

//second - (now % second) => now;
.6::second => dur T; //sync to masterClock/period
T - (now % T) => now;



Blit s => LPF lpf => JCRev rev => dac;
lpf.set(350, 500);

4 => s.freq;
.8 => s.gain;
1.2 => rev.gain;
.05 => rev.mix;

int x;
while(125::ms => now) {
//while (true) {
    (((x * 3 + 7) % 8) + 1) * 200 => lpf.freq;
    x++;
    
//    .25::T => now; //advance time
}
