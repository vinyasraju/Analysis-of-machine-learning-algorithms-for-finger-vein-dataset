load var
X = person1;
Y = person_label;
BaggedEnsemble = generic_random_forests(X,Y,60,'classification')
predict(BaggedEnsemble,[1 1])