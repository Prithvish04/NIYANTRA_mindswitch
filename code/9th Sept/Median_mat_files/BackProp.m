clc
clear all
format long  
cd 'c:\Users\DRIZZY\Desktop\Niyantra\Median_mat_files'
load data_mixed
load target_mixed
[sample,feature]=size(data_mixed);
[sample,output]=size(target_mixed);
input=[ones(sample,1),data_mixed];
target=target_mixed;
NN=10;
weights.layer1=rand(feature+1,NN);
% weights.layer2=rand(NN(1)+1,NN(2));
weights.output=rand(NN+1,output);
for k=1:10000000
NN=10;
layer1_output=input*(weights.layer1);
for i=1:sample
    for j=1:NN
        layer1_activation(i,j)=1/(1+exp(-1*layer1_output(i,j)));
    end
end
if(k==1)
layer1_activation=[ones(sample,1),layer1_activation];
end
% layer2_output=layer1_activation*(weights.layer2);
% for i=1:sample
%     for j=1:NN(2)
%         layer2_activation=1/(1+exp(-1*layer2_output(sample,NN(2))));
%     end
% end
% layer2_activation=[ones(sample,1),layer2_activation];
output_final=layer1_activation*(weights.output);
for i=1:sample
    for j=1:output
        output_activation(i,j)=1/(1+exp(-1*output_final(i,j)));
    end
end
alpha=0.5;
delta_output=(target-(output_activation)).*((output_activation).*(1-output_activation));
for i=1:output
    deltaWeight.output(:,i)=(((delta_output(:,i))')*layer1_activation)';
end
delta_inputj=(delta_output*(weights.output(2:end,:))');
delta_input=delta_inputj.*((layer1_activation(:,2:end)).*(1-layer1_activation(:,2:end)));
for i=1:NN
    deltaWeight.input(:,i)=(((delta_input(:,i))')*input)';
end
weights.layer1 = weights.layer1 + deltaWeight.input;
weights.output = weights.output + deltaWeight.output;
if(mod(k,100)==0)
    output_activation
    pause;
end
end