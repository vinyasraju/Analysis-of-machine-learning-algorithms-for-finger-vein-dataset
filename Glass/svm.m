load glass;
meas_1=meas(1:70,1);
meas_2=meas(71:140,2);
label=species(1:140);
one_label ='glass1';


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