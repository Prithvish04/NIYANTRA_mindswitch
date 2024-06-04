function [Y] = GB_24(X)

x1_step1_xoffset = [9.42242520971264;9.03724311397283;8.95172976828502;21.8264107672156;19.8769498651482;21.9146009518412;4.63157049096886;4.65920446178633;4.63854396034525;14.7092804118679;11.612926204956;12.7867918881546];
x1_step1_gain = [0.0569952827730294;0.103544897636796;0.0488576638865186;0.104175061903629;0.0966399152440241;0.1128433953534;0.426456059072614;0.395380964953841;0.349334159786462;0.140233513325877;0.104651329760166;0.106970361915778];
x1_step1_ymin = -1;

b1 = [-1.7766396442630823;1.2152332059455229;-1.1941949583640474;-1.1864876710188255;-0.81749032480763462;-0.53911998485835366;0.20276405089002275;-0.37199974545508585;-0.10318308674813953;-0.47825821240598171;0.59009662180701072;0.74873810024398901;-1.0622494047168118;-1.2441327116571161;-1.652148414592822;1.6993375581849206];
IW1_1 = [0.30818126630503817 0.089520001245968206 -0.15946608024917408 0.13538904106589317 0.41950049405119649 -0.49147774753230244 0.60810531044623883 0.77824844355555611 0.77831590260388239 -0.26208286860766644 0.0035111428649787992 0.87533279294647159;-0.1210933311138148 -0.24159703116116715 0.51536497241220847 0.87965130444142126 0.14600165211088112 -0.57117305650076167 -0.1341160431324494 0.77758186107552085 0.73549086741235226 -0.6181332369365361 0.79427287466032048 1.1042422054777035;-0.05757984621186911 -0.57666950776665793 -0.74255196894772069 0.16877176376514055 0.82071980257260913 0.33040668158659586 0.80397866239110982 0.51521693097310495 0.55655291508625659 -0.10872016199100792 0.64944861966159917 0.070573812057232066;0.87048936832905344 -0.42624960130055184 0.75513522028467506 0.60445808613151497 0.82273757184374607 0.68952921927194821 0.45844721851441683 0.45050477017014934 -0.12424153982678943 0.2130656232691015 0.33978089026538377 0.15149343620059413;0.46786020924754984 0.18211487916861313 -0.21030674676871083 0.57944645515791582 0.57906929684425446 -0.96272238946655853 0.374176920390562 -0.0032403302484005428 0.30309906262798775 0.2185184036580442 0.9635671674360049 0.64261499478586115;0.52197892928094591 -0.29237486522246547 -0.24658393743341553 -0.24975505922716537 0.27811136060865188 0.97000054563991234 -0.013124397691760917 -0.3913541189386362 0.54352175566532435 -0.9791569182391644 0.39860575627872047 0.11787403744364404;-0.44154528190331027 0.61369179742248037 0.88032007915904986 -0.16159343174999319 -0.19431023891307383 0.92521720941888086 -0.48855372523037111 0.4625127376071016 -0.20803565173375471 -0.034048938032831613 0.21839554906914094 -1.1175148263552808;1.2424398538782513 -0.76032895437517434 0.014440050176749299 0.1365395033907722 0.28212067978587879 -0.0038740132863300091 0.69223925637107175 -0.27428746079114008 -0.11288653527944567 0.85767383231571492 0.52109663717158039 -0.79232228292675921;0.51016724757298015 -0.37637538227091599 0.61124139921492726 0.8111947084353468 -1.0669170606340916 -1.8765384266993332 0.4926891487317428 1.2909608240136035 -0.08389335994941037 -0.68238394752261156 -0.45888851072716014 -0.61619084038147232;-0.01261141133069358 -0.166168999903029 1.0869860605562953 -0.030135803961896107 -0.13761904568560118 0.74827453690707002 -0.79384410249904669 -0.42134923639351202 0.42200941686447663 0.5224047870849915 0.36724783136779376 0.57084257335106292;0.029332788648931941 -0.78314997993515001 -0.60246377443622823 -0.72589687247792789 -0.20253359221335787 -0.42460543816053575 -0.41948755487189621 0.30307480889386085 0.40591784726739571 -0.22604408612764321 0.83065727444286208 0.44013528497333843;0.36555768444929754 0.71044829503126683 -0.75032283969193803 -0.79708488951332157 -0.497312706683115 -0.98350547419921175 -0.025343940752412586 -0.21299927583562567 0.26281589022654206 1.1219078256603099 -0.99211193478032067 -0.1921965179229724;-0.7045432795551726 0.81248235857694728 -0.036844826440991144 0.055727498126385194 0.18825087325887638 -0.37486460684046474 0.4583873786954486 0.039525568793968555 0.70171511204536063 0.69204310152272142 0.27621827869305793 -0.67854446732241724;-0.84165655614882795 -0.49251832597025125 0.097903242948162994 -0.095789616888232662 -0.55640343085579247 0.71063371624861227 -0.34908911903235884 0.62890760745442675 1.1511053685361543 -0.80947162268600625 -0.22754504070612069 0.32447009362249685;-0.24106964473450782 0.8795689237243759 -0.053212836446167033 0.97424203839067447 -0.041453504734517345 -0.53575064981901088 0.45765521322911668 0.49583644377043951 -0.088841778428560753 0.50728948445206756 -0.064238871443143858 -0.34768234207327137;0.48237991185773077 -0.87468209461128843 -0.55787656366613469 -0.18695589653045488 -0.5675215534663659 0.66906270517549671 -0.76350045158174329 -0.32143048381650879 0.24721303203516981 0.25660637111887741 0.074520698346334444 -0.58719051390952925];

b2 = [0.70505304634002153;0.35792981238433902];
LW2_1 = [0.6473199580493223 -0.53343559321661338 1.100963650761037 -0.68720034809512498 0.017479703945292246 -0.15286585495199553 1.3977560232980695 -0.050514265687681026 -1.0094094045285649 -0.32794379414796659 -0.23736192618489005 1.1520574466102624 0.17383106767313838 0.95545650064988119 0.38896795007662527 0.68808645906992594;-0.75094235419509936 1.0462640972098571 0.48819511165821938 0.82659787232574788 -0.56056317066025196 -0.36671123534290484 -0.032923789524775315 -1.3145382133812922 1.5117961432897435 0.41957107120263692 -0.50472149346918294 -0.80579483518124873 -0.34146769722837605 -0.82049654916899994 0.72101289382796097 -0.17443366696831442];

TS = size(X,2) 
if ~isempty(X)
    Q = size(X,2) 
else
    Q = 0;
end

Y = []


    
    
    Xp1 = mapminmax_apply(X,x1_step1_gain,x1_step1_xoffset,x1_step1_ymin)
    
    
    a1 = tansig_apply(b1 + IW1_1*Xp1)
    
    
    a2 = softmax_apply(b2 + LW2_1*a1)
    
    
    Y = a2


end

