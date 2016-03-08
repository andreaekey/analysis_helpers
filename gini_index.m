function gi = gini_index(x)

nrow = size(x,1);
ncol = size(x,2);

x_max = max(x,[],1);
x_scaled = bsxfun(@rdivide,sort(x,1,'ascend'),x_max);
x_scaled = [zeros(1,ncol);x_scaled];

auc = trapz(linspace(0,1,nrow+1),x_scaled);
gi = 1-2*auc;


% x = tocolumnvec(x);
% n = length(x);
% 
% d = pdist(x);
% % relative mean absolute difference = 2 * sum(d) / (n^2 * mean(x))
% % Gini = (relative mean absolute difference) / 2
% 
% gi = sum(d)/((n^2) * nanmean(x));
% 
% function r = tocolumnvec(v)
% r = v;
% if isrow(v)
% 	r = r';
% end
% end
end