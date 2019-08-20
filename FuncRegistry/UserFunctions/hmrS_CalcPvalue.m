% SYNTAX:
% pValue = hmrS_CalcPvalue(yRuns, stimRuns, baselineRange, hrfTimeWindow)
%
% UI NAME:
% Pvalue_on_Session
%
% DESCRIPTION:
% Calculate the p-value matrix for a single session.
%
% INPUTS:
% yRuns:
% stimRuns:
% baselineRange:
% hrfTimeWindow: 
%
% OUTPUTS:
% pValue: 
%
% USAGE OPTIONS:
% Pvalue_on_Session_Concentration_Data: pValue = hmrG_BlockAvg(dcRuns, stimRuns, baselineRange, hrfTimeWindow)
% Pvalue_on_Session_Delta_OD_Data:      pValue = hmrG_BlockAvg(dodRuns, stimRuns, baselineRange, hrfTimeWindow)
%
% PARAMETERS:
% baselineRange: [-2.0, 0.0]
% hrfTimeWindow: [-2.0, 20.0]
%
function pValue = hmrS_CalcPvalue(yRuns, stimRuns, baselineRange, hrfTimeWindow)
pValue = cell(length(yRuns),1);
for iRun = 1:length(yRuns)

    % Get stim vector by instantiating temporary SnirfClass object with this
    % function's stim argument as input, and then using the SnirfClass object's
    % GetStims method to convert stim to the s vector that this function needs.
    snirf = SnirfClass(yRuns{iRun}, stimRuns{iRun});
    t = snirf.GetTimeCombined();
    s = snirf.GetStims(t);                      % stim matrix for run iRun is same for all of a run's data blocks

    for iBlk = 1:length(yRuns{iRun})
        y = yRuns{iRun}(iBlk).GetDataMatrix();  % data matrix for run iRun, data block iBlk 
        if isempty(pValue{iBlk})
            pValue{iBlk} = zeros(size(y,2), size(s,2));    % p-value matrix size = # of channels X # of condition
        end

        % Processing for each run 
    end
end
