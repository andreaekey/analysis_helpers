function smry = summary_stats(s, varargin)
% SUMMARY_STATS computes summary stats on (numeric) fields of a scalar struct
% Note: If struct is not scalar, try converting to scalar: toscalarstruct(s)
    
    % check arguments
    narginchk(1,2);
    assert(isstruct(s) && isscalar(s), 'Input must be scalar struct');
    isnum = structfun(@isnumeric,s);
    assert(all(isnum), 'Fields must be numeric');
    
    validstats = {'n','min','max','mean','median','std','iqr','mad','aad','cv','robcv','fivenum','fivenum_p','nan'};
    if nargin == 2
        statlist = varargin{1};
    else
        statlist = {'min','max','mean','median','std','iqr','mad','cv'};
    end
    assert(all(ismember(statlist,validstats)),'Invalid statistic input(s)');
    
    
    % compute stats
    desc = structfun(@describe,s,'unif',false);
    names = fieldnames(desc);

    [smry.names] = names{:};
    smry = structfun(@(x) keepfield(x,statlist),desc);
   
end