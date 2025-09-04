function nodal_glm_forbaby(data_nodal,roi_ind,age,gender,headmotion,age_diff,mask_info,output_name)
% reg_type: 'age_factor' or 'genderxage_factor'
% data_nodal: node x sub;
n_roi = length(roi_ind);
hdr = spm_vol(mask_info);
mask_data = spm_read_vols(hdr);
for i=1:n_roi
    Index{i} = find(mask_data==roi_ind(i));
end

t_age_data=zeros(size(mask_data));
beta_data = zeros(size(mask_data));


for i=1:n_roi
    [age_stats]=glm_forbaby(data_nodal(i,:),age,gender,headmotion,age_diff);
    age_stats_all{i}=age_stats;
    t_age_data(Index{i})=age_stats{1,1}(1);
    dfe_age=age_stats{1,5}(1);
    beta_data(Index{i}) = age_stats{1,3}(1);
    p_age(i) = age_stats{1,2}(1);
end

FDR_p_age=gretna_FDR(p_age,0.05);

save([output_name '_age_reg_results.mat'],'age_stats_all');
save([output_name '_FDR_p_05_results.mat'],'FDR_p_age');
save([output_name '_p_age.mat'],'p_age');

hdr.dt=[64 0];

hdr.fname=[output_name '_beta_age_data.img'];
spm_write_vol(hdr,beta_data);


hdr.fname=[output_name '_t_age_data.img'];
hdr.descrip=['SPM{T_[' num2str(dfe_age) ']}'];
spm_write_vol(hdr,t_age_data);









