function [labels] = hard_hfs(X, Y, graph_param, laplacian_param)
% function [labels] = hard_hfs(X, Y, graph_param, laplacian_param)
%  a skeleton function to perform hard (constrained) HFS,
%  needs to be completed
%
%  Input
%  X:
%      (n x m) matrix of m-dimensional samples
%  Y:
%      (n x 1) vector with nodes labels [1, ... , num_classes] (0 is unlabeled)
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
% y = (l x c) target vector                                     %
% l_idx = (l x 1) vector with indices of labeled nodes          %
% u_idx = (u x 1) vector with indices of unlabeled nodes        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

c = 1:num_samples;

l_idx = c(Y != 0);
u_idx = c(Y == 0);

y = zeros(num_classes-1,length(l_idx));

for l = 1:length(l_idx)
  y(:,l) = -1;
  y(Y(l_idx(l)),l) = 1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% compute the hfs solution, remember that you can use           %
%   build_laplacian_regularized and build_similarity_graph      %
% f_l = (l x 1) hfs solution for labeled nodes                  %
% f_u = (u x 1) hfs solution for unlabeled nodes                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

W = build_similarity_graph(X, graph_param);
L = build_laplacian_regularized(X, graph_param, laplacian_param);

f_l = y;
f_u = (L(u_idx,u_idx) + gamma*eye(size(L(u_idx,u_idx))))^(-1)*(W(u_idx,l_idx)*f_l');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% compute the labels assignment from the hfs solution           %
% label: (n x 1) class assignments [1,2,...,num_classes]        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 [ mx llabels] = max(f_l);
 [ mx ulabels] = max(f_u');
labels = ones(num_samples,1);
labels(l_idx) = llabels;
labels(u_idx) = ulabels;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
