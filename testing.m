clc

% Example
TimeMatrix = [0 8 inf inf inf inf inf inf inf inf inf inf inf inf inf;
              8 0 2 3 6 inf inf inf inf inf inf inf inf inf inf;
              inf 2 0 inf inf 3 inf inf inf inf inf inf inf inf inf;
              inf 3 inf 0 4 4 inf inf inf inf inf 10 inf inf inf;
              inf 6 inf 4 0 inf inf inf inf inf inf inf inf inf inf;
              inf inf 3 4 inf 0 inf 9 inf inf inf inf inf inf 3;
              inf inf inf inf inf inf 0 inf inf 7 inf inf inf inf 2;
              inf inf inf inf inf 9 inf 0 inf 8 inf inf inf inf 2;
              inf inf inf inf inf inf inf inf 0 inf inf inf inf inf 8;
              inf inf inf inf inf inf 7 8 inf 0 5 inf 10 8 inf;
              inf inf inf inf inf inf inf inf inf 5 0 10 5 inf inf;
              inf inf inf 10 inf inf inf inf inf inf 10 0 inf inf inf;
              inf inf inf inf inf inf inf inf inf 10 5 inf 0 2 inf;
              inf inf inf inf inf inf inf inf inf 8 inf inf 2 0 inf;
              inf inf inf inf inf 3 2 2 8 inf inf inf inf inf 0];
waiting_time = 1;
transfer_time = 5;
          
% Case 1: No Transfer Needed
%i=5;
%j=12;
%common_route = [12 4 5 2 3];
%[tij]=tijCase1(i,j,common_route, waiting_time, TimeMatrix);
%fprintf('\n Time Between Node %d and %d: %d \n\n ', i,j, tij);

% Case 2: One Transfer is Needed
%i = 11;
%j = 10;
%routei = [14 13 11 12 4 5];
%routej = [13 10 7 15 8];

%i = 13;
%j = 6;
%routei = [13 10 7 15 9];
%routej = [11 10 8 15 6 4 5];

%[tij]=tijCase2(i,j,routei, routej, waiting_time, transfer_time, TimeMatrix);
%fprintf('\n Time Between Node %d and %d: %d \n\n ', i,j, tij);

% Case 3: Two Transfers Are Needed
%i = 9;
%j = 3;
%routei = [9 15 8 10 13];
%routef = [10 7 15 6 4 12 11];
%routej = [6 3 2 5 4]; 

%[tij]=tijCase3(i,j,routei, routef, routej, waiting_time, transfer_time, TimeMatrix);
%fprintf('\n Time Between Node %d and %d: %d \n\n ', i,j, tij);

waiting_time = 1;
transfer_time = 5;
%s = 4; 
%S0r =   {[ 10 8 15 6 3 2 1 0 0 0 0 0 0 0 0];
%        [ 6 3 2 5 0 0 0 0 0 0 0 0 0 0 0];
%        [ 4 12 11 13 14 0 0 0 0 0 0 0 0 0 0];
%        [ 9 15 8 10 7 0 0 0 0 0 0 0 0 0 0]};

%SolutionTimeMatrix = TotalTime(S0r,s,TimeMatrix, waiting_time, transfer_time);

%disp("Solution Time Matrix"); disp(SolutionTimeMatrix);


%sor =   {[ 12 11 10 8 6 4 5 2 0 0 0 0 0 0 0];
%        [ 14 10 13 11 12 4 2 1 0 0 0 0 0 0 0];
%        [ 9 15 7 10 8 6 0 0 0 0 0 0 0 0 0];
%        [ 1 2 3 6 8 15 7 10 0 0 0 0 0 0 0]};
%s = 4;

sor = {[1 2 3 6 15 7 10 13 0 0 0 0 0 0 0]; 
    [1 2 5 4 12 11 13 10 0 0 0 0 0 0 0 ]; 
    [9 15 8 6 4 12 0 0 0 0 0 0 0 0 0]; 
    [1 2 3 6 15 9 0 0 0 0 0 0 0 0 0];
    [6 3 2 4 12 11 10 0 0 0 0 0 0 0 0];
    [1 2 5 4 6 8 10 14 0 0 0 0 0 0 0];
    [11 13 14 10 7 15 9 0 0 0 0 0 0 0 0];
    [1 2 3 6 8 10 11 12 0 0 0 0 0 0 0]};
s = 8;

sor_SolutionTimeMatrix = TotalTime(sor,s,TimeMatrix, waiting_time, transfer_time);
obj_val = ObjFuncVal(sor,TravelDemandMatrix,DistanceMatrix,sor_SolutionTimeMatrix,n);
disp("E:"); disp(obj_val);   











%route1 = [13 11 20 7 5 1 0 0 0];
%route2 = [14 10 8 15 9 0 0 0 0];

%[b h] = common_nodes(route1, route2);
%disp("b");

DistanceMatrix = [0 8 inf inf inf inf inf inf inf inf inf inf inf inf inf;
                    8 0 2 3 6 inf inf inf inf inf inf inf inf inf inf;
                    inf 2 0 inf inf 3 inf inf inf inf inf inf inf inf inf;
                    inf 3 inf 0 4 4 inf inf inf inf inf 10 inf inf inf;
                    inf 6 inf 4 0 inf inf inf inf inf inf inf inf inf inf;
                    inf inf 3 4 inf 0 inf 9 inf inf inf inf inf inf 3;
                    inf inf inf inf inf inf 0 inf inf 7 inf inf inf inf 2;
                    inf inf inf inf inf 9 inf 0 inf 8 inf inf inf inf 2;
                    inf inf inf inf inf inf inf inf 0 inf inf inf inf inf 8;
                    inf inf inf inf inf inf 7 8 inf 0 5 inf 10 8 inf;
                    inf inf inf inf inf inf inf inf inf 5 0 10 5 inf inf;
                    inf inf inf 10 inf inf inf inf inf inf 10 0 inf inf inf;
                    inf inf inf inf inf inf inf inf inf 10 5 inf 0 2 inf;
                    inf inf inf inf inf inf inf inf inf 8 inf inf 2 0 inf;
                    inf inf inf inf inf 3 2 2 8 inf inf inf inf inf 0];

%vec = [8 15 6 3 2 1];
%node = 6;
%n = 15;

%new_node = mutation_op(node, DistanceMatrix, vec, n);
%disp("New Node"); disp(new_node);

%[shortestPaths, totalCosts] = kSP(DistanceMatrix, node, 5, 10);
%disp(shortestPaths);

%s = 4;
%n = 15;
%infeasible_solution = [1 2 4 12 11 13 0 0 0 0 0 0 0 0 0 11 10 8 15 6 3 0 0 0 0 0 0 0 0 0 13 10 7 15 6 4 5 0 0 0 0 0 0 0 0 13 11 10 7 15 0 0 0 0 0 0 0 0 0 0];

%[feasible_solution]=repair_infeasibility(infeasible_solution, s, n, DistanceMatrix);



             