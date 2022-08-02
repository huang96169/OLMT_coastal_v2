#!/bin/sh -f

python ./site_fullrun.py \
      --site US-GC3 --sitegroup Wetland --caseidprefix STP01 \
      --nyears_ad_spinup 200 --nyears_final_spinup 600 --nyears_transient 169 --tstep 1 \
      --cpl_bypass --machine stampede2 --compiler intel --mpilib impi \
      --gswp3 --pio_version 2 \
      --model_root /home1/06923/wendy611/scratch/E3SM_v2_BEN \
      --caseroot /home1/06923/wendy611/scratch/E3SM/cases \
      --ccsm_input /home1/06923/wendy611/scratch/inputdata \
      --runroot /home1/06923/wendy611/scratch/E3SM \
      --spinup_vars \
      --nopftdyn \
      --parm_file /home1/06923/wendy611/OLMT_ALQUIMIA/parm_short_GC3_5 \
