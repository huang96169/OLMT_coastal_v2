clear
rundir='/nfs/home/whf/E3SM/OLMT_coastal_v2/';
;f4=fopen('/home/whf/E3SM/inputs/Salinity/EOTBLongTerm_12Sep2022 CB3_3W copy.csv');
f4=fopen('/home/whf/E3SM/inputs/Salinity/EOTBLongTerm_12Sep2022 WT6.1 copy.csv');
C=textscan(f4, '%s %s %s %f %f %s %f %s','HeaderLines', 1,'Delimiter',',');
tmp1=cellstr(C{1,2});
tmp2=cellstr(C{1,3});
Layer=C{1,6};
Salinity_o=C{1,7};
for i=1:length(tmp1)
    time_so(i)=datenum([tmp1{i} ' ' tmp2{i}]);
end
id=find(contains(cellstr(Layer),'S')); 
time_so=time_so(id);
Salinity_o=Salinity_o(id);
[time_sort,Idx]=sort(time_so);
Salinity_sort=Salinity_o(Idx);
time_sort(1)=datenum(1984,7,12,7,0,0);
time_s=time_sort(1):1/24:time_sort(end);
Salinity_in=interp1(time_sort,Salinity_sort,time_s);
Tide_salinity=Salinity_in';
idx=find(abs(time_s-datenum(2022,1,1))<0.5/24);
Tide_salinity=Tide_salinity(1:idx);
time_s=time_s(1:idx);

f5=fopen('/home/whf/E3SM/inputs/Annapolis_fillgaps_NAVD.csv');
WL=textscan(f5, '%f %f','Delimiter',',');
elev=WL{1,2};
time_eo=WL{1,1};
id1=find(abs(time_eo-time_s(1))<0.5/24);
id2=find(abs(time_eo-time_s(end))<0.5/24);
Tide_height0=elev(id1:id2);
%dt1=1/24;
%fN=1/(2*dt1);
%[b,a]=butter(6,0.6/fN); % the cut off frequency is a and b is order.
%Tide_height=filtfilt(b,a,Tide_height0);


time_e=time_eo(id1:id2);
Time=datestr(time_e,'mm/dd/yyyy hh:00');
%title={'Time';'Tide_salinity';'Tide_height'};


schout=load('/home/whf/data/SCHISM/Ches01/PostP/RUNdir/salt.3level.GCREW_2.1-728');
time_m=schout(:,1)+datenum(2017,1,1);
salinity_m=schout(:,6);
idx1=find(abs(time_e-time_m(1))<1/48);
idx2=find(abs(time_e-time_m(end))<1/48);
Tide_salinity(idx1:idx2)=salinity_m;

A=table(Time,Tide_salinity,Tide_height0);
A1=table(time_e,Tide_salinity,Tide_height0);
writetable(A1,[rundir '/Annapolis_schism_salinity20172018_WT6_1_NAVD.csv']);

figure
id1=find(time_e==datenum(2017,1,1));id2=find(time_e==datenum(2018,12,31));
plot(time_e(id1:id2)-datenum(2017,1,1),Tide_salinity(id1:id2),'b')
hold on
plot(time_e(id1:id2)-datenum(2017,1,1),Salinity_in(id1:id2),'ro')
%datetick('x')
saveas(gcf,'salinity_20172018.png')

