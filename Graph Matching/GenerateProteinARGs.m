function [ proteinARG,protein ] = GenerateProteinARGs( start_sequence,end_sequence, fileName,distance_cutoff)
    
    protein = csvread(fileName);
    protein = protein(start_sequence:end_sequence,:);
    number_of_AA = size(protein,1);

    proteinStructure = zeros(number_of_AA);

    proteinAtrs = zeros([number_of_AA,1]);

    for i = 1:number_of_AA

        proteinAtrs(i) = protein(i,2);

        for j = i+1:number_of_AA
            x1=protein(i,3);
            y1=protein(i,4);
            z1=protein(i,5);
            x2=protein(j,3);
            y2=protein(j,4);
            z2=protein(j,5);
            dist = sqrt((x1-x2)^2+(y1-y2)^2+(z1-z2)^2);
            dist = dist*(dist<=distance_cutoff);
            proteinStructure(i,j)=dist;
            proteinStructure(j,i)=dist;
        end
    end
    
    proteinARG = ARG(proteinStructure,proteinAtrs);
end