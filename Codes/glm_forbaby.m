function [age_stats]=glm_forbaby(data,age,gender,headmotion,age_diff)

N=length(data);
% k=size([age gender headmotion age_diff],2);
whichstats={'rsquare','tstat','mse','r'};
%% age factor
%linear
stats_linear = regstats(data,[age gender headmotion age_diff],'linear',whichstats);

t = stats_linear.tstat.t(2);
p = stats_linear.tstat.pval(2);
beta_value = stats_linear.tstat.beta(2);
beta = stats_linear.tstat.beta;
dfe=stats_linear.tstat.dfe;
data_fitted = beta(1)+beta(2)*age+stats_linear.r;
rsq=stats_linear.rsquare;
   
age_stats = {t,p,beta_value,beta,dfe,data_fitted,rsq};

