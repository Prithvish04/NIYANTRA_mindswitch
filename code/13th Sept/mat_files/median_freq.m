function [mid_freq]=median_freq(Pxx,f)
mid=length(Pxx/2)
total_power=sum(Pxx)
begin=1
last=length(Pxx)
Px1=sum(Pxx(1:mid))
Px2=sum(Pxx(mid+1:end))

while(abs(Px1-Px2)<0.05*total_power)
if(Px1>Px2)
last=mid
else
begin=mid
end
mid=ceil((begin+last)/2)
Px1=sum(Pxx(begin:mid))
Px2=sum(Pxx(mid+1:last))
end

midfreq=mid
end
