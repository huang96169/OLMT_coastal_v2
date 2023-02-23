#!/bin/sh -f

python ./site_fullrun.py \
      --site US-GC4 --site3rd US-GC3 --sitegroup Wetland --caseidprefix B01 \
      --nyears_ad_spinup 200 --nyears_final_spinup 600 --nyears_transient 172 --tstep 1 \
      --cpl_bypass --machine cades --compiler gnu --mpilib openmpi \
      --walltime 9 \
      --hist_nhtfrq_trans -1 \
      --hist_mfilt_trans 8760 \
      --gswp3 --daymet \
      --metdir /nfs/data/ccsi/proj-shared/E3SM/inputdata/atm/datm7/atm_forcing.datm7.GSWP3.0.5d.v2.c180716/cpl_bypass_full \
      --model_root /home/whf/E3SM/E3SM_Salinity_3rd \
      --caseroot /home/whf/work/cases \
      --ccsm_input /nfs/data/ccsi/proj-shared/E3SM/inputdata \
      --runroot /lustre/or-scratch/cades-ccsi/scratch/whf \
      --spinup_vars \
      --nopftdyn \
      --col3rd \
      --np 1 \
      --tide_forcing_file /home/whf/E3SM/OLMT_coastal_v2/Annapolis_WT6_1_schism_salinity20172018_35yrs_NAVD.nc \
      --tide_components_file /home/whf/E3SM/OLMT_coastal_v2/harmonic_tides_8575512.csv \
      --parm_file /home/whf/E3SM/OLMT_coastal_v2/parm_GC4_B01 \
      --parm_file_2nd /home/whf/E3SM/OLMT_coastal_v2/parm_short_GC3_B01 \
