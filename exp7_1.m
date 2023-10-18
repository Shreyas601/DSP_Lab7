a = 2;

%1

% Define the parameters
N = 140;  % Window length
n = 0:N-1;  % Discrete time index

% Calculate the window functions
rectangular_window = ones(1, N);  % Rectangular window
hamming_window = 0.54 - 0.46 * cos(2 * pi * n / (N - 1));  % Hamming window
hanning_window = 0.5 * (1 - cos(2 * pi * n / (N - 1)));  % Hanning window

% Plot the window functions
subplot(3, 1, 1);
plot(n, rectangular_window);
title('Rectangular Window');
xlabel('n');
ylabel('Amplitude');

subplot(3, 1, 2);
plot(n, hamming_window);
title('Hamming Window');
xlabel('n');
ylabel('Amplitude');

subplot(3, 1, 3);
plot(n, hanning_window);
title('Hanning Window');
xlabel('n');
ylabel('Amplitude');

sgtitle('Window Functions in MATLAB');

%2

% Define the DFT length
N = 1024;  % Length of DFT

% Define a vector of different window lengths
window_lengths = [32, 64, 128, 256];

% Initialize a matrix to store the frequency domain representations
spectrum = zeros(length(window_lengths), N);

% Calculate and plot the spectrum for each window length
figure;

for i = 1:length(window_lengths)
    L = window_lengths(i);
    
    % Generate the Blackman window of length L
    w = blackman(L);
    
    % Zero-pad the window to match the DFT length
    w_padded = [w; zeros(N - L, 1)];
    
    % Compute the DFT of the window
    W = fft(w_padded, N);
    
    % Normalize the magnitude by the actual length
    normalized_spectrum = abs(W) / L;
    
    % Store the normalized spectrum for plotting
    spectrum(i, :) = normalized_spectrum;
    
    % Plot the spectrum
    subplot(length(window_lengths), 1, i);
    plot((0:N-1) / N, normalized_spectrum);
    title(['Blackman Window Spectrum (Length = ' num2str(L) ')']);
    xlabel('Normalized Frequency');
    ylabel('Magnitude');
end

sgtitle('Spectrum of Blackman Window for Different Lengths');
