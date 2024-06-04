function [Y,Xf,Af] = myNeuralNetworkFunction(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 09-Sep-2016 17:58:25.
%
% [Y] = myNeuralNetworkFunction(X,~,~) takes these arguments:
%
%   X = 1xTS cell, 1 inputs over TS timsteps
%   Each X{1,ts} = 12xQ matrix, input #1 at timestep ts.
%
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 3xQ matrix, output #1 at timestep ts.
%
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1_xoffset = [1.68225153850844;1.687733747403;1.70088193744179;3.56593361078692;3.45662522547845;3.60147221533988;0.723617941859257;0.725898031813287;0.726295797281729;13.3568434105256;16.760881830131;16.5455405226762];
x1_step1_gain = [2.42406547682654;2.32126603953241;2.4914707519352;0.71947883299075;0.780979935688948;0.758646775899407;8.21798826519336;6.53337286453065;6.32832003762608;0.151652096975256;0.176463631872773;0.190781257935949];
x1_step1_ymin = -1;

% Layer 1
b1 = [-1.8325183570601948;-1.5590683353916632;1.1854510657667117;-1.9958921152076647;-1.7893066935696915;1.7563009736975597;-0.067690030867895851;0.21132656319664586;-0.79421854927666857;0.70717776404057942;-0.65316191764884179;0.32912631721089175;-0.26480163619565789;1.5435731746383334;1.2836244717892187;-0.48998403320764661;-1.9642593366327068;-1.4188989848562426;-1.1676939441079055;2.1643566701290795];
IW1_1 = [0.83231541979047019 0.92360379636431467 -1.2457206407568913 1.1677176493449248 0.78181194240926266 -0.15400111558566235 -0.8380353728017248 -1.5893365665804402 0.0079094612733507999 -0.82131400267058186 -1.0596839380537901 0.23051188310248463;-0.38545303893934846 -1.7932646441774984 0.50484098140103739 -1.0397193475107287 0.042061482073686901 -0.19723157301571151 -1.0990943574490812 0.19553208479146683 1.4905956527766142 0.34070879573488594 0.053205733632759648 -1.2888713801723588;-1.4419585847223106 0.21551558020734718 -0.75259281071217388 -0.44331517987028074 -1.3766021433918589 0.0033837051241165719 -1.8250703270625448 -0.28185493994491845 -1.3349033782039259 -0.63254233602636778 0.68410134273076617 0.21900874544300136;0.87369541751231883 -0.020767268905388252 -0.9394029128679241 0.52867384749432533 0.99469827999795013 -0.29749809322182436 -0.35394458271299645 0.59143863317226586 0.035075459926747016 -0.26550536374951378 0.085443805295266573 -0.22745116916618047;0.46505638305155661 0.59289422685480808 1.5972858423687717 -0.40719885076640899 1.9828529168773725 0.32017967712180573 -2.0403743853229579 0.175044262854197 -2.4938211192558293 -0.0095685810788715443 -1.2666440230360627 0.043341599615354394;-1.2205624575125549 0.48424693241058397 2.1931384137348395 -0.5697456236013313 0.6014471276612473 0.76785908046818963 1.4361687659914459 0.81099002560297073 -0.64026483406974277 -0.3540709125395774 -1.2991807507663364 1.3426972002515973;-0.0063721285668570382 -1.3853463845550409 1.6196406581615315 -0.0037648079867028715 -0.44915393495796119 -0.77197608964474618 1.8786551946605832 1.3795027292507298 -1.2498694843902909 2.2855425453548914 0.00034637358301684929 0.027304667807371931;-0.75392295056939485 1.425649740763169 1.0673494691489185 0.47614742587192999 -1.9972692270501433 0.29162106853187475 1.3674800410069674 1.6875969502386166 0.33986822787710574 -0.045702314461384376 0.3424057580798287 0.4272560577452712;-1.6029217547267656 1.3069802183241073 -0.81220228889733004 -2.2087234064940895 -2.4605540803538672 -1.5085865092763591 0.077424127555476854 -1.4437778825837126 -1.6160982979180953 -0.24423527242542012 0.17510851022686078 -0.52314737890546525;-0.8129794249227954 -0.057053982558548502 0.37663248313052761 -0.39045034816951413 0.1600198166973556 0.7086704209809036 -0.36099804190658619 -0.43266021700414048 0.13527486203826672 0.22039965398995273 -0.50066635264100556 -0.72900354143774715;-2.396574648658683 -0.41107281805639334 -2.3210502879796393 1.4527568842545162 -0.9507056789844549 1.5171381419137198 -1.3645779272441225 -1.3499980744219582 0.56736284530987935 1.3410955810436911 0.011265395646232572 1.3940359061650758;0.86632198573224606 -0.2876696777932411 -0.081150215061899691 0.94008187348916028 -0.50161581332236216 -0.52702827941880759 1.5892894733965721 0.59954513470645077 -0.090001796302119796 1.4070931595638316 -0.45746755599594802 0.14425322880022515;-1.7528980208291984 0.84096139265682868 -0.85599280943125911 0.5819576250702293 1.133198662295027 0.9493928672605203 0.71870952705649427 -0.92609871883342854 -2.1116798903805329 0.38028102059725882 0.3578045414071559 -0.86349725792838261;1.3884136626636618 1.6247666958975673 0.45682274286677416 -1.61089293307014 0.40262212099494316 0.81993213394889541 -0.082978886242014646 0.74753992548092141 0.81536550433214328 -0.71379979726000087 -1.3894538664043452 0.024578823807204338;0.45526921487834926 0.18019476476681051 -0.65199128304264631 -1.0204479024710844 -0.040275331244510888 -0.90404994947997919 -0.95527592918027371 0.97277584853610555 -1.1399917528357622 0.71414828090070015 -0.063971751461255222 0.062129438949488372;-1.3290764948932641 2.2218290714004127 -0.36937717467780723 1.8651339718647959 -0.45394482083053211 0.14143881179639969 1.1473293325005314 0.88383742550623323 0.11937528781411269 -0.16736401849820556 -0.29114962221958157 0.99025837237335357;-0.57465945563817178 0.045777754965562009 -0.96436573576724216 0.54159650392552383 -1.3942164836548123 -1.2030865758570348 -1.3018503437493461 -0.19867534417060134 -0.34085796015452718 -0.41431620422286636 1.8204860691480769 0.34109056327716281;-0.87760435682195759 -0.81036913617316786 -0.41906648194899737 -0.24909870691539662 -0.091216779359625869 0.28585814627191664 -1.3115492169758816 -1.0373921717147154 -0.20159651894774347 -1.4827254690832183 -0.9635595985056119 -1.7574370143075966;-0.71126018206184083 0.63640320156863228 -2.0332318693336768 0.14938530810463974 -0.53347124901939358 -0.47707485073075229 1.5588080456542042 -0.3695807254529887 -0.3751004625883167 0.49178675810296157 -0.18595419094694932 -0.31042485155745098;1.0906483826858033 0.92701964586911623 0.87165542926713391 0.89377231300127558 0.34524256682371851 -0.83479078992141043 1.3009215777913401 -0.26009867920956137 0.80888940216960292 -0.080927087104578882 1.3387427878567559 -1.7703386100623275];

% Layer 2
b2 = [-0.63043147770921903;-0.37230887691691056;1.7218220097836854];
LW2_1 = [-0.30051649842308581 1.0425102263487682 1.1921681804843867 -0.021640337532927011 1.2725262105713362 1.7067457476871888 -0.47896903803287871 1.8784581931072672 1.558888290926749 0.19054012315924196 1.4035429699583784 -0.15194002632439688 -1.4854978638430971 -1.4807256515258429 0.99041786069744764 0.87709559248570779 -2.5221284478189645 -0.48484964828967098 1.0818157970989046 1.1676269711681253;-1.4151645560292838 -2.1832303992601569 -1.1330676181916866 -0.60386710035045266 0.30044944837934745 -0.10659261413795693 2.5287621576622761 -1.937634228892231 0.60823802402713745 0.40037386073859821 0.76838686335180062 0.50947950663633801 -0.015566724865987924 1.6919099138732403 -1.0146212041087184 -1.4158850002890726 1.3912011980807653 -0.42691218099560158 -0.97911041627855167 -1.8696155348948911;1.0175056787934382 1.1146184160089811 0.12023910058172076 0.19849495983929866 -2.1462815620099449 -0.90697342122327096 -0.52895861119607523 1.006247705215972 -3.7397159194324363 -0.44316906404668932 -2.4871342955460394 -0.63176944052717998 1.6009682550155799 -0.36879215583394487 2.2206409737700499 1.462645819520076 1.3025907510347479 1.9292020416281672 -0.68070635528440826 1.067681879108541];

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX, X = {X}; end;

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
    Q = size(X{1},2); % samples/series
else
    Q = 0;
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS
    
    % Input 1
    Xp1 = mapminmax_apply(X{1,ts},x1_step1_gain,x1_step1_xoffset,x1_step1_ymin);
    
    % Layer 1
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*Xp1);
    
    % Layer 2
    a2 = softmax_apply(repmat(b2,1,Q) + LW2_1*a1);
    
    % Output 1
    Y{1,ts} = a2;
end

% Final Delay States
Xf = cell(1,0);
Af = cell(2,0);

% Format Output Arguments
if ~isCellX, Y = cell2mat(Y); end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings_gain,settings_xoffset,settings_ymin)
y = bsxfun(@minus,x,settings_xoffset);
y = bsxfun(@times,y,settings_gain);
y = bsxfun(@plus,y,settings_ymin);
end

% Competitive Soft Transfer Function
function a = softmax_apply(n)
nmax = max(n,[],1);
n = bsxfun(@minus,n,nmax);
numer = exp(n);
denom = sum(numer,1);
denom(denom == 0) = 1;
a = bsxfun(@rdivide,numer,denom);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n)
a = 2 ./ (1 + exp(-2*n)) - 1;
end
