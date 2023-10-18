a = 2;

% P3
% Load the audio signal
[y, Fs] = audioread('instru2.wav');

% Set parameters
window_length = 1024; % Choose an appropriate window length
cutoff_frequency = 1000; % Adjust the cutoff frequency based on your needs
window_type = hamming(window_length); % Use a Hamming window as an example

% Design the FIR filter
h = fir1(window_length - 1, cutoff_frequency / (Fs / 2), 'low', window_type);

% Apply the filter to the audio signal
filtered_audio = filter(h, 1, y);

% Save the filtered audio to a .wav file
audiowrite('filtered_instru2.wav', filtered_audio, Fs);

% Plot the original audio's spectrogram
figure;
spectrogram(y, hamming(window_length), window_length/2, window_length, Fs, 'yaxis');

ylim([0, 5]); % Adjust the y-axis range for better visualization

% Plot the spectrogram of the filtered audio
figure;
spectrogram(filtered_audio, hamming(window_length), window_length/2, window_length, Fs, 'yaxis');

ylim([0, 5]); % Adjust the y-axis range for better visualization