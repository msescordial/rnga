function [p] = node_position(route,node)
    len = length(route);
    
    for i=1:len
        if (route(1,i) == node)
            p = i;
        end
    end

end