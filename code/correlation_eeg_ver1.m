%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   The following code is to correlate the adjacennt frames of the eeg   % 
%       signal for a complete 1 set of training session                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear all
close all

format long  

% extracting data from the file 
cd 'c:\Users\Prithvish\Desktop\Niyantra\26th Aug'
input_file=input('Enter the file name');
[pathstr,name,ext] = fileparts(char(input_file));
[status,sheet]=xlsfinfo(char(input_file));
mkdir(name);
cd(name);
size_sheet=size(sheet);

sheet=fliplr(sheet);

for k=1:3
    step=k:3:size_sheet(2)
    for j=1:length(step)-1
        cd ..
        raw_extract_1=xlsread(char(input_file),char(sheet(step(j))),'');
        raw_extract_2=xlsread(char(input_file),char(sheet(step(j+1))),'');
        cd(name);
   
        raw_extract_1=raw_extract_1(8:length(raw_extract_1),1:2);
        raw_extract_2=raw_extract_2(8:length(raw_extract_2),1:2);
        time_vector=raw_extract_1(:,1);
        raw_signal_1=raw_extract_1(:,2);
        raw_signal_2=raw_extract_2(:,2);
        correlated_eeg=xcorr(raw_signal_1,raw_signal_2);
        cor_signal=figure('visible','off');
        plot(correlated_eeg);
        saveas(cor_signal,strcat(char(sheet(step(j))),'_',char(sheet(step(j+1))),'_',num2str(k)),'jpg');
    end
end
cd ..
