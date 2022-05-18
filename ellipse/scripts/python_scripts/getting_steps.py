import pandas as pd
import plotly.express as px
import numpy as np



Coord_dict={}
currentStep=0
numberParticles=0
walls=[0,0,0]
readTimestep=0
readNAtoms=0
readCell=0
readParticle=0
f = open("./data/dump.indent", "r")
n=10
for line in f.readlines():
    line=line[:-1]
    if (line=="ITEM: TIMESTEP"):
        # print("READ1")
        readTimestep=1
        continue
    if readTimestep:
        # print("READ2")
        readTimestep=0
        currentStep=int(line)
        Coord_dict[currentStep]=[]
        continue
    if (line=="ITEM: NUMBER OF ATOMS"):
        readNAtoms=1
        continue
    if readNAtoms:
        readNAtoms=0
        numberParticles=int(line)
        continue
    if (line=="ITEM: BOX BOUNDS pp ss pp"):
        readCell=3
        continue
    if readCell>0:
        readCell-=1
        walls[readCell]=float(line.split()[1])
        continue
    if (line=="ITEM: ATOMS id type xs ys zs"):
        readParticle=numberParticles
        continue
    if readParticle>0:
        readParticle-=1
        Coord_dict[currentStep].append([float(x) for x in line.split()[2:]])
        continue
steps = list(Coord_dict.keys())

df = pd.DataFrame()
for step in steps:
    a = np.array(np.full((numberParticles, ), step))
    arr = np.append(np.array(Coord_dict[step]), a.reshape((1, a.size)).T, axis=1)
    df = df.append(pd.DataFrame(arr), ignore_index=True)
df.columns=['x', 'y', 'z', 'step']
