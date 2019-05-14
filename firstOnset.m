function [first_onset_n] = firstOnset(ir_m, thresh)

% FIRST_ONSET Detects first onset of impulse response
%
% Usage
%   [first_onset_n] = first_onset(ir, thresh);
%
% Input
%   ir_m : impulse response (multi-dimensional vector
%   thresh: relative threshold (rel to max ir value)
%
% Output
%   first_onset_n : indice of the last onset
%
% Authors
%   David Poirier-Quinot

% define default threshold 
if( nargin < 2 ); thresh = 1e-3; end;

% for each impulse response in input IR vector (matrix really)
first_onset_n = size(ir_m,1);
for i = 1:size(ir_m,2)
   ir_v = abs(ir_m(:,i));
   last = find(ir_v > max(ir_v) * thresh, 1, 'first');
   first_onset_n = min(first_onset_n, last);
end

