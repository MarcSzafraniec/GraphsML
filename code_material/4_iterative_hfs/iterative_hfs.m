function [labels, accuracy] = iterative_hfs(T)
% function [labels, accuracy] = iterative_hfs(t)
% a skeleton function to perform HFS, needs to be completed
%  Input
%  T:
%      number of iterations to use for the iterative propagation

%  Output
%  labels:
%      class assignments for each (n) nodes
%  accuracy

% load the data

in_data = load('data/data_iterative_hfs_graph.mat');

W = in_data.W;
Y = in_data.Y;
Y_masked =  in_data.Y_masked;

num_samples = size(W,1);
num_classes = sum(unique(Y) ~= 0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% compute the target y for the linear system                       %
% y = (l x num_classes) target vector                              %
% l_idx = (l x num_classes) vector with indices of labeled nodes   %
% u_idx = (u x num_classes) vector with indices of unlabeled nodes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

l_idx = ;
u_idx = ;

y = ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% compute the hfs solution, using iterated averaging            %
% remember that column-wise slicing is cheap, row-wise          %
% expensive and that W is already undirected                    %
% f_l = (l x num_classes) hfs solution for labeled              %
% f_u = (u x num_classes) hfs solution for unlabeled            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f_l = ;
f_u = ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% compute the labels assignment from the hfs solution           %
% label: (n x 1) class assignments [1,2,...,num_classes]        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

labels = ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

accuracy = mean(labels == Y)
