load iris.mat;
meas_1=meas(1:100,1);
meas_2=meas(1:100,2);
label=species(1:100);
one_label = 'setosa';


kernel_function = 'linear'
svm_classifier(meas_1,meas_2,label,one_label,kernel_function);

 figure;
 kernel_function = 'rbf'
 svm_classifier(meas_1,meas_2,label,one_label,kernel_function);
 
 figure;
 kernel_function = 'quadratic'
 svm_classifier(meas_1,meas_2,label,one_label,kernel_function);
 
 figure;
 kernel_function = 'polynomial'
 svm_classifier(meas_1,meas_2,label,one_label,kernel_function);
 
 figure;
 kernel_function = 'mlp'
 svm_classifier(meas_1,meas_2,label,one_label,kernel_function);