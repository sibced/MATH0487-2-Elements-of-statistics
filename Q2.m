% 2a -----------------------------------------
    load('pop.mat')
    charge_pop = table2array(pop(:,7));
   
    sample_50 = iid_sample(pop, 50);
    charge_sample_50 = table2array(sample_50(:,7));

        %i -----
        [mean_charge_sample, median_charge_sample, std_charge_sample] = sample_sum_up(charge_sample_50)

        %ii -----
        figure;
        boxplot(charge_sample_50)

        %iii -----
        KS_distance = ks_distance(charge_pop, charge_sample_50)


    
% 2b -----------------------------------------

    % i - ii - iii 
    mean_charge_samples = [];
    median_charge_samples = [];
    std_charge_samples = [];
    
    ks_samples = [];
    
        for i=1:500
            
            sample_50 = iid_sample(pop, 50);
            charge_sample_50 = table2array(sample_50(:,7));
            
            [mean_charge_sample, median_charge_sample, std_sample] = sample_sum_up(charge_sample_50);
            mean_charge_samples = [mean_charge_samples; mean_charge_sample];
            median_charge_samples = [median_charge_samples; median_charge_sample];
            std_charge_samples = [std_charge_samples; std_sample];

            ks_samples = [ks_samples; ks_distance(charge_pop, charge_sample_50)]; 
        end
        
    figure;
    histogram(mean_charge_samples);
    figure;
    histogram(median_charge_samples);
    figure;
    histogram(std_charge_samples);
    figure;
    histogram(ks_samples);
    

    mean_means_Q2bi = mean(mean_charge_samples)
    mean_medians_Q2bii = mean(median_charge_samples)
    mean_std_Q2biii = mean(std_charge_samples)
    
    %iv -----
   
    
 
 