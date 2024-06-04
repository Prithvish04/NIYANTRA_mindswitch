clc
clear all
format long  
cd 'c:\Users\Prithvish\Desktop\Niyantra\9th Sept\RGB'
load data_all
load target_all
[sample,feature]=size(data_mixed);
[sample,output]=size(target_mixed);
input=[ones(sample,1),data_mixed];
target=target_mixed;
NN=input('Number of neurons for layer: ');
weights.layer1=rand(feature+1,NN(1));
weights.layer2=rand(NN(1)+1,NN(2));
weights.output=rand(NN(2)+1,output);
layer1_output=input*(weights.layer1);
for i=1:sample
    for j=1:NN(1)
        layer1_activation=1/(1+exp(-1*layer1_output(sample,NN(1))));
    end
end
layer1_activation=[ones(sample,1),layer1_activation];
layer2_output=layer1_activation*(weights.layer2);
for i=1:sample
    for j=1:NN(2)
        layer2_activation=1/(1+exp(-1*layer2_output(sample,NN(2))));
    end
end
layer2_activation=[ones(sample,1),layer2_activation];
output_final=layer2_activation*(weights.output);
for i=1:sample
    for j=1:output
        output_activation=1/(1+exp(-1*output_final(sample,output)));
    end
end
alpha=0.5;
delta_output=(target-(output_activation))*((output_activation)*(1-output_activation));



    

