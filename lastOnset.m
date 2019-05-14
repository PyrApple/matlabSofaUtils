function [last_onset_n] = lastOnset(ir_m, thresh)

% LAST_ONSET Detects last onset of impulse response
%
% Usage
%   [last_onset_n] = last_onset(ir, thresh);
%
% Input
%   ir_m : impulse response (multi-dimensional vector
%   thresh: relative threshold (rel to max ir value)
%
% Output
%   last_onset_n : indice of the last onset
%
% Authors
%   David Poirier-Quinot

% define default threshold 
if( nargin < 2 ); thresh = 1e-3; end;

% for each impulse response in input IR vector (matrix really)
last_onset_n = 0;
for i = 1:size(ir_m,2)
   ir_v = abs(ir_m(:,i));
   last = find(ir_v > max(ir_v) * thresh, 1, 'last');
   last_onset_n = max(last_onset_n, last);
end