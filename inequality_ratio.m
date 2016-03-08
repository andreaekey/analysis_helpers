function ratio = inequality_ratio(x,Ntop,Nbot)
% inequality ratio = (wealth share of Ntop richest)/(wealth share of Nbot poorest)
x_srt = sort(x,1,'descend');
ratio = sum(x_srt(1:Ntop,:),1)./sum(x_srt(end-Nbot+1:end,:),1);

