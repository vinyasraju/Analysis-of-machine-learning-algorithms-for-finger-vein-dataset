function BaggedEnsemble = generic_random_forests(X,Y,iNumBags,str_method)


BaggedEnsemble = TreeBagger(iNumBags,X,Y,'OOBPred','On','Method',str_method)

% plot out of bag prediction error
oobErrorBaggedEnsemble = oobError(BaggedEnsemble);
figure('position',[0 450 400 300]);
plot(oobErrorBaggedEnsemble)
xlabel 'Number of grown trees';
ylabel 'Out-of-bag classification error';
oobPredict(BaggedEnsemble)

% view trees
view(BaggedEnsemble.Trees{1}) % text description
view(BaggedEnsemble.Trees{1},'mode','graph') % graphic description