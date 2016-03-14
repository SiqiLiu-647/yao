=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1312 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.6   0.602      114.8
Field Avg  1.65                     53.6   0.602      114.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92add8,winddir=0x7fba6c92ae60,
 _layeralt=0x7fba6c92beb8)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c928b98,lgs_prof_alt=0x7fba6c91d710,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6ca2da30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1312,_nsub4disp=0,
 _nmes=2624,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00155882,
 -0.00124977],_lastvalidtt=[0.00155882,-0.00124977],_upttcommand=[0,0],_refmes=
 0x7fba6b0b1630,_tiprefv=0x7fba6c07b630,_tiltrefv=0x7fba6c080a30,_tiprefvn=
 0x7fba6c09e630,_tiltrefvn=0x7fba6c085e30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6b1a6830,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6c06ec30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6b1a6830,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c9c8630,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c928ff8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6b8093a0,_ctrlden=0x7fba6c928c40,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ad0df80,_xlast=0x7fba6ad0ad20,_ylast=[0x7fba6b804030,
 0x7fba6b804030,0x7fba6b804030],_y0=0x7fba6b83f430,_signus=0x7fba6ad0d8b0,
 _puppixoffset=[0,0],_nact=80,_def=0x10cef1030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ae0c0d0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928bd0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c928d20,xposition=0x7fba6c9273f0,yposition=
 0x7fba6c927498,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c927620,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1300 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.8   0.550      127.1
Field Avg  1.65                     54.8   0.550      127.1
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ad50,layerfrac=0x7fba6c92acc8,
 layerspeed=0x7fba6c92ac40,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92abb8,
 _layeralt=0x7fba6c92beb8)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.4,
 pyr_mod_npts=20,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c928a48,lgs_prof_alt=0x7fba6c91dac8,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b839430,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1300,_nsub4disp=0,
 _nmes=2600,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.0140872,
 -0.00277032],_lastvalidtt=[0.0140872,-0.00277032],_upttcommand=[0,0],_refmes=
 0x7fba6c9c1630,_tiprefv=0x7fba6ca71430,_tiltrefv=0x7fba6b0e4830,_tiprefvn=
 0x7fba6ca14230,_tiltrefvn=0x7fba6b0b1630,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6ca85a30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6b0eae30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6ca85a30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c9c6830,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c928ab8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c91d9b0,_ctrlden=0x7fba6c927968,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6af35a40,_xlast=0x7fba6af304b0,_ylast=[0x7fba6c90dc30,
 0x7fba6c90dc30,0x7fba6c90dc30],_y0=0x7fba6c997830,_signus=0x7fba6af32380,
 _puppixoffset=[0,0],_nact=80,_def=0x10ca90030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6af340c0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d710,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927620,xposition=0x7fba6b8093a0,yposition=
 0x7fba6c928c40,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c928bd0,ncpdm=0x0,
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
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.6   0.602      114.8
Field Avg  1.65                     53.6   0.602      114.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92acc8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92ad50,layeralt=0x7fba6c92ae60,winddir=0x7fba6c92add8,
 _layeralt=0x7fba6c92c270)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c928ff8,lgs_prof_alt=0x7fba6c927700,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6ca2ac30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1312,_nsub4disp=0,
 _nmes=2624,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.0014757,
 -0.00122427],_lastvalidtt=[0.0014757,-0.00122427],_upttcommand=[0,0],_refmes=
 0x7fba6ca4bc30,_tiprefv=0x7fba6c9c1630,_tiltrefv=0x7fba6cad9e30,_tiprefvn=
 0x7fba6c9dc230,_tiltrefvn=0x7fba6c9c6a30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6c08d630,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6c0b9e30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6c08d630,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c9cbe30,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c927460)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c91d9e8,_ctrlden=0x7fba6c8cec40,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6af2ce80,_xlast=0x7fba6af33b60,_ylast=[0x7fba6c90dc30,
 0x7fba6c90dc30,0x7fba6c90dc30],_y0=0x7fba6c986c30,_signus=0x7fba6af2e6c0,
 _puppixoffset=[0,0],_nact=80,_def=0x10e761030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ae0e090,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91dac8,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c928bd0,xposition=0x7fba6c928a80,yposition=
 0x7fba6c927968,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c91d710,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1312 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.6   0.602      114.8
Field Avg  1.65                     53.6   0.602      114.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92abb8,winddir=0x7fba6c92ab30,
 _layeralt=0x7fba6c92a910)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c928ab8,lgs_prof_alt=0x7fba6c928d58,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6c083030,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1312,_nsub4disp=0,
 _nmes=2624,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00136228,
 -0.00126692],_lastvalidtt=[0.00136228,-0.00126692],_upttcommand=[0,0],_refmes=
 0x7fba6b82dc30,_tiprefv=0x7fba6ca4c830,_tiltrefv=0x7fba6c08d630,_tiprefvn=
 0x7fba6ca51c30,_tiltrefvn=0x7fba6c072830,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6cab8e30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6ca57230,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6cab8e30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c9cb630,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c927268)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c91dda0,_ctrlden=0x7fba6c9273f0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ac2eeb0,_xlast=0x7fba6ac307f0,_ylast=[0x7fba6b040030,
 0x7fba6b040030,0x7fba6b040030],_y0=0x7fba6b022630,_signus=0x7fba6ac2bc10,
 _puppixoffset=[0,0],_nact=80,_def=0x10e761030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ae0dd70,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c927700,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91d710,xposition=0x7fba6c927690,yposition=
 0x7fba6c8cec40,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c91dac8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1312 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.6   0.602      114.8
Field Avg  1.65                     53.6   0.602      114.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ad50,layerfrac=0x7fba6c92acc8,
 layerspeed=0x7fba6c92ac40,layeralt=0x7fba6c92add8,winddir=0x7fba6c92ae60,
 _layeralt=0x7fba6b00da50)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927460,lgs_prof_alt=0x7fba6c927620,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6c9dc230,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1312,_nsub4disp=0,
 _nmes=2624,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00148421,
 -0.00130196],_lastvalidtt=[0.00148421,-0.00130196],_upttcommand=[0,0],_refmes=
 0x7fba6c9c6a30,_tiprefv=0x7fba6b156430,_tiltrefv=0x7fba6c9c1630,_tiprefvn=
 0x7fba6b085c30,_tiltrefvn=0x7fba6c9e2030,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6ca84830,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6c0a4c30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6ca84830,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c9e7430,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6b808e98)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c927968,_ctrlden=0x7fba6c928cb0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ae0bfd0,_xlast=0x7fba6ae0b4e0,_ylast=[0x7fba6c032c30,
 0x7fba6c032c30,0x7fba6c032c30],_y0=0x7fba6c014c30,_signus=0x7fba6ae0b660,
 _puppixoffset=[0,0],_nact=80,_def=0x10e761030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ae0c150,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928d58,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91dac8,xposition=0x7fba6c91d9b0,yposition=
 0x7fba6c9273f0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c927700,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1312 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.6   0.602      114.8
Field Avg  1.65                     53.6   0.602      114.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92acc8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92ad50,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92abb8,
 _layeralt=0x7fba6c92bb00)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927268,lgs_prof_alt=0x7fba6c927428,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b1d6a30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1312,_nsub4disp=0,
 _nmes=2624,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.0013592,
 -0.00127984],_lastvalidtt=[0.0013592,-0.00127984],_upttcommand=[0,0],_refmes=
 0x7fba6caa6c30,_tiprefv=0x7fba6ca7e230,_tiltrefv=0x7fba6b15fc30,_tiprefvn=
 0x7fba6c9c1630,_tiltrefvn=0x7fba6b1d0430,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6b0e8230,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6caad230,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6b0e8230,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c974230,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c91d7b8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c91dcc0,_ctrlden=0x7fba6b8093d8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ae0e520,_xlast=0x7fba6ae0e6a0,_ylast=[0x7fba6c07d830,
 0x7fba6c07d830,0x7fba6c07d830],_y0=0x7fba6c014c30,_signus=0x7fba6ae0ece0,
 _puppixoffset=[0,0],_nact=80,_def=0x10e761030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ae0b7f0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c927620,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927700,xposition=0x7fba6c928b60,yposition=
 0x7fba6c928cb0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c928d58,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1312 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.6   0.602      114.8
Field Avg  1.65                     53.6   0.602      114.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92abb8,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92beb8)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927700,lgs_prof_alt=0x7fba6c927690,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6ca58630,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1312,_nsub4disp=0,
 _nmes=2624,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00153095,
 -0.00121626],_lastvalidtt=[0.00153095,-0.00121626],_upttcommand=[0,0],_refmes=
 0x7fba6b0c3430,_tiprefv=0x7fba6c9c1630,_tiltrefv=0x7fba6ca42030,_tiprefvn=
 0x7fba6c9c6a30,_tiltrefvn=0x7fba6ca52e30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6b869430,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6b0de630,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6b869430,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c9e5a30,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6b809138)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c927850,_ctrlden=0x7fba6c91e3c0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6af2c100,_xlast=0x7fba6af35a40,_ylast=[0x7fba6c935430,
 0x7fba6c935430,0x7fba6c935430],_y0=0x7fba6ca58230,_signus=0x7fba6af33b60,
 _puppixoffset=[0,0],_nact=80,_def=0x10e761030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6af2f0a0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d710,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91db70,xposition=0x7fba6c928d58,yposition=
 0x7fba6c927428,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6b81a088,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1312 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.6   0.611      110.7
Field Avg  1.65                     53.6   0.611      110.7
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92abb8,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92bc10)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927700,lgs_prof_alt=0x7fba6c927690,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6c9cbe30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1312,_nsub4disp=0,
 _nmes=2624,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00191908,
 -0.00105868],_lastvalidtt=[0.00191908,-0.00105868],_upttcommand=[0,0],_refmes=
 0x7fba6cb18230,_tiprefv=0x7fba6b085030,_tiltrefv=0x7fba6c9e5a30,_tiprefvn=
 0x7fba6b079230,_tiltrefvn=0x7fba6ca42030,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6b15fc30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6ca2f830,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6b15fc30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6ca2b430,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c9249f8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6b808f40,_ctrlden=0x7fba6c91d9b0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ad11160,_xlast=0x7fba6ad0ad20,_ylast=[0x7fba6b804030,
 0x7fba6b804030,0x7fba6b804030],_y0=0x7fba6b83f430,_signus=0x7fba6ad10610,
 _puppixoffset=[0,0],_nact=80,_def=0x10f8d5030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ad0fcd0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d710,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91db70,xposition=0x7fba6b808e98,yposition=
 0x7fba6b809480,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6b81a088,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1312 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.6   0.612      110.7
Field Avg  1.65                     53.6   0.612      110.7
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92abb8,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92c2f8)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927700,lgs_prof_alt=0x7fba6c927690,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6ca9bc30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1312,_nsub4disp=0,
 _nmes=2624,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00184182,
 -0.000936747],_lastvalidtt=[0.00184182,-0.000936747],_upttcommand=[0,0],
 _refmes=0x7fba6ca19630,_tiprefv=0x7fba6b19b430,_tiltrefv=0x7fba6b08a430,
 _tiprefvn=0x7fba6b085030,_tiltrefvn=0x7fba6b079230,_reordervec=0x0,_npixels=0,
 _npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=
 0,_centroidw=0x0,_fimage=0x7fba6b0e8030,_fimage2=0x0,_imistart=0x0,_imjstart=
 0x0,_imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=
 0x0,_unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,
 _flat=0x0,_domask=0,_submask=0x7fba6cb57e30,_kernel=0x0,_kernels=0x0,_kerfftr=
 0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6b0e8030,_x=
 0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6cb54a30,
 _bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,
 _wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,
 _LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,
 _dmnotinpath=0x7fba6c91d940)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c9272a0,_ctrlden=0x7fba6c927770,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6af33780,_xlast=0x7fba6af32c80,_ylast=[0x7fba6c935430,
 0x7fba6c935430,0x7fba6c935430],_y0=0x7fba6c90dc30,_signus=0x7fba6af33b60,
 _puppixoffset=[0,0],_nact=80,_def=0x10f8d5030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ac32160,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d710,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91db70,xposition=0x7fba6b809138,yposition=
 0x7fba6b8091e0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6b81a088,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1304 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.6   0.614      106.6
Field Avg  1.65                     53.6   0.614      106.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92abb8,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92b3b0)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927700,lgs_prof_alt=0x7fba6c927690,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6ca15c30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1304,_nsub4disp=0,
 _nmes=2608,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00174357,
 -0.00127934],_lastvalidtt=[0.00174357,-0.00127934],_upttcommand=[0,0],_refmes=
 0x7fba6cb66030,_tiprefv=0x7fba6ca18630,_tiltrefv=0x7fba6cbac430,_tiprefvn=
 0x7fba6cb54a30,_tiltrefvn=0x7fba6cb3cc30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6b850230,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6b863430,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6b850230,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6b0b1630,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c9277a8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c91dc50,_ctrlden=0x7fba6c927888,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6af2ca00,_xlast=0x7fba6af33780,_ylast=[0x7fba6c90dc30,
 0x7fba6c90dc30,0x7fba6c90dc30],_y0=0x7fba6c990430,_signus=0x7fba6af2e6c0,
 _puppixoffset=[0,0],_nact=80,_def=0x10f8d5030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ac30440,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d710,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91db70,xposition=0x7fba6c9249f8,yposition=
 0x7fba6c927310,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6b81a088,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1312 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.6   0.609      110.7
Field Avg  1.65                     53.6   0.609      110.7
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92abb8,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92c270)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.1,
 pyr_mod_npts=40,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927700,lgs_prof_alt=0x7fba6c927690,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6cb41e30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1312,_nsub4disp=0,
 _nmes=2624,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00153526,
 -0.00102006],_lastvalidtt=[0.00153526,-0.00102006],_upttcommand=[0,0],_refmes=
 0x7fba6b882830,_tiprefv=0x7fba6c0b6430,_tiltrefv=0x7fba6cb57830,_tiprefvn=
 0x7fba6c0a4030,_tiltrefvn=0x7fba6c9dc230,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6ca91630,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6b895a30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6ca91630,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c9c1630,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c91d898)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c927508,_ctrlden=0x7fba6c928e00,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6af2f560,_xlast=0x7fba6af2ca00,_ylast=[0x7fba6c990430,
 0x7fba6c990430,0x7fba6c990430],_y0=0x7fba6cb5cc30,_signus=0x7fba6af304d0,
 _puppixoffset=[0,0],_nact=80,_def=0x10f8d5030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6af33780,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d710,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91db70,xposition=0x7fba6c91d940,yposition=
 0x7fba6b809100,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6b81a088,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1284 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.2   0.622      102.5
Field Avg  1.65                     53.2   0.622      102.5
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92abb8,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92b6c0)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927700,lgs_prof_alt=0x7fba6c927690,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6c16f430,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1284,_nsub4disp=0,
 _nmes=2568,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00436458,
 0.00240544],_lastvalidtt=[0.00436458,0.00240544],_upttcommand=[0,0],_refmes=
 0x7fba6c9e1630,_tiprefv=0x7fba6b124a30,_tiltrefv=0x7fba6b079230,_tiprefvn=
 0x7fba6b0cee30,_tiltrefvn=0x7fba6b11ee30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6b180030,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6c0e1a30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6b180030,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c9dc230,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c928e38)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6b808f08,_ctrlden=0x7fba6c927818,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ac377e0,_xlast=0x7fba6ac32500,_ylast=[0x7fba6b040030,
 0x7fba6b040030,0x7fba6b040030],_y0=0x7fba6b15f030,_signus=0x7fba6ac2bed0,
 _puppixoffset=[0,0],_nact=80,_def=0x10fc0a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6af35a40,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d710,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91db70,xposition=0x7fba6c9277a8,yposition=
 0x7fba6c928bd0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6b81a088,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1284 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.0   0.636       94.3
Field Avg  1.65                     53.0   0.636       94.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92abb8,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92bb88)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927700,lgs_prof_alt=0x7fba6c927690,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b20ae30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1284,_nsub4disp=0,
 _nmes=2568,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.0055209,
 0.00143536],_lastvalidtt=[0.0055209,0.00143536],_upttcommand=[0,0],_refmes=
 0x7fba6c9dc230,_tiprefv=0x7fba6cae9030,_tiltrefv=0x7fba6cb89a30,_tiprefvn=
 0x7fba6cadba30,_tiltrefvn=0x7fba6c9e1430,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6caee230,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6cac9e30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6caee230,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6b0a9830,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6b809170)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c91e3f8,_ctrlden=0x7fba6b809480,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ac2c190,_xlast=0x7fba6ac37790,_ylast=[0x7fba6b15f030,
 0x7fba6b15f030,0x7fba6b15f030],_y0=0x7fba6b022630,_signus=0x7fba6ac347a0,
 _puppixoffset=[0,0],_nact=80,_def=0x10ca90030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6af2ca00,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d710,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91db70,xposition=0x7fba6c91d898,yposition=
 0x7fba6c91da90,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6b81a088,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.0   0.635       94.3
Field Avg  1.65                     53.0   0.635       94.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92abb8,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92b8e0)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927700,lgs_prof_alt=0x7fba6c927690,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6ca53630,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00336074,
 0.000577455],_lastvalidtt=[0.00336074,0.000577455],_upttcommand=[0,0],_refmes=
 0x7fba6cac0c30,_tiprefv=0x7fba6ca4b830,_tiltrefv=0x7fba6ca46630,_tiprefvn=
 0x7fba6cae9030,_tiltrefvn=0x7fba6cb89a30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6b0bae30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6b13a230,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6b0bae30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c974230,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c9275b0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c91dda0,_ctrlden=0x7fba6c927380,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ac2bc10,_xlast=0x7fba6ac2c120,_ylast=[0x7fba6b022630,
 0x7fba6b022630,0x7fba6b022630],_y0=0x7fba6b040030,_signus=0x7fba6ac32b70,
 _puppixoffset=[0,0],_nact=80,_def=0x10fc0a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ac346b0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d710,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91db70,xposition=0x7fba6c928e38,yposition=
 0x7fba6c927968,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6b81a088,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.2   0.633       98.4
Field Avg  1.65                     53.2   0.633       98.4
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92abb8,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92b218)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927700,lgs_prof_alt=0x7fba6c927690,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6cb1d830,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00406636,
 0.000731169],_lastvalidtt=[0.00406636,0.000731169],_upttcommand=[0,0],_refmes=
 0x7fba6b0c0030,_tiprefv=0x7fba6b079230,_tiltrefv=0x7fba6b0eba30,_tiprefvn=
 0x7fba6b1ccc30,_tiltrefvn=0x7fba6b289630,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6cb89030,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6b1d3230,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6cb89030,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6b085630,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c9273b8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6b8091e0,_ctrlden=0x7fba6c927428,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6af37e10,_xlast=0x7fba6af353f0,_ylast=[0x7fba6c90dc30,
 0x7fba6c90dc30,0x7fba6c90dc30],_y0=0x7fba6cb1d430,_signus=0x7fba6af36b10,
 _puppixoffset=[0,0],_nact=80,_def=0x10ca90030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ac34510,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d710,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91db70,xposition=0x7fba6b809170,yposition=
 0x7fba6c91e3c0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6b81a088,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.0   0.619      114.8
Field Avg  1.65                     53.0   0.619      114.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92abb8,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92bd20)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927700,lgs_prof_alt=0x7fba6c927690,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b0a0e30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00376067,
 0.00140077],_lastvalidtt=[0.00376067,0.00140077],_upttcommand=[0,0],_refmes=
 0x7fba6b15fc30,_tiprefv=0x7fba6b1c6230,_tiltrefv=0x7fba6b153230,_tiprefvn=
 0x7fba6b079230,_tiltrefvn=0x7fba6b0eba30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6b10c830,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6b870c30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6b10c830,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c974230,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6b809218)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c928ea8,_ctrlden=0x7fba6c927818,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6af2ca00,_xlast=0x7fba6af35a40,_ylast=[0x7fba6cb1d430,
 0x7fba6cb1d430,0x7fba6cb1d430],_y0=0x7fba6c990430,_signus=0x7fba6af33b60,
 _puppixoffset=[0,0],_nact=80,_def=0x10fc0a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ac32ba0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d710,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91db70,xposition=0x7fba6c9275b0,yposition=
 0x7fba6c928dc8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6b81a088,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.6   0.607      118.9
Field Avg  1.65                     53.6   0.607      118.9
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92abb8,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92beb8)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927700,lgs_prof_alt=0x7fba6c927690,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6cb82c30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00491775,
 0.00290697],_lastvalidtt=[0.00491775,0.00290697],_upttcommand=[0,0],_refmes=
 0x7fba6b110e30,_tiprefv=0x7fba6b0f8c30,_tiltrefv=0x7fba6b106230,_tiprefvn=
 0x7fba6b1c6230,_tiltrefvn=0x7fba6b153230,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6cabce30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6ca14230,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6cabce30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6b0a0e30,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c9274d0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c9249f8,_ctrlden=0x7fba6c928a48,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6af32d30,_xlast=0x7fba6af2ca00,_ylast=[0x7fba6c990430,
 0x7fba6c990430,0x7fba6c990430],_y0=0x7fba6c935430,_signus=0x7fba6af2f560,
 _puppixoffset=[0,0],_nact=80,_def=0x10f5e6030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ac34ba0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d710,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91db70,xposition=0x7fba6c9273b8,yposition=
 0x7fba6c928b28,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6b81a088,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.2   0.628       98.4
Field Avg  1.65                     53.2   0.628       98.4
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92abb8,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92bc10)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927700,lgs_prof_alt=0x7fba6c927690,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b252c30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00437666,
 0.00333223],_lastvalidtt=[0.00437666,0.00333223],_upttcommand=[0,0],_refmes=
 0x7fba6ca35630,_tiprefv=0x7fba6ca9a430,_tiltrefv=0x7fba6caa5e30,_tiprefvn=
 0x7fba6ca9f630,_tiltrefvn=0x7fba6ca5f230,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6cb7bc30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6b0cee30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6cb7bc30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6ca30830,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c928f50)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c927310,_ctrlden=0x7fba6c927578,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ac2e3c0,_xlast=0x7fba6ac2e540,_ylast=[0x7fba6b022630,
 0x7fba6b022630,0x7fba6b022630],_y0=0x7fba6b072e30,_signus=0x7fba6ac34fe0,
 _puppixoffset=[0,0],_nact=80,_def=0x10ca90030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6af32d00,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d710,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91db70,xposition=0x7fba6b809218,yposition=
 0x7fba6c91d9e8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6b81a088,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.4   0.618      110.7
Field Avg  1.65                     53.4   0.618      110.7
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92abb8,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92c2f8)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927700,lgs_prof_alt=0x7fba6c927690,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b1aec30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00516073,
 0.00218592],_lastvalidtt=[0.00516073,0.00218592],_upttcommand=[0,0],_refmes=
 0x7fba6b1bee30,_tiprefv=0x7fba6b1c4030,_tiltrefv=0x7fba6b17f630,_tiprefvn=
 0x7fba6b16c630,_tiltrefvn=0x7fba6b1b1630,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6caa6630,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6b172c30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6caa6630,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c9e6230,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c927888)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6b809100,_ctrlden=0x7fba6c927460,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ac2e240,_xlast=0x7fba6ac2e3c0,_ylast=[0x7fba6b072e30,
 0x7fba6b072e30,0x7fba6b072e30],_y0=0x7fba6b0a4e30,_signus=0x7fba6ac329e0,
 _puppixoffset=[0,0],_nact=80,_def=0x10e761030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ac36700,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d710,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91db70,xposition=0x7fba6c9274d0,yposition=
 0x7fba6b809058,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6b81a088,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.4   0.430      291.0
Field Avg  1.65                     53.4   0.430      291.0
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92abb8,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92b3b0)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927700,lgs_prof_alt=0x7fba6c927690,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6c9e9630,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[-0.00169295,
 0.00220627],_lastvalidtt=[-0.00169295,0.00220627],_upttcommand=[0,0],_refmes=
 0x7fba6b1b6830,_tiprefv=0x7fba6b179230,_tiltrefv=0x7fba6b0c4630,_tiprefvn=
 0x7fba6b1c4030,_tiltrefvn=0x7fba6b17f630,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6caebe30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6b870c30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6caebe30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c974230,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c927850)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6b808fe8,_ctrlden=0x7fba6c928c40,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6af31ab0,_xlast=0x7fba6af337c0,_ylast=[0x7fba6c94fa30,
 0x7fba6c94fa30,0x7fba6c94fa30],_y0=0x7fba6c935430,_signus=0x7fba6af33b60,
 _puppixoffset=[0,0],_nact=80,_def=0x10fbc4030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ac329e0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d710,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91db70,xposition=0x7fba6c928f50,yposition=
 0x7fba6b809480,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6b81a088,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.2   0.642       94.3
Field Avg  1.65                     53.2   0.642       94.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92abb8,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92c270)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.3,
 pyr_mod_npts=40,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927700,lgs_prof_alt=0x7fba6c927690,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6cae9030,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00224635,
 0.00030394],_lastvalidtt=[0.00224635,0.00030394],_upttcommand=[0,0],_refmes=
 0x7fba6caf0c30,_tiprefv=0x7fba6b16c630,_tiltrefv=0x7fba6c0cde30,_tiprefvn=
 0x7fba6b179230,_tiltrefvn=0x7fba6c09e630,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6cb03630,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6cad9230,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6cb03630,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6cae5c30,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c928c08)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c91e430,_ctrlden=0x7fba6c929030,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ad0da40,_xlast=0x7fba6ad0df80,_ylast=[0x7fba6b83f430,
 0x7fba6b83f430,0x7fba6b83f430],_y0=0x7fba6b804030,_signus=0x7fba6ad0ad20,
 _puppixoffset=[0,0],_nact=80,_def=0x10fbc4030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6af31ab0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d710,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91db70,xposition=0x7fba6c927888,yposition=
 0x7fba6c91dc50,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6b81a088,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1288 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.4   0.580      118.9
Field Avg  1.65                     54.4   0.580      118.9
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92abb8,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92b6c0)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927700,lgs_prof_alt=0x7fba6c927690,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b853630,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1288,_nsub4disp=0,
 _nmes=2576,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00561606,
 0.00184276],_lastvalidtt=[0.00561606,0.00184276],_upttcommand=[0,0],_refmes=
 0x7fba6c108830,_tiprefv=0x7fba6c9c6830,_tiltrefv=0x7fba6b18ae30,_tiprefvn=
 0x7fba6ca14230,_tiltrefvn=0x7fba6c0cde30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6ca42630,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6c116830,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6ca42630,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6ca19430,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c928ce8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c928d20,_ctrlden=0x7fba6c9249f8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ae0e250,_xlast=0x7fba6ae0e3d0,_ylast=[0x7fba6c032c30,
 0x7fba6c032c30,0x7fba6c032c30],_y0=0x7fba6c014c30,_signus=0x7fba6ae0f260,
 _puppixoffset=[0,0],_nact=80,_def=0x10fbc4030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ac2e100,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d710,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91db70,xposition=0x7fba6c927850,yposition=
 0x7fba6c91d668,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6b81a088,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.6   0.607      110.7
Field Avg  1.65                     53.6   0.607      110.7
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92abb8,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92bb88)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927700,lgs_prof_alt=0x7fba6c927690,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b82ce30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00539293,
 0.0014755],_lastvalidtt=[0.00539293,0.0014755],_upttcommand=[0,0],_refmes=
 0x7fba6ca53230,_tiprefv=0x7fba6ca1e630,_tiltrefv=0x7fba6b827c30,_tiprefvn=
 0x7fba6c9c6830,_tiltrefvn=0x7fba6b82f830,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6ca72e30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6ca63030,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6ca72e30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c9c1630,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6b808e60)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c928dc8,_ctrlden=0x7fba6c9272d8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ac2e280,_xlast=0x7fba6ac2e400,_ylast=[0x7fba6b15e430,
 0x7fba6b15e430,0x7fba6b15e430],_y0=0x7fba6b096430,_signus=0x7fba6ac329e0,
 _puppixoffset=[0,0],_nact=80,_def=0x10fbc4030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6af2ca00,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d710,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91db70,xposition=0x7fba6c928c08,yposition=
 0x7fba6c91dc18,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6b81a088,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.6   0.611      114.8
Field Avg  1.65                     53.6   0.611      114.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92abb8,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92b8e0)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927700,lgs_prof_alt=0x7fba6c927690,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b1e6430,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00515347,
 0.0017325],_lastvalidtt=[0.00515347,0.0017325],_upttcommand=[0,0],_refmes=
 0x7fba6ca98a30,_tiprefv=0x7fba6b173630,_tiltrefv=0x7fba6b0b4a30,_tiprefvn=
 0x7fba6b178830,_tiltrefvn=0x7fba6b182c30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6cb7ea30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6b0be230,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6cb7ea30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6ca5f430,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6b808e28)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c927460,_ctrlden=0x7fba6c927818,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6af35a40,_xlast=0x7fba6af33780,_ylast=[0x7fba6c9ce630,
 0x7fba6c9ce630,0x7fba6c9ce630],_y0=0x7fba6c999630,_signus=0x7fba6af33b60,
 _puppixoffset=[0,0],_nact=80,_def=0x1100f7030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6af2f560,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d710,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91db70,xposition=0x7fba6c928ce8,yposition=
 0x7fba6c927508,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6b81a088,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.8   0.629       98.4
Field Avg  1.65                     53.8   0.629       98.4
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92abb8,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92b218)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927700,lgs_prof_alt=0x7fba6c927690,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b079230,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00517792,
 0.00104754],_lastvalidtt=[0.00517792,0.00104754],_upttcommand=[0,0],_refmes=
 0x7fba6b15fc30,_tiprefv=0x7fba6c0b6c30,_tiltrefv=0x7fba6c9c6830,_tiprefvn=
 0x7fba6c0a4830,_tiltrefvn=0x7fba6ca98430,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6caa0e30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6b1ef430,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6caa0e30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c9e8c30,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c928e38)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c928f88,_ctrlden=0x7fba6c928b28,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6af31ab0,_xlast=0x7fba6af363b0,_ylast=[0x7fba6c999630,
 0x7fba6c999630,0x7fba6c999630],_y0=0x7fba6c94fa30,_signus=0x7fba6af36850,
 _puppixoffset=[0,0],_nact=80,_def=0x10ca90030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ac2bc10,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d710,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91db70,xposition=0x7fba6b808e60,yposition=
 0x7fba6b808f08,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6b81a088,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.2   0.628       98.4
Field Avg  1.65                     53.2   0.628       98.4
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92abb8,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92bd20)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927700,lgs_prof_alt=0x7fba6c927690,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b08bc30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00471704,
 0.00279015],_lastvalidtt=[0.00471704,0.00279015],_upttcommand=[0,0],_refmes=
 0x7fba6b178a30,_tiprefv=0x7fba6b07f830,_tiltrefv=0x7fba6b0bb030,_tiprefvn=
 0x7fba6b079230,_tiltrefvn=0x7fba6b0b4a30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6b15fc30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6b0cee30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6b15fc30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c9e8c30,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c9278f8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c927428,_ctrlden=0x7fba6c928af0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ac2c050,_xlast=0x7fba6ac32f20,_ylast=[0x7fba6b15e430,
 0x7fba6b15e430,0x7fba6b15e430],_y0=0x7fba6b0cc430,_signus=0x7fba6ac334a0,
 _puppixoffset=[0,0],_nact=80,_def=0x10fbc4030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6af31ab0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d710,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91db70,xposition=0x7fba6b808e28,yposition=
 0x7fba6b808c68,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6b81a088,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1288 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       56.9   0.504      135.3
Field Avg  1.65                     56.9   0.504      135.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92abb8,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92beb8)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.5,
 pyr_mod_npts=24,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927700,lgs_prof_alt=0x7fba6c927690,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b880630,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1288,_nsub4disp=0,
 _nmes=2576,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.0164385,
 0.00591714],_lastvalidtt=[0.0164385,0.00591714],_upttcommand=[0,0],_refmes=
 0x7fba6ca47c30,_tiprefv=0x7fba6ca50630,_tiltrefv=0x7fba6ca7c630,_tiprefvn=
 0x7fba6ca39e30,_tiltrefvn=0x7fba6cacb030,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6b245a30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6b1a1430,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6b245a30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c9c1630,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c91e388)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c91d908,_ctrlden=0x7fba6c927818,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6af2f6a0,_xlast=0x7fba6af37790,_ylast=[0x7fba6c986c30,
 0x7fba6c986c30,0x7fba6c986c30],_y0=0x7fba6ca50230,_signus=0x7fba6af387b0,
 _puppixoffset=[0,0],_nact=80,_def=0x10fbc4030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ae0c930,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d710,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91db70,xposition=0x7fba6c928e38,yposition=
 0x7fba6b808d80,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6b81a088,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       56.0   0.536      131.2
Field Avg  1.65                     56.0   0.536      131.2
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92abb8,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92bc10)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.5,
 pyr_mod_npts=28,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927700,lgs_prof_alt=0x7fba6c927690,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6c9c7e30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00793012,
 0.00304446],_lastvalidtt=[0.00793012,0.00304446],_upttcommand=[0,0],_refmes=
 0x7fba6c9e6630,_tiprefv=0x7fba6b208030,_tiltrefv=0x7fba6b202e30,_tiprefvn=
 0x7fba6b1d0e30,_tiltrefvn=0x7fba6b0c1630,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6b24e830,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6b889630,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6b24e830,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c9e1430,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6b8091a8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c928c08,_ctrlden=0x7fba6c928b28,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6af2ca00,_xlast=0x7fba6af31ab0,_ylast=[0x7fba6ca50230,
 0x7fba6ca50230,0x7fba6ca50230],_y0=0x7fba6c94fa30,_signus=0x7fba6af33b60,
 _puppixoffset=[0,0],_nact=80,_def=0x10fbc4030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ac2bf40,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d710,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91db70,xposition=0x7fba6c9278f8,yposition=
 0x7fba6c929030,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6b81a088,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.8   0.570      123.0
Field Avg  1.65                     54.8   0.570      123.0
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92abb8,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92c2f8)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.5,
 pyr_mod_npts=32,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927700,lgs_prof_alt=0x7fba6c927690,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6cb4ca30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00844101,
 0.00376209],_lastvalidtt=[0.00844101,0.00376209],_upttcommand=[0,0],_refmes=
 0x7fba6cac1e30,_tiprefv=0x7fba6b085430,_tiltrefv=0x7fba6cabb830,_tiprefvn=
 0x7fba6b208030,_tiltrefvn=0x7fba6c9c4a30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6c0a6630,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6b8af630,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6c0a6630,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6cb48230,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6b809138)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c928b28,_ctrlden=0x7fba6b808e60,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ac33c60,_xlast=0x7fba6ac37550,_ylast=[0x7fba6b096430,
 0x7fba6b096430,0x7fba6b096430],_y0=0x7fba6b15e430,_signus=0x7fba6ac32c10,
 _puppixoffset=[0,0],_nact=80,_def=0x10e761030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6af31ab0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d710,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91db70,xposition=0x7fba6c91e388,yposition=
 0x7fba6b808f40,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6b81a088,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.8   0.584      118.9
Field Avg  1.65                     53.8   0.584      118.9
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92abb8,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92b3b0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.5,
 pyr_mod_npts=36,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927700,lgs_prof_alt=0x7fba6c927690,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6ca96a30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00660211,
 0.00195587],_lastvalidtt=[0.00660211,0.00195587],_upttcommand=[0,0],_refmes=
 0x7fba6b0bae30,_tiprefv=0x7fba6b08a630,_tiltrefv=0x7fba6b29cc30,_tiprefvn=
 0x7fba6b085430,_tiltrefvn=0x7fba6b079230,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6cad2030,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6ca3ac30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6cad2030,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6b0b1630,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6b808cd8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c9277a8,_ctrlden=0x7fba6c927770,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ae0dd70,_xlast=0x7fba6ae0e260,_ylast=[0x7fba6c0b4430,
 0x7fba6c0b4430,0x7fba6c0b4430],_y0=0x7fba6c014c30,_signus=0x7fba6ae0c3a0,
 _puppixoffset=[0,0],_nact=80,_def=0x10fbc4030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ac37510,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d710,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91db70,xposition=0x7fba6b8091a8,yposition=
 0x7fba6c928bd0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6b81a088,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.8   0.598      114.8
Field Avg  1.65                     53.8   0.598      114.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92ad50,
 layerspeed=0x7fba6c92abb8,layeralt=0x7fba6c92ab30,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92c270)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.5,
 pyr_mod_npts=40,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927700,lgs_prof_alt=0x7fba6c927690,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6ca93830,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00706209,
 0.00281641],_lastvalidtt=[0.00706209,0.00281641],_upttcommand=[0,0],_refmes=
 0x7fba6cab2830,_tiprefv=0x7fba6b0eee30,_tiltrefv=0x7fba6c0c6430,_tiprefvn=
 0x7fba6b08a630,_tiltrefvn=0x7fba6c0ab630,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6b209430,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6c0cde30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6b209430,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6ca96830,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6b8092c0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6b809100,_ctrlden=0x7fba6c91dda0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6af39b30,_xlast=0x7fba6af39360,_ylast=[0x7fba6c9cbc30,
 0x7fba6c9cbc30,0x7fba6c9cbc30],_y0=0x7fba6c986630,_signus=0x7fba6af39fd0,
 _puppixoffset=[0,0],_nact=80,_def=0x10fbc4030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6af398b0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d710,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91db70,xposition=0x7fba6b809138,yposition=
 0x7fba6c9249f8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6b81a088,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1476 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       85.6   0.192      217.2
Field Avg  1.65                     85.6   0.192      217.2
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ad50,layerfrac=0x7fba6c92abb8,
 layerspeed=0x7fba6c92ac40,layeralt=0x7fba6c92ae60,winddir=0x7fba6c92acc8,
 _layeralt=0x7fba6c92b6c0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.05,
 pyr_mod_npts=4,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927268,lgs_prof_alt=0x7fba6c928b60,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b08a030,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1476,_nsub4disp=0,
 _nmes=2952,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00747865,
 0.000944566],_lastvalidtt=[0.00747865,0.000944566],_upttcommand=[0,0],_refmes=
 0x7fba6c0b7430,_tiprefv=0x7fba6b07f830,_tiltrefv=0x7fba6b16d430,_tiprefvn=
 0x7fba6b079230,_tiltrefvn=0x7fba6b0b1630,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6b202030,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6c0e0e30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6b202030,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6b0b7430,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6b809170)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c91d860,_ctrlden=0x7fba6c928ff8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ac31700,_xlast=0x7fba6ac33d10,_ylast=[0x7fba6b096430,
 0x7fba6b096430,0x7fba6b096430],_y0=0x7fba6b15e430,_signus=0x7fba6ac32610,
 _puppixoffset=[0,0],_nact=80,_def=0x10fbc4030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6af34720,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c927690,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6b81a088,xposition=0x7fba6c9249f8,yposition=
 0x7fba6c91dda0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c91d710,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1376 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       56.7   0.455      168.0
Field Avg  1.65                     56.7   0.455      168.0
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ad50,layerfrac=0x7fba6c92abb8,
 layerspeed=0x7fba6c92ac40,layeralt=0x7fba6c92ae60,winddir=0x7fba6c92acc8,
 _layeralt=0x7fba6c92bb88)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.05,
 pyr_mod_npts=8,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927268,lgs_prof_alt=0x7fba6c928b60,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b23ee30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1376,_nsub4disp=0,
 _nmes=2752,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00379735,
 -0.000237972],_lastvalidtt=[0.00379735,-0.000237972],_upttcommand=[0,0],
 _refmes=0x7fba6b1eea30,_tiprefv=0x7fba6b855a30,_tiltrefv=0x7fba6c9c1630,
 _tiprefvn=0x7fba6b820030,_tiltrefvn=0x7fba6cad1e30,_reordervec=0x0,_npixels=0,
 _npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=
 0,_centroidw=0x0,_fimage=0x7fba6b1b5430,_fimage2=0x0,_imistart=0x0,_imjstart=
 0x0,_imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=
 0x0,_unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,
 _flat=0x0,_domask=0,_submask=0x7fba6b20f830,_kernel=0x0,_kernels=0x0,_kerfftr=
 0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6b1b5430,_x=
 0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6caf8830,
 _bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,
 _wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,
 _LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,
 _dmnotinpath=0x7fba6c928ce8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6b8091e0,_ctrlden=0x7fba6b808fe8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ac28320,_xlast=0x7fba6ac30440,_ylast=[0x7fba6b15e430,
 0x7fba6b15e430,0x7fba6b15e430],_y0=0x7fba6b022630,_signus=0x7fba6ac2e100,
 _puppixoffset=[0,0],_nact=80,_def=0x1102c5030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ae0c330,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c927690,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6b81a088,xposition=0x7fba6c927700,yposition=
 0x7fba6b809020,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c91d710,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1312 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.6   0.602      114.8
Field Avg  1.65                     53.6   0.602      114.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92abb8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92ae60,winddir=0x7fba6c92add8,
 _layeralt=0x7fba6c92bb00)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6b809020,lgs_prof_alt=0x7fba6c927a48,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6c0c2a30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1312,_nsub4disp=0,
 _nmes=2624,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00146039,
 -0.00123152],_lastvalidtt=[0.00146039,-0.00123152],_upttcommand=[0,0],_refmes=
 0x7fba6c0a1430,_tiprefv=0x7fba6b079230,_tiltrefv=0x7fba6c9c1630,_tiprefvn=
 0x7fba6b07e630,_tiltrefvn=0x7fba6cb5d630,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6cab8830,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6c0f1030,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6cab8830,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6b0a1a30,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c928e00)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c928310,_ctrlden=0x7fba6c927f18,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ac2bc10,_xlast=0x7fba6ac2d020,_ylast=[0x7fba6b022630,
 0x7fba6b022630,0x7fba6b022630],_y0=0x7fba6b0a4e30,_signus=0x7fba6ac318b0,
 _puppixoffset=[0,0],_nact=80,_def=0x10ca90030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ad0b950,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c91d860,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91dcc0,xposition=0x7fba6c928b98,yposition=
 0x7fba6c928b60,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6b809218,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1312 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.6   0.602      114.8
Field Avg  1.65                     53.6   0.602      114.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92ac40,layerfrac=0x7fba6c92acc8,
 layerspeed=0x7fba6c92abb8,layeralt=0x7fba6c92a910,winddir=0x7fba6c92ad50,
 _layeralt=0x7fba6c92c270)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c927268,lgs_prof_alt=0x7fba6c8cec40,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b124230,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1312,_nsub4disp=0,
 _nmes=2624,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00140474,
 -0.00128449],_lastvalidtt=[0.00140474,-0.00128449],_upttcommand=[0,0],_refmes=
 0x7fba6b0cee30,_tiprefv=0x7fba6b0c2c30,_tiltrefv=0x7fba6c9c1630,_tiprefvn=
 0x7fba6b15fc30,_tiltrefvn=0x7fba6ca4dc30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6b0ed430,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6ca41230,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6b0ed430,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c974230,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6b809170)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6b808e28,_ctrlden=0x7fba6c927a10,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ae0b890,_xlast=0x7fba6ae0bc20,_ylast=[0x7fba6c032c30,
 0x7fba6c032c30,0x7fba6c032c30],_y0=0x7fba6c014c30,_signus=0x7fba6ae0b4e0,
 _puppixoffset=[0,0],_nact=80,_def=0x10fbc4030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ae0c220,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c927a48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6b809218,xposition=0x7fba6c91db00,yposition=
 0x7fba6c927f18,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c91d860,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1312 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.6   0.602      114.8
Field Avg  1.65                     53.6   0.602      114.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92acc8,layerfrac=0x7fba6c92abb8,
 layerspeed=0x7fba6c92ac40,layeralt=0x7fba6c92add8,winddir=0x7fba6c92ae60,
 _layeralt=0x7fba6c92b748)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6c928e00,lgs_prof_alt=0x7fba6c928a48,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6cacd430,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1312,_nsub4disp=0,
 _nmes=2624,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00135405,
 -0.00111489],_lastvalidtt=[0.00135405,-0.00111489],_upttcommand=[0,0],_refmes=
 0x7fba6b080e30,_tiprefv=0x7fba6cacfe30,_tiltrefv=0x7fba6b21c230,_tiprefvn=
 0x7fba6c9c4a30,_tiltrefvn=0x7fba6b086230,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6ca76630,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6cad6c30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6ca76630,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c9e3230,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6b808d80)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c91d668,_ctrlden=0x7fba6c927738,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ac28320,_xlast=0x7fba6ac32b70,_ylast=[0x7fba6b022630,
 0x7fba6b022630,0x7fba6b022630],_y0=0x7fba6b15e430,_signus=0x7fba6ac2bda0,
 _puppixoffset=[0,0],_nact=80,_def=0x10fbc4030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ae0cc70,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c8cec40,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c91d860,xposition=0x7fba6b808c68,yposition=
 0x7fba6c927a10,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c927a48,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1312 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.6   0.602      114.8
Field Avg  1.65                     53.6   0.602      114.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92abb8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92ad50,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92b9f0)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6b809170,lgs_prof_alt=0x7fba6c91dcc0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b20cc30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1312,_nsub4disp=0,
 _nmes=2624,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00151379,
 -0.0012484],_lastvalidtt=[0.00151379,-0.0012484],_upttcommand=[0,0],_refmes=
 0x7fba6b0be030,_tiprefv=0x7fba6ca14230,_tiltrefv=0x7fba6b0c3430,_tiprefvn=
 0x7fba6c9c4a30,_tiltrefvn=0x7fba6b20f630,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6cb8ea30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6ca98a30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6cb8ea30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6b214a30,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c9274d0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c927460,_ctrlden=0x7fba6c91da90,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ae0baa0,_xlast=0x7fba6ae0cc30,_ylast=[0x7fba6c0afa30,
 0x7fba6c0afa30,0x7fba6c0afa30],_y0=0x7fba6c014c30,_signus=0x7fba6ae0eaa0,
 _puppixoffset=[0,0],_nact=80,_def=0x10fbc4030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6af2ca00,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928a48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927a48,xposition=0x7fba6c928310,yposition=
 0x7fba6c927738,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c8cec40,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1284 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.2   0.623      102.5
Field Avg  1.65                     53.2   0.623      102.5
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92abb8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92ad50,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92c1e8)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6b809170,lgs_prof_alt=0x7fba6c91dcc0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b0e5230,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1284,_nsub4disp=0,
 _nmes=2568,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00464267,
 0.00253031],_lastvalidtt=[0.00464267,0.00253031],_upttcommand=[0,0],_refmes=
 0x7fba6ca8b230,_tiprefv=0x7fba6c0c0230,_tiltrefv=0x7fba6b0b1630,_tiprefvn=
 0x7fba6c0cee30,_tiltrefvn=0x7fba6b079230,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6cb15830,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6c0d9a30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6cb15830,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6ca79230,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c927968)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c928348,_ctrlden=0x7fba6c927620,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ae0f020,_xlast=0x7fba6ae0baa0,_ylast=[0x7fba6c014c30,
 0x7fba6c014c30,0x7fba6c014c30],_y0=0x7fba6c0b2a30,_signus=0x7fba6ae0cc30,
 _puppixoffset=[0,0],_nact=80,_def=0x10fbc4030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ae0eaa0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928a48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927a48,xposition=0x7fba6c928e00,yposition=
 0x7fba6c928bd0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c8cec40,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.6   0.607      114.8
Field Avg  1.65                     53.6   0.607      114.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92abb8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92ad50,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92bc98)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6b809170,lgs_prof_alt=0x7fba6c91dcc0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6ca63830,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00494967,
 0.00258247],_lastvalidtt=[0.00494967,0.00258247],_upttcommand=[0,0],_refmes=
 0x7fba6caa3230,_tiprefv=0x7fba6b0b6830,_tiltrefv=0x7fba6b850230,_tiprefvn=
 0x7fba6b0bba30,_tiltrefvn=0x7fba6b832030,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6b268c30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6b1dd430,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6b268c30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c9e5a30,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c91e430)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c924a30,_ctrlden=0x7fba6c928578,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6af31ab0,_xlast=0x7fba6af37e10,_ylast=[0x7fba6c94fa30,
 0x7fba6c94fa30,0x7fba6c94fa30],_y0=0x7fba6c8c4a30,_signus=0x7fba6af33b60,
 _puppixoffset=[0,0],_nact=80,_def=0x10fbc4030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ae0b4e0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928a48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927a48,xposition=0x7fba6c9274d0,yposition=
 0x7fba6c928ab8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c8cec40,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1288 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.4   0.580      118.9
Field Avg  1.65                     54.4   0.580      118.9
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92abb8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92ad50,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92bfc8)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6b809170,lgs_prof_alt=0x7fba6c91dcc0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b867430,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1288,_nsub4disp=0,
 _nmes=2576,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00578571,
 0.0016652],_lastvalidtt=[0.00578571,0.0016652],_upttcommand=[0,0],_refmes=
 0x7fba6cabf430,_tiprefv=0x7fba6b0c5e30,_tiltrefv=0x7fba6b0c0c30,_tiprefvn=
 0x7fba6b0b6830,_tiltrefvn=0x7fba6b080c30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6ca2d430,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6b870c30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6ca2d430,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c0a0830,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6b808db8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c9278f8,_ctrlden=0x7fba6b8093d8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ac34b80,_xlast=0x7fba6ac2bd30,_ylast=[0x7fba6b022630,
 0x7fba6b022630,0x7fba6b022630],_y0=0x7fba6b0aa830,_signus=0x7fba6ac31470,
 _puppixoffset=[0,0],_nact=80,_def=0x10e761030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ae0c220,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928a48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927a48,xposition=0x7fba6c927968,yposition=
 0x7fba6c9273b8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c8cec40,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1288 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       56.9   0.504      135.3
Field Avg  1.65                     56.9   0.504      135.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92abb8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92ad50,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92c2f8)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.5,
 pyr_mod_npts=24,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6b809170,lgs_prof_alt=0x7fba6c91dcc0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b0a2830,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1288,_nsub4disp=0,
 _nmes=2576,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.015113,
 0.00621469],_lastvalidtt=[0.015113,0.00621469],_upttcommand=[0,0],_refmes=
 0x7fba6b853630,_tiprefv=0x7fba6b0b1630,_tiltrefv=0x7fba6b249030,_tiprefvn=
 0x7fba6b0c5e30,_tiltrefvn=0x7fba6b0c0c30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6b179e30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6cbb4630,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6b179e30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c9e3230,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c928498)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c9273f0,_ctrlden=0x7fba6c928508,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6af39500,_xlast=0x7fba6af38bc0,_ylast=[0x7fba6c94fa30,
 0x7fba6c94fa30,0x7fba6c94fa30],_y0=0x7fba6c977230,_signus=0x7fba6af32380,
 _puppixoffset=[0,0],_nact=80,_def=0x10e761030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6af2cc50,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928a48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927a48,xposition=0x7fba6c91e430,yposition=
 0x7fba6c928f88,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c8cec40,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1312 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.6   0.611      110.7
Field Avg  1.65                     53.6   0.611      110.7
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92abb8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92ad50,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92c518)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6b809170,lgs_prof_alt=0x7fba6c91dcc0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b235430,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1312,_nsub4disp=0,
 _nmes=2624,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00192786,
 -0.00114284],_lastvalidtt=[0.00192786,-0.00114284],_upttcommand=[0,0],_refmes=
 0x7fba6c9c1630,_tiprefv=0x7fba6b243830,_tiltrefv=0x7fba6ca5da30,_tiprefvn=
 0x7fba6b0b6830,_tiltrefvn=0x7fba6ca62e30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6b15fc30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6ca28430,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6b15fc30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6ca24030,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c91d898)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c928540,_ctrlden=0x7fba6c9275e8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ac2d020,_xlast=0x7fba6ac325f0,_ylast=[0x7fba6b022630,
 0x7fba6b022630,0x7fba6b022630],_y0=0x7fba6b0aa830,_signus=0x7fba6ac30800,
 _puppixoffset=[0,0],_nact=80,_def=0x10e761030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6af31ab0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928a48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927a48,xposition=0x7fba6b808db8,yposition=
 0x7fba6b809480,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c8cec40,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1284 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.0   0.636       94.3
Field Avg  1.65                     53.0   0.636       94.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92abb8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92ad50,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92be30)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6b809170,lgs_prof_alt=0x7fba6c91dcc0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6c9c6a30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1284,_nsub4disp=0,
 _nmes=2568,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00560498,
 0.0016385],_lastvalidtt=[0.00560498,0.0016385],_upttcommand=[0,0],_refmes=
 0x7fba6ca58430,_tiprefv=0x7fba6ca14230,_tiltrefv=0x7fba6b860e30,_tiprefvn=
 0x7fba6ca1b030,_tiltrefvn=0x7fba6b820030,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6b8cc230,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6b870c30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6b8cc230,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c9df630,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c927ff8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6b809250,_ctrlden=0x7fba6b809020,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6af35780,_xlast=0x7fba6af2c100,_ylast=[0x7fba6c94fa30,
 0x7fba6c94fa30,0x7fba6c94fa30],_y0=0x7fba6c978430,_signus=0x7fba6af2e6c0,
 _puppixoffset=[0,0],_nact=80,_def=0x1100f7030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6af2ca00,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928a48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927a48,xposition=0x7fba6c928498,yposition=
 0x7fba6c927540,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c8cec40,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.2   0.628       98.4
Field Avg  1.65                     53.2   0.628       98.4
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92abb8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92ad50,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92b328)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6b809170,lgs_prof_alt=0x7fba6c91dcc0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6caef830,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00448832,
 0.00305786],_lastvalidtt=[0.00448832,0.00305786],_upttcommand=[0,0],_refmes=
 0x7fba6c9c6830,_tiprefv=0x7fba6c9df630,_tiltrefv=0x7fba6b080c30,_tiprefvn=
 0x7fba6ca14230,_tiltrefvn=0x7fba6b085e30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6cba5e30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6ca49430,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6cba5e30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6b0c3c30,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c927a80)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c9283f0,_ctrlden=0x7fba6c91d908,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6af36590,_xlast=0x7fba6af300c0,_ylast=[0x7fba6c978430,
 0x7fba6c978430,0x7fba6c978430],_y0=0x7fba6c999630,_signus=0x7fba6af353e0,
 _puppixoffset=[0,0],_nact=80,_def=0x1100f7030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ae0b4e0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928a48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927a48,xposition=0x7fba6c91d898,yposition=
 0x7fba6c927ee0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c8cec40,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.6   0.607      110.7
Field Avg  1.65                     53.6   0.607      110.7
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92abb8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92ad50,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92c0d8)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6b809170,lgs_prof_alt=0x7fba6c91dcc0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b1e3a30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00606075,
 0.000962164],_lastvalidtt=[0.00606075,0.000962164],_upttcommand=[0,0],_refmes=
 0x7fba6c9c1630,_tiprefv=0x7fba6b1dd430,_tiltrefv=0x7fba6b0cee30,_tiprefvn=
 0x7fba6b079230,_tiltrefvn=0x7fba6b080c30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6ca68230,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6b864030,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6ca68230,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c974230,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c9283b8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c928d58,_ctrlden=0x7fba6c927428,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ac28320,_xlast=0x7fba6ac2e4c0,_ylast=[0x7fba6b0ab430,
 0x7fba6b0ab430,0x7fba6b0ab430],_y0=0x7fba6b022630,_signus=0x7fba6ac33d10,
 _puppixoffset=[0,0],_nact=80,_def=0x10fbc4030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6af31ab0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928a48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927a48,xposition=0x7fba6c927ff8,yposition=
 0x7fba6c928fc0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c8cec40,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       56.5   0.536      131.2
Field Avg  1.65                     56.5   0.536      131.2
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92abb8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92ad50,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92ba78)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.5,
 pyr_mod_npts=28,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6b809170,lgs_prof_alt=0x7fba6c91dcc0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6ca82630,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00738652,
 0.00313744],_lastvalidtt=[0.00738652,0.00313744],_upttcommand=[0,0],_refmes=
 0x7fba6b825230,_tiprefv=0x7fba6b085e30,_tiltrefv=0x7fba6c9c1630,_tiprefvn=
 0x7fba6b1dd430,_tiltrefvn=0x7fba6ca53630,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6cb83830,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6c0f2c30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6cb83830,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c9c7230,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c927268)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6b808db8,_ctrlden=0x7fba6c9273f0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ac2e100,_xlast=0x7fba6ac28320,_ylast=[0x7fba6b022630,
 0x7fba6b022630,0x7fba6b022630],_y0=0x7fba6b15e430,_signus=0x7fba6ac2e280,
 _puppixoffset=[0,0],_nact=80,_def=0x10fbc4030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6af300c0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928a48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927a48,xposition=0x7fba6c927a80,yposition=
 0x7fba6c928af0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c8cec40,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1312 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.6   0.612      106.6
Field Avg  1.65                     53.6   0.612      106.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92abb8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92ad50,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92b9f0)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6b809170,lgs_prof_alt=0x7fba6c91dcc0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b1ec030,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1312,_nsub4disp=0,
 _nmes=2624,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00181589,
 -0.000838828],_lastvalidtt=[0.00181589,-0.000838828],_upttcommand=[0,0],
 _refmes=0x7fba6c0f2c30,_tiprefv=0x7fba6b20d430,_tiltrefv=0x7fba6b208030,
 _tiprefvn=0x7fba6b1e2630,_tiltrefvn=0x7fba6b0b1630,_reordervec=0x0,_npixels=0,
 _npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=
 0,_centroidw=0x0,_fimage=0x7fba6cbcb630,_fimage2=0x0,_imistart=0x0,_imjstart=
 0x0,_imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=
 0x0,_unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,
 _flat=0x0,_domask=0,_submask=0x7fba6b86a630,_kernel=0x0,_kernels=0x0,_kerfftr=
 0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6cbcb630,_x=
 0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6b07c630,
 _bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,
 _wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,
 _LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,
 _dmnotinpath=0x7fba6c927fc0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c927700,_ctrlden=0x7fba6c91dac8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6af30240,_xlast=0x7fba6af34720,_ylast=[0x7fba6c90dc30,
 0x7fba6c90dc30,0x7fba6c90dc30],_y0=0x7fba6c94fa30,_signus=0x7fba6af2e6c0,
 _puppixoffset=[0,0],_nact=80,_def=0x10fbc4030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ad0d8b0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928a48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927a48,xposition=0x7fba6c9283b8,yposition=
 0x7fba6b808df0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c8cec40,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.0   0.635       94.3
Field Avg  1.65                     53.0   0.635       94.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92abb8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92ad50,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92c1e8)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6b809170,lgs_prof_alt=0x7fba6c91dcc0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b1dd430,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.003371,
 0.000409962],_lastvalidtt=[0.003371,0.000409962],_upttcommand=[0,0],_refmes=
 0x7fba6c0f9e30,_tiprefv=0x7fba6c9c1630,_tiltrefv=0x7fba6cbd8030,_tiprefvn=
 0x7fba6c9c6830,_tiltrefvn=0x7fba6cac2630,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6cb51c30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6c117c30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6cb51c30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6ca15c30,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c928380)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6b8092c0,_ctrlden=0x7fba6c9274d0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ac34030,_xlast=0x7fba6ac2e290,_ylast=[0x7fba6b15e430,
 0x7fba6b15e430,0x7fba6b15e430],_y0=0x7fba6b022630,_signus=0x7fba6ac2e410,
 _puppixoffset=[0,0],_nact=80,_def=0x10fbc4030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ad0da30,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928a48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927a48,xposition=0x7fba6c927268,yposition=
 0x7fba6c928578,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c8cec40,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.4   0.618      110.7
Field Avg  1.65                     53.4   0.618      110.7
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92abb8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92ad50,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92bc98)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6b809170,lgs_prof_alt=0x7fba6c91dcc0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6c9e8c30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00504588,
 0.0021828],_lastvalidtt=[0.00504588,0.0021828],_upttcommand=[0,0],_refmes=
 0x7fba6b1e2630,_tiprefv=0x7fba6b1e7830,_tiltrefv=0x7fba6b1a0830,_tiprefvn=
 0x7fba6b1eca30,_tiltrefvn=0x7fba6b0bae30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6cabd430,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6b86a630,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6cabd430,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6b0a0e30,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c91d7f0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c91da20,_ctrlden=0x7fba6c9284d0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6af31ab0,_xlast=0x7fba6af2e7d0,_ylast=[0x7fba6c94fa30,
 0x7fba6c94fa30,0x7fba6c94fa30],_y0=0x7fba6c90dc30,_signus=0x7fba6af33b60,
 _puppixoffset=[0,0],_nact=80,_def=0x10e761030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ad0d8b0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928a48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927a48,xposition=0x7fba6c927fc0,yposition=
 0x7fba6c927690,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c8cec40,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.6   0.611      114.8
Field Avg  1.65                     53.6   0.611      114.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92abb8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92ad50,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92bfc8)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6b809170,lgs_prof_alt=0x7fba6c91dcc0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b1d8030,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00557104,
 0.00265072],_lastvalidtt=[0.00557104,0.00265072],_upttcommand=[0,0],_refmes=
 0x7fba6c9c5630,_tiprefv=0x7fba6b079230,_tiltrefv=0x7fba6ca14230,_tiprefvn=
 0x7fba6b1e7830,_tiltrefvn=0x7fba6c9e3230,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6b104830,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6c0cce30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6b104830,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6b1d4c30,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c91d940)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c928c08,_ctrlden=0x7fba6c928e38,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6af2ca00,_xlast=0x7fba6af31ab0,_ylast=[0x7fba6c90dc30,
 0x7fba6c90dc30,0x7fba6c90dc30],_y0=0x7fba6c8c4a30,_signus=0x7fba6af32380,
 _puppixoffset=[0,0],_nact=80,_def=0x10e761030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ac31360,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928a48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927a48,xposition=0x7fba6c928380,yposition=
 0x7fba6b808e60,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c8cec40,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.8   0.571      123.0
Field Avg  1.65                     54.8   0.571      123.0
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92abb8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92ad50,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92c2f8)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.5,
 pyr_mod_npts=32,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6b809170,lgs_prof_alt=0x7fba6c91dcc0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6ca26830,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00732082,
 0.00450638],_lastvalidtt=[0.00732082,0.00450638],_upttcommand=[0,0],_refmes=
 0x7fba6b085e30,_tiprefv=0x7fba6c9c1630,_tiltrefv=0x7fba6ca5c630,_tiprefvn=
 0x7fba6c9c6830,_tiltrefvn=0x7fba6ca14230,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6cacd630,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6b0eb430,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6cacd630,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c974230,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c928508)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c91e3c0,_ctrlden=0x7fba6b809480,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ac2d350,_xlast=0x7fba6ac2e100,_ylast=[0x7fba6b022630,
 0x7fba6b022630,0x7fba6b022630],_y0=0x7fba6b15e430,_signus=0x7fba6ac2bc10,
 _puppixoffset=[0,0],_nact=80,_def=0x10e761030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6af31ab0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928a48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927a48,xposition=0x7fba6c91d7f0,yposition=
 0x7fba6c91d898,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c8cec40,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1304 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.6   0.614      106.6
Field Avg  1.65                     53.6   0.614      106.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92abb8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92ad50,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92c518)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6b809170,lgs_prof_alt=0x7fba6c91dcc0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b853630,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1304,_nsub4disp=0,
 _nmes=2608,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00146495,
 -0.00109701],_lastvalidtt=[0.00146495,-0.00109701],_upttcommand=[0,0],_refmes=
 0x7fba6b080c30,_tiprefv=0x7fba6ca68830,_tiltrefv=0x7fba6ca71030,_tiprefvn=
 0x7fba6c9c1630,_tiltrefvn=0x7fba6ca5c630,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6cb77430,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6caa9630,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6cb77430,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6ca14230,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c928030)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c9284d0,_ctrlden=0x7fba6c91dda0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ac30c00,_xlast=0x7fba6ac2d340,_ylast=[0x7fba6b15e430,
 0x7fba6b15e430,0x7fba6b15e430],_y0=0x7fba6b0ab430,_signus=0x7fba6ac31440,
 _puppixoffset=[0,0],_nact=80,_def=0x10e761030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6af2ca00,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928a48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927a48,xposition=0x7fba6c91d940,yposition=
 0x7fba6c91dc50,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c8cec40,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.2   0.633       98.4
Field Avg  1.65                     53.2   0.633       98.4
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92abb8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92ad50,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92be30)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6b809170,lgs_prof_alt=0x7fba6c91dcc0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b176230,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00354784,
 0.00128442],_lastvalidtt=[0.00354784,0.00128442],_upttcommand=[0,0],_refmes=
 0x7fba6b200430,_tiprefv=0x7fba6c9c6830,_tiltrefv=0x7fba6ca14230,_tiprefvn=
 0x7fba6ca68830,_tiltrefvn=0x7fba6ca71030,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6b251c30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6ca7c830,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6b251c30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6ca76230,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c927f50)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6b808fe8,_ctrlden=0x7fba6c928540,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ac2c1a0,_xlast=0x7fba6ac30c00,_ylast=[0x7fba6b0ab430,
 0x7fba6b0ab430,0x7fba6b0ab430],_y0=0x7fba6b096430,_signus=0x7fba6ac347e0,
 _puppixoffset=[0,0],_nact=80,_def=0x1100f7030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ac342e0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928a48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927a48,xposition=0x7fba6c928508,yposition=
 0x7fba6c9272a0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c8cec40,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.4   0.432      291.0
Field Avg  1.65                     53.4   0.432      291.0
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92abb8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92ad50,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92b328)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6b809170,lgs_prof_alt=0x7fba6c91dcc0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6c9e8e30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=
 [-0.000521273,0.00185461],_lastvalidtt=[-0.000521273,0.00185461],_upttcommand=
 [0,0],_refmes=0x7fba6b169430,_tiprefv=0x7fba6b854230,_tiltrefv=0x7fba6b0c4430,
 _tiprefvn=0x7fba6b820030,_tiltrefvn=0x7fba6b16e630,_reordervec=0x0,_npixels=0,
 _npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=
 0,_centroidw=0x0,_fimage=0x7fba6ca82e30,_fimage2=0x0,_imistart=0x0,_imjstart=
 0x0,_imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=
 0x0,_unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,
 _flat=0x0,_domask=0,_submask=0x7fba6b86a630,_kernel=0x0,_kernels=0x0,_kerfftr=
 0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6ca82e30,_x=
 0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6b15fc30,
 _bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,
 _wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,
 _LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,
 _dmnotinpath=0x7fba6c928c40)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c928ff8,_ctrlden=0x7fba6c927620,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ae0b4e0,_xlast=0x7fba6ae0b660,_ylast=[0x7fba6c032c30,
 0x7fba6c032c30,0x7fba6c032c30],_y0=0x7fba6c014c30,_signus=0x7fba6ae0b7e0,
 _puppixoffset=[0,0],_nact=80,_def=0x10fbc4030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ad0c910,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928a48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927a48,xposition=0x7fba6c928030,yposition=
 0x7fba6c9277a8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c8cec40,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.8   0.628       98.4
Field Avg  1.65                     53.8   0.628       98.4
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92abb8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92ad50,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92c0d8)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6b809170,lgs_prof_alt=0x7fba6c91dcc0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6cadca30,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00461863,
 0.00119705],_lastvalidtt=[0.00461863,0.00119705],_upttcommand=[0,0],_refmes=
 0x7fba6b15fc30,_tiprefv=0x7fba6b169030,_tiltrefv=0x7fba6b295830,_tiprefvn=
 0x7fba6b079230,_tiltrefvn=0x7fba6b0c4430,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6ca42e30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6cbc8830,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6ca42e30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6cbd5230,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c91dba8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c927310,_ctrlden=0x7fba6c927ee0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ac2d020,_xlast=0x7fba6ac33d10,_ylast=[0x7fba6b096430,
 0x7fba6b096430,0x7fba6b096430],_y0=0x7fba6b0ab430,_signus=0x7fba6ac33e90,
 _puppixoffset=[0,0],_nact=80,_def=0x10fbc4030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6af31ab0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928a48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927a48,xposition=0x7fba6c927f50,yposition=
 0x7fba6c927268,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c8cec40,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.8   0.585      118.9
Field Avg  1.65                     53.8   0.585      118.9
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92abb8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92ad50,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92ba78)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.5,
 pyr_mod_npts=36,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6b809170,lgs_prof_alt=0x7fba6c91dcc0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6caf0230,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00588328,
 0.00186213],_lastvalidtt=[0.00588328,0.00186213],_upttcommand=[0,0],_refmes=
 0x7fba6ca3c830,_tiprefv=0x7fba6b87be30,_tiltrefv=0x7fba6b079230,_tiprefvn=
 0x7fba6b881030,_tiltrefvn=0x7fba6b295830,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6b1f6830,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6b0b1630,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6b1f6830,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6b0a0e30,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c9273f0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c928508,_ctrlden=0x7fba6c91db38,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6af33ca0,_xlast=0x7fba6af304d0,_ylast=[0x7fba6c9cbc30,
 0x7fba6c9cbc30,0x7fba6c9cbc30],_y0=0x7fba6c999630,_signus=0x7fba6af379a0,
 _puppixoffset=[0,0],_nact=80,_def=0x10fbc4030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ac2d330,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928a48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927a48,xposition=0x7fba6c928c40,yposition=
 0x7fba6c927968,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c8cec40,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1312 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.6   0.609      110.7
Field Avg  1.65                     53.6   0.609      110.7
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92abb8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92ad50,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92b9f0)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.1,
 pyr_mod_npts=40,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6b809170,lgs_prof_alt=0x7fba6c91dcc0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b191230,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1312,_nsub4disp=0,
 _nmes=2624,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00142955,
 -0.00110921],_lastvalidtt=[0.00142955,-0.00110921],_upttcommand=[0,0],_refmes=
 0x7fba6c9e1630,_tiprefv=0x7fba6c9dc230,_tiltrefv=0x7fba6b0c3430,_tiprefvn=
 0x7fba6cb0e230,_tiltrefvn=0x7fba6b087c30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6b25d030,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6cb17a30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6b25d030,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c9c1630,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c9279a0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c927fc0,_ctrlden=0x7fba6c9282d8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6af30650,_xlast=0x7fba6af33c90,_ylast=[0x7fba6c999630,
 0x7fba6c999630,0x7fba6c999630],_y0=0x7fba6c968830,_signus=0x7fba6af3a300,
 _puppixoffset=[0,0],_nact=80,_def=0x10f5e6030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ac2d020,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928a48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927a48,xposition=0x7fba6c91dba8,yposition=
 0x7fba6b808db8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c8cec40,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.0   0.619      114.8
Field Avg  1.65                     53.0   0.619      114.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92abb8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92ad50,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92c1e8)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6b809170,lgs_prof_alt=0x7fba6c91dcc0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6cb34230,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00387848,
 0.00128501],_lastvalidtt=[0.00387848,0.00128501],_upttcommand=[0,0],_refmes=
 0x7fba6b0b1630,_tiprefv=0x7fba6b82fe30,_tiltrefv=0x7fba6ca61030,_tiprefvn=
 0x7fba6b820030,_tiltrefvn=0x7fba6c9c4a30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6cb99430,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6ca66a30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6cb99430,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6b1e6c30,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c927ea8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c928fc0,_ctrlden=0x7fba6c928498,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ac2bff0,_xlast=0x7fba6ac2c170,_ylast=[0x7fba6b0ab430,
 0x7fba6b0ab430,0x7fba6b0ab430],_y0=0x7fba6b072e30,_signus=0x7fba6ac346a0,
 _puppixoffset=[0,0],_nact=80,_def=0x10cb54030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6af3b3d0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928a48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927a48,xposition=0x7fba6c9273f0,yposition=
 0x7fba6c9283b8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c8cec40,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.0   0.642       94.3
Field Avg  1.65                     53.0   0.642       94.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92abb8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92ad50,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92bc98)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.3,
 pyr_mod_npts=40,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6b809170,lgs_prof_alt=0x7fba6c91dcc0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b124630,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00258543,
 0.000566855],_lastvalidtt=[0.00258543,0.000566855],_upttcommand=[0,0],_refmes=
 0x7fba6b0c3230,_tiprefv=0x7fba6ca66230,_tiltrefv=0x7fba6ca92630,_tiprefvn=
 0x7fba6caa6e30,_tiltrefvn=0x7fba6ca61030,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6cade630,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6b0fb230,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6cade630,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6ca14230,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c928d58)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c9278f8,_ctrlden=0x7fba6c928dc8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6af30650,_xlast=0x7fba6af35ae0,_ylast=[0x7fba6ca97830,
 0x7fba6ca97830,0x7fba6ca97830],_y0=0x7fba6cbdd630,_signus=0x7fba6af2e6c0,
 _puppixoffset=[0,0],_nact=80,_def=0x10f5e6030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6ac28320,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928a48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927a48,xposition=0x7fba6c9279a0,yposition=
 0x7fba6b809218,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c8cec40,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.2   0.629       98.4
Field Avg  1.65                     53.2   0.629       98.4
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92abb8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92ad50,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92bfc8)
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
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6b809170,lgs_prof_alt=0x7fba6c91dcc0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b21c830,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00498545,
 0.00387709],_lastvalidtt=[0.00498545,0.00387709],_upttcommand=[0,0],_refmes=
 0x7fba6b216230,_tiprefv=0x7fba6b111430,_tiltrefv=0x7fba6b28de30,_tiprefvn=
 0x7fba6b222030,_tiltrefvn=0x7fba6b116630,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6cb73430,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6cacbc30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6cb73430,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6c9e1230,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c9274d0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c927310,_ctrlden=0x7fba6c928dc8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ac30c60,_xlast=0x7fba6ac311e0,_ylast=[0x7fba6b022630,
 0x7fba6b022630,0x7fba6b022630],_y0=0x7fba6b0ab430,_signus=0x7fba6ac356d0,
 _puppixoffset=[0,0],_nact=80,_def=0x10cb54030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6af31ab0,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928a48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927a48,xposition=0x7fba6c927ea8,yposition=
 0x7fba6c927700,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c8cec40,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 1280 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.8   0.598      114.8
Field Avg  1.65                     53.8   0.598      114.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12_pyr-imav.fits
Some other graphics in sh12x12_pyr.ps

Original parameter file: sh12x12_pyr.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 80; //This is the pupil diameter in pixel, original version 80 pixels. but we want to compare with the SHWFS, which consists of 24 pixels.
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
 wfs(n).pyr_mod_npts = 20;// 5*lambda/D*2*pi/(2 lambda/D), number of points in a circle.; square, we will result in 5*sqrt(2)/2=3.5 and we take 3. type: long........... 4 has the best strehl ratio.
 wfs(n).pyr_mod_loc  = "after";// the modulation is placed after the field stop.
 
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";// Type zernike, because the number of the actuators 336 is larger than the number of the measurements 132*2(number of pixels times the two directions x and y).
 dm(n).nzer         = 80;// # of zernike modes.
 dm(n).pitch	       = 7;//
 
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
 atm_struct(dr0at05mic=43.33,screen=0x7fba6c92abb8,layerfrac=0x7fba6c92ac40,
 layerspeed=0x7fba6c92acc8,layeralt=0x7fba6c92ad50,winddir=0x7fba6c92a910,
 _layeralt=0x7fba6c92c2f8)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3.7,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=17.9,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0.5,
 pyr_mod_npts=40,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc="after",pyr_denom=
 "subap",shmethod=0,shnxsub=40,npixpersub=2,pixsize=0,npixels=0,spotpitch=0,
 extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,
 biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="round",fssize=1.5,fsoffset=[0,
 0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fba6b809170,lgs_prof_alt=0x7fba6c91dcc0,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=2,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fba6b1e0830,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=1280,_nsub4disp=0,
 _nmes=2560,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=3.25498e+06,_skynphotons=39.7935,_tt=[0.00714336,
 0.00309378],_lastvalidtt=[0.00714336,0.00309378],_upttcommand=[0,0],_refmes=
 0x7fba6c9e1430,_tiprefv=0x7fba6b1e8430,_tiltrefv=0x7fba6b1e3230,_tiprefvn=
 0x7fba6b111430,_tiltrefvn=0x7fba6b28de30,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fba6cab1030,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fba6c0cce30,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fba6cab1030,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fba6ca14230,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=3.255e+11,_pha2dhc=0x0,_wpha2dhc=0x0,
 _n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=
 0x7fba6c927f18)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12_pyr-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fba6c91dba8,_ctrlden=0x7fba6c928380,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12_pyr-ecmat1.fits",noextrap=0,elt=0,irexp=0,
 irfact=0,filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=
 0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fba6ac35540,_xlast=0x7fba6ac34600,_ylast=[0x7fba6b0ab430,
 0x7fba6b0ab430,0x7fba6b0ab430],_y0=0x7fba6b0a3e30,_signus=0x7fba6ac30440,
 _puppixoffset=[0,0],_nact=80,_def=0x10f5e6030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile="sh12x12_pyr-if1-ext.fits",
 _edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=80,_n2=177,_pupil=0x0,_command=
 0x7fba6af2ca00,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0)]
 mat_struct(method="svd",condition=0x7fba6c928a48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12_pyr-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fba6c927a48,xposition=0x7fba6c928d58,yposition=
 0x7fba6c928ab8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fba6c8cec40,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3.255e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=10,skipevery=0,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
