% clear ; close all; clc;

fprintf('Plotting Input Data ...\n')
data = load('iris.mat');
data1=data.meas;
data2=data.species;

X = data1(1:50, 1);
y = data1(1:50, 2);
m = length(y); 
plotData(X, y);

X = [ones(m, 1), data1(1:50,1)]; 
theta = zeros(2, 1); 
iterations = 1500; 
alpha = 0.01;

fprintf("The first cost is %f\n",computeCost(X, y, theta));

fprintf('Press Enter to Applying Gradient Descent ...\n');
theta = gradientDescent(X, y, theta, alpha, iterations);  
fprintf('Theta found by gradient descent: ');
fprintf('%f %f \n', theta(1), theta(2));

hold on; 
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
hold off