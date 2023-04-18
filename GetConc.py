import pandas as pd
import numpy as np
import sys


edge_length=9.8*10**(-9)
NPeptide=50
Avagadronumber= 6.023 *10**23
volume=(edge_length*edge_length*edge_length)
Conc= (NPeptide/(Avagadronumber * volume ))/1000

#print (Avagadronumber, "\n", edge_length, "\n", Conc, volume)

print (np.round(Conc,3))

particle=Conc*Avagadronumber*volume

print (particle*1000)



