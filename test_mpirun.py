#!/usr/bin/env python
import sys,os, time
import numpy as np
import netcdf4_functions as nffun
import subprocess
from mpi4py import MPI
from optparse import OptionParser

comm=MPI.COMM_WORLD
rank=comm.Get_rank()
size=comm.Get_size()
np    = 10
niter = 1
print('rank1='+str(rank))
if (rank == 0):
    print('rank2='+str(rank))
    for thisiter in range(0,niter):
        print('thisiter='+str(thisiter))
        n_done = 0
        for n_job in range(1,size):
            comm.send(n_job, dest=n_job, tag=1)
            comm.send(0,     dest=n_job, tag=2)
            time.sleep(0.2)
            print('n_job='+str(n_job))
            print('n_done='+str(n_done))
        for n_job in range(size,np+1):
            process = comm.recv(source=MPI.ANY_SOURCE, tag=3)
            thisjob = comm.recv(source=process, tag=4)
            n_done = n_done+1
            print('n_job='+str(n_job))
            print('n_done='+str(n_done))
            comm.send(n_job, dest=process, tag=1)
            comm.send(0,     dest=process, tag=2)
        while (n_done < np):
            process = comm.recv(source=MPI.ANY_SOURCE, tag=3)
            thisjob = comm.recv(source=process, tag=4)
            n_done = n_done+1
            print('n_job='+str(n_job))
            print('n_done='+str(n_done))
            comm.send(-1, dest=process, tag=1)
            comm.send(-1, dest=process, tag=2)
    MPI.Finalize()  
else:
    print('rank3='+str(rank))
    for thisiter in range(0,niter):
        print('thisiter='+str(thisiter))
        status=0
    while status == 0:
          myjob = comm.recv(source=0, tag=1)
          status = comm.recv(source=0, tag=2)
          if (status == 0):
             print('successfully submitted')
             print('finished on '+str(myjob))
             comm.send(rank,  dest=0, tag=3)
             comm.send(myjob, dest=0, tag=4)
    MPI.Finalize() 
