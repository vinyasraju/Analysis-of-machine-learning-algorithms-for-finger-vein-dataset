clc;clear all;
load variable

 meas_1=person1(1:316,1);
 meas_2=person2(1:316,1);
 label=person_label(1:316,1);
 one_label = 'Person1';

kernel_function = 'linear';
svm_classifier(meas_1,meas_2,label,one_label,kernel_function);

% figure;
 kernel_function = 'rbf';
 svm_classifier(meas_1,meas_2,label,one_label,kernel_function);
% 
% figure;
 kernel_function = 'quadratic';
 svm_classifier(meas_1,meas_2,label,one_label,kernel_function);
% 
% figure;
 kernel_function = 'polynomial';
 svm_classifier(meas_1,meas_2,label,one_label,kernel_function);
% 
% figure;
 kernel_function = 'mlp';
 svm_classifier(meas_1,meas_2,label,one_label,kernel_function);