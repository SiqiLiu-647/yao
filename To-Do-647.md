Stuck at the installation part
* ERROR (pkg_probe_oses) Did not find any OS directory at http://www.maumae.net/yorick/packages/

Deformable Mirror parameters(from wikipedia webpage, deformable mirror):
Number of actuators: determines the number of degrees of freedom (wavefront inflections) the mirror can correct. It is very common to compare an arbitrary DM to an ideal device that can perfectly reproduce wavefront modes in the form of Zernike polynomials. For predefined statistics of aberrations a deformable mirror with M actuators can be equivalent to an ideal Zernike corrector with N (usually N < M) degrees of freedom. For correction of the atmospheric turbulence, elimination of low-order Zernike terms usually results in significant improvement of the image quality, while further correction of the higher-order terms introduces less significant improvements. For strong and rapid wavefront error fluctuations such as shocks and wake turbulence typically encountered in high-speed aerodynamic flowfields, the number of actuators, actuator pitch and stroke determine the maximum wavefront gradients that can be compensated for.

Actuator pitch: is the distance between actuator centers. Deformable mirrors with large actuator pitch and large number of actuators are bulky and expensive.

Actuator stroke is the maximum possible actuator displacement, typically in positive or negative excursions from some central null position. Stroke typically ranges from ±1 to ±30 micrometres. Free actuator stroke limits the maximum amplitude of the corrected wavefront, while the inter-actuator stroke limits the maximum amplitude and gradients of correctable higher-order aberrations.

Influence function is the characteristic shape corresponding to the mirror response to the action of a single actuator. Different types of deformable mirrors have different influence functions, moreover the influence functions can be different for different actuators of the same mirror. Influence function that covers the whole mirror surface is called a "modal" function, while localized response is called "zonal".

Actuator coupling shows how much the movement of one actuator will displace its neighbors. All "modal" mirrors have large cross-coupling, which in fact is good as it secures the high quality of correction of smooth low-order optical aberrations that usually have the highest statistical weight.

Response time shows how quickly the mirror will react to the control signal. Can vary from microseconds (MEMS and magnetics mirrors) to tens of seconds for thermally controlled DM's.

Hysteresis and creep are nonlinear actuation effects that decrease the precision of the response of the deformable mirror. For different concepts, the hysteresis can vary from zero (electrostatically-actuated mirrors) to tens of percent for mirrors with piezoelectric actuators. Hysteresis is a residual positional error from previous actuator position commands, and limits the mirror ability to work in a feedforward mode, outside of a feedback loop.


# ================================================================
yao::manual
2016/02/21
1. Run the simulation that will get the best Strehl ratio, given a specific setup, the code could read the file.
2. Figure out the reason to choose sim.diffract to be 1 or 2: fully diffractive or simple geometric.
wfs.shmethod	long	N/A	none	yes	1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
3. Figure out why Monte-Carlo?
4. Remember to git log the file, there is currently error in it: the mirror and the WFS. the number of the actuators are not right, and the number of WFS is not right...
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations



# ====================================================
2016/02/22
* what does it mean of the x-window, the patches of guide star beam, A and B represents
* why the number of the actuators are always 80?
* fracIllum will also influence the result.

Suresh
* Could be able to write a yorick file, like python and run underneath.

# ====================================================
2016/02/23
* There is always an error(when running the yao_loop_exampple.i): 
> ERROR (*main*) unrecognized keyword in builtin function call
WARNING detailed line number information unavailable
now at pc= 145 (of 331), failed at pc= 168
  LINE: 21  FILE: /Users/siqi/YAO/examples/yao_loop_example.i
 To enter debug mode, type <RETURN> now (then dbexit to get out)

 what does the A and C here means...Never mind

 A is the symbol in the plot.

 # ==================================================
 2016/02/23 Ask Suresh about the simulation result.

 The exposure time is the iteration time 1.6 ms.
 The frame delay is the exposure time + the readout delay = 1.6ms + 1.596 ms 
 If we take the exposure time as the unit, so the frame rate will be considered to be 1+ 1.596/1.6 = 2
 Or the iteration time is 0.8 ms, because the previous iteration time is the maximum value, the frame delay could be 1+1.596/0.8 = 3.






