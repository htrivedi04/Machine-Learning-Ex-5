function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

% Linear Hypothesis calc
h_theta = X * theta;

% Cost Function
J = 1 / (2 * m) * sum((h_theta - y) .^ 2);

% The Bias can't be regularized... because it's a regulator!
theta1 = [0 ; theta(2:size(theta), :)];

% penalty (Regularization)
Reg = lambda * sum(theta1 .^ 2) / (2 * m);

J = J + Reg;


% =========================================================================

% Gradient following the formula
grad =  ( X' * (h_theta - y) + lambda*theta1 ) / m;

grad = grad(:);

end
