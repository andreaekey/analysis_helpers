function tbl = sorttable(tbl,ord,varargin)
% SORTTABLE reorders TBL (struct) using ORD (numerical or cellstr)

assert(isstruct(tbl),'tbl is not a struct');
pnames = {'keyfld'};
dflts = {''};
args = parse_args(pnames,dflts,varargin{:});

len = length(tbl);
assert(len==length(ord),'Ordering vector must be same length as table');

if isnumeric(ord) 
    assert(isequal(sort(ord,'ascend'),1:len),'Ordering vector should be permutation of 1:length(tbl)');
    tbl = tbl(ord);
elseif iscellstr(ord) && isfield(tbl,args.keyfld)
    assert(all(ismember(ord,{tbl.(args.keyfld)})),'Ordering vector should be permutation of tbl keyfield');
    [~,idx]=subset({tbl.(args.keyfld)},ord);
    tbl = tbl(idx);
end