"""
Select the best parameter for the simulation: Strehl ratio

"""
import numpy as np
import matplotlib.pylab as plt
import re

with open('sh12x12.par','w+') as f:
    lines = f.readlines()
n = len(lines)

for i in range(n):
	m = re.search('loop.gain',lines[i])
	if m == None:
		pass
	elif m.group(0) == 'loop.gain':
		loopgain = re.search('(?<== )*.*',lines[i])
		print loopgain.group(0)
		for j in range(1):
			gain = 0.1 + 0.05 *j
			loopgain = re.sub('(?<== )\w',str(gain),lines[i])
			lines[i] = loopgain
			print loopgain
			print lines[i]

f.close()