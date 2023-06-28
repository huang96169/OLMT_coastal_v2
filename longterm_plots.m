clear
%data=load('/home/whf/E3SM/OLMT_coastal_v2/STP45NPP_annual_35yr_1.txt');
%NPP_STP29=data(:,3)+data(:,4);
%AGNPP_STP29=data(:,3);
%BGNPP_STP29=data(:,4);
%data=load('/home/whf/E3SM/OLMT_coastal_v2/STP42NPP_annual_35yr_1.txt');
%NPP_STP27=data(:,3)+data(:,4);
%AGNPP_STP27=data(:,3);
%BGNPP_STP27=data(:,4);
%SRL_NPP=abs(NPP_STP29-NPP_STP27);

data=load('/home/whf/E3SM/runcase/results/NMTB39dNPP_annual_35yr_2.txt');
AGNPP_STP29=data(:,3);
BGNPP_STP29=data(:,4);
NPP_STP29=data(:,3)+data(:,4);
data=load('/home/whf/E3SM/runcase/results/OM06NPP_annual_35yr_1.txt');
AGNPP_STP27=data(:,3)
BGNPP_STP27=data(:,4)
NPP_STP27=data(:,3)+data(:,4)
ATF_NPP=abs(NPP_STP29-NPP_STP27)
ATF_AGNPP=abs(AGNPP_STP27-AGNPP_STP29)
ATF_BGNPP=abs(BGNPP_STP27-BGNPP_STP29)
%figure 
%bar(1984:1984+length(NPP_STP29)-1,ATF_NPP);
%figure
%bar(1984:1984+length(NPP_STP29)-1,SRL_NPP);


