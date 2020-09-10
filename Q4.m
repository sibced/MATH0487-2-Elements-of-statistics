load('pop.mat')

age_pop = table2array(pop(:,2)); % age
smoker_pop = table2array(pop(:,6)); % smoker
charge_pop = pop(:,7); % charges

% 4a -----------
    charge_smoker_pop =  table();
    charge_nonSmoker_pop = table();

    
% 4b -----------
    charge_smoker50_pop = table();
    charge_nonSmoker50_pop = table(); 

    
j = 1; k = 1; l = 1; m = 1;

for i = 1: length(age_pop)
    
    if smoker_pop(i) == 1
        charge_smoker_pop(j,:) = charge_pop(i,:);
        j=j+1;
    end
    if smoker_pop(i) == 0
        charge_nonSmoker_pop(k,:) = charge_pop(i,:);
        k=k+1;
    end
    
    
   
    if smoker_pop(i) == 1 && age_pop(i) > 50
        charge_smoker50_pop(l,:) = charge_pop(i,:);
        l=l+1;
    end
    if smoker_pop(i) == 0  && age_pop(i) > 50
        charge_nonSmoker50_pop(m,:) = charge_pop(i,:);
        m=m+1;
    end
 
end

x = mean(table2array(charge_smoker_pop)) - mean(table2array(charge_nonSmoker_pop));

variance_pop = var(table2array(charge_smoker_pop), 1) + var(table2array(charge_nonSmoker_pop), 1);
sigma = sqrt(variance_pop) ;


variance_pop_50 = var(table2array(charge_smoker50_pop), 1) + var(table2array(charge_nonSmoker50_pop), 1);
sigma_50 = sqrt(variance_pop_50);

intervalle = [x- icdf('Normal', 0.975 , 0  , 1 )* sigma/sqrt(50), x+ icdf('Normal', 0.975 , 0  , 1 )*sigma/sqrt(50) ];

intervalle50 = [x- icdf('Normal', 0.975 , 0  , 1 )*sigma_50/sqrt(50), x+ icdf('Normal', 0.975 , 0  , 1 )*sigma_50/sqrt(50)];



% échantillons -------------------------

case_ok = 0;
case_50_ok = 0;

for i=1:100
    
        % echantillon fumeur taille 50
        sample_smoker = iid_sample(charge_smoker_pop, 50);
        sample_smoker = table2array(sample_smoker);
        
        % echantillon non fumeur taille 50
        sample_nonSmoker = iid_sample(charge_nonSmoker_pop, 50);
        sample_nonSmoker = table2array(sample_nonSmoker);
        
            x_ech = mean(sample_smoker) - mean(sample_nonSmoker);
        
        % echantillon fumeur de 50ans ou + de taille 50
        sample_smoker50 = iid_sample(charge_smoker50_pop, 50);
        sample_smoker50 = table2array(sample_smoker50);
        
        % echantillon non fumeur de 50ans ou + de taille 50
        sample_nonSmoker50 = iid_sample(charge_nonSmoker50_pop, 50);
        sample_nonSmoker50 = table2array(sample_nonSmoker50);
        
            x_ech_50 = mean(sample_smoker50) - mean(sample_nonSmoker50);
            
        
        % calcul du nbr de fois que l'hypothese est acceptée
        if x_ech < intervalle(2) && x_ech > intervalle(1)
            case_ok = case_ok +1;  
        end
        
        if x_ech_50 < intervalle50(2) && x_ech > intervalle50(1)
            case_50_ok = case_50_ok +1; 
        end
        
end

% nombre de fois que H0 est rejetée 
nbr_h0_rejet_Q4a = 100-case_ok   
nbr_h0_rejet_Q4b = 100-case_50_ok  
