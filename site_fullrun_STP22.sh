#!/bin/sh -f

python ./site_fullrun.py \
      --site US-GC4 --sitegroup Wetland --caseidprefix STP22 \
      --nyears_ad_spinup 200 --nyears_final_spinup 600 --nyears_transient 169 --tstep 1 \
      --cpl_bypass --machine stampede2 --compiler intel --mpilib impi \
      --gswp3 --daymet \
      --metdir /home1/06923/wendy611/scratch/inputdata/atm/datm7/atm_forcing.datm7.GSWP3.0.5d.v2.c180716/cpl_bypass_full \
      --model_root /home1/06923/wendy611/scratch/E3SM_Salinity_3rd \
      --caseroot /home1/06923/wendy611/scratch/E3SM/cases \
      --ccsm_input /home1/06923/wendy611/scratch/inputdata \
      --runroot /home1/06923/wendy611/scratch/E3SM \
      --spinup_vars \
      --nopftdyn \
      --marsh \
      --np 1 \
      --tide_forcing_file /home1/06923/wendy611/OLMT_coastal_v2/tidesPLM_2019_gapfill.nc \
      --parm_file /home1/06923/wendy611/OLMT_coastal_v2/parm_GC4_6 \
