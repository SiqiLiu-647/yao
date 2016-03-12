=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      387.3   0.016      528.7
Field Avg  1.65                    387.3   0.016      528.7
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 wfs(n).shnxsub	   = 2;  //# of subapertures in telescope diameter, in 1D direction.
 wfs(n).npixels     = 2;   //Focal plane: Final # of pixels per subaperture. After pixel-binning, the sub-aperture consists of 2x2 pixels.
 wfs(n).npixpersub  = 40;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80
 wfs(n).fssize      = 1.65;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80)
 wfs(n).fstop        = "square"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract.
 wfs(n).pyr_mod_ampl = 1.0;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float
 wfs(n).pyr_mod_npts = 12;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 //loop.startskip     = 10; //# of iteration to skip before collecting statistics.
 //loop.skipevery     = 10000; //In phase screen, skip by "skipby" steps every skipevery iterations (0=none).
 //loop.skipby        = 10000;// Get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fa1f98a5290,layerfrac=0x7fa1f98a5538,
 layerspeed=0x7fa1f98a54b0,layeralt=0x7fa1f98a55c0,winddir=0x7fa1f98a5648,
 _layeralt=0x7fa1f98a4fe8)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=1,
 pyr_mod_npts=12,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=2,npixpersub=40,pixsize=0,npixels=2,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",fssize=1.65,fsoffset=
 [0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fa1f90a3b70,lgs_prof_alt=0x7fa1f98c3e68,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fa1fa020f70,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=4,_nsub4disp=0,_nmes=8,
 _sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,_fluxpersub=
 0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,_skyfluxpersub=0x0,
 _nphotons=3.25498e+06,_skynphotons=61.3067,_tt=[-0.0884938,0.0419613],
 _lastvalidtt=[-0.0884938,0.0419613],_upttcommand=[0,0],_refmes=0x7fa1fa0213b0,
 _tiprefv=0x7fa1fa021968,_tiltrefv=0x7fa1fa0217d0,_tiprefvn=0x7fa1fa021858,
 _tiltrefvn=0x7fa1fa0212a0,_reordervec=0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,
 _nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,_centroidw=0x0,
 _fimage=0x7fa1f8d1e100,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,_imistart2=0x0,
 _imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,
 _fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,
 _submask=0x7fa1fa0b4e30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,_kerffti=0x0,
 _kernelconv=0,_cyclecounter=1,_dispimage=0x7fa1f8d1e100,_x=0x0,_y=0x0,
 _centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fa1fa021190,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fa1f90a5078)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=-0.1,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fa1f98c42c8,_ctrlden=0x7fa1f98c4258,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fa1f8d07cd0,_xlast=0x7fa1f8d1fde0,_ylast=[0x7fa1f98e9430,
 0x7fa1f98e9430,0x7fa1f98e9430],_y0=0x7fa1f98fdc30,_signus=0x7fa1f8d05260,
 _puppixoffset=[0,0],_nact=80,_def=0x105fbb030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fa1f8d07840,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fa1f90a4eb8,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fa1f90a4f98,xposition=0x7fa1f90a4f60,yposition=
 0x7fa1f90a4f28,xspeed=0x0,yspeed=0x0,dispzoom=0x7fa1f90a4ef0,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      387.3   0.016      528.7
Field Avg  1.65                    387.3   0.016      528.7
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 wfs(n).shnxsub	   = 2;  //# of subapertures in telescope diameter, in 1D direction.
 wfs(n).npixels     = 25;   //Focal plane: Final # of pixels per subaperture. After pixel-binning, the sub-aperture consists of 2x2 pixels.
 wfs(n).npixpersub  = 40;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80
 wfs(n).fssize      = 1.65;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80)
 wfs(n).fstop        = "square"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract.
 wfs(n).pyr_mod_ampl = 1.0;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float
 wfs(n).pyr_mod_npts = 12;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 //loop.startskip     = 10; //# of iteration to skip before collecting statistics.
 //loop.skipevery     = 10000; //In phase screen, skip by "skipby" steps every skipevery iterations (0=none).
 //loop.skipby        = 10000;// Get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fa1f98a5538,layerfrac=0x7fa1f98a54b0,
 layerspeed=0x7fa1f98a5290,layeralt=0x7fa1fa0212a0,winddir=0x7fa1fa021858,
 _layeralt=0x7fa1f98a4fe8)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=1,
 pyr_mod_npts=12,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=2,npixpersub=40,pixsize=0,npixels=25,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",fssize=1.65,fsoffset=
 [0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fa1f90a5040,lgs_prof_alt=0x7fa1fa802180,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fa1fa021968,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=4,_nsub4disp=0,_nmes=8,
 _sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,_fluxpersub=
 0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,_skyfluxpersub=0x0,
 _nphotons=3.25498e+06,_skynphotons=61.3067,_tt=[-0.0885635,0.0411676],
 _lastvalidtt=[-0.0885635,0.0411676],_upttcommand=[0,0],_refmes=0x7fa1fa020f70,
 _tiprefv=0x7fa1fa0213b0,_tiltrefv=0x7fa1f98a50f8,_tiprefvn=0x7fa1fa021b00,
 _tiltrefvn=0x7fa1fa021190,_reordervec=0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,
 _nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,_centroidw=0x0,
 _fimage=0x7fa1f8d24740,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,_imistart2=0x0,
 _imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,
 _fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,
 _submask=0x7fa1fa062a30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,_kerffti=0x0,
 _kernelconv=0,_cyclecounter=1,_dispimage=0x7fa1f8d24740,_x=0x0,_y=0x0,
 _centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fa1fa0220d8,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fa1f90a0df8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=-0.1,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fa1f90a0e30,_ctrlden=0x7fa1f98c3f48,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fa1f8d1fde0,_xlast=0x7fa1f8d07cd0,_ylast=[0x7fa1f98e9430,
 0x7fa1f98e9430,0x7fa1f98e9430],_y0=0x7fa1f98fdc30,_signus=0x7fa1f8d05260,
 _puppixoffset=[0,0],_nact=80,_def=0x1056af030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fa1f8d08300,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fa1f90a4f28,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fa1f90a4ef0,xposition=0x7fa1f98c42c8,yposition=
 0x7fa1f98c4258,xspeed=0x0,yspeed=0x0,dispzoom=0x7fa1f90a4eb8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      387.3   0.016      528.7
Field Avg  1.65                    387.3   0.016      528.7
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 wfs(n).shnxsub	   = 2;  //# of subapertures in telescope diameter, in 1D direction.
 wfs(n).npixels     = 2;   //Focal plane: Final # of pixels per subaperture. After pixel-binning, the sub-aperture consists of 2x2 pixels.
 wfs(n).npixpersub  = 40;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80
 wfs(n).fssize      = 1.65;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80)
 wfs(n).fstop        = "square"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract.
 wfs(n).pyr_mod_ampl = 1.0;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float
 wfs(n).pyr_mod_npts = 12;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fa1f98a5290,layerfrac=0x7fa1f98a5538,
 layerspeed=0x7fa1f98a54b0,layeralt=0x7fa1fa021858,winddir=0x7fa1fa0212a0,
 _layeralt=0x7fa1fa0213b0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=1,
 pyr_mod_npts=12,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=2,npixpersub=40,pixsize=0,npixels=2,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",fssize=1.65,fsoffset=
 [0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fa1f90a0e30,lgs_prof_alt=0x7fa1f98c3e68,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fa1f98a5648,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=4,_nsub4disp=0,_nmes=8,
 _sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,_fluxpersub=
 0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,_skyfluxpersub=0x0,
 _nphotons=3.25498e+06,_skynphotons=61.3067,_tt=[-0.0886354,0.0411492],
 _lastvalidtt=[-0.0886354,0.0411492],_upttcommand=[0,0],_refmes=0x7fa1fa021108,
 _tiprefv=0x7fa1f98a4fe8,_tiltrefv=0x7fa1fa022380,_tiprefvn=0x7fa1fa021968,
 _tiltrefvn=0x7fa1fa0220d8,_reordervec=0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,
 _nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,_centroidw=0x0,
 _fimage=0x7fa1f8d21220,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,_imistart2=0x0,
 _imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,
 _fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,
 _submask=0x7fa1fa06f430,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,_kerffti=0x0,
 _kernelconv=0,_cyclecounter=1,_dispimage=0x7fa1f8d21220,_x=0x0,_y=0x0,
 _centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fa1fa021da8,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fa1f90a4ef0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fa1fa802500,_ctrlden=0x7fa1f90a5238,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fa1f8c42530,_xlast=0x7fa1f8c43ae0,_ylast=[0x7fa1f9104a30,
 0x7fa1f9104a30,0x7fa1f9104a30],_y0=0x7fa1f90de430,_signus=0x7fa1f8c461d0,
 _puppixoffset=[0,0],_nact=80,_def=0x105fbb030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fa1f8c46660,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fa1f90a0df8,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fa1f90a5040,xposition=0x7fa1f90a4f28,yposition=
 0x7fa1f98c4258,xspeed=0x0,yspeed=0x0,dispzoom=0x7fa1f98c4bf8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      387.3   0.016      528.7
Field Avg  1.65                    387.3   0.016      528.7
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 wfs(n).shnxsub	   = 2;  //# of subapertures in telescope diameter, in 1D direction.
 wfs(n).npixels     = 40;   //Focal plane: Final # of pixels per subaperture. After pixel-binning, the sub-aperture consists of 2x2 pixels.
 wfs(n).npixpersub  = 40;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80
 wfs(n).fssize      = 1.65;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80)
 wfs(n).fstop        = "square"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract.
 wfs(n).pyr_mod_ampl = 1.0;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float
 wfs(n).pyr_mod_npts = 12;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fa1f98a5290,layerfrac=0x7fa1f98a5538,
 layerspeed=0x7fa1f98a54b0,layeralt=0x7fa1fa0227c0,winddir=0x7fa1fa021968,
 _layeralt=0x7fa1fa0213b0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=1,
 pyr_mod_npts=12,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=2,npixpersub=40,pixsize=0,npixels=40,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",fssize=1.65,fsoffset=
 [0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fa1f90a3a90,lgs_prof_alt=0x7fa1f98c4220,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fa1fa021108,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=4,_nsub4disp=0,_nmes=8,
 _sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,_fluxpersub=
 0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,_skyfluxpersub=0x0,
 _nphotons=3.25498e+06,_skynphotons=61.3067,_tt=[-0.0888601,0.0416212],
 _lastvalidtt=[-0.0888601,0.0416212],_upttcommand=[0,0],_refmes=0x7fa1fa021b00,
 _tiprefv=0x7fa1fa021638,_tiltrefv=0x7fa1fa021eb8,_tiprefvn=0x7fa1fa0222f8,
 _tiltrefvn=0x7fa1fa021da8,_reordervec=0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,
 _nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,_centroidw=0x0,
 _fimage=0x7fa1f8c48fd0,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,_imistart2=0x0,
 _imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,
 _fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,
 _submask=0x7fa1f996f030,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,_kerffti=0x0,
 _kernelconv=0,_cyclecounter=1,_dispimage=0x7fa1f8c48fd0,_x=0x0,_y=0x0,
 _centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fa1fa021a78,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fa1f90a0e30)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fa1f98c4060,_ctrlden=0x7fa1f90a51c8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fa1f8c43ae0,_xlast=0x7fa1f8c41e40,_ylast=[0x7fa1f90a9e30,
 0x7fa1f90a9e30,0x7fa1f90a9e30],_y0=0x7fa1f90dca30,_signus=0x7fa1f8c447e0,
 _puppixoffset=[0,0],_nact=80,_def=0x1056af030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fa1f8c46bd0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fa1fa8025e0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fa1f90a0df8,xposition=0x7fa1f90a5238,yposition=
 0x7fa1f90a4ef0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fa1f90a4f28,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      387.3   0.016      528.7
Field Avg  1.65                    387.3   0.016      528.7
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 wfs(n).shnxsub	   = 2;  //# of subapertures in telescope diameter, in 1D direction.
 wfs(n).npixels     = 40;   //Focal plane: Final # of pixels per subaperture. After pixel-binning, the sub-aperture consists of 2x2 pixels.
 wfs(n).npixpersub  = 40;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80
 wfs(n).fssize      = 1.65;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80)
 wfs(n).fstop        = "square"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract.
 wfs(n).pyr_mod_ampl = 1.0;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float
 wfs(n).pyr_mod_npts = 12;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fea91930eb0,layerfrac=0x7fea91930c90,
 layerspeed=0x7fea91930f38,layeralt=0x7fea91930fc0,winddir=0x7fea91931048,
 _layeralt=0x7fea919309e8)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=1,
 pyr_mod_npts=12,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=2,npixpersub=40,pixsize=0,npixels=40,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",fssize=1.65,fsoffset=
 [0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fea90882040,lgs_prof_alt=0x7fea908820b0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fea90884c58,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=4,_nsub4disp=0,_nmes=8,
 _sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,_fluxpersub=
 0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,_skyfluxpersub=0x0,
 _nphotons=3.25498e+06,_skynphotons=61.3067,_tt=[-0.0884938,0.0419613],
 _lastvalidtt=[-0.0884938,0.0419613],_upttcommand=[0,0],_refmes=0x7fea908847b0,
 _tiprefv=0x7fea90884370,_tiltrefv=0x7fea90884bd0,_tiprefvn=0x7fea90884d68,
 _tiltrefvn=0x7fea90884508,_reordervec=0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,
 _nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,_centroidw=0x0,
 _fimage=0x7fea90422b00,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,_imistart2=0x0,
 _imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,
 _fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,
 _submask=0x7fea92072e30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,_kerffti=0x0,
 _kernelconv=0,_cyclecounter=1,_dispimage=0x7fea90422b00,_x=0x0,_y=0x0,
 _centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fea90884ac0,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fea90877830)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fea90876f00,_ctrlden=0x7fea91855c30,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fea904258c0,_xlast=0x7fea90425a40,_ylast=[0x7fea9087aa30,
 0x7fea9087aa30,0x7fea9087aa30],_y0=0x7fea90908630,_signus=0x7fea90425bc0,
 _puppixoffset=[0,0],_nact=80,_def=0x1119e0030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fea9060ed00,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fea90881fd0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fea90881f60,xposition=0x7fea90881ef0,yposition=
 0x7fea90881eb8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fea90881f28,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      387.3   0.016      528.7
Field Avg  1.65                    387.3   0.016      528.7
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 wfs(n).shnxsub	   = 2;  //# of subapertures in telescope diameter, in 1D direction.
 wfs(n).npixels     = 40;   //Focal plane: Final # of pixels per subaperture. After pixel-binning, the sub-aperture consists of 2x2 pixels.
 wfs(n).npixpersub  = 40;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80
 wfs(n).fssize      = 1.65;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80)
 wfs(n).fstop        = "square"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract.
 wfs(n).pyr_mod_ampl = 1.0;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float
 wfs(n).pyr_mod_npts = 12;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fea91930eb0,layerfrac=0x7fea91930c90,
 layerspeed=0x7fea91930f38,layeralt=0x7fea91930fc0,winddir=0x7fea91931048,
 _layeralt=0x7fea90884618)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=1,
 pyr_mod_npts=12,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=2,npixpersub=40,pixsize=0,npixels=40,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",fssize=1.65,fsoffset=
 [0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fea90882040,lgs_prof_alt=0x7fea908820b0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fea90884df0,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=4,_nsub4disp=0,_nmes=8,
 _sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,_fluxpersub=
 0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,_skyfluxpersub=0x0,
 _nphotons=3.25498e+06,_skynphotons=61.3067,_tt=[-0.0885635,0.0411676],
 _lastvalidtt=[-0.0885635,0.0411676],_upttcommand=[0,0],_refmes=0x7fea90885cd0,
 _tiprefv=0x7fea919309e8,_tiltrefv=0x7fea90885450,_tiprefvn=0x7fea90884370,
 _tiltrefvn=0x7fea90884bd0,_reordervec=0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,
 _nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,_centroidw=0x0,
 _fimage=0x7fea90425510,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,_imistart2=0x0,
 _imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,
 _fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,
 _submask=0x7fea909ae230,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,_kerffti=0x0,
 _kernelconv=0,_cyclecounter=1,_dispimage=0x7fea90425510,_x=0x0,_y=0x0,
 _centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fea90885560,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fea90876bf0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fea91941640,_ctrlden=0x7fea9185c9a8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fea906470d0,_xlast=0x7fea9060b740,_ylast=[0x7fea919a0430,
 0x7fea919a0430,0x7fea919a0430],_y0=0x7fea9199e430,_signus=0x7fea9064c870,
 _puppixoffset=[0,0],_nact=80,_def=0x1110d4030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fea9064b850,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fea90881fd0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fea90881f60,xposition=0x7fea9185ca88,yposition=
 0x7fea908822e0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fea90881f28,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      387.3   0.016      528.7
Field Avg  1.65                    387.3   0.016      528.7
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 wfs(n).shnxsub	   = 2;  //# of subapertures in telescope diameter, in 1D direction.
 wfs(n).npixels     = 40;   //Focal plane: Final # of pixels per subaperture. After pixel-binning, the sub-aperture consists of 2x2 pixels.
 wfs(n).npixpersub  =11;
 wfs(n).npixpersub  = 40;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80
 wfs(n).fssize      = 1.65;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80)
 wfs(n).fstop        = "square"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract.
 wfs(n).pyr_mod_ampl = 1.0;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - -
 wfs(n).pyr_mod_npts = 12;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fea91930c90,layerfrac=0x7fea91930f38,
 layerspeed=0x7fea91930eb0,layeralt=0x7fea90884bd0,winddir=0x7fea90884370,
 _layeralt=0x7fea90884618)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=1,
 pyr_mod_npts=12,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=2,npixpersub=40,pixsize=0,npixels=40,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",fssize=1.65,fsoffset=
 [0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fea90881e10,lgs_prof_alt=0x7fea9185c970,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fea919309e8,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=4,_nsub4disp=0,_nmes=8,
 _sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,_fluxpersub=
 0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,_skyfluxpersub=0x0,
 _nphotons=3.25498e+06,_skynphotons=61.3067,_tt=[-0.0886354,0.0411492],
 _lastvalidtt=[-0.0886354,0.0411492],_upttcommand=[0,0],_refmes=0x7fea90884df0,
 _tiprefv=0x7fea90885cd0,_tiltrefv=0x7fea91930af8,_tiprefvn=0x7fea90884d68,
 _tiltrefvn=0x7fea90885560,_reordervec=0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,
 _nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,_centroidw=0x0,
 _fimage=0x7fea904265f0,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,_imistart2=0x0,
 _imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,
 _fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,
 _submask=0x7fea90970630,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,_kerffti=0x0,
 _kernelconv=0,_cyclecounter=1,_dispimage=0x7fea904265f0,_x=0x0,_y=0x0,
 _centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fea90885b38,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fea908808d0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fea90880b70,_ctrlden=0x7fea90881e80,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fea9060b740,_xlast=0x7fea9060eae0,_ylast=[0x7fea919a0430,
 0x7fea919a0430,0x7fea919a0430],_y0=0x7fea9199e430,_signus=0x7fea906470b0,
 _puppixoffset=[0,0],_nact=80,_def=0x1119e0030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fea9064bb10,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fea908820b0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fea90881f28,xposition=0x7fea91941640,yposition=
 0x7fea9185c9a8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fea90881fd0,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      387.3   0.016      528.7
Field Avg  1.65                    387.3   0.016      528.7
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 wfs(n).shnxsub	   = 2;  //# of subapertures in telescope diameter, in 1D direction.
 wfs(n).npixels     = 40;   //Focal plane: Final # of pixels per subaperture. After pixel-binning, the sub-aperture consists of 2x2 pixels.
 wfs(n).npixpersub  =11;
 wfs(n).npixpersub  = 40;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80
 wfs(n).fssize      = 1.65;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80)
 wfs(n).fstop        = "square"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract.
 wfs(n).pyr_mod_ampl = 1.0;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - -
 wfs(n).pyr_mod_npts = 12;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fea91930f38,layerfrac=0x7fea91930eb0,
 layerspeed=0x7fea91930c90,layeralt=0x7fea90885560,winddir=0x7fea90884d68,
 _layeralt=0x7fea90884618)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=1,
 pyr_mod_npts=12,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=2,npixpersub=40,pixsize=0,npixels=40,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",fssize=1.65,fsoffset=
 [0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fea90876bf0,lgs_prof_alt=0x7fea90880a20,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fea90885cd0,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=4,_nsub4disp=0,_nmes=8,
 _sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,_fluxpersub=
 0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,_skyfluxpersub=0x0,
 _nphotons=3.25498e+06,_skynphotons=61.3067,_tt=[-0.0888601,0.0416212],
 _lastvalidtt=[-0.0888601,0.0416212],_upttcommand=[0,0],_refmes=0x7fea919309e8,
 _tiprefv=0x7fea90884df0,_tiltrefv=0x7fea91931048,_tiprefvn=0x7fea90884a38,
 _tiltrefvn=0x7fea90885b38,_reordervec=0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,
 _nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,_centroidw=0x0,
 _fimage=0x7fea90425d70,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,_imistart2=0x0,
 _imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,
 _fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,
 _submask=0x7fea91a68c30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,_kerffti=0x0,
 _kernelconv=0,_cyclecounter=1,_dispimage=0x7fea90425d70,_x=0x0,_y=0x0,
 _centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fea90885010,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fea9087ddf8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fea90876b80,_ctrlden=0x7fea90876de8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fea90423fb0,_xlast=0x7fea90422ce0,_ylast=[0x7fea9088f030,
 0x7fea9088f030,0x7fea9088f030],_y0=0x7fea9087aa30,_signus=0x7fea90423080,
 _puppixoffset=[0,0],_nact=80,_def=0x1110d4030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fea9064ec50,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fea9185c970,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fea90881fd0,xposition=0x7fea90880b70,yposition=
 0x7fea90881e80,xspeed=0x0,yspeed=0x0,dispzoom=0x7fea908820b0,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      387.3   0.016      528.7
Field Avg  1.65                    387.3   0.016      528.7
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 2;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one...
 wfs(n).npixels     = 40;   //Focal plane: Final # of pixels per subaperture. After pixel-binning, the sub-aperture consists of 2x2 pixels.
 wfs(n).npixpersub  = 40;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80
 wfs(n).fssize       = 1.65;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80)
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract.
 wfs(n).pyr_mod_ampl = 1.0;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - -
 wfs(n).pyr_mod_npts = 12;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a4b0,layerfrac=0x7fc23308a290,
 layerspeed=0x7fc23308a538,layeralt=0x7fc23308a428,winddir=0x7fc23308a0f8,
 _layeralt=0x7fc233089fe8)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=1,
 pyr_mod_npts=12,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=2,npixpersub=40,pixsize=0,npixels=40,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.65,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc23403d9a8,lgs_prof_alt=0x7fc23403f5f0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc23404c548,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=4,_nsub4disp=0,_nmes=8,
 _sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,_fluxpersub=
 0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,_skyfluxpersub=0x0,
 _nphotons=3.25498e+06,_skynphotons=48.1502,_tt=[-0.0898816,0.0422601],
 _lastvalidtt=[-0.0898816,0.0422601],_upttcommand=[0,0],_refmes=0x7fc23404c1b0,
 _tiprefv=0x7fc23404be80,_tiltrefv=0x7fc23404c5d0,_tiprefvn=0x7fc23404bdf8,
 _tiltrefvn=0x7fc23404c018,_reordervec=0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,
 _nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,_centroidw=0x0,
 _fimage=0x7fc232d10370,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,_imistart2=0x0,
 _imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,
 _fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,
 _submask=0x7fc23391c030,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,_kerffti=0x0,
 _kernelconv=0,_cyclecounter=1,_dispimage=0x7fc232d10370,_x=0x0,_y=0x0,
 _centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc23404bce8,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc23403f4a0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23403fac0,_ctrlden=0x7fc233857888,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232d21750,_xlast=0x7fc232d0c2c0,_ylast=[0x7fc2338b2430,
 0x7fc2338b2430,0x7fc2338b2430],_y0=0x7fc2338f3e30,_signus=0x7fc232d0ee50,
 _puppixoffset=[0,0],_nact=80,_def=0x108c4b030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232d11770,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403a7f8,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc2340498b8,xposition=0x7fc234049848,yposition=
 0x7fc23403a830,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc234049ab0,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      387.3   0.016      528.7
Field Avg  1.65                    387.3   0.016      528.7
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 2;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one...
 wfs(n).npixels     = 15;   //Focal plane: Final # of pixels per subaperture. After pixel-binning, the sub-aperture consists of 2x2 pixels.
 wfs(n).npixpersub  = 40;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80
 wfs(n).fssize       = 1.65;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80)
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract.
 wfs(n).pyr_mod_ampl = 1.0;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - -
 wfs(n).pyr_mod_npts = 12;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a4b0,layerfrac=0x7fc23308a290,
 layerspeed=0x7fc23308a538,layeralt=0x7fc23404bce8,winddir=0x7fc23404c0a0,
 _layeralt=0x7fc233089fe8)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=1,
 pyr_mod_npts=12,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=2,npixpersub=40,pixsize=0,npixels=15,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.65,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc23403fa88,lgs_prof_alt=0x7fc23403da50,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc23308a5c0,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=4,_nsub4disp=0,_nmes=8,
 _sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,_fluxpersub=
 0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,_skyfluxpersub=0x0,
 _nphotons=3.25498e+06,_skynphotons=48.1502,_tt=[-0.0894181,0.0423603],
 _lastvalidtt=[-0.0894181,0.0423603],_upttcommand=[0,0],_refmes=0x7fc23308a648,
 _tiprefv=0x7fc23404c7f0,_tiltrefv=0x7fc23404bdf8,_tiprefvn=0x7fc23404ced8,
 _tiltrefvn=0x7fc23404c5d0,_reordervec=0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,
 _nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,_centroidw=0x0,
 _fimage=0x7fc232c47070,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,_imistart2=0x0,
 _imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,
 _fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,
 _submask=0x7fc2338f9a30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,_kerffti=0x0,
 _kernelconv=0,_cyclecounter=1,_dispimage=0x7fc232c47070,_x=0x0,_y=0x0,
 _centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc23404d3a0,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc23403d5f0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc234049650,_ctrlden=0x7fc23403d660,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232d21750,_xlast=0x7fc232d0c2c0,_ylast=[0x7fc2338b2430,
 0x7fc2338b2430,0x7fc2338b2430],_y0=0x7fc2338f3e30,_signus=0x7fc232d0e260,
 _puppixoffset=[0,0],_nact=80,_def=0x108c4b030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232d10aa0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403d820,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc23403d9a8,xposition=0x7fc23403f5f0,yposition=
 0x7fc23403fac0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc234049a40,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      387.3   0.016      528.7
Field Avg  1.65                    387.3   0.016      528.7
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 2;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one...
 //wfs(n).npixels     = 15;   //Focal plane: Final # of pixels per subaperture. After pixel-binning, the sub-aperture consists of 2x2 pixels.
 wfs(n).npixpersub  = 40;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80
 wfs(n).fssize       = 1.65;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80)
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract.
 wfs(n).pyr_mod_ampl = 1.0;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - -
 wfs(n).pyr_mod_npts = 12;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a290,layerfrac=0x7fc23308a538,
 layerspeed=0x7fc23308a4b0,layeralt=0x7fc23404c5d0,winddir=0x7fc23404ced8,
 _layeralt=0x7fc233089fe8)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=1,
 pyr_mod_npts=12,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=2,npixpersub=40,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.65,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc23403d628,lgs_prof_alt=0x7fc2340495a8,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc23404c7f0,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=4,_nsub4disp=0,_nmes=8,
 _sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,_fluxpersub=
 0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,_skyfluxpersub=0x0,
 _nphotons=3.25498e+06,_skynphotons=48.1502,_tt=[-0.0896165,0.042389],
 _lastvalidtt=[-0.0896165,0.042389],_upttcommand=[0,0],_refmes=0x7fc23308a5c0,
 _tiprefv=0x7fc23308a648,_tiltrefv=0x7fc23308a428,_tiprefvn=0x7fc23404d070,
 _tiltrefvn=0x7fc23404d3a0,_reordervec=0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,
 _nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,_centroidw=0x0,
 _fimage=0x7fc232c45380,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,_imistart2=0x0,
 _imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,
 _fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,
 _submask=0x7fc233180830,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,_kerffti=0x0,
 _kernelconv=0,_cyclecounter=1,_dispimage=0x7fc232c45380,_x=0x0,_y=0x0,
 _centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc23404d538,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc233857a80)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc233857268,_ctrlden=0x7fc23403d890,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232c3d8f0,_xlast=0x7fc232c43e10,_ylast=[0x7fc2330a9c30,
 0x7fc2330a9c30,0x7fc2330a9c30],_y0=0x7fc23312fc30,_signus=0x7fc232c46d60,
 _puppixoffset=[0,0],_nact=80,_def=0x10833f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232c3f0f0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403da50,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc234049a40,xposition=0x7fc234049650,yposition=
 0x7fc23403d660,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403d820,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      387.3   0.016      528.7
Field Avg  1.65                    387.3   0.016      528.7
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 4;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... pyr_npix = 40 = 80/2 
 //wfs(n).npixels     = 40;   //Focal plane: Final # of pixels per subaperture. After pixel-binning, the sub-aperture consists of 2x2 pixels...  does not seem to have an influence here...
 wfs(n).npixpersub   = 20;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.65;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80)
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract.
 wfs(n).pyr_mod_ampl = 1.0;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - -
 wfs(n).pyr_mod_npts = 12;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 //wfs(n).pyr_npix     =15;
 //wfs(n).binfact = 20;
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23404ced8,layerfrac=0x7fc23308a538,
 layerspeed=0x7fc23404c4c0,layeralt=0x7fc23404cf60,winddir=0x7fc23404bce8,
 _layeralt=0x7fc23404c5d0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=1,
 pyr_mod_npts=12,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=4,npixpersub=20,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.65,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc2340497d8,lgs_prof_alt=0x7fc2340494c8,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc23380b658,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=16,_nsub4disp=0,_nmes=
 32,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=48.1502,_tt=[-0.0893739,
 0.0428062],_lastvalidtt=[-0.0893739,0.0428062],_upttcommand=[0,0],_refmes=
 0x7fc232d23b20,_tiprefv=0x7fc232c45f30,_tiltrefv=0x7fc232f04730,_tiprefvn=
 0x7fc232c49200,_tiltrefvn=0x7fc232f04870,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc233842630,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc233950030,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc233842630,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc233912f40,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc234049618)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23403f1c0,_ctrlden=0x7fc23403d660,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232d21750,_xlast=0x7fc232d0fcd0,_ylast=[0x7fc2338b2430,
 0x7fc2338b2430,0x7fc2338b2430],_y0=0x7fc23384ba30,_signus=0x7fc232d27e70,
 _puppixoffset=[0,0],_nact=80,_def=0x108c4b030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232d27780,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc233857428,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc23403daf8,xposition=0x7fc23403f778,yposition=
 0x7fc23403dc48,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403e1f8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 52 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0     2892.0   0.000     2094.4
Field Avg  1.65                   2892.0   0.000     2094.4
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 8;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... pyr_npix = 40 = 80/2 
 //wfs(n).npixels     = 40;   //Focal plane: Final # of pixels per subaperture. After pixel-binning, the sub-aperture consists of 2x2 pixels...  does not seem to have an influence here...
 wfs(n).npixpersub   = 10;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.65;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80)
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract.
 wfs(n).pyr_mod_ampl = 1.0;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - -
 wfs(n).pyr_mod_npts = 12;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 //wfs(n).pyr_npix     =15;
 //wfs(n).binfact = 20;
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a538,layerfrac=0x7fc23404c4c0,
 layerspeed=0x7fc23404ced8,layeralt=0x7fc23404c018,winddir=0x7fc23404cd40,
 _layeralt=0x7fc23404c5d0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=1,
 pyr_mod_npts=12,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=8,npixpersub=10,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.65,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc2338579d8,lgs_prof_alt=0x7fc2340492d0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc232d27d80,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=52,_nsub4disp=0,_nmes=
 104,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=48.1502,_tt=
 [-0.000543805,0.000742951],_lastvalidtt=[-0.000543805,0.000742951],
 _upttcommand=[0,0],_refmes=0x7fc232d26560,_tiprefv=0x7fc232c49260,_tiltrefv=
 0x7fc232d29be0,_tiprefvn=0x7fc232c49960,_tiltrefvn=0x7fc232d29f60,_reordervec=
 0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,
 _binindices=0x0,_binxy=0,_centroidw=0x0,_fimage=0x7fc233149830,_fimage2=0x0,
 _imistart=0x0,_imjstart=0x0,_imistart2=0x0,_imjstart2=0x0,_unittip=0x0,
 _unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=
 0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,_submask=0x7fc23320e830,_kernel=
 0x0,_kernels=0x0,_kerfftr=0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7fc233149830,_x=0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,
 _bckgrdcalib=0x7fc232c3ee00,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fc2340496c0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc234049a40,_ctrlden=0x7fc23403f778,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232d27260,_xlast=0x7fc232d21750,_ylast=[0x7fc2338b2430,
 0x7fc2338b2430,0x7fc2338b2430],_y0=0x7fc233825630,_signus=0x7fc232d0fcf0,
 _puppixoffset=[0,0],_nact=80,_def=0x10833f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232d10aa0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc2340494c8,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc23403e1f8,xposition=0x7fc23403f1c0,yposition=
 0x7fc23403d660,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc233857428,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1332 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      751.6   0.001     2094.4
Field Avg  1.65                    751.6   0.001     2094.4
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 //wfs(n).npixels     = 40;   //Focal plane: Final # of pixels per subaperture. After pixel-binning, the sub-aperture consists of 2x2 pixels...  does not seem to have an influence here...
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.65;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80)
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract.
 wfs(n).pyr_mod_ampl = 1.0;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - -
 wfs(n).pyr_mod_npts = 12;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 //wfs(n).pyr_npix     =15;
 //wfs(n).binfact = 20;
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23404c4c0,layerfrac=0x7fc23404ced8,
 layerspeed=0x7fc23308a538,layeralt=0x7fc23404bce8,winddir=0x7fc23404cf60,
 _layeralt=0x7fc23404c5d0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=1,
 pyr_mod_npts=12,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.65,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc234049618,lgs_prof_alt=0x7fc23403db30,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc233112c30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1332,_nsub4disp=0,
 _nmes=2664,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=48.1502,_tt=[-0.00750086,
 0.00839928],_lastvalidtt=[-0.00750086,0.00839928],_upttcommand=[0,0],_refmes=
 0x7fc2348d2830,_tiprefv=0x7fc2331a3630,_tiltrefv=0x7fc2338f9a30,_tiprefvn=
 0x7fc233142630,_tiltrefvn=0x7fc23386da30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc233a99a30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc23398b030,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc233a99a30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc233908a30,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc23403fac0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc233857700,_ctrlden=0x7fc2340497a0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232c46b00,_xlast=0x7fc232c43e10,_ylast=[0x7fc233118630,
 0x7fc233118630,0x7fc233118630],_y0=0x7fc23312fc30,_signus=0x7fc232c430b0,
 _puppixoffset=[0,0],_nact=80,_def=0x108c4b030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232c456f0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc2340492d0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc233857428,xposition=0x7fc234049a40,yposition=
 0x7fc23403f778,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc2340494c8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1332 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      687.9   0.001     2094.4
Field Avg  1.65                    687.9   0.001     2094.4
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 //wfs(n).npixels     = 40;   //Focal plane: Final # of pixels per subaperture. After pixel-binning, the sub-aperture consists of 2x2 pixels...  does not seem to have an influence here...
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 1.0;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - -
 wfs(n).pyr_mod_npts = 12;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 //wfs(n).pyr_npix     =15;
 //wfs(n).binfact = 20;
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a538,layerfrac=0x7fc23404c4c0,
 layerspeed=0x7fc23404ced8,layeralt=0x7fc23404cf60,winddir=0x7fc23404bce8,
 _layeralt=0x7fc23404c5d0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=1,
 pyr_mod_npts=12,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc23403d970,lgs_prof_alt=0x7fc2338577e0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc2339ec430,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1332,_nsub4disp=0,
 _nmes=2664,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=
 [-0.000269837,0.00352717],_lastvalidtt=[-0.000269837,0.00352717],_upttcommand=
 [0,0],_refmes=0x7fc234815630,_tiprefv=0x7fc2330e6630,_tiltrefv=0x7fc2330d5230,
 _tiprefvn=0x7fc233200c30,_tiltrefvn=0x7fc233906430,_reordervec=0x0,_npixels=0,
 _npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=
 0,_centroidw=0x0,_fimage=0x7fc233a54830,_fimage2=0x0,_imistart=0x0,_imjstart=
 0x0,_imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=
 0x0,_unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,
 _flat=0x0,_domask=0,_submask=0x7fc2331f4230,_kernel=0x0,_kernels=0x0,_kerfftr=
 0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc233a54830,_x=
 0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc23408f230,
 _bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,
 _wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,
 _LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,
 _dmnotinpath=0x7fc23403f740)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23403fd60,_ctrlden=0x7fc23403fc48,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232d10aa0,_xlast=0x7fc232d21750,_ylast=[0x7fc23312fc30,
 0x7fc23312fc30,0x7fc23312fc30],_y0=0x7fc23390fe30,_signus=0x7fc232c430b0,
 _puppixoffset=[0,0],_nact=80,_def=0x10833f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232c45570,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc234049308,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc233857700,xposition=0x7fc2340492d0,yposition=
 0x7fc23403db30,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc2340497a0,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1472 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      111.9   0.085      315.6
Field Avg  1.65                    111.9   0.085      315.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 1.2;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - -
 wfs(n).pyr_mod_npts = 4;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23404c4c0,layerfrac=0x7fc23404ced8,
 layerspeed=0x7fc23308a538,layeralt=0x7fc23404c018,winddir=0x7fc23404cd40,
 _layeralt=0x7fc23404c5d0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=1.2,
 pyr_mod_npts=4,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc23403da18,lgs_prof_alt=0x7fc23403fb68,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc233a56c30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1472,_nsub4disp=0,
 _nmes=2944,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00660447,
 -0.00221571],_lastvalidtt=[0.00660447,-0.00221571],_upttcommand=[0,0],_refmes=
 0x7fc23408b430,_tiprefv=0x7fc2330d5230,_tiltrefv=0x7fc23310f830,_tiprefvn=
 0x7fc23319a230,_tiltrefvn=0x7fc233149630,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc23324a830,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc233a60430,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc23324a830,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc233948430,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc23403f778)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23403fac0,_ctrlden=0x7fc23403d9a8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232d10aa0,_xlast=0x7fc232c45720,_ylast=[0x7fc23312fc30,
 0x7fc23312fc30,0x7fc23312fc30],_y0=0x7fc23388a830,_signus=0x7fc232c430b0,
 _puppixoffset=[0,0],_nact=80,_def=0x108c4b030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232c43e10,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc2338577e0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc2340497a0,xposition=0x7fc23403fd60,yposition=
 0x7fc23403fc48,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc234049308,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1316 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      162.0   0.014     2094.4
Field Avg  1.65                    162.0   0.014     2094.4
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 1.2;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - -
 wfs(n).pyr_mod_npts = 4;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23404ced8,layerfrac=0x7fc23308a538,
 layerspeed=0x7fc23404c4c0,layeralt=0x7fc23404bce8,winddir=0x7fc23404cf60,
 _layeralt=0x7fc23404c5d0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=1.2,
 pyr_mod_npts=12,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc23403f740,lgs_prof_alt=0x7fc233857380,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc2330d8630,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1316,_nsub4disp=0,
 _nmes=2632,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.0187369,
 -0.016907],_lastvalidtt=[0.0187369,-0.016907],_upttcommand=[0,0],_refmes=
 0x7fc2338fee30,_tiprefv=0x7fc233180830,_tiltrefv=0x7fc233950030,_tiprefvn=
 0x7fc23310f830,_tiltrefvn=0x7fc233906430,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc2340eae30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc233963030,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc2340eae30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc234833a30,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc23403d970)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc2340498b8,_ctrlden=0x7fc234049650,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232d21750,_xlast=0x7fc232d10aa0,_ylast=[0x7fc2338aa630,
 0x7fc2338aa630,0x7fc2338aa630],_y0=0x7fc23388a830,_signus=0x7fc232d25be0,
 _puppixoffset=[0,0],_nact=80,_def=0x10833f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232d0e700,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403fb68,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc234049308,xposition=0x7fc23403fac0,yposition=
 0x7fc23403d9a8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc2338577e0,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1472 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      111.9   0.085      315.6
Field Avg  1.65                    111.9   0.085      315.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 1.2;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - -
 wfs(n).pyr_mod_npts = 4;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a538,layerfrac=0x7fc23404c4c0,
 layerspeed=0x7fc23404ced8,layeralt=0x7fc23404cd40,winddir=0x7fc23404c018,
 _layeralt=0x7fc23404c5d0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=1.2,
 pyr_mod_npts=4,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc23403f778,lgs_prof_alt=0x7fc23403d5b8,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc23481b430,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1472,_nsub4disp=0,
 _nmes=2944,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00651099,
 -0.00247046],_lastvalidtt=[0.00651099,-0.00247046],_upttcommand=[0,0],_refmes=
 0x7fc23407c430,_tiprefv=0x7fc2340d4a30,_tiltrefv=0x7fc2338f9a30,_tiprefvn=
 0x7fc2340aea30,_tiltrefvn=0x7fc233950030,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc233aba430,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc2340c8030,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc233aba430,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc233945230,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc234049730)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23403fac0,_ctrlden=0x7fc23403d858,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232c3f110,_xlast=0x7fc232c3ddc0,_ylast=[0x7fc2330a5a30,
 0x7fc2330a5a30,0x7fc2330a5a30],_y0=0x7fc233152030,_signus=0x7fc232c471d0,
 _puppixoffset=[0,0],_nact=80,_def=0x10866e030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232c43e10,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc233857380,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc2338577e0,xposition=0x7fc2340498b8,yposition=
 0x7fc234049650,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403fb68,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1396 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      399.0   0.003     2094.4
Field Avg  1.65                    399.0   0.003     2094.4
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 1.2;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - -
 wfs(n).pyr_mod_npts = 4;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23404ced8,layerfrac=0x7fc23308a538,
 layerspeed=0x7fc23404c4c0,layeralt=0x7fc23404c018,winddir=0x7fc23404cd40,
 _layeralt=0x7fc23404c5d0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=1.2,
 pyr_mod_npts=8,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc234049260,lgs_prof_alt=0x7fc234049308,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc23320f430,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1396,_nsub4disp=0,
 _nmes=2792,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=
 [-0.000263379,-0.00191459],_lastvalidtt=[-0.000263379,-0.00191459],
 _upttcommand=[0,0],_refmes=0x7fc233906430,_tiprefv=0x7fc2331ce030,_tiltrefv=
 0x7fc2331a0c30,_tiprefvn=0x7fc2338f9a30,_tiltrefvn=0x7fc233945230,_reordervec=
 0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,
 _binindices=0x0,_binxy=0,_centroidw=0x0,_fimage=0x7fc233242830,_fimage2=0x0,
 _imistart=0x0,_imjstart=0x0,_imistart2=0x0,_imjstart2=0x0,_unittip=0x0,
 _unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=
 0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,_submask=0x7fc2331b3e30,_kernel=
 0x0,_kernels=0x0,_kerfftr=0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7fc233242830,_x=0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,
 _bckgrdcalib=0x7fc23310ce30,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fc2340497d8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc2338576c8,_ctrlden=0x7fc23403f938,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232c451f0,_xlast=0x7fc232c488b0,_ylast=[0x7fc23312fc30,
 0x7fc23312fc30,0x7fc23312fc30],_y0=0x7fc2330dac30,_signus=0x7fc232c45570,
 _puppixoffset=[0,0],_nact=80,_def=0x10866e030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232c48180,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc233857700,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc23403fac0,xposition=0x7fc233857380,yposition=
 0x7fc23403d5b8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403d858,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1472 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      111.9   0.085      315.6
Field Avg  1.65                    111.9   0.085      315.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 1.2;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - -
 wfs(n).pyr_mod_npts = 4;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a538,layerfrac=0x7fc23404c4c0,
 layerspeed=0x7fc23404ced8,layeralt=0x7fc23404bce8,winddir=0x7fc23404cf60,
 _layeralt=0x7fc23404c5d0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=1.2,
 pyr_mod_npts=4,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc23403e1f8,lgs_prof_alt=0x7fc23403d740,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc233148c30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1472,_nsub4disp=0,
 _nmes=2944,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00654866,
 -0.00224796],_lastvalidtt=[0.00654866,-0.00224796],_upttcommand=[0,0],_refmes=
 0x7fc233197830,_tiprefv=0x7fc233142630,_tiltrefv=0x7fc2332aac30,_tiprefvn=
 0x7fc233190a30,_tiltrefvn=0x7fc2332b0a30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc2339cd030,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc23395ca30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc2339cd030,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc23386da30,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc234049688)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23403f9e0,_ctrlden=0x7fc23309ac40,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232c43e10,_xlast=0x7fc232c45570,_ylast=[0x7fc23313a430,
 0x7fc23313a430,0x7fc23313a430],_y0=0x7fc23312fc30,_signus=0x7fc232c430b0,
 _puppixoffset=[0,0],_nact=80,_def=0x10866e030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232c47050,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc234049308,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc23403d858,xposition=0x7fc2338576c8,yposition=
 0x7fc23403f938,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc233857700,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1476 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      101.5   0.139      237.7
Field Avg  1.65                    101.5   0.139      237.7
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.2;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 4;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23404c4c0,layerfrac=0x7fc23404ced8,
 layerspeed=0x7fc23308a538,layeralt=0x7fc23404cd40,winddir=0x7fc23404c018,
 _layeralt=0x7fc23404c5d0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.2,
 pyr_mod_npts=4,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc2340497d8,lgs_prof_alt=0x7fc233838888,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc2330d6c30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1476,_nsub4disp=0,
 _nmes=2952,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.0112523,
 -0.00446186],_lastvalidtt=[0.0112523,-0.00446186],_upttcommand=[0,0],_refmes=
 0x7fc2330f6630,_tiprefv=0x7fc233148c30,_tiltrefv=0x7fc23408c430,_tiprefvn=
 0x7fc233142630,_tiltrefvn=0x7fc234092230,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc23328fe30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc2339b7a30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc23328fe30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc233906430,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc234049458)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23403da18,_ctrlden=0x7fc23403fac0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232d27010,_xlast=0x7fc232d25a10,_ylast=[0x7fc233873c30,
 0x7fc233873c30,0x7fc233873c30],_y0=0x7fc233826c30,_signus=0x7fc232d0e260,
 _puppixoffset=[0,0],_nact=80,_def=0x10866e030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232d0e840,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403d740,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc233857700,xposition=0x7fc23403f9e0,yposition=
 0x7fc23309ac40,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc234049308,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1356 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       60.2   0.422      151.7
Field Avg  1.65                     60.2   0.422      151.7
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.2;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 8;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23404ced8,layerfrac=0x7fc23308a538,
 layerspeed=0x7fc23404c4c0,layeralt=0x7fc23404cf60,winddir=0x7fc23404bce8,
 _layeralt=0x7fc23404c5d0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.2,
 pyr_mod_npts=8,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc234049688,lgs_prof_alt=0x7fc23403f5b8,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc233870030,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1356,_nsub4disp=0,
 _nmes=2712,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.0132744,
 -0.00378424],_lastvalidtt=[0.0132744,-0.00378424],_upttcommand=[0,0],_refmes=
 0x7fc233993230,_tiprefv=0x7fc23483b630,_tiltrefv=0x7fc233945230,_tiprefvn=
 0x7fc23480b630,_tiltrefvn=0x7fc23398cc30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc23320a430,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc233198c30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc23320a430,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc2330db630,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc2338576c8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23403e1f8,_ctrlden=0x7fc2340496c0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232c49af0,_xlast=0x7fc232c473b0,_ylast=[0x7fc2330a5a30,
 0x7fc2330a5a30,0x7fc2330a5a30],_y0=0x7fc233159430,_signus=0x7fc232c43e10,
 _puppixoffset=[0,0],_nact=80,_def=0x108c4b030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232c48bb0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc233838888,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc234049308,xposition=0x7fc23403da18,yposition=
 0x7fc23403fac0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403d740,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1332 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       55.0   0.541      131.2
Field Avg  1.65                     55.0   0.541      131.2
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.2;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 12;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a538,layerfrac=0x7fc23404c4c0,
 layerspeed=0x7fc23404ced8,layeralt=0x7fc23404c018,winddir=0x7fc23404cd40,
 _layeralt=0x7fc23404c5d0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.2,
 pyr_mod_npts=12,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc234049458,lgs_prof_alt=0x7fc234049730,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc233155630,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1332,_nsub4disp=0,
 _nmes=2664,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00641578,
 -0.00321539],_lastvalidtt=[0.00641578,-0.00321539],_upttcommand=[0,0],_refmes=
 0x7fc2338fdc30,_tiprefv=0x7fc233948630,_tiltrefv=0x7fc233109e30,_tiprefvn=
 0x7fc2339cc230,_tiltrefvn=0x7fc2330e6630,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc233a45e30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc23395ca30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc233a45e30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc2330db630,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc23403fd60)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23403f510,_ctrlden=0x7fc233857700,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232c3dfa0,_xlast=0x7fc232c47360,_ylast=[0x7fc233150e30,
 0x7fc233150e30,0x7fc233150e30],_y0=0x7fc2330a5a30,_signus=0x7fc232c3e410,
 _puppixoffset=[0,0],_nact=80,_def=0x109f1a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232c3e6d0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403f5b8,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc23403d740,xposition=0x7fc23403e1f8,yposition=
 0x7fc2340496c0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc233838888,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1308 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.0   0.587      118.9
Field Avg  1.65                     54.0   0.587      118.9
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.2;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 16;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23404c4c0,layerfrac=0x7fc23404ced8,
 layerspeed=0x7fc23308a538,layeralt=0x7fc23404bce8,winddir=0x7fc23404cf60,
 _layeralt=0x7fc23404c5d0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.2,
 pyr_mod_npts=16,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc2338576c8,lgs_prof_alt=0x7fc23403dc10,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc2339e0c30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1308,_nsub4disp=0,
 _nmes=2616,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00439875,
 -0.00162867],_lastvalidtt=[0.00439875,-0.00162867],_upttcommand=[0,0],_refmes=
 0x7fc2348bc830,_tiprefv=0x7fc23395ca30,_tiltrefv=0x7fc233948430,_tiprefvn=
 0x7fc2330e6630,_tiltrefvn=0x7fc2338f9a30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc2332cf230,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc2331efa30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc2332cf230,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc23386da30,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc23403db30)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc234049960,_ctrlden=0x7fc233857540,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232c47920,_xlast=0x7fc232c48530,_ylast=[0x7fc2330c7630,
 0x7fc2330c7630,0x7fc2330c7630],_y0=0x7fc23313a430,_signus=0x7fc232c48c10,
 _puppixoffset=[0,0],_nact=80,_def=0x108c4b030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232c474e0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc234049730,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc233838888,xposition=0x7fc23403f510,yposition=
 0x7fc233857700,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403f5b8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1308 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.0   0.613      106.6
Field Avg  1.65                     54.0   0.613      106.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.2;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23404ced8,layerfrac=0x7fc23308a538,
 layerspeed=0x7fc23404c4c0,layeralt=0x7fc23404cd40,winddir=0x7fc23404c018,
 _layeralt=0x7fc23404c5d0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.2,
 pyr_mod_npts=20,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc23403fd60,lgs_prof_alt=0x7fc23403f740,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc233155630,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1308,_nsub4disp=0,
 _nmes=2616,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00654267,
 -0.000119239],_lastvalidtt=[0.00654267,-0.000119239],_upttcommand=[0,0],
 _refmes=0x7fc23321ec30,_tiprefv=0x7fc23386da30,_tiltrefv=0x7fc23398ac30,
 _tiprefvn=0x7fc23395ca30,_tiltrefvn=0x7fc2338f9a30,_reordervec=0x0,_npixels=0,
 _npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=
 0,_centroidw=0x0,_fimage=0x7fc233a26a30,_fimage2=0x0,_imistart=0x0,_imjstart=
 0x0,_imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=
 0x0,_unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,
 _flat=0x0,_domask=0,_submask=0x7fc233298030,_kernel=0x0,_kernels=0x0,_kerfftr=
 0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc233a26a30,_x=
 0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc2330db630,
 _bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,
 _wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,
 _LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,
 _dmnotinpath=0x7fc233857a10)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23403fc80,_ctrlden=0x7fc23403d8c8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232c49790,_xlast=0x7fc232c3ddc0,_ylast=[0x7fc2330a9c30,
 0x7fc2330a9c30,0x7fc2330a9c30],_y0=0x7fc23313a430,_signus=0x7fc232c48110,
 _puppixoffset=[0,0],_nact=80,_def=0x10833f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232c3e730,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403dc10,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc23403f5b8,xposition=0x7fc234049960,yposition=
 0x7fc233857540,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc234049730,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1284 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.2   0.618      106.6
Field Avg  1.65                     53.2   0.618      106.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.2;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 24;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a538,layerfrac=0x7fc23404c4c0,
 layerspeed=0x7fc23404ced8,layeralt=0x7fc23404cf60,winddir=0x7fc23404bce8,
 _layeralt=0x7fc23404c5d0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.2,
 pyr_mod_npts=24,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc23403db30,lgs_prof_alt=0x7fc23403f890,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc233155630,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1284,_nsub4disp=0,
 _nmes=2568,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.0033328,
 0.000771423],_lastvalidtt=[0.0033328,0.000771423],_upttcommand=[0,0],_refmes=
 0x7fc23408b030,_tiprefv=0x7fc233239230,_tiltrefv=0x7fc233234030,_tiprefvn=
 0x7fc23310de30,_tiltrefvn=0x7fc2331c1830,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc2331c6a30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc233a3b630,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc2331c6a30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc23386da30,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc234049298)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23403fac0,_ctrlden=0x7fc23403d580,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232c43e30,_xlast=0x7fc232d27010,_ylast=[0x7fc23384ba30,
 0x7fc23384ba30,0x7fc23384ba30],_y0=0x7fc2330a9c30,_signus=0x7fc232d28a20,
 _puppixoffset=[0,0],_nact=80,_def=0x109f1a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232d2b730,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403f740,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc234049730,xposition=0x7fc23403fc80,yposition=
 0x7fc23403d8c8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403dc10,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1284 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.0   0.626      102.5
Field Avg  1.65                     54.0   0.626      102.5
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.2;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 28;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23404c4c0,layerfrac=0x7fc23404ced8,
 layerspeed=0x7fc23308a538,layeralt=0x7fc23404c018,winddir=0x7fc23404cd40,
 _layeralt=0x7fc23404c5d0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.2,
 pyr_mod_npts=28,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc233857a10,lgs_prof_alt=0x7fc23403d900,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc233111a30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1284,_nsub4disp=0,
 _nmes=2568,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00237805,
 -0.000444535],_lastvalidtt=[0.00237805,-0.000444535],_upttcommand=[0,0],
 _refmes=0x7fc2331cd030,_tiprefv=0x7fc2330d5230,_tiltrefv=0x7fc2332bd830,
 _tiprefvn=0x7fc2331bb430,_tiltrefvn=0x7fc233102e30,_reordervec=0x0,_npixels=0,
 _npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=
 0,_centroidw=0x0,_fimage=0x7fc233a68430,_fimage2=0x0,_imistart=0x0,_imjstart=
 0x0,_imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=
 0x0,_unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,
 _flat=0x0,_domask=0,_submask=0x7fc2331aea30,_kernel=0x0,_kernels=0x0,_kerfftr=
 0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc233a68430,_x=
 0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc23394b630,
 _bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,
 _wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,
 _LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,
 _dmnotinpath=0x7fc23403d5b8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23403f938,_ctrlden=0x7fc23403d4d8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232d27010,_xlast=0x7fc232d10aa0,_ylast=[0x7fc2330dac30,
 0x7fc2330dac30,0x7fc2330dac30],_y0=0x7fc233872a30,_signus=0x7fc232c48f20,
 _puppixoffset=[0,0],_nact=80,_def=0x108c4b030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232c47e30,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403f890,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc23403dc10,xposition=0x7fc23403fac0,yposition=
 0x7fc23403d580,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403f740,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.0   0.626      102.5
Field Avg  1.65                     54.0   0.626      102.5
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.2;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 32;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23404ced8,layerfrac=0x7fc23308a538,
 layerspeed=0x7fc23404c4c0,layeralt=0x7fc23404bce8,winddir=0x7fc23404cf60,
 _layeralt=0x7fc23404c5d0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.2,
 pyr_mod_npts=32,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc234049298,lgs_prof_alt=0x7fc234049500,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc233a84830,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00100304,
 -0.000390607],_lastvalidtt=[0.00100304,-0.000390607],_upttcommand=[0,0],
 _refmes=0x7fc233149630,_tiprefv=0x7fc2330f3430,_tiltrefv=0x7fc233a1bc30,
 _tiprefvn=0x7fc2330ece30,_tiltrefvn=0x7fc233906430,_reordervec=0x0,_npixels=0,
 _npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=
 0,_centroidw=0x0,_fimage=0x7fc2332d9630,_fimage2=0x0,_imistart=0x0,_imjstart=
 0x0,_imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=
 0x0,_unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,
 _flat=0x0,_domask=0,_submask=0x7fc2331bb430,_kernel=0x0,_kernels=0x0,_kerfftr=
 0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc2332d9630,_x=
 0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc233995230,
 _bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,
 _wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,
 _LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,
 _dmnotinpath=0x7fc234049490)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23403dc10,_ctrlden=0x7fc23403e150,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232c43e10,_xlast=0x7fc232c430b0,_ylast=[0x7fc23312fc30,
 0x7fc23312fc30,0x7fc23312fc30],_y0=0x7fc2330a9c30,_signus=0x7fc232c45570,
 _puppixoffset=[0,0],_nact=80,_def=0x10833f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232c3e7b0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403d900,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc23403f740,xposition=0x7fc23403f938,yposition=
 0x7fc23403d4d8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403f890,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.8   0.630       98.4
Field Avg  1.65                     53.8   0.630       98.4
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.2;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 36;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a538,layerfrac=0x7fc23404c4c0,
 layerspeed=0x7fc23404ced8,layeralt=0x7fc23404cd40,winddir=0x7fc23404c018,
 _layeralt=0x7fc23404c5d0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.2,
 pyr_mod_npts=36,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc23403d5b8,lgs_prof_alt=0x7fc234049308,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc234813830,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00166387,
 0.000792938],_lastvalidtt=[0.00166387,0.000792938],_upttcommand=[0,0],_refmes=
 0x7fc233149230,_tiprefv=0x7fc233a54830,_tiltrefv=0x7fc233945230,_tiprefvn=
 0x7fc233a1bc30,_tiltrefvn=0x7fc233a67830,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc2332eac30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc233a5ae30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc2332eac30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc23390c430,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc23403fdd0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23403d468,_ctrlden=0x7fc234049618,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232d27010,_xlast=0x7fc232d21750,_ylast=[0x7fc2330dc230,
 0x7fc2330dc230,0x7fc2330dc230],_y0=0x7fc23388a830,_signus=0x7fc232c43e10,
 _puppixoffset=[0,0],_nact=80,_def=0x109f1a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232c43230,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc234049500,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc23403f890,xposition=0x7fc23403dc10,yposition=
 0x7fc23403e150,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403d900,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.0   0.623      110.7
Field Avg  1.65                     54.0   0.623      110.7
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.2;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 40;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23404c4c0,layerfrac=0x7fc23404ced8,
 layerspeed=0x7fc23308a538,layeralt=0x7fc23404cf60,winddir=0x7fc23404bce8,
 _layeralt=0x7fc23404c5d0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.2,
 pyr_mod_npts=40,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc234049490,lgs_prof_alt=0x7fc23403daf8,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc2340e1430,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00245292,
 0.000149082],_lastvalidtt=[0.00245292,0.000149082],_upttcommand=[0,0],_refmes=
 0x7fc233247a30,_tiprefv=0x7fc2330f6e30,_tiltrefv=0x7fc2338fe030,_tiprefvn=
 0x7fc233265e30,_tiltrefvn=0x7fc233a63830,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc2332df830,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc233109430,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc2332df830,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc233a68a30,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc2340497d8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc233838888,_ctrlden=0x7fc234049730,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232c483f0,_xlast=0x7fc232c43e10,_ylast=[0x7fc233159430,
 0x7fc233159430,0x7fc233159430],_y0=0x7fc2330a5a30,_signus=0x7fc232c49640,
 _puppixoffset=[0,0],_nact=80,_def=0x10833f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232c430b0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc234049308,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc23403d900,xposition=0x7fc23403d468,yposition=
 0x7fc234049618,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc234049500,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.0   0.628      102.5
Field Avg  1.65                     54.0   0.628      102.5
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.4;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 40;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23404ced8,layerfrac=0x7fc23308a538,
 layerspeed=0x7fc23404c4c0,layeralt=0x7fc23404c018,winddir=0x7fc23404cd40,
 _layeralt=0x7fc23404c5d0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.4,
 pyr_mod_npts=40,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc23403fdd0,lgs_prof_alt=0x7fc23403fac0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc233a23430,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.004704,
 0.000779829],_lastvalidtt=[0.004704,0.000779829],_upttcommand=[0,0],_refmes=
 0x7fc233185a30,_tiprefv=0x7fc23318ac30,_tiltrefv=0x7fc233180830,_tiprefvn=
 0x7fc2330f6830,_tiltrefvn=0x7fc2332bce30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc233a25e30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc2339c9830,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc233a25e30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc2332c2030,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc23403fd98)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23403da50,_ctrlden=0x7fc233857428,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232c43250,_xlast=0x7fc232c3e8f0,_ylast=[0x7fc2330a9c30,
 0x7fc2330a9c30,0x7fc2330a9c30],_y0=0x7fc23312fc30,_signus=0x7fc232c3ddc0,
 _puppixoffset=[0,0],_nact=80,_def=0x109f1a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232c47e40,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403daf8,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc234049500,xposition=0x7fc233838888,yposition=
 0x7fc234049730,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc234049308,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1312 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.0   0.590      123.0
Field Avg  1.65                     54.0   0.590      123.0
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.4;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 40;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a538,layerfrac=0x7fc23404c4c0,
 layerspeed=0x7fc23404ced8,layeralt=0x7fc23404bce8,winddir=0x7fc23404cf60,
 _layeralt=0x7fc23300da50)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.1,
 pyr_mod_npts=24,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc2340497d8,lgs_prof_alt=0x7fc23403d900,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc234054030,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1312,_nsub4disp=0,
 _nmes=2624,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=
 [-0.000425913,0.000180593],_lastvalidtt=[-0.000425913,0.000180593],
 _upttcommand=[0,0],_refmes=0x7fc234089a30,_tiprefv=0x7fc23390a430,_tiltrefv=
 0x7fc2339cbc30,_tiprefvn=0x7fc2339e5430,_tiltrefvn=0x7fc233a2cc30,_reordervec=
 0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,
 _binindices=0x0,_binxy=0,_centroidw=0x0,_fimage=0x7fc2340c7430,_fimage2=0x0,
 _imistart=0x0,_imjstart=0x0,_imistart2=0x0,_imjstart2=0x0,_unittip=0x0,
 _unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=
 0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,_submask=0x7fc2339eba30,_kernel=
 0x0,_kernels=0x0,_kerfftr=0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7fc2340c7430,_x=0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,
 _bckgrdcalib=0x7fc23386da30,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fc234049688)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23403f938,_ctrlden=0x7fc2338576c8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232c48bd0,_xlast=0x7fc232c49150,_ylast=[0x7fc2330a9c30,
 0x7fc2330a9c30,0x7fc2330a9c30],_y0=0x7fc23312fc30,_signus=0x7fc232c492d0,
 _puppixoffset=[0,0],_nact=80,_def=0x10866e030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232d21750,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403fac0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc234049308,xposition=0x7fc234049730,yposition=
 0x7fc233857428,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403daf8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1312 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.0   0.598      118.9
Field Avg  1.65                     54.0   0.598      118.9
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.4;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 40;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a538,layerfrac=0x7fc23404c4c0,
 layerspeed=0x7fc23404ced8,layeralt=0x7fc23404bce8,winddir=0x7fc23404cf60,
 _layeralt=0x7fc23404bbd8)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.1,
 pyr_mod_npts=28,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc2340497d8,lgs_prof_alt=0x7fc23403d900,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc2348d7c30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1312,_nsub4disp=0,
 _nmes=2624,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=
 [-0.000499286,-2.92153e-05],_lastvalidtt=[-0.000499286,-2.92153e-05],
 _upttcommand=[0,0],_refmes=0x7fc2348bea30,_tiprefv=0x7fc233215a30,_tiltrefv=
 0x7fc2331a8e30,_tiprefvn=0x7fc2332ca030,_tiltrefvn=0x7fc23310fa30,_reordervec=
 0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,
 _binindices=0x0,_binxy=0,_centroidw=0x0,_fimage=0x7fc233a5ca30,_fimage2=0x0,
 _imistart=0x0,_imjstart=0x0,_imistart2=0x0,_imjstart2=0x0,_unittip=0x0,
 _unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=
 0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,_submask=0x7fc23321c030,_kernel=
 0x0,_kernels=0x0,_kerfftr=0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7fc233a5ca30,_x=0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,
 _bckgrdcalib=0x7fc23386da30,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fc23403f548)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23403d660,_ctrlden=0x7fc234049538,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232c48e20,_xlast=0x7fc232c48fa0,_ylast=[0x7fc23312fc30,
 0x7fc23312fc30,0x7fc23312fc30],_y0=0x7fc2330dc230,_signus=0x7fc232c4d660,
 _puppixoffset=[0,0],_nact=80,_def=0x10866e030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232d2bb70,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403fac0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc234049308,xposition=0x7fc23403fdd0,yposition=
 0x7fc233857a48,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403daf8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1312 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.8   0.601      114.8
Field Avg  1.65                     53.8   0.601      114.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.4;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 40;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a538,layerfrac=0x7fc23404c4c0,
 layerspeed=0x7fc23404ced8,layeralt=0x7fc23404bce8,winddir=0x7fc23404cf60,
 _layeralt=0x7fc23404c0a0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.1,
 pyr_mod_npts=32,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc2340497d8,lgs_prof_alt=0x7fc23403d900,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc233900030,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1312,_nsub4disp=0,
 _nmes=2624,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=
 [-0.000941524,-3.72681e-05],_lastvalidtt=[-0.000941524,-3.72681e-05],
 _upttcommand=[0,0],_refmes=0x7fc233102e30,_tiprefv=0x7fc233108230,_tiltrefv=
 0x7fc233263630,_tiprefvn=0x7fc233215a30,_tiltrefvn=0x7fc2331a8e30,_reordervec=
 0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,
 _binindices=0x0,_binxy=0,_centroidw=0x0,_fimage=0x7fc2339a4230,_fimage2=0x0,
 _imistart=0x0,_imjstart=0x0,_imistart2=0x0,_imjstart2=0x0,_unittip=0x0,
 _unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=
 0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,_submask=0x7fc2340a6230,_kernel=
 0x0,_kernels=0x0,_kerfftr=0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7fc2339a4230,_x=0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,
 _bckgrdcalib=0x7fc233948630,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fc233857770)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23403d5b8,_ctrlden=0x7fc23403f778,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232c48b60,_xlast=0x7fc232c48e20,_ylast=[0x7fc2330dc230,
 0x7fc2330dc230,0x7fc2330dc230],_y0=0x7fc2330c1e30,_signus=0x7fc232c4c560,
 _puppixoffset=[0,0],_nact=80,_def=0x10866e030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232d25a00,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403fac0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc234049308,xposition=0x7fc234049688,yposition=
 0x7fc23403f890,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403daf8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1304 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.0   0.603      114.8
Field Avg  1.65                     54.0   0.603      114.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.4;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 40;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a538,layerfrac=0x7fc23404c4c0,
 layerspeed=0x7fc23404ced8,layeralt=0x7fc23404bce8,winddir=0x7fc23404cf60,
 _layeralt=0x7fc23308a5c0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.1,
 pyr_mod_npts=36,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc2340497d8,lgs_prof_alt=0x7fc23403d900,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc2331ea430,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1304,_nsub4disp=0,
 _nmes=2608,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=
 [-0.000602941,6.30025e-05],_lastvalidtt=[-0.000602941,6.30025e-05],
 _upttcommand=[0,0],_refmes=0x7fc233a4e230,_tiprefv=0x7fc23386da30,_tiltrefv=
 0x7fc2331ae230,_tiprefvn=0x7fc233945230,_tiltrefvn=0x7fc233209430,_reordervec=
 0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,
 _binindices=0x0,_binxy=0,_centroidw=0x0,_fimage=0x7fc233a38030,_fimage2=0x0,
 _imistart=0x0,_imjstart=0x0,_imistart2=0x0,_imjstart2=0x0,_unittip=0x0,
 _unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=
 0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,_submask=0x7fc2331b4830,_kernel=
 0x0,_kernels=0x0,_kerfftr=0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7fc233a38030,_x=0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,
 _bckgrdcalib=0x7fc233950030,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fc23403d778)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc234049848,_ctrlden=0x7fc23403f900,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232d21750,_xlast=0x7fc232d25be0,_ylast=[0x7fc23394c230,
 0x7fc23394c230,0x7fc23394c230],_y0=0x7fc233826c30,_signus=0x7fc232d2aff0,
 _puppixoffset=[0,0],_nact=80,_def=0x10866e030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232c48b60,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403fac0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc234049308,xposition=0x7fc23403f548,yposition=
 0x7fc23403f7b0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403daf8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1284 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.2   0.618      106.6
Field Avg  1.65                     53.2   0.618      106.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.4;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 40;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a538,layerfrac=0x7fc23404c4c0,
 layerspeed=0x7fc23404ced8,layeralt=0x7fc23404bce8,winddir=0x7fc23404cf60,
 _layeralt=0x7fc23404d5c0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.2,
 pyr_mod_npts=24,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc2340497d8,lgs_prof_alt=0x7fc23403d900,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc233206430,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1284,_nsub4disp=0,
 _nmes=2568,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.0033088,
 0.000605163],_lastvalidtt=[0.0033088,0.000605163],_upttcommand=[0,0],_refmes=
 0x7fc233962a30,_tiprefv=0x7fc2339c8430,_tiltrefv=0x7fc23314a430,_tiprefvn=
 0x7fc23386da30,_tiltrefvn=0x7fc2331ae230,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc23322de30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc233109430,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc23322de30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc233950030,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc23309ac40)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc2338577a8,_ctrlden=0x7fc234049420,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232d2e180,_xlast=0x7fc232d21750,_ylast=[0x7fc233826c30,
 0x7fc233826c30,0x7fc233826c30],_y0=0x7fc2338aa630,_signus=0x7fc232d2f190,
 _puppixoffset=[0,0],_nact=80,_def=0x10866e030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232c45fb0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403fac0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc234049308,xposition=0x7fc233857770,yposition=
 0x7fc2340498f0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403daf8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1284 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.0   0.626      102.5
Field Avg  1.65                     54.0   0.626      102.5
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.4;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 40;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a538,layerfrac=0x7fc23404c4c0,
 layerspeed=0x7fc23404ced8,layeralt=0x7fc23404bce8,winddir=0x7fc23404cf60,
 _layeralt=0x7fc23404d318)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.2,
 pyr_mod_npts=28,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc2340497d8,lgs_prof_alt=0x7fc23403d900,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc233900030,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1284,_nsub4disp=0,
 _nmes=2568,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00241152,
 -0.000472906],_lastvalidtt=[0.00241152,-0.000472906],_upttcommand=[0,0],
 _refmes=0x7fc2332d2c30,_tiprefv=0x7fc233906430,_tiltrefv=0x7fc233142630,
 _tiprefvn=0x7fc2339c8430,_tiltrefvn=0x7fc23314a430,_reordervec=0x0,_npixels=0,
 _npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=
 0,_centroidw=0x0,_fimage=0x7fc233a95230,_fimage2=0x0,_imistart=0x0,_imjstart=
 0x0,_imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=
 0x0,_unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,
 _flat=0x0,_domask=0,_submask=0x7fc2340b8830,_kernel=0x0,_kernels=0x0,_kerfftr=
 0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc233a95230,_x=
 0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc233945230,
 _bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,
 _wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,
 _LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,
 _dmnotinpath=0x7fc23403f510)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23403d580,_ctrlden=0x7fc23403fa50,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232d2bab0,_xlast=0x7fc232d29ed0,_ylast=[0x7fc2338aa630,
 0x7fc2338aa630,0x7fc2338aa630],_y0=0x7fc23388a830,_signus=0x7fc232d2d150,
 _puppixoffset=[0,0],_nact=80,_def=0x10866e030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232c488a0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403fac0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc234049308,xposition=0x7fc23403d778,yposition=
 0x7fc234049618,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403daf8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.0   0.626      102.5
Field Avg  1.65                     54.0   0.626      102.5
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.4;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 40;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a538,layerfrac=0x7fc23404c4c0,
 layerspeed=0x7fc23404ced8,layeralt=0x7fc23404bce8,winddir=0x7fc23404cf60,
 _layeralt=0x7fc23404d6d0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.2,
 pyr_mod_npts=32,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc2340497d8,lgs_prof_alt=0x7fc23403d900,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc233147830,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.000887763,
 -0.000207776],_lastvalidtt=[0.000887763,-0.000207776],_upttcommand=[0,0],
 _refmes=0x7fc2348bc430,_tiprefv=0x7fc233945230,_tiltrefv=0x7fc2330d5230,
 _tiprefvn=0x7fc233906430,_tiltrefvn=0x7fc233142630,_reordervec=0x0,_npixels=0,
 _npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=
 0,_centroidw=0x0,_fimage=0x7fc233a8f030,_fimage2=0x0,_imistart=0x0,_imjstart=
 0x0,_imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=
 0x0,_unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,
 _flat=0x0,_domask=0,_submask=0x7fc233a62e30,_kernel=0x0,_kernels=0x0,_kerfftr=
 0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc233a8f030,_x=
 0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc23395f230,
 _bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,
 _wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,
 _LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,
 _dmnotinpath=0x7fc23403e118)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23403f900,_ctrlden=0x7fc23403d548,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232d10aa0,_xlast=0x7fc232d2bab0,_ylast=[0x7fc23388a830,
 0x7fc23388a830,0x7fc23388a830],_y0=0x7fc233826c30,_signus=0x7fc232d0f400,
 _puppixoffset=[0,0],_nact=80,_def=0x10866e030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232f04ff0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403fac0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc234049308,xposition=0x7fc23309ac40,yposition=
 0x7fc234049650,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403daf8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.8   0.630       98.4
Field Avg  1.65                     53.8   0.630       98.4
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.4;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 40;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a538,layerfrac=0x7fc23404c4c0,
 layerspeed=0x7fc23404ced8,layeralt=0x7fc23404bce8,winddir=0x7fc23404cf60,
 _layeralt=0x7fc23404ce50)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.2,
 pyr_mod_npts=36,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc2340497d8,lgs_prof_alt=0x7fc23403d900,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc23386da30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00130569,
 0.000539456],_lastvalidtt=[0.00130569,0.000539456],_upttcommand=[0,0],_refmes=
 0x7fc2348cd830,_tiprefv=0x7fc233950030,_tiltrefv=0x7fc23314ac30,_tiprefvn=
 0x7fc233945230,_tiltrefvn=0x7fc2330d5230,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc2340c5030,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc2348ee830,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc2340c5030,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc23407f830,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc23403d9e0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23403d628,_ctrlden=0x7fc23403f5b8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232d2a060,_xlast=0x7fc232d10aa0,_ylast=[0x7fc233826c30,
 0x7fc233826c30,0x7fc233826c30],_y0=0x7fc2339d7c30,_signus=0x7fc232d2fe70,
 _puppixoffset=[0,0],_nact=80,_def=0x10a53f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232c3df00,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403fac0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc234049308,xposition=0x7fc23403f510,yposition=
 0x7fc23403e1f8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403daf8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.0   0.605      118.9
Field Avg  1.65                     54.0   0.605      118.9
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.4;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 40;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a538,layerfrac=0x7fc23404c4c0,
 layerspeed=0x7fc23404ced8,layeralt=0x7fc23404bce8,winddir=0x7fc23404cf60,
 _layeralt=0x7fc23300da50)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.3,
 pyr_mod_npts=24,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc2340497d8,lgs_prof_alt=0x7fc23403d900,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc233870430,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00359073,
 -0.000308155],_lastvalidtt=[0.00359073,-0.000308155],_upttcommand=[0,0],
 _refmes=0x7fc2330eb830,_tiprefv=0x7fc233102e30,_tiltrefv=0x7fc2332ada30,
 _tiprefvn=0x7fc233215a30,_tiltrefvn=0x7fc23314ac30,_reordervec=0x0,_npixels=0,
 _npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=
 0,_centroidw=0x0,_fimage=0x7fc233180830,_fimage2=0x0,_imistart=0x0,_imjstart=
 0x0,_imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=
 0x0,_unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,
 _flat=0x0,_domask=0,_submask=0x7fc23321c030,_kernel=0x0,_kernels=0x0,_kerfftr=
 0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc233180830,_x=
 0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc234809e30,
 _bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,
 _wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,
 _LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,
 _dmnotinpath=0x7fc23403f858)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc233857268,_ctrlden=0x7fc23403e0a8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232d21750,_xlast=0x7fc232d2a060,_ylast=[0x7fc2339d7c30,
 0x7fc2339d7c30,0x7fc2339d7c30],_y0=0x7fc2338b3430,_signus=0x7fc232d2e590,
 _puppixoffset=[0,0],_nact=80,_def=0x10a53f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232c482f0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403fac0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc234049308,xposition=0x7fc23403e118,yposition=
 0x7fc234049490,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403daf8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.0   0.627       98.4
Field Avg  1.65                     54.0   0.627       98.4
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.4;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 40;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a538,layerfrac=0x7fc23404c4c0,
 layerspeed=0x7fc23404ced8,layeralt=0x7fc23404bce8,winddir=0x7fc23404cf60,
 _layeralt=0x7fc23404cc30)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.3,
 pyr_mod_npts=28,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc2340497d8,lgs_prof_alt=0x7fc23403d900,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc233ad1230,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00578568,
 0.000756434],_lastvalidtt=[0.00578568,0.000756434],_upttcommand=[0,0],_refmes=
 0x7fc23395ec30,_tiprefv=0x7fc23386da30,_tiltrefv=0x7fc233aede30,_tiprefvn=
 0x7fc233957430,_tiltrefvn=0x7fc2338f9a30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc233a9ba30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc233a56430,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc233a9ba30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc233ab5c30,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc233857460)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc233803c30,_ctrlden=0x7fc2338576c8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232c49150,_xlast=0x7fc232c492d0,_ylast=[0x7fc2330c1e30,
 0x7fc2330c1e30,0x7fc2330c1e30],_y0=0x7fc23313a430,_signus=0x7fc232c45cf0,
 _puppixoffset=[0,0],_nact=80,_def=0x10a53f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232d21750,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403fac0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc234049308,xposition=0x7fc23403d9e0,yposition=
 0x7fc23403d8c8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403daf8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.0   0.623      106.6
Field Avg  1.65                     54.0   0.623      106.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.4;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 40;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a538,layerfrac=0x7fc23404c4c0,
 layerspeed=0x7fc23404ced8,layeralt=0x7fc23404bce8,winddir=0x7fc23404cf60,
 _layeralt=0x7fc23404c7f0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.3,
 pyr_mod_npts=32,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc2340497d8,lgs_prof_alt=0x7fc23403d900,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc233949430,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00663972,
 0.000233564],_lastvalidtt=[0.00663972,0.000233564],_upttcommand=[0,0],_refmes=
 0x7fc23407c430,_tiprefv=0x7fc2332d2c30,_tiltrefv=0x7fc2332e8230,_tiprefvn=
 0x7fc233110630,_tiltrefvn=0x7fc233142630,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc2339b9630,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc2340b8830,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc2339b9630,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc233946030,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc23403a830)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc234049340,_ctrlden=0x7fc23403fc10,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232d263e0,_xlast=0x7fc232d2a8a0,_ylast=[0x7fc2338b3430,
 0x7fc2338b3430,0x7fc2338b3430],_y0=0x7fc23390fe30,_signus=0x7fc232d2e860,
 _puppixoffset=[0,0],_nact=80,_def=0x10a53f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232c45cf0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403fac0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc234049308,xposition=0x7fc23403f858,yposition=
 0x7fc23403e468,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403daf8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.0   0.524      209.0
Field Avg  1.65                     54.0   0.524      209.0
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.4;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 40;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a538,layerfrac=0x7fc23404c4c0,
 layerspeed=0x7fc23404ced8,layeralt=0x7fc23404bce8,winddir=0x7fc23404cf60,
 _layeralt=0x7fc23404bbd8)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.3,
 pyr_mod_npts=36,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc2340497d8,lgs_prof_alt=0x7fc23403d900,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc233215a30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00476766,
 0.000519764],_lastvalidtt=[0.00476766,0.000519764],_upttcommand=[0,0],_refmes=
 0x7fc233971a30,_tiprefv=0x7fc2330f6830,_tiltrefv=0x7fc233909830,_tiprefvn=
 0x7fc2332d2c30,_tiltrefvn=0x7fc23399da30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc233a56430,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc23397e630,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc233a56430,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc23407c430,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc2338579d8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc2338576c8,_ctrlden=0x7fc23403d708,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232d21750,_xlast=0x7fc232d263e0,_ylast=[0x7fc23390fe30,
 0x7fc23390fe30,0x7fc23390fe30],_y0=0x7fc233826c30,_signus=0x7fc232d2ee30,
 _puppixoffset=[0,0],_nact=80,_def=0x10a53f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232c482f0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403fac0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc234049308,xposition=0x7fc233857460,yposition=
 0x7fc23403f5b8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403daf8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1288 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.4   0.575      123.0
Field Avg  1.65                     54.4   0.575      123.0
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.4;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 40;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a538,layerfrac=0x7fc23404c4c0,
 layerspeed=0x7fc23404ced8,layeralt=0x7fc23404bce8,winddir=0x7fc23404cf60,
 _layeralt=0x7fc23404bf08)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.4,
 pyr_mod_npts=24,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc2340497d8,lgs_prof_alt=0x7fc23403d900,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc2340bb830,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1288,_nsub4disp=0,
 _nmes=2576,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00508111,
 -0.00505778],_lastvalidtt=[0.00508111,-0.00505778],_upttcommand=[0,0],_refmes=
 0x7fc233142630,_tiprefv=0x7fc2332db830,_tiltrefv=0x7fc2332f8a30,_tiprefvn=
 0x7fc2330f6830,_tiltrefvn=0x7fc23310c630,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc233aa9030,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc233a63c30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc233aa9030,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc23386da30,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc2338578c0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc2338573b8,_ctrlden=0x7fc23403d548,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232f03e00,_xlast=0x7fc232c48e70,_ylast=[0x7fc2330fd030,
 0x7fc2330fd030,0x7fc2330fd030],_y0=0x7fc233156430,_signus=0x7fc232c4fb20,
 _puppixoffset=[0,0],_nact=80,_def=0x10866e030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232d10aa0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403fac0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc234049308,xposition=0x7fc23403a830,yposition=
 0x7fc23403fdd0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403daf8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.0   0.600      118.9
Field Avg  1.65                     54.0   0.600      118.9
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.4;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 40;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a538,layerfrac=0x7fc23404c4c0,
 layerspeed=0x7fc23404ced8,layeralt=0x7fc23404bce8,winddir=0x7fc23404cf60,
 _layeralt=0x7fc23308a5c0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.4,
 pyr_mod_npts=28,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc2340497d8,lgs_prof_alt=0x7fc23403d900,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc233a51230,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00318917,
 -0.00139175],_lastvalidtt=[0.00318917,-0.00139175],_upttcommand=[0,0],_refmes=
 0x7fc2332ed430,_tiprefv=0x7fc23386da30,_tiltrefv=0x7fc233a9cc30,_tiprefvn=
 0x7fc233a96630,_tiltrefvn=0x7fc233906430,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc23395ec30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc233a89c30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc23395ec30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc2332db830,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc23403f9e0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc233857690,_ctrlden=0x7fc234049260,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232c488a0,_xlast=0x7fc232c48a20,_ylast=[0x7fc233156430,
 0x7fc233156430,0x7fc233156430],_y0=0x7fc2330c1e30,_signus=0x7fc232c50360,
 _puppixoffset=[0,0],_nact=80,_def=0x10a860030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232d21750,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403fac0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc234049308,xposition=0x7fc2338579d8,yposition=
 0x7fc23403e0a8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403daf8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.0   0.607      118.9
Field Avg  1.65                     54.0   0.607      118.9
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.4;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 40;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a538,layerfrac=0x7fc23404c4c0,
 layerspeed=0x7fc23404ced8,layeralt=0x7fc23404bce8,winddir=0x7fc23404cf60,
 _layeralt=0x7fc23404d5c0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.4,
 pyr_mod_npts=32,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc2340497d8,lgs_prof_alt=0x7fc23403d900,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc23310f830,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00332851,
 -0.00115454],_lastvalidtt=[0.00332851,-0.00115454],_upttcommand=[0,0],_refmes=
 0x7fc233945230,_tiprefv=0x7fc2332eb630,_tiltrefv=0x7fc2339d1c30,_tiprefvn=
 0x7fc2332d2c30,_tiltrefvn=0x7fc233a9cc30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc233a76c30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc23396c430,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc233a76c30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc233a4f830,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc23403f5f0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23403dac0,_ctrlden=0x7fc23403e468,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232d2b700,_xlast=0x7fc232d25a00,_ylast=[0x7fc233904a30,
 0x7fc233904a30,0x7fc233904a30],_y0=0x7fc23395e030,_signus=0x7fc232d29ed0,
 _puppixoffset=[0,0],_nact=80,_def=0x10a53f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232c4f4b0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403fac0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc234049308,xposition=0x7fc2338578c0,yposition=
 0x7fc23403faf8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403daf8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.0   0.626       98.4
Field Avg  1.65                     54.0   0.626       98.4
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 40;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 1.5;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.4;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 40;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=80,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a538,layerfrac=0x7fc23404c4c0,
 layerspeed=0x7fc23404ced8,layeralt=0x7fc23404bce8,winddir=0x7fc23404cf60,
 _layeralt=0x7fc23404d318)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.4,
 pyr_mod_npts=36,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc2340497d8,lgs_prof_alt=0x7fc23403d900,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc2331ace30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00372289,
 0.00151821],_lastvalidtt=[0.00372289,0.00151821],_upttcommand=[0,0],_refmes=
 0x7fc233142630,_tiprefv=0x7fc233215a30,_tiltrefv=0x7fc233147830,_tiprefvn=
 0x7fc2332eb630,_tiltrefvn=0x7fc233193630,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc2332b0230,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc23322de30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc2332b0230,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc2332db830,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc2338577e0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23403e1f8,_ctrlden=0x7fc233857a80,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232d21750,_xlast=0x7fc232d26570,_ylast=[0x7fc23395e030,
 0x7fc23395e030,0x7fc23395e030],_y0=0x7fc233826c30,_signus=0x7fc232d25be0,
 _puppixoffset=[0,0],_nact=80,_def=0x10a53f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fc232f06120,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403fac0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc234049308,xposition=0x7fc23403f9e0,yposition=
 0x7fc234049490,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403daf8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 136 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      191.9   0.008      628.3
Field Avg  1.65                    191.9   0.008      628.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 24; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 12;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 0.495;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.1;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 4;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=24,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=64,_cent=32.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23404ced8,layerfrac=0x7fc23308a538,
 layerspeed=0x7fc23404c4c0,layeralt=0x7fc23404cf60,winddir=0x7fc23404bce8,
 _layeralt=0x7fc23404d318)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.1,
 pyr_mod_npts=4,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=12,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=0.495,fsoffset=
 [0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc234049500,lgs_prof_alt=0x7fc23403e230,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc23386da30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=136,_nsub4disp=0,_nmes=
 272,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=4.33352,_tt=[-0.0114539,
 -0.00284815],_lastvalidtt=[-0.0114539,-0.00284815],_upttcommand=[0,0],_refmes=
 0x7fc23395d830,_tiprefv=0x7fc23390a630,_tiltrefv=0x7fc2338fcc30,_tiprefvn=
 0x7fc2338f9a30,_tiltrefvn=0x7fc233a54430,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc233190030,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc233949230,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc233190030,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc2338f3c30,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc23403d820)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23309ac40,_ctrlden=0x7fc23403f778,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232d2d480,_xlast=0x7fc232d21750,_ylast=[0x7fc233826c30,
 0x7fc233826c30,0x7fc233826c30],_y0=0x7fc233a54e30,_signus=0x7fc232d2dc10,
 _puppixoffset=[0,0],_nact=80,_def=0x107a06030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=12,_n2=53,_pupil=0x0,_command=
 0x7fc232d2b110,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403d970,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc23403e1f8,xposition=0x7fc23403fac0,yposition=
 0x7fc23403d900,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc233857a80,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 136 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      130.1   0.011      628.3
Field Avg  1.65                    130.1   0.011      628.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 24; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 12;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 0.495;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.05;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 4;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=24,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=64,_cent=32.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a538,layerfrac=0x7fc23404c4c0,
 layerspeed=0x7fc23404ced8,layeralt=0x7fc23404c018,winddir=0x7fc23404cd40,
 _layeralt=0x7fc23404d318)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.05,
 pyr_mod_npts=4,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=12,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=0.495,fsoffset=
 [0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc233838888,lgs_prof_alt=0x7fc23403f4a0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc2338fae30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=136,_nsub4disp=0,_nmes=
 272,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=4.33352,_tt=[0.00198811,
 -0.00267933],_lastvalidtt=[0.00198811,-0.00267933],_upttcommand=[0,0],_refmes=
 0x7fc233a62830,_tiprefv=0x7fc233a3ca30,_tiltrefv=0x7fc233a47630,_tiprefvn=
 0x7fc23390ea30,_tiltrefvn=0x7fc23395d830,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc233150630,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc2338f9a30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc233150630,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc233912830,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc23403f740)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23403fd98,_ctrlden=0x7fc2340494c8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232d21750,_xlast=0x7fc232d106b0,_ylast=[0x7fc233826c30,
 0x7fc233826c30,0x7fc233826c30],_y0=0x7fc233870e30,_signus=0x7fc232d29ed0,
 _puppixoffset=[0,0],_nact=80,_def=0x1073fa030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=12,_n2=53,_pupil=0x0,_command=
 0x7fc232d0f400,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403e230,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc233857a80,xposition=0x7fc23309ac40,yposition=
 0x7fc23403f778,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403d970,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 128 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      218.2   0.009      628.3
Field Avg  1.65                    218.2   0.009      628.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 24; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 12;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 0.495;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.05;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 8;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=24,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=64,_cent=32.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23404c4c0,layerfrac=0x7fc23404ced8,
 layerspeed=0x7fc23308a538,layeralt=0x7fc23404bce8,winddir=0x7fc23404cf60,
 _layeralt=0x7fc23404d318)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.05,
 pyr_mod_npts=8,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=12,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=0.495,fsoffset=
 [0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc23403d820,lgs_prof_alt=0x7fc2340495e0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc23386ec30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=128,_nsub4disp=0,_nmes=
 256,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=4.33352,_tt=[-0.0106599,
 -0.00726018],_lastvalidtt=[-0.0106599,-0.00726018],_upttcommand=[0,0],_refmes=
 0x7fc233957a30,_tiprefv=0x7fc23390a630,_tiltrefv=0x7fc233a57830,_tiprefvn=
 0x7fc2338f3430,_tiltrefvn=0x7fc233a56e30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc233a58230,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc2330faa30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc233a58230,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc234817430,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc23403d628)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc234049500,_ctrlden=0x7fc23403f468,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232d0f400,_xlast=0x7fc232d21750,_ylast=[0x7fc233958430,
 0x7fc233958430,0x7fc233958430],_y0=0x7fc2338f3e30,_signus=0x7fc232d29ed0,
 _puppixoffset=[0,0],_nact=80,_def=0x1073fa030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=12,_n2=53,_pupil=0x0,_command=
 0x7fc232d2aaa0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403f4a0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc23403d970,xposition=0x7fc23403fd98,yposition=
 0x7fc2340494c8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403e230,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 128 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0     1365.3   0.003      628.3
Field Avg  1.65                   1365.3   0.003      628.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 24; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 12;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 0.495;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.2;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 8;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=24,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=64,_cent=32.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23404ced8,layerfrac=0x7fc23308a538,
 layerspeed=0x7fc23404c4c0,layeralt=0x7fc23404cd40,winddir=0x7fc23404c018,
 _layeralt=0x7fc23404d318)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.2,
 pyr_mod_npts=8,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=12,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=0.495,fsoffset=
 [0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc23403f740,lgs_prof_alt=0x7fc23403dc10,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc2338f1430,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=128,_nsub4disp=0,_nmes=
 256,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=4.33352,_tt=[-0.01167,
 0.00415694],_lastvalidtt=[-0.01167,0.00415694],_upttcommand=[0,0],_refmes=
 0x7fc23390e030,_tiprefv=0x7fc233a4a030,_tiltrefv=0x7fc23390ea30,_tiprefvn=
 0x7fc233a53030,_tiltrefvn=0x7fc233957a30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc233870630,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc233158030,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc233870630,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc234803030,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc23403f1c0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc233857380,_ctrlden=0x7fc23403d660,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232d21750,_xlast=0x7fc232d2ede0,_ylast=[0x7fc233826c30,
 0x7fc233826c30,0x7fc233826c30],_y0=0x7fc233958430,_signus=0x7fc232d2dbc0,
 _puppixoffset=[0,0],_nact=80,_def=0x1073fa030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=12,_n2=53,_pupil=0x0,_command=
 0x7fc232d10630,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc2340495e0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc23403e230,xposition=0x7fc234049500,yposition=
 0x7fc23403f468,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403f4a0,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=1000,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 112 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       94.0   0.009      628.3
Field Avg  1.65                     94.0   0.009      628.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 24; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 12;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 0.495;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.2;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 8;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=24,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=64,_cent=32.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23308a538,layerfrac=0x7fc23404c4c0,
 layerspeed=0x7fc23404ced8,layeralt=0x7fc23404cf60,winddir=0x7fc23404bce8,
 _layeralt=0x7fc23404c438)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.01,
 pyr_mod_npts=4,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=12,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=0.495,fsoffset=
 [0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc23403d628,lgs_prof_alt=0x7fc23403dac0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc232e0aeb0,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=112,_nsub4disp=0,_nmes=
 224,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=4.33352,_tt=[0.00310664,
 -0.0109339],_lastvalidtt=[0.00310664,-0.0109339],_upttcommand=[0,0],_refmes=
 0x7fc233229a30,_tiprefv=0x7fc2330c3630,_tiltrefv=0x7fc2330c3e30,_tiprefvn=
 0x7fc2330f3e30,_tiltrefvn=0x7fc233151430,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc2332d6e30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc233949e30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc2332d6e30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc233915830,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc23403f5b8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23403f4d8,_ctrlden=0x7fc23403f5f0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232c4dba0,_xlast=0x7fc232c50990,_ylast=[0x7fc2330fd030,
 0x7fc2330fd030,0x7fc2330fd030],_y0=0x7fc233116c30,_signus=0x7fc232c3ddc0,
 _puppixoffset=[0,0],_nact=80,_def=0x1073fa030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=12,_n2=53,_pupil=0x0,_command=
 0x7fc232c488a0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403dc10,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc23403f4a0,xposition=0x7fc23403fa88,yposition=
 0x7fc23403d660,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc2340495e0,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 112 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      191.9   0.009      628.3
Field Avg  1.65                    191.9   0.009      628.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 24; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 12;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 0.495;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.2;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 8;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=24,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=64,_cent=32.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23404c4c0,layerfrac=0x7fc23404ced8,
 layerspeed=0x7fc23308a538,layeralt=0x7fc23404c018,winddir=0x7fc23404cd40,
 _layeralt=0x7fc23404d208)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.01,
 pyr_mod_npts=4,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=12,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=0.495,fsoffset=
 [0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc23403f1c0,lgs_prof_alt=0x7fc23403e230,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc232d2b3d0,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=112,_nsub4disp=0,_nmes=
 224,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=4.33352,_tt=[0.00311042,
 -0.000843887],_lastvalidtt=[0.00311042,-0.000843887],_upttcommand=[0,0],
 _refmes=0x7fc2330dd630,_tiprefv=0x7fc233872430,_tiltrefv=0x7fc233871c30,
 _tiprefvn=0x7fc23390d230,_tiltrefvn=0x7fc23390da30,_reordervec=0x0,_npixels=0,
 _npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=
 0,_centroidw=0x0,_fimage=0x7fc2338fee30,_fimage2=0x0,_imistart=0x0,_imjstart=
 0x0,_imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=
 0x0,_unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,
 _flat=0x0,_domask=0,_submask=0x7fc234809e30,_kernel=0x0,_kernels=0x0,_kerfftr=
 0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc2338fee30,_x=
 0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc2338f3c30,
 _bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,
 _wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,
 _LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,
 _dmnotinpath=0x7fc234049420)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc23403fb68,_ctrlden=0x7fc23403d6d0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232f06e30,_xlast=0x7fc232f07710,_ylast=[0x7fc2348cae30,
 0x7fc2348cae30,0x7fc2348cae30],_y0=0x7fc2348caa30,_signus=0x7fc232f042b0,
 _puppixoffset=[0,0],_nact=80,_def=0x1073fa030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=12,_n2=53,_pupil=0x0,_command=
 0x7fc232d0c2c0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403dac0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc2340495e0,xposition=0x7fc233857380,yposition=
 0x7fc23403f5f0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403dc10,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 112 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      161.3   0.008      628.3
Field Avg  1.65                    161.3   0.008      628.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 24; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
 sim.debug          = 0;
 sim.verbose        = 1; //The amount of information you get during the aoinit. 0, means you get no feedback at all except for warnings and error messages; 1 will print out a lot of information.
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // This is r0=0.15m, D/r0=6.5m/0.15m=43.33. The diameter of the atmosphere over the critial length of the atmosphere turbulence.
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");// Default values from the atmosphere.
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 //-------------------------------
 nwfs               = 1; // number of WFSs (=1, single object adaptive optics; >1 if e.g. mcao multi-conjugate adaptive optics)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "pyramid";
 wfs(n).lambda	   = 0.65;// All the information related to the wfs should be in band centred in 650 nm. R band.
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).skymag      = 17.9;// see https://www.gemini.edu/sciops/telescopes-and-sites/observing-condition-constraints/optical-sky-background for reference. Bright sky with full moon, the equivalent number of photons received by one arcsec^2.
 wfs(n).noise       = 1; //whether the noise could be switched on or off
 wfs(n).ron         = 3.7;
 //---------------------- Not Clear yet....--------------
 wfs(n).shnxsub	   = 12;  //# of subapertures in telescope diameter, in 1D direction, but this should be the result from the previous one... number of pixels in each sub-aperture.
 wfs(n).npixpersub   = 2;// Pupil plane. # of pixels per sub-aperture. wfs.npixpersub * wfs.shnxsub = 2*40 = 80   
 wfs(n).fssize       = 0.495;//calculated from lambda/(diameter/sim.pupil)=650nm/(6.5m/80) = 1.65
 wfs(n).fstop        = "round"; // The field stop size and shape are mentioned in paper McGuire 1999, abstract. 
 wfs(n).pyr_mod_ampl = 0.2;// 5*lambda/D = 5*650*10^(-9)/6.5=1.031 arcsec. float .... what is the modulation amplitude.... - - 
 //10*lambda/D
 wfs(n).pyr_mod_npts = 8;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 //dm(n).thresholdresp = -0.1 ;//0 would filter all actuators and 1 would retain them all. 0.5 would retain all actuator which measurement max response is larger than the max response of all actuators. 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 //-------------------------------
 tel.diam	       = 6.5; // Diameter of MMT.
 tel.cobs	       = 0.1; // 64cm/6.5m = 0.1
 //-------------------------------
 target.lambda	   = &([1.65]);// The wavelength of the science camera detector, unit micron.
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 //-------------------------------
 gs.zeropoint	   = 3.255e11;//calibrate Photometric zero point (#photons@pupil/s/full_aper, mag0 star). See evernote, this calculated in R band.
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 2; //Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2. Because there is 1.6ms Frame Rate, 1.596 ms read time; so the framedelay is calculated as 1+readoutdelay/itime-> 1+1.596/1.6=2
 loop.niter	       = 1000; //Total number of iterations.
 loop.ittime	       = 1e-3; //Iteration time (sampling time), unit second.
 loop.modalgainfile = "simulModeGains.fits";
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=24,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=64,_cent=32.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fc23404ced8,layerfrac=0x7fc23308a538,
 layerspeed=0x7fc23404c4c0,layeralt=0x7fc23404bce8,winddir=0x7fc23404cf60,
 _layeralt=0x7fc23404bbd8)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.01,
 pyr_mod_npts=4,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=12,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=0.495,fsoffset=
 [0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fc23403f5b8,lgs_prof_alt=0x7fc23403f4a0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fc232c4e1d0,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=112,_nsub4disp=0,_nmes=
 224,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=4.33352,_tt=[0.00252035,
 -0.00506794],_lastvalidtt=[0.00252035,-0.00506794],_upttcommand=[0,0],_refmes=
 0x7fc23314ea30,_tiprefv=0x7fc2330de230,_tiltrefv=0x7fc23310a030,_tiprefvn=
 0x7fc233229e30,_tiltrefvn=0x7fc2332d7830,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fc233950030,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fc2330d6430,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fc233950030,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fc233915830,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fc234049848)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fc233857850,_ctrlden=0x7fc234049260,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fc232e09560,_xlast=0x7fc232e096e0,_ylast=[0x7fc234038430,
 0x7fc234038430,0x7fc234038430],_y0=0x7fc234041430,_signus=0x7fc232e09860,
 _puppixoffset=[0,0],_nact=80,_def=0x1073fa030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=12,_n2=53,_pupil=0x0,_command=
 0x7fc232c52210,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fc23403e230,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fc23403dc10,xposition=0x7fc23403f4d8,yposition=
 0x7fc23403d6d0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fc23403dac0,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
