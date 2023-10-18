%Time-Domain Windowing
% Create a time-domain signal
t = 0:0.001:1;
signal = sin(2*pi*50*t) + sin(2*pi*100*t);

% Apply a Hanning window to the signal
windowed_signal = signal .* hann(length(signal));

% Plot the original signal and the windowed signal
subplot(2, 1, 1);
plot(t, signal);
title('Original Signal');
xlabel('Time');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(t, windowed_signal);
title('Windowed Signal (Hanning Window)');
xlabel('Time');
ylabel('Amplitude');
figure;

%Window-Based FIR filter

% Create an example signal
t = 0:0.001:1;
signal = sin(2*pi*50*t) + sin(2*pi*100*t) + 0.2*randn(size(t));

% Design a low-pass FIR filter using window-based design
filter_order = 51;
cutoff_frequency = 80; % Hz
nyquist = 0.5 * 1000; % Nyquist frequency for a 1 kHz sampling rate
normalized_cutoff = cutoff_frequency / nyquist;
filter_coeffs = fir1(filter_order, normalized_cutoff);

% Apply the FIR filter to the signal
filtered_signal = filter(filter_coeffs, 1, signal);

% Plot the original signal and the filtered signal
subplot(2, 1, 1);
plot(t, signal);
title('Original Signal');
xlabel('Time');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(t, filtered_signal);
title('Filtered Signal (Low-Pass FIR Filter)');
xlabel('Time');
ylabel('Amplitude');
