Using "YAO", a Monte-Carlo AO simulation tool, we develope a series of simulation tests.  The aim of the tests is to obtain the best-performed parameters of the Shack-Hartmann wavefront sensor and the Pyramid wavefront sensor and compare their performances, based on MMT adaptive optics system.  These two wavefront sensors are detecting the same field of view in R band(0.65 micron), with the camera working in H(1.65 micron) and K(2.2micron) bands.

For testing the best-performed control system parameters, we made two sets of plots showing the relation of the Strehl ratio (peak value of the intensity from observation/theoretical peak of the intensity) and the loop gain, given different iteration times.  From the plot, we can see that for SHWFS, the best-performed results are obtained when the loop_gain=0.3, iteration_time= 1 ms(given the limit of the control system); while for the pyramid wavefront sensor, the best-performed results are obtained when the loop_gain=0.5, iteration_time= 1 ms. 

<img src="SHWFS_gain_ittime_1650.png" width="200" height='200'>
<img src="SHWFS_gain_ittime_2200.png" width="200" height='200'>
<img src="PYWFS_gain_ittime_1650.png" width="200" height='200'>
<img src="PYWFS_gain_ittime_2200.png" width="200" height='200'>

The setup of the pyramid wavefront sensor requires modulation, therefore, we make an extra testing on the modulation parameters of the pyramid wavefront sensor. The following images show the relation of the Strehl ratio and the modulation amplitude given different number of points on the modulation circle.  We choose the modulation amplitude with 0.1 and the number of points on the modulation circle to be 16 for Kband, and modulation amplitude with 0.2 and the number of poitns on the modulation circle to be 24 for H band.

<img src="PYWFS_Modulation_amp_pnts_1650.png" width="200" height='200'>
<img src="PYW_Modulation_amp_pnts_2200.png" width="200" height='200'>


For the comparison of the performance of 2 wavefront sensors, we made two plots showing the relation of the Strehl ratio and the magnitude of the star.  With the parameters given in the previous testings, we can conclude that in the region that the magnitude of the stars brighter than the 15 magnitude, the Pyramid wavefront sensor always outperforms the Shack-Hartmann wavefront sensor.

<img src="Kband_mag.png" width="200" height='200'>
<img src="Hband_mag.png" width="200" height='200'>


