clc
clear all
format long  
cd 'c:\Users\DRIZZY\Desktop\Niyantra\Median_mat_files'
load data9
load weights
[sample,feature]=size(data9);
input=[ones(sample,1),data9];
NN=10;
%weights.layer1=rand(feature+1,NN);
% weights.layer2=rand(NN(1)+1,NN(2));
%weights.output=rand(NN+1,output);
layer1_output=input*(weights.layer1);
for i=1:sample
    for j=1:NN
        layer1_activation(i,j)=1/(1+exp(-1*layer1_output(i,j)));
    end
end
layer1_activation=[ones(sample,1),layer1_activation];
% layer2_output=layer1_activation*(weights.layer2);
% for i=1:sample
%     for j=1:NN(2)
%         layer2_activation=1/(1+exp(-1*layer2_output(sample,NN(2))));
%     end
% end
% layer2_activation=[ones(sample,1),layer2_activation];
output_final=layer1_activation*(weights.output);
for i=1:sample
    for j=1:3
        output_activation(i,j)=1/(1+exp(-1*output_final(i,j)));
    end
end