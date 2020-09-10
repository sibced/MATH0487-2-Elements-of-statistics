load('pop.mat')

BMI_pop = table2array(pop(:,4));
[mean_BMI_pop, median_BMI_pop, std_BMI_pop] = sum_up(BMI_pop);

mean_BMI_samples = [];
median_BMI_samples  = [];
sample3_average = [];
interval_student = [];
interval_gauss = [];

for i=1:100 
    
        % 3a & 3b ---------------------
        sample_50 = iid_sample(pop, 100);
        BMI_sample_50 = table2array(sample_50(:,4));
        
        [mean_BMI_sample, median_BMI_sample, std_BMI_sample] = sample_sum_up(BMI_sample_50);

        mean_BMI_samples = [mean_BMI_samples; mean_BMI_sample];
        median_BMI_samples = [median_BMI_samples; median_BMI_sample]; 
        
        % 3d ---------------------
        sample_20 = iid_sample(pop, 20);
        BMI_sample_20 = table2array(sample_20(:,4));
 
            % i 
            [lower_student, upper_student] = student_interval(BMI_sample_20, 0.95);
            interval_student = [interval_student ; [lower_student, upper_student] ]; 
            
            % ii
            [lower_gauss, upper_gauss] = gauss_interval(BMI_sample_20, std_BMI_pop, 0.95);
            interval_gauss = [interval_gauss ; [lower_gauss, upper_gauss] ];
      
end

% 3a & 3b (suite) ---------------------
biais_mean_Q3a = abs( mean(mean_BMI_samples) - mean_BMI_pop ) 
variance_mean_Q3a = var(mean_BMI_samples, 1)

biais_median_Q3b = abs( mean(median_BMI_samples) - median_BMI_pop )
variance_median_Q3b =  var(median_BMI_samples, 1)


% 3d (suite) ---------------------
nbr_ic_student = 0;
nbr_ic_gauss = 0;

for i=1:100 
    
    if mean_BMI_pop > interval_student(i, 1) && mean_BMI_pop < interval_student(i,2)
        nbr_ic_student = nbr_ic_student + 1;
    end
      
    if mean_BMI_pop > interval_gauss(i, 1) && mean_BMI_pop < interval_gauss(i,2)
        nbr_ic_gauss = nbr_ic_gauss + 1;
    end
    
end

prop_ic_student_Q3d = nbr_ic_student / 100

prop_ic_gauss_Q3d = nbr_ic_gauss / 100


