function a = structtoarray(s,varargin)
%STRUCTTOARRAY Convert structure with doubles to an array. 
% Handles non-scalar structs (size not [1 1]). 
% A = STRUCT2ARRAY(S)
% Dimensions of result are [number of fields, number of entries].

% Additional arguments reshape array into specified dimensions.
% A = STRUCT2ARRAY(S,[nrow, ncol])
% A = STRUCT2ARRAY(S, nrow, ncol)

%   Modified: Andrea Ekey, 7 March 2016

%   Author(s): R. Losada
%   Copyright 1988-2013 The MathWorks, Inc.

narginchk(1,3);

% Convert structure to cell
c = struct2cell(s);

% Construct an array
a = [c{:}];

dim = [numel(fieldnames(s)), numel(s)];

if nargin==2
    dim = varargin{1};
elseif nargin==3
    dim = [varargin{1}, varargin{2}];
end

a = reshape(a,dim);
