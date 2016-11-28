function labels = soft_hfs(X, Y, c_l, c_u, graph_param, laplacian_param)
% function [Y] = soft_hfs(X, Y, c_l, c_u, graph_param, laplacian_param)
%  a skeleton function to perform soft (unconstrained) HFS,
%  needs to be completed
%
%  Input
%  X:
%      (n x m) matrix of m-dimensional samples
%  Y:
%      (n x 1) vector with nodes labels [1, ... , num_classes] (0 is unlabeled)
%  c_l,c_u:
%      coefficients for C matrix
%  graph_param:
%      structure containing the graph construction parameters as fields
%  laplacian_param:
%      structure containing the laplacian construction parameters as fields
%
%  Output
%  labels:
%      class assignments for each (n) nodes

num_samples = size(X,1);
num_classes = length(unique(Y));
gamma = laplacian_param.regularization;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% compute the target y for the linear system                    %
% y = (n x num_classes) target vector                           %
% l_idx = (l x 1) vector with indices of labeled nodes          %
% u_idx = (u x 1) vector with indices of unlabeled nodes        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

c = 1:num_samples;

l_idx = c(Y != 0);
u_idx = c(Y == 0);

y = zeros(num_classes-1,num_samples);

for l = 1:length(l_idx)
  y(:,l_idx(l)) = -1;
  y(Y(l_idx(l)),l_idx(l)) = 1;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% compute the hfs solution, remember that you can use           %
%   build_laplacian_regularized and build_similarity_graph      %
% f = (n x 1) hfs solution for labeled nodes                    %
% C = (n x n) diagonal matrix with c_l for labeled samples      %
%             and c_u otherwise                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
W = build_similarity_graph(X, graph_param);
L = build_laplacian_regularized(X, graph_param, laplacian_param);

C = diag((c_l-c_u)*(Y != 0) + c_u);

Q = L + gamma*eye(size(L));
f = (C^(-1)*Q + eye(size(L)))^(-1)*y';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% compute the labels assignment from the hfs solution           %
% label: (n x 1) class assignments [1, ... ,num_classes]        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[ mx llabels] = max(f');
 labels = llabels';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
