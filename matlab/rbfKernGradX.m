function gX = rbfKernGradX(kern, X, X2)

% RBFKERNGRADX Gradient of RBF kernel with respect to input locations.
% FORMAT
% DESC computes the gradident of the radial basis function
% kernel with respect to the input positions where both the row
% positions and column positions are provided separately.
% ARG kern : kernel structure for which gradients are being
% computed.
% ARG x1 : row locations against which gradients are being computed.
% ARG x2 : column locations against which gradients are being computed.
% RETURN g : the returned gradients. The gradients are returned in
% a matrix which is numData2 x numInputs x numData1. Where numData1 is
% the number of data points in X1, numData2 is the number of data
% points in X2 and numInputs is the number of input
% dimensions in X.
%
% SEEALSO : rbfKernParamInit, kernGradX, rbfKernDiagGradX
%
% COPYRIGHT : Neil D. Lawrence, 2004, 2005, 2006

% KERN


gX = zeros(size(X2, 1), size(X2, 2), size(X, 1));
for i = 1:size(X, 1);
  gX(:, :, i) = rbfKernGradXpoint(kern, X(i, :), X2);
end
  

function gX = rbfKernGradXpoint(kern, x, X2)

% RBFKERNGRADXPOINT Gradient with respect to one point of x.

gX = zeros(size(X2));
n2 = dist2(X2, x);
wi2 = (.5 .* kern.inverseWidth);
rbfPart = kern.variance*exp(-n2*wi2);
for i = 1:size(x, 2)
  gX(:, i) = kern.inverseWidth*(X2(:, i) - x(i)).*rbfPart;
end
