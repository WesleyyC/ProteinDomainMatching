function [c] = edge_compatibility(edge1, edge2)
    % edge_compatibility function is used to calculate the similarity
    % between edges
    
    % the score is between [0,1]
    
    % the higher the score, the more similiarity are there between edge1
    % and edge2
    
    % this function can be define by the user, but in our case is
    % c(E,e)=1-3|E-e|;
    
    % assume node1 and node2 are node object
    
    weight_range = 9;  %update with GenerateProteinARGs
    
    c = 0;
    
    %The range of the edge rate
    if ~edge1.trueEdge()||~edge2.trueEdge()
        return;
    else     
        %normalize the score
        c = 1-3*abs(edge1.weight-edge2.weight)/weight_range;
    end

end

