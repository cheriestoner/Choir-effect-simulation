# Choir-effect-simulation

The idea of this project was to implement a choir effect
on a ten seconds long single vocal containing 4 pitches using MATLAB. A single vocal was recorded in a studio and
a beating was added to each partial of the vocal, to obtain
variations in amplitude and perceive the vocal as a choir.
The idea of the algorithm was to apply amplitude modulations to the harmonic partials of the input vocal in the frequency domain. The random beating for each partial was
generated from a Gaussian white noise, with a speed proportional to the frequency of the corresponding partial. As
a result, ten seconds of vocal with choir effect was generated as an output and the program was able to simulate an
ensemble effect for a single vocal with variations in pitch.
Another output with same properties was also generated in
which the size of the choir effect changed with time.
