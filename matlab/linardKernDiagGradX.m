function gX = linardKernDiagGradX(kern, X)


% LINARDKERNDIAGGRADX Gradient of LINARD kernel's diagonal with respect to X.
% FORMAT
% DESC computes the gradient of the diagonal of the automatic relevance determination linear kernel matrix with
% respect to the elements of the design matrix given in X.
% ARG kern : the kernel structure for which gradients are being computed.
% ARG X : the input data in the form of a design matrix.
% RETURN gX : the gradients of the diagonal with respect to each element
% of X. The returned matrix has the same dimensions as X.
%
% SEEALSO : linardKernParamInit, kernDiagGradX, linardkernGradX
%
% COPYRIGHT : Neil D. Lawrence, 2004, 2005, 2006

% SHEFFIELDML


gX = 2*kern.variance*X.*repmat(kern.inputScales, [size(X, 1), 1]);