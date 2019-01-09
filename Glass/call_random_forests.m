load glass_al_ca;
load glass_label;
X = glass_al_ca(1:71,1:2);

Y=glass_al_ca(187:214,1:2);
X = [X;Y];

Y = cellstr(glass_label);
 BaggedEnsemble = generic_random_forests(X,Y,30,'classification')
 predict(BaggedEnsemble,[2 1])