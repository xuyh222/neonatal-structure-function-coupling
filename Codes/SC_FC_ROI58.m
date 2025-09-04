clear;clc

dir0=['G:\SC-FC\'];
MTCpath = [dir0,'mainresults\'];

sub_num = 40;
node_num = 58;

% % % FC matrix
load ([MTCpath,'MTC_withGR.mat'])
sub_num = 40;
for i = 1:sub_num
    [fc_r fc_p]= corrcoef(MTC{i});
    fc_r = fc_r - diag(diag(fc_r));
    fc_r(fc_r<0) = 0;
    fc_r(fc_p>0.05)= 0;
    FC_matrix{i,1} = abs(fc_r);
end

% % % SC-FC coupling, absolute values
load ([dir0,'SC_matrix.mat'])
for i = 1:sub_num
    sc_sub = FNFA_all{i};
    fc_sub = FC_matrix{i};
    for j = 1:node_num
        fc = fc_sub(:,j);
        sc = sc_sub(:,j);
        node_coupling(j,:) = corr(fc,sc,'type','Pearson');
%         node_coupling(j,:) = corr(fc,sc,'type','Spearman');
    end
    sub_coupling(:,i) = node_coupling;
end
sub_coupling = abs(sub_coupling);
save sub_coupling sub_coupling



