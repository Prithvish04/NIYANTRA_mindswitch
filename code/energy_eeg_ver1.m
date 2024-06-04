%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   The following code is to extract the energy parameter from an eeg    % 
%       signal for a complete 1 set of training session                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clc
clear all
close all

% taking input parameter of the alpha beta theta
par.sample_freq=100;
par.lower_cutoff_alpha=8;
par.higher_cutoff_alpha=13;
par.lower_cutoff_beta=13;
par.higher_cutoff_beta=30;
par.lower_cutoff_theta=3;
par.higher_cutoff_theta=8;
par.order_alpha=4;
par.order_beta=4;
par.order_theta=4;


% filter design for alpha beta theata
Wn_alpha=[par.lower_cutoff_alpha par.higher_cutoff_alpha]/par.sample_freq;
Wn_beta=[par.lower_cutoff_beta par.higher_cutoff_beta]/par.sample_freq;
Wn_theta=[par.lower_cutoff_theta par.higher_cutoff_theta]/par.sample_freq;
[B_alpha,A_alpha] = butter(par.order_alpha,Wn_alpha)
[B_beta,A_beta] = butter(par.order_beta,Wn_beta)
[B_theta,A_theta] = butter(par.order_theta,Wn_theta)

% setting up path and reading data from the xlsx file
cd 'C:\Users\Prithvish\Desktop\Niyantra\9th Sept'
input_file=input('Enter the file name');
[pathstr,name,ext] = fileparts(char(input_file));
[status,sheet]=xlsfinfo(char(input_file));
mkdir(name);
cd(name);
size_sheet=size(sheet);
energy=[];

for j=1:size_sheet(2)
    cd ..
    Energy_alpha=0;
    Energy_beta=0;
    Energy_theta=0;
    Energy_overall=0;
    % raw_eeg signal extraction
    raw_eeg=xlsread(char(input_file),char(sheet(size_sheet(2)-j+1)),'');
    cd(name);
    raw_eeg_size=size(raw_eeg);
    raw_eeg=raw_eeg(9:raw_eeg_size(1),1:2);
    
    % filter eeg signal into alpha beta and theta bands
    alpha_filt_eeg = filtfilt(B_alpha,A_alpha,raw_eeg(:,2));
    beta_filt_eeg = filter(B_beta,A_beta,raw_eeg(:,2));
    theta_filt_eeg = filter(B_theta,A_theta,raw_eeg(:,2));
       alpha_filt_eeg =alpha_filt_eeg (100:end);
       beta_filt_eeg =beta_filt_eeg (100:end);
       theta_filt_eeg =theta_filt_eeg (100:end);
    % calculating energy for individual bands
    for k=1:length(alpha_filt_eeg)
        Energy_alpha=((alpha_filt_eeg(k))^2)+Energy_alpha;
        Energy_beta=((beta_filt_eeg(k))^2)+Energy_beta;
        Energy_theta=((theta_filt_eeg(k))^2)+Energy_theta;
        Energy_overall=(raw_eeg(k,2)^2)+Energy_overall;
    end
    Energy_vector_alpha(j)=Energy_alpha;
    Energy_vector_beta(j)=Energy_beta;
    Energy_vector_theta(j)=Energy_theta;
    Energy_vector_overall(j)=Energy_overall;
end
sum=Energy_vector_alpha+Energy_vector_beta+Energy_vector_theta;
x=Energy_vector_alpha./sum;
y=Energy_vector_beta./sum;
z=Energy_vector_theta./sum;
% X=[x(7) x(8) x(9); x(13) x(14) x(15); x(19) x(20) x(21)]*100
% Y=[y(7) x(8) y(9); y(13) y(14) y(15); y(19) y(20) y(21)]*100
% Z=[z(7) z(8) z(9); z(13) z(14) z(15); z(19) z(20) z(21)]*100
% creating a cluster array
% finding energy in only color frames
% plotting energy with the regression 
% q1=1:length(Energy_vector_alpha);
% [r1,m1,b1]=regression(q1,Energy_vector_alpha)
% y1=m1*q1+b1
% req_plot=figure('visible','on')
% hold on
% plot(q1,y1)
% [pks1 locs1] = findpeaks(Energy_vector_alpha)
% plot(locs1,pks1,'g')
% saveas(req_plot,'regression_plot_no_overlap','jpg')
% hold off
% %cd ..

