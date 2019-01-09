% clear ; close all; clc;
 load var
 X = person1(1:316,[1 2]);
 y = person_label(1:316,1);
 X(:,1)=X(:,1)*100;
 X(:,2)=X(:,2)*100;
 label='Person1';
 y= ismember(y,label);

figure('position',[100 200 500 500]);
 plotData(X, y); 
 xlabel('Major Axis Length');
 ylabel('Minor Axis Length');
 legend('Person2', 'Person1')

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
 xlabel('Major Axis Length');
 ylabel('Minor Axis Length');

axis([8 30 5.5 10]);
legend('Person2', 'Person1');
hold off;
p = predict(theta, X);

fprintf('\n\nTrain Accuracy: %f\n', mean(double(p == y)) * 100);

