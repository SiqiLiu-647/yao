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

