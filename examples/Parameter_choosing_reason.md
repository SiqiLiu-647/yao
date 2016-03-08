 The reason to choose that parameters:

 1. pupil diam:
 the lightpath of the system is like:
 light--> primary mirror --> secondary mirror --> beam splitter --> focal plane(far field)
                                                                --> field stop --> focus lens --> lenslet --> CCD detector (near field)
Basically, what we measure on the focal plane is the I(x,y) = |F(E(x,y))|^2
E(x,y) is the electricity field of the light on the primary mirror, and the I(x,y) is the square of the fourier transform of the electric field.

on the primary plane, we separate the whole field into sim.pupildiam*sim.pupildiam grid. and the intensity got fourier transform then we get the airy function.

the grid size should be at least D/r0, which r0 is the typical length of the atm wavefront, so we can see the details of the wavefront.
6.5m/15cm*2 = 86.7, according to Nyquist sampling theorem.

The number of pixels are corresponding the pixels on the pupil plane, which maps the primary mirror.

So te number of pixels per sub-aperture should be 86.7/12 = 7, if we use 130/12 = 11. Because we want to have an integer corresponding from the pixels on the pupil plane to the pixels on the CCD plane(the pixel grid has larger size of the primary mirror, and each integer size of the pixels correspond to a sub-aperture on the image plane.)

so, we are using the pupildiam = 132, and the subnpixel = 132/12 = 11.

 2. satisfaction of the near-field and the far-field results.
satisfaction of the near-field is following : wfs.shnxsub * wfs.npixpersub = sim.pupildiam.  12 * 11 = 132
satisfaction of the far-field is following : wfs.npixels * wfs.pixsize = FOV. 2*1.2 = 2.4
so the number of pixels in the sub-aperture * pixel size = 2.4 that is the field of view for the sub-aperture.

and we already know the plate scale, which is 60 um/arcsec...72um/60um*arcsec = 1.2, that is how we get the field of view for each pixel.


 3. the deformable mirror.
we have 336 actuators, and the total number of sub-apertures are 12*12, the measurements we get is 144*2 = 288, so the informaiton from the wavefront sensor is less-constraint on the deformable mirror actuators, but from the zernike polynomial configurations, we can solve the problem of n_actuators < n_meausurements.
and from the simulation, we see that the residuals are less constrained on the edge of the deformable mirror and the center because we have less constraints on these parts.

4. atm structure
dr0at05mic = D/r0 = 6.5m/15cm =


5.  The exposure time is the iteration time 1.6 ms.
 The frame delay is the exposure time + the readout delay = 1.6ms + 1.596 ms
 If we take the exposure time as the unit, so the frame rate will be considered to be 1+ 1.596/1.6 = 2
 Or the iteration time is 0.8 ms, because the previous iteration time is the maximum value, the frame delay could be 1+1.596/0.8 = 3.

 6. The noise,
 the first one for the noise: whether to switch on or off.
 the ron is for the read out noise, which could be obtained from the MMT paper. 


 #========================2016/02/29 group meeting with Suresh======================
 1. The overall goal is to reduce PSF and reduce pixels.(to reach higher strehl ratio)
 2. This week weekly plan will be shown in group wiki.


#========================2016/03/03 Meeting with Suresh==============================
1. phase screen points to the phase screen of the atmosphere.
Like the command, create_phase_screens, 2048,256,prefix='screen'.
create 2048/256 = 8 phase screens suitable for use by yao. 
This will create N (N=long dimension/short dimension, 8 in that case) phase screens of dimension 2048x256 suitable for use by yao. It is advised to choose dimensions that are powers of 
2. Depending on your platform and CPU, it may take some time (1mn or so), as this routine is absolutely not optimized. This is a one shot run. You will not need to do that everytime you run yao, as you can, and are encouraged, to use the same phase screens. You may need to run it once more to create larger phase screens if the need arises, but that's about it. The phase screens (screen1.fits to screen8.fits in the example above) will be created in the current working directory. Move them somewhere convenient (I have them in Y_USER/data=.yorick/data in my case). You will need to edit the yao parameter files to reflect the path and names of these phase screens if you put it somewhere different or used a different name (look for "atm.screen" in the parfile).

What aoread() does is 
(a) read, or rather include, the parameter file, which will fill the various structures containing the definitions of the WFS, DM, loop, etc... 
(b) go through a simple check of the parameters to see if anything is missing or if there are incompatible assigments, in which case it will print out an error message (hopefully understandable). Otherwise, it prints out informational messages or warnings.
Then we need to initialize the system. aoinit() will do that for us. It will initialize all the arrays (pupil, etc), initialize the system pupil, the various WFS, DM, etc. It will then compute the interaction matrix, invert it and finally plot (if requested) a graphical system configuration. The amount of information you get during the aoinit is set by sim.verbose. The default verbose in sh6x6.par is 0, which means you get no feedback at all except for warnings and error messages. Let's set sim.verbose to 1 and run aoinit():

2. Question-during the initialization: 
what is the influence functions and what is the Pre_computing kernels for SH WFS
1) The pre-computing kernels for the SHWFS

2) DM influcence functions: how it influence the nearby ones...

3) Interaction Matrix

4) Modal Gain

5) Interation and command matrices
what is SVD...

3. aoloop
shwfs_comp_lgs_defocuses: wfs(1).lgs_prof_alt undefined //how is this calculated
Optimizing 2D FFT - size = 28 //what is this...
Pre-computing Kernels for the SH WFS
WFS#1 Field stop size = 2.400000  //right
NGS#1 flux varies between 24213 and 28723 photon/subap/it   // how is this calculated...

4. 
Saving results in /Users/siqi/YAO/examples/sh12x12.res (ps,imav.fits)...
time(1-2) =  3.86 ms  (WF sensing)// what does it mean...
time(2-3) =  0.03 ms  (Reset and measurement history handling) // what is this...
time(3-4) =  0.03 ms  (cMat multiplication)
time(4-5) =  0.83 ms  (DM shape computation)
time(5-6) =  2.02 ms  (Target PSFs estimation)
time(6-7) =  1.49 ms  (Displays)
time(7-8) =  0.06 ms  (Circular buffers, end-of-loop printouts)
Finished on 10:35:32
120.890946 iterations/second on average
 Pixel size in images (e.g., imav): 13.499 mas

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1    1.65    0.0    0.0       60.5   0.305      314.2


Strehl, FWHM and 50 percent encircled energy are available as extern variables under the name strehl, fwhm and e50 (the averaged PSFs are also available, together with the history of DM commands, DM errors and WFS measurements if the keyword savecb= has been set):

# ====================Controlling features ==========================
In yao, you have to define the AO system you want to simulate. 
It starts by defining an entrance aperture (the system pupil). This is done through 2 parameters: the physical pupil size (e.g. diameter) in real world units, meters. And because yao is a monte-carlo code, that uses arrays to generate phases and PSFs, 
we will need a pupil array and thus a pupil diameter in pixel.

#===================2016/03/03  ======================
The yao