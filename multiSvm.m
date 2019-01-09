% T=[13.8048    0.8144    1.4493    0.8580    1.2017    1.9146
%                 14.0032    0.8253    1.3530    0.7587    1.1136    1.9115
%                 13.4718    0.7448    1.3168    0.6488    0.9679    1.7066
%                 13.4248    0.8570    1.2975    0.7427    1.0695    1.7481
%                 13.9660    0.8580    1.4005    0.7662    1.1767    1.8889
%                 13.9122    0.7966    1.3022    0.8067    1.2131    1.9073];
%  C= [6
%               5
%               4
%               1
%               3
%               6];
%           
%           
%  test=[14.0032    0.8253    1.3530    0.7587    1.1136    1.9115
%        13.6455    0.6933    1.2975    0.6012    1.0018    1.6647];
clc;
clear all;
load iris.mat;
meas_1=meas(1:150,1);
meas_2=meas(1:150,2);
label=species(1:150);
one_label = 'setosa';
T=meas;
C=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
   2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
   3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3];
test=meas;
%function [itrfin] = multisvm( T,C,test )

% %Inputs: T=Training Matrix, C=Group, test=Testing matrix Outputs:
% %itrfin=Resultant class(Group,USE ROW VECTOR MATRIX) to which tst set
% %belongs 
 itrind=size(test,1);
 itrfin=[];
 Cb=C;
 Tb=T;
 for tempind=1:itrind
     tst=test(tempind,:);
     C=Cb;
     T=Tb;
     u=unique(C);
     N=length(u);
     c4=[];
     c3=[];
     j=1;
     k=1;
     if(N>2)
         itr=1;
         classes=0;
         cond=max(C)-min(C);
         while((classes~=1)&(itr<=length(u))& size(C,2)>1 & cond>0)
         %This while loop is the multiclass SVM Trick
             c1=(C==u(itr));
             newClass=c1;
             svmStruct = svmtrain(T,newClass,'kernel_function','rbf');   % I am using rbf kernel function, you must change it also
             classes = svmclassify(svmStruct,tst);
         
             % This is the loop for Reduction of Training Set
             for i=1:size(newClass,2)
                 if newClass(1,i)==0;
                     c3(k,:)=T(i,:);
                     k=k+1;
                 end
             end
         T=c3;
         c3=[];
         k=1;
         
             % This is the loop for reduction of group
             for i=1:size(newClass,2)
                 if newClass(1,i)==0;
                     c4(1,j)=C(1,i);
                     j=j+1;
                 end
             end
         C=c4;
         c4=[];
         j=1;
         
         cond=max(C)-min(C); % Condition for avoiding group 
                             %to contain similar type of values and the
                             %reduce them to process
         
             % This condition can select the particular value of iteration
             % base on classes
             if classes~=1
                 itr=itr+1;
             end    
         end
     end
 
 valt=Cb==u(itr);		% This logic is used to allow classification
 val=Cb(valt==1);		% of multiple rows testing matrix
 val=unique(val);
 itrfin(tempind,:)=val;  
 end

%