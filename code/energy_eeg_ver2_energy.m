%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   The following code is to extract the energy parameter from an eeg    % 
%       signal for a complete 1 set of training session                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear all
close all

format long  

% taking input parameter of the alpha,beta and theta
par.sample_freq=256;
par.lower_cutoff_alpha=8;
par.higher_cutoff_alpha=13;
par.lower_cutoff_beta=13;
par.higher_cutoff_beta=40;
par.lower_cutoff_theta=4;
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


Energy_alpha_subjects=[];
Energy_beta_subjects=[];
Energy_theta_subjects=[];
cd 'c:\Users\Prithvish\Desktop\Niyantra\26th Aug\RGB'
allFiles = dir( 'c:\Users\Prithvish\Desktop\Niyantra\26th Aug\RGB' );
allNames = { allFiles.name };
size_file=size(allNames);
for i=3:(size_file(2))    
    % setting up path and reading data from the xlsx file   
    [pathstr,name,ext] = fileparts(char(allNames(i)));
    [status,sheet]=xlsfinfo(char(allNames(i)));
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
        raw_eeg=xlsread(char(allNames(i)),char(sheet(size_sheet(2)-j+1)),'');
        cd(name);
        raw_eeg_size=size(raw_eeg);
        raw_eeg=raw_eeg(9:raw_eeg_size(1),1:2);
    
        % filter eeg signal into alpha beta and theta bands
        alpha_filt_eeg = filtfilt(B_alpha,A_alpha,raw_eeg(:,2));
        beta_filt_eeg = filtfilt(B_beta,A_beta,raw_eeg(:,2));
        theta_filt_eeg = filtfilt(B_theta,A_theta,raw_eeg(:,2));
        alpha_filt_eeg=alpha_filt_eeg(100:end,:);
        beta_filt_eeg=beta_filt_eeg(100:end,:);
        theta_filt_eeg=theta_filt_eeg(100:end,:);
        alpha=figure('visible','off')
        plot(alpha_filt_eeg)
        %saveas(alpha,strcat('alpha_',char(j)),'jpg')
        beta=figure('visible','off')
        plot(beta_filt_eeg)
        %saveas(beta,strcat('beta_',char(j)),'jpg')
        theta=figure('visible','off')
        plot(theta_filt_eeg)
        %saveas(theta,strcat('theta_',char(j)),'jpg')
    
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
    cd ..
    Energy_alpha_subjects=[Energy_alpha_subjects;Energy_vector_alpha]
    Energy_beta_subjects=[Energy_beta_subjects;Energy_vector_beta]
    Energy_theta_subjects=[Energy_theta_subjects;Energy_vector_theta]
end




% finding the percent energy in only color frames
Energy_sum=Energy_alpha_subjects+Energy_beta_subjects+Energy_theta_subjects;
alpha_percent=(Energy_alpha_subjects./Energy_sum)*100
beta_percent=(Energy_beta_subjects./Energy_sum)*100
theta_percent=(Energy_theta_subjects./Energy_sum)*100


% 
% color_alpha_percent=[];
% color_beta_percent=[];
% color_theta_percent=[];
% for i=1:3
%     color_alpha_percent=[color_alpha_percent Energy_vector_alpha(6*i-2)];
%     color_alpha_percent=[color_alpha_percent Energy_vector_alpha(6*i-1)];
%     color_alpha_percent=[color_alpha_percent Energy_vector_alpha(6*i)];
%     color_beta_percent=[color_beta_percent Energy_vector_beta(6*i-2)];
%     color_beta_percent=[color_beta_percent Energy_vector_beta(6*i-1)];
%     color_beta_percent=[color_beta_percent Energy_vector_beta(6*i)];
%     color_theta_percent=[color_theta_percent Energy_vector_theta(6*i-2)];
%     color_theta_percent=[color_theta_percent Energy_vector_theta(6*i-1)];
%     color_theta_percent=[color_theta_percent Energy_vector_theta(6*i)];
% end
% creating a cluster array
% plotting energy with the regression 
% 
% 
% 
% 
% 
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

