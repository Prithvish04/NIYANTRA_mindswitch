function [f,pwr] = MedianFreq(X)
% use a rectangular window for time-domain input
kaiserBeta = 0;
% fetch the PSD from the input
[Pxx, F, Frange, rbw, extraArgs, status] = psdparserange('medfreq', kaiserBeta, varargin{:});
[f,pwr] = computeMedFreq(Pxx, F, Frange);

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function [f,pwr] = computeMedFreq(Pxx, F, freqrange)

% Compute the power from the PSD
width = specfreqwidth(F);
P = width*Pxx

% Cumulative rectangular integration
cumPwr = [zeros(1,size(P,2)); cumsum(P)];

% place borders halfway between each estimate.
cumF = [F(1); (F(1:end-1)+F(2:end))/2; F(end)];

% find the integrated power for the low and high frequency range
Plo = interpPower(cumPwr,cumF,freqrange(1));
Phi = interpPower(cumPwr,cumF,freqrange(2));

% return the power between the frequency range
pwr = Phi-Plo;

% return the frequency that divides the power equally
f = interpFreq(cumPwr,cumF,(Plo+Phi)/2);

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function p = interpPower(cumPwr,cumF,f)
idx = find(f<=cumF, 1,'first');
if ~isempty(idx)
  if idx==1
    p = signal.internal.linterp(cumPwr(1,:),cumPwr(2,:),cumF(1),cumF(2),f);
  else
    p = signal.internal.linterp(cumPwr(idx,:),cumPwr(idx-1,:), ...
                                cumF(idx),cumF(idx-1),f);
  end
else
  p = nan(1,size(cumPwr,2));
end

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function f = interpFreq(cumPwr, cumF, pwrThresh)
nChan = size(cumPwr,2);
f = zeros(1,nChan);

for iChan=1:nChan
  idx = find(pwrThresh(iChan)<=cumPwr(:,iChan),1,'first');
  if ~isempty(idx)
    if idx==1
       idx=2;
    end
    f(iChan) = signal.internal.linterp(cumF(idx-1), cumF(idx), ...
                 cumPwr(idx-1,iChan), cumPwr(idx,iChan), pwrThresh(iChan));
  else
    f(iChan) = NaN;
  end
end

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function plotMedFreq(Pxx, F, Frange, rbw, Fmed, status)

% plot spectrum
if strcmp(status.inputType,'power');
  % power spectrum when specified
  [hLine, xscale] = psdplot(Pxx, F, rbw, 'power', status);
else
  % otherwise, default to PSD
  [hLine, xscale] = psdplot(Pxx, F, rbw, 'psd', status);
end

% show the active frequency range of the measurement
hAxes = ancestor(hLine(1),'axes');
xLim = [F(1) F(end)];
yLim = get(hAxes,'YLim');
psdmaskactiverange(hAxes, xscale, xLim, yLim, Frange);

% plot vertical bar for each estimate
for i=1:numel(Fmed)
  line(xscale*[Fmed(i) Fmed(i)], yLim, ...
       'Parent',hAxes, ...
       'LineStyle','-.', ...
       'Color',get(hLine(i),'Color'));
end

% title the plot
titleStr = getString(message('signal:medfreq:MedianFreqEstimate'));
if isscalar(Fmed)
  [Fm, ~, units] = engunits(Fmed(1), 'unicode');
  if status.normF
    titleStr = sprintf('%s: %.3f \\times \\pi %srad/sample',titleStr,Fm/pi,units);
  else
    titleStr = sprintf('%s: %.3f %sHz',titleStr,Fm,units);
  end
end

title(titleStr);