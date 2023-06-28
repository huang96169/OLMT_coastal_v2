% detrend the observed water level
rundir='/nfs/home/whf/E3SM/OLMT_coastal_v2/';
f1=fopen('./Annapolis_sal_elev_datenum_MSL.csv');
C=textscan(f1,'%f %f %f','HeaderLines',1,'Delimiter',',');
Time=C{1,1};
Tide_salinity=C{1,2};
Tide_Height=C{1,3};
Tide_height=detrend(Tide_Height);
A=table(Time,Tide_salinity,Tide_height);
writetable(A,[rundir 'Annapolis_sal_elev_detrend_datenum_MSL.csv']);
figure 
plot(Time,Tide_Height,'r');
hold on
plot(Time,Tide_height,'b')
datetick('x')
saveas(gcf,'elev_detrend.png')

