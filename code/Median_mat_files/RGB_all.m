function [Y,Xf,Af] = myNeuralNetworkFunction(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 11-Sep-2016 00:14:35.
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
x1_step1_xoffset = [1.61979124040807;1.55095105336276;1.66415058335307;3.56593361078692;3.45662522547845;3.60147221533988;0.723617941859257;0.725898031813287;0.726295797281729;13.3568434105256;16.0341644910475;13.2878855205591];
x1_step1_gain = [2.21370092252636;1.97367098659041;2.38245543493017;0.71947883299075;0.676700786631049;0.618678865714721;6.05492556554721;6.39335879958422;4.40445406597915;0.0887938864162567;0.0957316763256615;0.0989044886412822];
x1_step1_ymin = -1;

% Layer 1
b1 = [1.4202527310388715;-1.1866959523595444;-1.1587206175383495;-1.6265495662345422;1.142289085577995;1.2525051690514859;-0.071848872350813775;-0.48427508818380738;-0.39781722294249633;-0.15985542008305459;-0.45127669018074307;0.35522974932529677;-1.2519041898013556;-0.66639472467037331;0.13138456137598431;-1.2211811937882231;1.6815255332276466;1.4191025427581596;2.0543317273154731;1.2009761412597022];
IW1_1 = [-0.50696468042460641 2.4744041837077941 0.025560497992660719 0.81188426884452991 -0.12632038461163997 0.45516837434056323 1.2673129895824815 0.21371645180362697 -1.1482265594742689 -0.025636691321273886 0.056949803748595748 -1.1152372169494575;0.19114084055658739 0.44570847153168919 -0.89256182555169128 -2.5892639606617953 -0.30198810431293854 -1.1991676621451994 1.367255662231142 -0.5249683263892938 -0.50793045323982233 0.11235683005462203 0.20726211636372233 0.45237590867173277;1.1037502466401921 -0.7783542948741865 0.68379336877224883 -1.0271122279575624 0.49386399399566228 0.52339478655032812 -0.50411572388488102 0.26927809971804784 0.65189301663510746 -0.46712135727551612 0.70413181768311528 1.1891347278377402;0.49000321163642735 0.78310799068672876 0.52445431683081856 0.30976147029511319 0.086161612062304202 0.22833594550624572 0.29592024569689179 0.73946615723112197 0.51688046370510998 0.65615490571709034 -0.14080805645306452 0.5486560494115944;0.099799786173591365 -0.60359950787246885 0.041895376708608441 -0.15700782701798738 -2.1363072444046676 0.40923425682931092 0.014095114335566282 -2.013808332296759 0.37946047620106227 0.15667792640757558 -0.2257717253100246 -0.46594337960785054;-0.61460398292332608 -0.43353724817391837 1.6104017215633006 -1.0754239604889893 -0.84338570086757669 0.77960932081340484 -0.81214223142639597 1.0637867405752177 -0.23924548994134931 0.60511064769822298 0.15450050557006378 -0.74764631128896908;-0.55280985841898522 -0.81739975947047738 0.49041961135921952 -1.2658669003586591 -0.07080636321623518 0.069292988265204525 -0.062304048732959569 0.46388785680865885 -0.081109200313207536 -0.098844654464636805 1.1356680309316531 -0.61533458841805055;0.030958452012402993 -0.23093748984881401 -0.58504321719698704 -0.69651898775114107 0.86823326847746118 -0.54360949147645643 -0.86391230361377158 -0.82133566020891624 -0.24109707080386245 0.11919355996711395 0.84778483874827648 0.39582460184272117;1.5364829149491208 -0.90778090554362345 0.22812849049168016 0.47044622411645515 -0.043146921072567401 -0.26104788511353944 -0.3923344440155625 0.25160973474107934 -0.20528068081258066 -0.62459387013236967 0.43228638320685914 1.1373544504325248;-0.058858310499363332 0.66258891598865499 -0.44656505462126889 -0.2574851534941891 -0.7892814684519357 0.16989356801159347 0.62280157151336657 -0.57322616332524723 -0.32130144410638301 0.060521274327915965 0.69262836533446692 0.82890970769033978;-0.64741540089321892 -0.13605424957503531 0.57939702570078389 0.1350017084622025 0.10568491540375044 0.17479199358308609 -1.0280251740009931 0.64273921685014901 0.69849419949889624 0.17194436548158637 -0.078479813893061148 -0.92681090347437378;-0.071581606756219954 -0.20386657409714576 0.51458844536918558 -0.32333971604222428 0.79567104107804421 -0.75098940100635314 -0.27123185986567755 -0.16563435110949143 0.13337332399949975 0.68868327579981592 -0.8836341737009632 0.069141102216684167;0.18143675943365123 0.62702549823246845 -0.59094893499595424 0.83852658272467817 0.7880523022452175 -0.60396626641252793 -0.81226994769830707 0.5226078251430627 0.19412962168424922 -1.3990197142727601 -1.0341621223093189 -0.26503552580324913;-1.2777344135418873 2.0762666641145526 -0.43890206918767444 0.47216212208644748 0.41464465290785624 0.81305429179466704 1.0070453607048551 1.8835632817977588 -0.71704714068804232 0.16435213373463406 -1.2440843539834927 0.17604723751102275;0.68670321959402036 -1.4555036204796763 -1.2754280364105708 0.5603906816486629 0.23277255377975822 0.024870338626956597 0.49034266640025925 0.014008939147336523 0.67613662710163458 0.35681957410838366 -0.030534032403150422 0.90012594163082726;-0.98082406585712845 0.67477562852516959 -0.75038367575587328 0.25281411671974335 -0.37557283127533936 0.31939777913896877 -0.2766083047144326 0.6460348073057014 -0.23138313286544634 -0.01076231786875716 0.19931357495816771 0.40268624777343304;-0.0048214790906376814 -1.1837089090125448 0.6035891505778892 0.71684431131999615 -0.50971492195141033 -0.92730013471445982 0.50198786304102372 0.76489281120923924 0.77841824666571768 0.42957392984235321 -0.52228989448038055 0.2735763514060911;1.4270724647393906 -1.1871437108196703 0.54040472351299684 -0.39822851700104145 0.52461060667845794 0.57260984028458017 -0.69636477392387697 -0.39758193050109136 -0.8462151185445832 1.3786495563412564 0.58016343207809318 -0.5074576128308631;0.89652134298222264 -0.3772258913617309 0.75611133357870519 0.018407887993654955 -2.1414077767339195 -0.31459405479172531 0.93900433796612348 -1.4876743684574625 -0.11695645833275332 0.62005833949333211 -1.091588302883425 -1.3056217806303663;1.1433240539146334 -1.6287693248869641 -0.50626990892922719 -0.44657248401695704 1.9850245397653088 -0.52916072131813674 -0.95517446939105066 -0.85413759291775981 1.8125998634919012 -0.7731304785234141 0.79063427945441866 0.24608616650638493];

% Layer 2
b2 = [0.43397042375335126;0.67037736551886795;-0.029507136965374475];
LW2_1 = [0.38887424288382166 0.9824039131741561 0.099079257260032222 1.0527670021219548 1.0861894550251665 0.51477256102950875 0.51008966314338411 1.4206373023560199 1.1834814567723535 -0.39059593112314589 0.50616859316731089 -0.67271708317195777 1.2654398951708579 1.236844543070863 -0.28440401246469571 -0.0075026021728707565 0.77991268713272743 0.043534944565779679 0.78660985259771221 -0.16406915921681242;0.50503343210645235 -0.18986959209618129 -0.42647950988623934 1.0151926460632392 -2.0041560763411264 2.7498667954775842 -0.23073949685270409 -0.46460716972103738 -0.77338012775400811 -0.75838196469341557 -1.9282974994256443 -0.72871523763091028 0.36341570918702898 -2.8897019723068165 1.6432372988072994 -0.63371759180773368 0.10964614092063395 -1.122974256105848 -2.6697664519230031 0.71355171954877838;-1.5079019929227291 -1.9953107087687323 2.070379339040215 0.48701968571673654 -0.60523923280363257 -0.51542678933324604 0.046462785612142475 0.99155582205487303 0.078587010140682964 -0.66123634389989017 -1.0641349762211045 -0.77639743418737384 0.24596184178652364 0.48802341613127126 0.12843052071477334 -1.3031555516816646 -0.77920643922374777 1.3026833283562813 1.3623368989570928 -1.7488149594986011];

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
