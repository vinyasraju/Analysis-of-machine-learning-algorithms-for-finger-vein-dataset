% three points of interest
clc;
load fisheriris

X = meas(51:150,3:4);
X=X';
P=0.5+(2.9-0.5).*rand(1);

Q=2.5+(7.5-2.5).*rand(1);
R=[Q,P];

R=R';

plot(R(1,1),R(2,1),'g*');

disp(R)


% 4 nearest neighbours to each point
I = nearestneighbour(R, X, 'NumberOfNeighbours', 3)
disp(I)
I=I';
hold on
plot(X(1,1), X(2, 1), 'r.','MarkerSize', 15);
plot(X(1,51), X(2, 51), 'b.','MarkerSize', 15)


for j=2 : 50
    
plot(X(1,j), X(2, j), 'r.','MarkerSize', 15);


end
count=0;
count1=0;

for k=52 : 100
plot(X(1,k), X(2, k), 'b.','MarkerSize', 15)
end

if( I(1,1)< 50)
    count=count+1;
else 
    count1=count1+1;
end
   if( I(2,1)< 50)
    count=count+1;
else 
    count1=count1+1;
   end
   
    if( I(3,1)< 50)
    count=count+1;
   else 
    count1=count1+1;
    end
 if(count1>count)
     disp('setosa');
 else
      disp('virginia');
 end 

hold on
p1 = repmat(R(1,1),1,3);
p2 = repmat(R(2,1),1,3);

quiver(p1, p2, X(1, I(:, 1)) - p1, X(2, I(:, 1)) - p2, 0, 'k')
legend('point of interest','virginia','setosa','location','northwest');
hold off