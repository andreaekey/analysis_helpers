function s_scalar = toscalarstruct(s)
% TOSCALARSTRUCT converts struct(size [n 1] or [1 n]) to scalar (size [1 1])

assert(isstruct(s),'Input must be struct')
if ~isscalar(s) 
    flds = fieldnames(s);
    s_scalar = struct();
    for i=1:length(flds)
        % get field from struct 
        if isnumeric(s(1).(flds{i}))
            getfld = [s.(flds{i})];
        else
            getfld = {s.(flds{i})};
        end
        % insert values in scalar struct
        s_scalar.(flds{i}) = getfld;
    end
else
    s_scalar = s;
end