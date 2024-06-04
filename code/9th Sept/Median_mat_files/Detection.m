clc
clear all
load datakundu
data=input('Data');
pause;
Y=RG_all(data');
[z,I]=max(Y);
if I==1
    color='red'
else
    color='green'
end
