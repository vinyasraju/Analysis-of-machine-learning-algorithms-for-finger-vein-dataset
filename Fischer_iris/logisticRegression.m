% clear ; close all; clc;
 
 data = load('iris.mat');
 X = data.meas(1:100,[1 2]);
 y = data.species(1:100,: );
 X(:,1)=X(:,1)*10;
 X(:,2)=X(:,2)*10;
 label='setosa';
 y= ismember(y,label);

figure('position',[100 200 500 500]);
 plotData(X, y);  
 legend('SETOSA', 'VERSICOLOR')
 [m, n] = size(X);
 
 X = [ones(m, 1) X];
 initial_theta = zeros(n + 1, 1);
 
 [cost, grad] = costFunction(initial_theta, X, y);
 fprintf('Cost at initial theta (zeros): %f\n', cost);
 fprintf(' %f \n', grad);

 
 options = optimset('GradObj', 'on', 'MaxIter', 400);
 
 theta = fminunc(@(t)(costFunction(t, X, y)),initial_theta, options);
 
fprintf('theta: \n');
fprintf(' %f \n', theta);
figure('position',[800 200 500 500]);
plotDecisionBoundary(theta, X, y);


hold on;
 xlabel('Sepal Length');
 ylabel('Sepal Width');

axis([40 80 10 60]);


legend('SETOSA', 'VERSICOLOR')
hold off;
p = predict(theta, X);

fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
