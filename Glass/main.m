clear ; close all; clc;
warning('off','all');
load var2
 X = Sheet1(:,[1 2]);
 y = Sheet1(:,3);
  X(:,1)=X(:,1)*10;
  X(:,2)=X(:,2)*10;
  
fprintf(['Plotting input data \n']);
figure('position',[100 200 500 500]);
plotData(X, y);

hold on;

xlabel('Aluminium')
ylabel('Calcium')
legend('Bulding Window', 'Head Lamp')
hold off;


[m, n] = size(X);
X = [ones(m, 1) X];

initial_theta = zeros(n + 1, 1);

[cost, grad] = costFunction(initial_theta, X, y);

fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf('Gradient at initial theta (zeros): \n');
fprintf(' %f \n', grad);

options = optimset('GradObj', 'on', 'MaxIter', 400);

[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('theta: \n');
fprintf(' %f \n', theta);
figure('position',[800 200 500 500]);
plotDecisionBoundary(theta, X, y);

hold on;

xlabel('Aluminium')
ylabel('Calcium')
axis ([0 25 40 180]);
legend('Bulding Window', 'Head Lamp')
hold off;
p = predict(theta, X);

fprintf('\n\nTrain Accuracy: %f\n', mean(double(p == y)) * 100);