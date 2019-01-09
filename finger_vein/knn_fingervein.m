clc;
clear all;
load('person1.mat');
load('person2.mat');

j=1;
for i = 1: 5 : 160
   %disp(i);
   T1 = person1(i:i+4,1);
   T1=T1';
   X1(j,:)=std(T1);
   T2 = person2(i:i+4,1);
   T2=T2';
   X2(j,:)=std(T2);
   j=j+1;  
end

j=1;
for i = 161: 5 : 320
   %disp(i);
   T1 = person1(i:i+4,1);
   T1=T1';
   Y1(j,:)=std(T1);
   T2 = person2(i:i+4,1);
   T2=T2';
   Y2(j,:)=std(T2);
   j=j+1;   
end
plot(X1,Y1, 'b.', 'MarkerSize', 15);
axis([0 0.03 0 0.02]);

hold on;

plot(X2,Y2, 'g.', 'MarkerSize', 15);
hold on
A=cat(1,X1,X2);
A=A';
B=cat(1,Y1,Y2);
B=B';

A=cat(1,A,B);

disp(A);
count=0;
count1=0;
P=(0.014).*rand(1);

Q=(0.03).*rand(1);
R=[Q,P];

R=R';

plot(R(1,1),R(2,1),'r*');

I = nearestneighbour(R, A, 'NumberOfNeighbours', 3)
disp(R);

I=I';
p1 = repmat(R(1,1), 1, 3);
p2 = repmat(R(2,1), 1, 3);

if( I(1,1)< 32)
    count=count+1;
else 
    count1=count1+1;
end
   if( I(2,1)< 32)
    count=count+1;
else 
    count1=count1+1;
   end
   
    if( I(3,1)< 32)
    count=count+1;
   else 
    count1=count1+1;
    end
 if(count1>count)
     disp('Person 1');
 else
      disp('Person 2');
 end 
quiver(p1, p2, A(1, I(:, 1)) - p1, A(2, I(:, 1)) - p2, 0, 'k')
legend('person2','person1','sample','location','northwest');
hold off