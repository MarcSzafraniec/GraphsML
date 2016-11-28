function [new_label] = online_ssl_compute_solution(t, online_cover_state, Y, gamma_g)
% [new_label] = online_ssl_compute_solution(t, online_cover_state, Y, gamma_g)
%     Computes the HFS solution given an online cover and labels
%
% Input
% t:
%     the current time step
% online_cover_state:
%     the current cover state, returned by online_ssl_update_centroids.m
% Y:
%     (n x 1) label vector
%
%  gamma_g:
%      regularization constant
%
% Output
% new_label:
%     computed label for the sample received at time t

centroids = online_cover_state.centroids;
nodes_to_centroids_map = online_cover_state.nodes_to_centroids_map;
centroids_to_nodes_map = online_cover_state.centroids_to_nodes_map;

num_centroids = size(centroids,1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% choose the experiment parameter                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

graph_param.graph_type = ; %'knn' or 'eps'
graph_param.graph_thresh = ; % the number of neighbours for the graph or the epsilon threshold
graph_param.sigma2 = ; % exponential_euclidean's sigma^2

laplacian_param_regularization = ; %regularization to add to the laplacian (\gamma_g)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% use the build_similarity_graph function to build the          %
% graph W, the similarity matrix on the centroids               %
% W_tilda_q: (num_centroids x num_centroids) dimensional matrix %
% representing the adjacency matrix of the graph                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

W_tilda_q = ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% build the multiplicites vector v and the normalized W_q       %
% v: (num_centroids x 1) vector                                 %
% V: (num_centroids x num_centroids) diagonal matrix built      %
%       from v                                                  %
% W_q: (num_centroids x num_centroids) dimensional matrix       %
% representing the normalized adjacency matrix of the graph     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i = 1:num_centroids
    v(-----------) = sum(----------- == -----------(-----------));
end

V = ;
W_q = ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% compute the quantized laplacian                               %
% L: (num_centroids x num_centroids) quantized laplacian        %
% Q: (num_centroids x num_centroids) dimensional matrix         %
%     representing the laplacian with gamma_g regularization    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

L = ;
Q = ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% compute the target y for the linear system eigenvector        %
% Y_mapped = (num_centroids x 1) labels of the nodes that are   %
%               currently a representative for a centroid       %
% y = (l x 1) target vector with {+1,-1} entries                %
% l_idx = (l x 1) vector with indices of labeled nodes          %
% u_idx = (u x 1) vector with indices of unlabeled nodes        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Y_mapped = Y(-----------);

l_idx = ;
u_idx = ;

y = ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

y = y(:); %make sure it's a column vector

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% compute the hfs solution
% f_l = (l x 1) hfs solution for labeled nodes                  %
% f_u = (u x 1) hfs solution for unlabeled nodes                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f_l = ;
f_u = ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% compute the labels assignment from the hfs solution           %
% new_label:  {+1, -1, 0} class assignment for new sample       %
% new_label_confidence: confidence for new sample assignment    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

new_label_confidence = f_u(---------- == t);

new_label = ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('label %d confidence %.5f time %d\n', new_label, new_label_confidence, t);
fflush(stdout);
