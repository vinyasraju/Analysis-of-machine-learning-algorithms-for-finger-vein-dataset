
function svmStruct = svm_classifier(meas_1,meas_2,label,one_label,kernel_function)
data   = [meas_1, meas_2];
species = cellstr(label);
groups = ismember(species,one_label);

[train, test] = crossvalind('holdOut',groups); %spliting training n testing data
cp = classperf(groups);

%svmStruct = svmtrain(data(train,:),groups(train),'showplot',true); %use thisif any kernal func cmp is not req
svmStruct = svmtrain(data(train,:),groups(train),'showplot',true,'kernel_function',kernel_function);
classes = svmclassify(svmStruct,data(test,:),'showplot',true);
classperf(cp,classes,test);
cp.CorrectRate
end