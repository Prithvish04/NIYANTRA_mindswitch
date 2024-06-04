function [Y,Xf,Af] = myNeuralNetworkFunction(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 09-Sep-2016 14:57:09.
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
x1_step1_xoffset = [1.68225153850844;1.687733747403;1.70088193744179;3.56593361078692;3.45662522547845;3.60147221533988;0.723617941859257;0.725898031813287;0.726295797281729;13.3568434105256;16.3443348591275;14.6281154737623];
x1_step1_gain = [2.42406547682654;2.32126603953241;2.4914707519352;0.71947883299075;0.676700786631049;0.758646775899407;6.32337134845644;6.53337286453065;6.32832003762608;0.147296617569698;0.170208028017692;0.160878229205209];
x1_step1_ymin = -1;

% Layer 1
b1 = [1.7516183285336193;1.0675566907839416;2.0656597148213307;-1.5607308466141567;1.1550921350139767;-1.0526320774777513;1.0664084007572272;0.24713636962556687;0.95600074601971086;0.034268413671370165;0.28663235836567147;-0.24471835552697091;0.57639437505777003;-0.24994199769281381;1.3161137583122313;0.52920590467227357;1.2466491630796721;1.2676637502653973;-2.0773852436192892;1.8257377966980279];
IW1_1 = [-0.96757482519458127 -0.17467314620657193 -0.62790131732834897 -0.57566808500556221 -0.29256349604923954 -1.5947225933008708 0.21204098740379496 0.80350485931576932 -0.92902163944275873 -0.028414365970232742 -0.89641528701184547 -0.26706625190495331;0.0019089751408027105 -0.081884510276556993 -1.3455899829132771 0.82114704558580731 -0.68939746168584481 -0.18018600827572079 -1.4680987102313168 -1.7128763362163493 -0.40383982329532697 -0.086633259649427211 0.059631421778847234 -1.4787265146896644;-0.55605886043634367 0.20845938208411419 0.34035399619528151 -0.013319561899146445 -0.54096021635554581 -0.43479239939342312 -0.52158728977768098 0.35924813071089368 -0.26689482370241513 -0.33570038220267118 0.38899888675368138 0.78381704146070386;0.43594604152038174 -0.57844353353716405 -0.47259840572451778 1.0401229578129945 -0.68189044274212185 0.0500670279359334 -0.86997765505046809 -0.32681249292513986 -0.55341414321605353 -0.43807533303927065 0.85395319087070809 0.13416397182530865;-0.60400156173117059 0.58600262974580331 0.95801766925754772 -0.14401551134142199 -0.78101143357201552 0.1166907288910972 0.35136225351648687 -0.96726920326104182 0.32198323721666422 0.74408454043827976 -0.54955922647572453 -0.17866768795652624;0.49856499238843011 0.37162878551444106 0.12490134643433976 0.83044465669402467 0.091672025088268855 0.97560843655933227 -0.48359323294909878 0.18209195122232349 0.62546252256350532 -0.54148526828586574 0.43192997386507725 0.42035452586028527;-0.3296176877458506 1.3178664866878296 -0.027052436974031181 -0.84504168077823993 -0.54316174061724654 -0.54154790184510682 -0.76102370020705623 0.91562703610848784 -0.64864883887496927 -0.32228228706808359 0.88911686081099095 0.034178289426011851;0.38723506622848475 -0.69034703904169292 0.61320261944562204 -0.5669465823951797 -0.013308913981317071 -0.12330564120226041 -0.41859763488953755 -0.62884140675722999 -1.0512408848634083 1.0039950360449024 0.56835685784083589 0.69780984723215855;-0.46196440976006514 2.1002062097541687 0.3032737489313525 -0.3052202740314432 -0.064138767771606139 -0.34970598757327004 -0.89163680869809758 -0.2447766406250812 0.13174282117649685 0.0846210060728049 0.20420649581908137 -0.074185607490944286;0.41618107653486308 0.30799065402495723 -1.239471135896038 -1.0404378827900731 -0.70800120103656916 -1.3831565889898114 0.67355806996637779 1.4152738298156702 -1.2323460283713255 0.17795765606755676 -0.34333430737489617 -0.70543952891792705;-0.30364796386895027 -0.51794740522182725 -0.95997008787843374 -0.41122100440639781 1.744833699230141 -0.57115618854411798 0.617395401130866 0.17702450301228215 0.16075483258827608 -1.3881636441957825 -1.615233876835332 -0.88282863935811473;-1.4400469116777777 -1.0412667641007414 0.83020852699731762 0.64720507557357376 0.13032465321386033 0.11213930754371314 -0.48749004423322784 -1.4526008315807331 -0.082210171284157474 -1.0679873968259443 0.6712884701460019 0.65467450201854882;0.081237068431084081 0.45725119212216953 0.054797060783336481 -0.68495837008689564 -0.50595195312995123 0.18068591566904557 0.88594379337098639 -0.35663182462856524 0.68599015100705363 0.44690848835991676 -0.23963196292178082 -0.093405446783599425;0.55848284820047411 0.011304377206322398 0.9060378912121585 -0.57268937568348055 -0.049735754102459916 0.49021372633111915 -2.3843916968035019 -0.22715794557416075 -0.31384640038332989 0.589950622709004 -0.29076218793218478 -0.91874711212880555;2.1614084641528617 1.1807434599840125 -0.14540149788612197 -0.19010179529583651 -0.22814478496791249 -0.69349130791272207 0.23100543621815087 -0.54911753945249708 0.54867441797499905 0.67400426880181175 0.53375187489418574 -0.66821705451809155;-0.39499584797160142 -1.1609970491831443 0.16940548354275931 -0.56745301762091194 -0.11610166281262911 1.1572428617388504 0.16282105019629195 0.55807695005279734 0.32171565878799196 0.82891393124615376 1.2216140127888815 -1.0896230865493395;-0.57195923168511698 0.17270666421662745 0.26506607659810355 -0.1739805216275801 0.51535751849494738 0.16704505709871587 0.71504301595624442 -1.31881780897695 0.69100659384857155 0.56821456425394801 0.21120246611448185 -0.5133955448548021;0.89019959355681799 0.56341655378194311 -0.69689440907265776 0.71697059820570297 -0.11825006218008929 0.9606507878560977 -0.23054430247119143 1.0352273367862568 0.600710856103433 0.4613302259104145 -0.75824898297122711 -0.38572145308716743;-0.8094560480646068 -0.19559616152322745 0.58120229951266877 0.50352108812726293 0.5052031024378808 0.64237251055585332 -0.74774671863973363 0.43264335946096527 -0.29781125601466202 0.24122298550056112 0.16445147793530904 0.92119140874261407;0.86177376261845373 0.35394144031534774 0.017067379019858955 -0.35843367776982188 -0.31480180738687502 -1.3078596665926392 0.45705901411383132 -0.50880500054483668 -0.22911603705251482 0.22859816477447994 -0.16905834126447492 -0.48333760363915235];

% Layer 2
b2 = [0.41282781056807394;0.41590504620984131;-0.61506925782018251];
LW2_1 = [-0.27249564005397409 0.33642653925758631 0.39128482830378986 -0.22525180202731987 0.051866861652282277 -0.41724994115272279 0.86461751700248579 0.041994836130392198 -0.12088863896439166 -0.38657736378310786 1.2696698831224815 -0.02610471561663838 0.69058707667346864 -1.2770895657442549 -0.2096217209243334 -0.28399715346652338 0.23363105870357215 -0.72066026512001835 0.73366426032862497 -0.21203498233304791;-0.11079657169219577 1.067623724773755 0.36961237338878178 -0.50852529178946448 -0.97996308010434818 -0.18341765705850291 -1.9196206976179588 1.057841851966989 -0.27700293230798995 1.0852489212964034 -1.3261383845367987 -1.6876970691738602 0.33039946245913171 1.4804712717256323 -1.5997973417204148 1.0000052184843342 -0.50810202006820815 -0.55745624134578142 -0.22620797885066812 -0.74774807421151079;1.6938138650148264 -1.7486330175679099 0.57602207994413823 0.89154635483812317 -1.0359533667218446 -0.83459165957023385 -0.26119473063400539 -0.4482551638959581 -0.17463397493178176 -1.6388134450156024 1.1878618503712872 1.0537874163508005 0.090211544669698371 -1.2556072090469983 1.6848222216680373 0.12023364400112918 -0.17931820449347105 0.62202847627119418 -0.72354049303789492 0.46552617760101572];

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