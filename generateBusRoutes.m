% Input: 
% 1. netCostMatrix (Distance Matrix)
% 2. k (for k-shortest path algorithm)
% Output:
% 1. BusRouteID - 3-column cell array
%                 (1st column: ID, 2nd column: Route, 3rd column: Cost
% 2. AllPaths - 2nd column of BusRouteID 
% 3. AllCosts - 3rd column of BusRouteID
% 4. no_of_routes - total no. of routes



function [BusRouteID, AllPaths, AllCosts, no_of_routes] = generateBusRoutes(netCostMatrix,k)
    no_of_routes = 0;
    n = size(netCostMatrix,1); 
    AllPaths = zeros(1,n);      % to list all Paths/Routes Generated
    AllCosts = zeros(1,1);      % to list all Costs of Paths/Routes Generated
    kp = 1;
    for source = 1:n           
        for destination = 1:n     

            % Call kShortestPath 
            [shortestPaths, totalCosts] = kSP(netCostMatrix, source, destination, k);

            for i = 1: length(shortestPaths)
                % fprintf('Path # %d:\n',i);
                % disp(shortestPaths{i})
                % fprintf('Cost of path %d is %5.2f\n\n',i,totalCosts(i));
            	no_of_routes = no_of_routes + 1;       
                b = length(shortestPaths{i});
                AllPaths(kp,1:b)=shortestPaths{i};
                AllCosts(kp,1)=totalCosts(i);
                kp = kp+1;
            end   
        end  
    end
    
    no_of_routes = kp-1;
    
    % Displaying the Paths and Costs
    % for j=1:no_of_routes
    %    fprintf('Path %d:\n',j); disp(AllPaths{j});
    %    fprintf('Cost of Path %d:\n',j); disp(AllCosts(j));
    % end
    
    % fprintf('All %d Paths:\n',no_of_routes); disp(AllPaths);
    % fprintf('All Costs of %d Paths:\n',no_of_routes); disp(AllCosts);
    
    % Assigning Bus Route IDS    
    BusRouteID = [];
    for i=1:no_of_routes
        BusRouteID{i,1} = i;
        BusRouteID{i,2} = AllPaths(i,:);
        BusRouteID{i,3} = AllCosts(i);
    end
    %fprintf('BusRouteID \n', no_of_routes); disp(BusRouteID);
end