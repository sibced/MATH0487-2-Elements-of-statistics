% 1a ------------------------------------------------

    load('pop.mat')
    charge_pop = table2array(pop(:,7));

    figure;
    histogram(charge_pop)
    
% 1b ------------------------------------------------

    [mean_charge_pop, median_charge_pop, std_charge_pop] = sum_up(charge_pop)

% 1c ------------------------------------------------

    [lower_normal_charge, upper_normal_charge] = normal_interval(charge_pop)

    nbrNormalCharge = 0;
    for i = 1: length(charge_pop)
        if charge_pop(i) < upper_normal_charge && charge_pop(i) > lower_normal_charge 
                nbrNormalCharge = nbrNormalCharge +1;
        end
    end
    prop_Q1c = nbrNormalCharge/length(charge_pop)

% 1d ------------------------------------------------
   
    figure;
    boxplot(charge_pop)
    [Quant1, Quant2, Qant3] = quartiles(charge_pop);

    lower_box = Quant1 - 1.5*(Qant3 - Quant1);
    upper_box = Qant3 + 1.5*(Qant3 - Quant1);
    aberrantes = 0;
    for i = 1: length(charge_pop)
        if charge_pop(i) < lower_box || charge_pop(i) > upper_box 
                aberrantes = aberrantes +1;
        end
    end
    aberrantes

    % 1e ------------------------------------------------

    figure;
    cdfplot(charge_pop)

    FreqCum = functionFreqCum(charge_pop, 0:0.5:max(charge_pop));

    hold on;
    plot(0:0.5:max(charge_pop), FreqCum)

    prop_inf_25000 = proportion(charge_pop, 25000);
    prop_inf_smith = proportion(charge_pop, 1.6884924e+04); %16884.924$

    prop_Q1e = prop_inf_25000  - prop_inf_smith

    % 1f ------------------------------------------------

    age_pop = table2array(pop(:,2));
    sex_pop = table2array(pop(:,3));

    pop_age_sex_charge = [ age_pop, sex_pop, charge_pop];
    pop_H = [];
    pop_F = [];

    for i = 1: length(pop_age_sex_charge)
        if pop_age_sex_charge(i,2) == 1
            pop_H = [pop_H ; pop_age_sex_charge(i, :,:)];
        end
        if pop_age_sex_charge(i,2) == 0
            pop_F = [pop_F ; pop_age_sex_charge(i, :,:)];
        end
    end
    figure;
    scatter(pop_H(:,1), pop_H(:,3))
    figure;
    scatter(pop_F(:,1), pop_F(:,3))

    coeff_cor_H = correlation(pop_H(:,1), pop_H(:,3))
    coeff_cor_F = correlation(pop_F(:,1), pop_F(:,3))