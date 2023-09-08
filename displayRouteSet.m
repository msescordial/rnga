function displayRouteSet(S0,BusRouteID)
    s = size(S0,1);
    for b = 1:s
        r = S0(b,1);
        route = BusRouteID{r,2};
        
        fprintf('Route %d:', r);
        displayBusRoute(route);
    end
end