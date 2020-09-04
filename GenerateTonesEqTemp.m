
% Define some intervals:
ONE_OCTAVE = 12;
ONE_STEP = 2;
PERFECT_FIFTH = 7;
PERFECT_FOURTH = 5;
MAJOR_THIRD = 4;
MINOR_THIRD = 3;
TRITONE = 6;


% Generate a few reference pitches:
a440 = 440;
% How many 1/2 steps to get to middle c?
% ab, g, gb, f, e, eb, d, db, c = 9
middle_c = downHalfStepEqTemp(a440, 9);
BARITONE_C = downHalfStepEqTemp(middle_c, ONE_OCTAVE);
HIGH_C = upHalfStepEqTemp(middle_c, ONE_OCTAVE);
LOW_F = downHalfStepEqTemp(BARITONE_C, PERFECT_FIFTH);
HIGH_G = upHalfStepEqTemp(middle_c, PERFECT_FIFTH);

% ----------------------------------------------------------------------------------------------------
%                                           Define Scales
% ----------------------------------------------------------------------------------------------------
major_scale = [0, 2, 4, 5, 7, 9, 11, 12];

natural_minor = [0, 2, 3, 5, 7, 8, 10, 12];

% Give a name to that warmup thing in which you go up a perfect 5th
% stepwise:
dadadadadadadadada = [0, 2, 4, 5, 7, 5, 4, 2, 0];

% Define tonics from low F to F above middle C:
dada_tonics = zeros(25, 0);
for n = 1:25
    dada_tonics(n) = upHalfStepEqTemp(LOW_F, n-1);
end

% ----------------------------------------------------------------------------------------------------
%                                         Generate .wav Files
% ----------------------------------------------------------------------------------------------------
BEATS_PER_SECOND = 120;
SECONDS_PER_BEAT = 1 / BEATS_PER_SECOND;
Fs = 44100;
Ts = 1/Fs;
FILE_SECONDS = 10;
FILE_SAMPLES = FILE_SECONDS * Fs;

SAMPLES_SHORT = Fs * 0.5;
SAMPLES_MED = Fs * 2;
SAMPLES_LONG = Fs * 5;

samples = zeros(FILE_SAMPLES, 1);

% Generate tones for major scale dada's:
tonic = LOW_F;
start_idx = 1;
DC_BIAS = 1;

one_window = easyWindow(SAMPLES_SHORT);
for tonic = dada_tonics
    for oneNote = dadadadadadadadada
        % Define a frequency in Hz:
        oneFreq = upHalfStepEqTemp(tonic, oneNote) * pi / (180 / Fs);
        omega = oneFreq * pi / 180;
        t = 0:Ts:(Ts*(SAMPLES_SHORT-1));
        oneSeq = transpose(sin(omega * t)); 
        oneSeq = oneSeq .* one_window;
        samples(start_idx : start_idx + numel(oneSeq)-1) = oneSeq;
        start_idx = start_idx + SAMPLES_SHORT;
    end    
end

uut = audioplayer(samples, 44100);
play(uut);
%audiowrite(

% Generate Major Scales:

% Generate Natural Minors:

% Generate Harmonic Minors:

% Generate Melodic Minors:


% Split each of those into 5 smaller ones:

% Generate a wave file:



