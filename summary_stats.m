function smry = summary_stats(s, varargin)
    narginchk(1,2);
    assert(isstruct(s) && isscalar(s), 'Input must be scalar struct');
    
    % compute stats
    desc = structfun(@describe,s,'unif',false);
    names = fieldnames(desc);
    % get
    if nargin == 2
        statlist = varargin{1};
    else
        statlist = {'min','max','mean','median','std','iqr','mad','cv','fivenum'};
    end
    
    validstats = {'n','min','max','mean','median','std','iqr','mad','aad','cv','robcv','fivenum','fivenum_p','nan'};
    assert(all(ismember(statlist,validstats)),'Invalid statistic input');
    
    smry = structfun(@(x) keepfield(x,statlist),desc);
    [smry.names] = names{:};
end