#!/usr/bin/env python
# -*- coding: utf-8 -*-

filename = 'input.txt'
light_vals = [200, 180, 160, 140, 120, 100]
sound_vals = [20, 50, 100, 150, 200]
line = 0
lvi = 0
svi = 0
segmentlength = 50
f = open(filename, 'w')
while(line < segmentlength):
	if(line % 5 == 0):
		svi = 1
	else:
		svi = 0
	f.write('photo sensor * %i \n' % light_vals[lvi])
	f.write('sound_sensor = %i \n' % sound_vals[svi])
	line= line + 1
line = 0
lvi = 1
while(line < segmentlength):
	if(line % 5 == 0):
		svi = 2
	else:
		svi = 0
	f.write('photo sensor * %i \n' % light_vals[lvi])
	f.write('sound_sensor = %i \n' % sound_vals[svi])
	line= line + 1
line = 0
lvi = 2
while(line < segmentlength):
	if(line % 5 == 0):
		svi = 3
	else:
		svi = 0
	f.write('photo sensor * %i \n' % light_vals[lvi])
	f.write('sound_sensor = %i \n' % sound_vals[svi])
	line= line + 1
line = 0
lvi = 4
while(line < segmentlength):
	if(line % 4 == 0):
		svi = 4
	else:
		svi = 0
	f.write('photo sensor * %i \n' % light_vals[lvi])
	f.write('sound_sensor = %i \n' % sound_vals[svi])
	line= line + 1
line = 0
lvi = 5
while(line < segmentlength):
	if(line % 2 == 0):
		svi = 4
	else:
		svi = 0
	f.write('photo sensor * %i \n' % light_vals[lvi])
	f.write('sound_sensor = %i \n' % sound_vals[svi])
	line= line + 1
##walk it back 
line = 0
lvi = 4
while(line < segmentlength):
	if(line % 4 == 0):
		svi = 4
	else:
		svi = 0
	f.write('photo sensor * %i \n' % light_vals[lvi])
	f.write('sound_sensor = %i \n' % sound_vals[svi])
	line= line + 1
line = 0
lvi = 3
while(line < segmentlength):
	if(line % 5 == 0):
		svi = 3
	else:
		svi = 0
	f.write('photo sensor * %i \n' % light_vals[lvi])
	f.write('sound_sensor = %i \n' % sound_vals[svi])
	line= line + 1
line = 0
lvi = 1
while(line < segmentlength):
	if(line % 5 == 0):
		svi = 2
	else:
		svi = 0
	f.write('photo sensor * %i \n' % light_vals[lvi])
	f.write('sound_sensor = %i \n' % sound_vals[svi])
	line= line + 1
line = 0
lvi = 0
while(line < segmentlength):
	if(line % 5 == 0):
		svi = 1
	else:
		svi = 0
	f.write('photo sensor * %i \n' % light_vals[lvi])
	f.write('sound_sensor = %i \n' % sound_vals[svi])
	line= line + 1
f.close()

