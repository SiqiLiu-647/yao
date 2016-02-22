=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.1964  0.1964  0.1964   6.28  6.28  6.28   32x32   32x32    176.8
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.2376  0.0774  1.2376   2.48  2.48  2.48    2x 2    2x 2    174.3
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.2376  0.0774  1.2376   2.48  2.48  2.48    2x 2    2x 2    174.3
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.2376  0.0774  1.2376   2.48  2.48  2.48    2x 2    2x 2    174.3
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.2376  0.0774  1.2376   2.48  2.48  2.48    2x 2    2x 2    174.3
 
Summary:
Mirror #1, stackarray, 45 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 112 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 42.4; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       55.4   0.483      221.3
Field Avg  1.65                     55.4   0.483      221.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 120; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 0;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 42.44;                    // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  how is r0 derived here…
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); //Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    //Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         //WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 10.;        //WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shmethod	   = 2;          //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 wfs(n).shnxsub	   = 12;         //# of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).pixsize     = 1.25;  //0.087;      //Focal plane: Subaperture CCD pixel size in arcsec ;arcsec
 wfs(n).npixels     = 36;         //Focal plane: Final # of pixels per subaperture; int
 wfs(n).noise       = 5;          //Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        //Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         //Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          //# of iterations over which to integrate before delivering slopes
 
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	        = "stackarray"; //Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 dm(n).iffile	    = “”;           //Influence function file name. Leave it alone.
 dm(n).nxact	        = 7;          //Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 dm(n).pitch	        = 20;            //Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 
 dm(n).alt           = 0.;           //Conjugation altitude, at zenith
 dm(n).unitpervolt   = 0.01;         //Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: arcsec/Volt.
 dm(n).push4imat     = 100;          //Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      //Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            //iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           //Telescope diameter, in meters, float
 //tel.cobs	       = 0.1125;        //Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)
 
 //-------------------------------
 target.lambda	   = &([1.65]);     //Image wavelengths in micron -H band
 target.xposition   = &([0.]);       //“Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.6;           //Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 5000;          //Total number of iterations
 loop.ittime	       = 2e-3;          //Iteration time (sampling time)
 loop.startskip     = 10;            //Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         //In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         //See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 120,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=42.44,screen=0x7fcaa191a220,layerfrac=0x7fcaa191a198,
 layerspeed=0x7fcaa191a110,layeralt=0x7fcaa191a088,winddir=0x7fcaa1919a28,
 _layeralt=0x7fcaa19195e8)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=
 10,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=0,pixsize=1.23762,npixels=2,
 spotpitch=2,extfield=2.47525,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.47525,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fcaa0834dc0,lgs_prof_alt=
 0x7fcaa085f0d8,nzer=0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fcaa06436e0,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fcaa044af40,_origpixsize=1.25,_rebinfactor=16,_gsalt=0,_gsdepth=
 0,_nsub=112,_nsub4disp=132,_nmes=224,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=
 0x0,_tiltsh=0x1084fc030,_masks=0x0,_fluxpersub=0x7fcaa0449f80,_rayleighflux=
 0x0,_sodiumflux=0x0,_raylfluxpersub=0x7fcaa0440640,_skyfluxpersub=
 0x7fcaa0440890,_nphotons=174.277,_skynphotons=0,_tt=[-0.0166962,0.00464636],
 _lastvalidtt=[-0.0166962,0.00464636],_upttcommand=[0,0],_refmes=0x7fcaa0643080,
 _tiprefv=0x7fcaa1017030,_tiltrefv=0x7fcaa19a8430,_tiprefvn=0x7fcaa1015630,
 _tiltrefvn=0x7fcaa19a8c30,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=32,
 _nx4fft=32,_istart=0x7fcaa044b190,_jstart=0x7fcaa0449d30,_binindices=
 0x7fcaa198b230,_binxy=2,_centroidw=0x7fcaa085f650,_fimage=0x7fcaa08dde30,
 _fimage2=0x0,_imistart=0x7fcaa063f880,_imjstart=0x7fcaa0642100,_imistart2=
 0x7fcaa0642350,_imjstart2=0x7fcaa06425a0,_unittip=0x7fcaa043b8c0,_unittilt=
 0x7fcaa0439c80,_lgs_defocuses=0x7fcaa085f340,_unitdefocus=0x108053030,_fimnx=
 24,_fimny=24,_fimny2=0x0,_yoffset=0x0,_bias=0x7fcaa08b9a30,_flat=
 0x7fcaa08e0630,_domask=1,_submask=0x7fcaa08ab830,_kernel=0x7fcaa19a3430,
 _kernels=0x10843e030,_kerfftr=0x11515b030,_kerffti=0x1150d6030,_kernelconv=0,
 _cyclecounter=1,_dispimage=0x7fcaa0861630,_x=0x7fcaa08de830,_y=0x7fcaa08dee30,
 _centroidgain=1,_rayleigh=0x7fcaa085f880,_bckgrdcalib=0x7fcaa0911e30,
 _bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,
 _wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,
 _LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,
 _dmnotinpath=0x7fcaa083e7d8)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=20,alt=0,hyst=0,push4imat=100,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fcaa085f5e0,_ctrlden=0x7fcaa0838750,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=7,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,
 regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fcaa196b488,_xlast=0x7fcaa196bfe0,_ylast=[0x7fcaa063eee0,
 0x7fcaa063eee0,0x7fcaa063eee0],_y0=0x7fcaa063dcc0,_signus=0x7fcaa0641f50,
 _puppixoffset=[0,0],_nact=45,_def=0x10c495030,_x=0x7fcaa196b8a8,_y=
 0x7fcaa196bab8,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,_indval=0x7fcaa043ba90,
 _indext=0x7fcaa0845ac0,_eiffile="sh12x12-if1-ext.fits",_edef=0x115055030,_ex=
 0x7fcaa085f500,_ey=0x7fcaa083e810,_enact=4,_n1=60,_n2=197,_pupil=0x0,_command=
 0x7fcaa196b698,_flat_command=0x0,_extrapcmat=0x7fcaa2021430,_eltdefsize=0,
 _regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fcaa083e068,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0,tipvib_white_rms=0,tipvib_1overf_rms=0,tipvib_peaks=
 0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=0,
 tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fcaa085f810,xposition=0x7fcaa083e6c0,yposition=
 0x7fcaa085f0a0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fcaa085edc0,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=1000,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.2321  0.0774  0.2321   2.48  0.93  0.93    4x 4    4x 4    174.3
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.2321  0.0774  0.2321   2.48  0.93  0.93    4x 4    4x 4    174.3
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.2321  0.0774  0.2321   2.48  0.93  0.93    4x 4    4x 4    174.3
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.2321  0.0774  0.2321   2.48  0.93  0.93    4x 4    4x 4    174.3
 
Summary:
Mirror #1, stackarray, 4 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 112 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 42.4; 5000 iterations
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.1238  0.1238  0.1238   0.50  0.50  0.50    4x 4    4x 4    165.3
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.1238  0.1238  0.1238   0.50  0.50  0.50    4x 4    4x 4    165.3
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.2475  0.1238  0.2475   0.50  0.50  0.50    2x 2    2x 2    169.5
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.2475  0.1238  0.2475   0.50  0.50  0.50    2x 2    2x 2    169.5
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.2475  0.1238  0.2475   0.50  0.50  0.50    2x 2    2x 2    169.5
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0     1418.0   0.003      628.3
Field Avg  1.65                   1418.0   0.003      628.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 2;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 10.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 2;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 0.30;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*15)*206265 = 1.55 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 4;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type = "zernike";
 dm(n).iffile	    = “”; 
 dm(n).nxact	        = 20; 
 dm(n).pitch	        = 1; 
 dm(n).nzer          = 80;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01; 
 dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      //Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            //iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           //Telescope diameter, in meters, float
 tel.cobs	       = 0.0985;        //Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)
 
 //-------------------------------
 target.lambda	   = &([1.65]);     //Image wavelengths in micron -H band
 target.xposition   = &([0.]);       //“Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.6;           //Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 5000;          //Total number of iterations
 loop.ittime	       = 2e-3;          //Iteration time (sampling time)
 loop.startskip     = 10;            //Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         //In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         //See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 24,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=64,_cent=32.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051888,layerfrac=0x7fedfd051910,
 layerspeed=0x7fedfd051a20,layeralt=0x7fedfc84d878,winddir=0x7fedfc84da10,
 _layeralt=0x7fedfd051c40)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=
 10,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=2,pixsize=0.247525,npixels=2,
 spotpitch=2,extfield=0.495049,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=0.495049,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fedfc866b10,lgs_prof_alt=
 0x7fedfc866718,nzer=0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fedfbf0c3d0,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fedfbe3d970,_origpixsize=0.3,_rebinfactor=2,_gsalt=0,_gsdepth=0,
 _nsub=108,_nsub4disp=132,_nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,
 _tiltsh=0x7fedfc1e9830,_masks=0x0,_fluxpersub=0x7fedfbe3f1a0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fedfbe3f3f0,_skyfluxpersub=0x7fedfbe3f640,
 _nphotons=169.492,_skynphotons=0,_tt=[-0.0308126,0.0645887],_lastvalidtt=
 [-0.0308126,0.0645887],_upttcommand=[0,0],_refmes=0x7fedfbd0aaf0,_tiprefv=
 0x7fedfd881e30,_tiltrefv=0x7fedfd87f430,_tiprefvn=0x7fedfd883230,_tiltrefvn=
 0x7fedfd883a30,_reordervec=0x0,_npixels=2,_npb=0,_sdim=4,_nx=4,_nx4fft=4,
 _istart=0x7fedfbe42720,_jstart=0x7fedfbe45900,_binindices=0x7fedfd050de8,
 _binxy=2,_centroidw=0x7fedfc867168,_fimage=0x7fedfc88a030,_fimage2=0x0,
 _imistart=0x7fedfbc376d0,_imjstart=0x7fedfbc37bb0,_imistart2=0x7fedfbc37e00,
 _imjstart2=0x7fedfbc38050,_unittip=0x7fedfc866f38,_unittilt=0x7fedfc866e20,
 _lgs_defocuses=0x7fedfc846248,_unitdefocus=0x7fedfd0d5e30,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fedfc053830,_flat=0x7fedfc211230,_domask=1,
 _submask=0x7fedfc84ded8,_kernel=0x7fedfc84dba8,_kernels=0x7fedfc20f030,
 _kerfftr=0x7fedfc133430,_kerffti=0x7fedfc14e830,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7fedfc881830,_x=0x7fedfd099630,_y=0x7fedfd0bc230,_centroidgain=1,
 _rayleigh=0x7fedfc867130,_bckgrdcalib=0x7fedfc211c30,_bckgrdinit=0,_bckgrdsub=
 1,_meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],
 _LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=
 0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fedfc866c98)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=1,alt=0,hyst=0,push4imat=100,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc845fe0,_ctrlden=0x7fedfc845b10,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=20,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbc36a60,_xlast=0x7fedfbc361c0,_ylast=[0x7fedfc073c30,0x7fedfc073c30,
 0x7fedfc073c30],_y0=0x7fedfc04e430,_signus=0x7fedfbc385f0,_puppixoffset=[0,0],
 _nact=80,_def=0x101d4f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=12,_n2=53,_pupil=0x0,_command=0x7fedfbc37920,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc866670,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.0985,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc845f38,xposition=0x7fedfc8460f8,yposition=
 0x7fedfc866d40,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc866d08,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=1000,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.1238  0.1238  0.1238   0.50  0.25  0.25    2x 2    2x 2    169.5
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0     1394.6   0.003      628.3
Field Avg  1.65                   1394.6   0.003      628.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 2;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 10.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 2;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 0.0972;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 dm(n).iffile	    = “”; 
 dm(n).nxact	        = 20; 
 dm(n).pitch	        = 1; 
 dm(n).nzer          = 80;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01; 
 dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      //Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            //iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           //Telescope diameter, in meters, float
 tel.cobs	       = 0.0985;        //Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)
 
 //-------------------------------
 target.lambda	   = &([1.65]);     //Image wavelengths in micron -H band
 target.xposition   = &([0.]);       //“Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.6;           //Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 5000;          //Total number of iterations
 loop.ittime	       = 2e-3;          //Iteration time (sampling time)
 loop.startskip     = 10;            //Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         //In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         //See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 24,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=64,_cent=32.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051910,layerfrac=0x7fedfd051a20,
 layerspeed=0x7fedfd051888,layeralt=0x7fedfc84dba8,winddir=0x7fedfc84ded8,
 _layeralt=0x7fedfd051c40)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=
 10,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=2,pixsize=0.123762,npixels=2,
 spotpitch=2,extfield=0.247525,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=0.247525,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fedfc866670,lgs_prof_alt=
 0x7fedfc866d40,nzer=0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fedfbe48150,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fedfbe3f9e0,_origpixsize=0.0972,_rebinfactor=1,_gsalt=0,_gsdepth=
 0,_nsub=108,_nsub4disp=132,_nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=
 0x0,_tiltsh=0x7fedfc15aa30,_masks=0x0,_fluxpersub=0x7fedfbc36ee0,_rayleighflux=
 0x0,_sodiumflux=0x0,_raylfluxpersub=0x7fedfbe47910,_skyfluxpersub=
 0x7fedfbe47b60,_nphotons=169.492,_skynphotons=0,_tt=[-3.05361e-08,
 -3.05361e-08],_lastvalidtt=[-3.05361e-08,-3.05361e-08],_upttcommand=[0,0],
 _refmes=0x7fedfbc384f0,_tiprefv=0x7fedfc04e030,_tiltrefv=0x7fedfc1e6430,
 _tiprefvn=0x7fedfc1ed030,_tiltrefvn=0x7fedfc170430,_reordervec=0x0,_npixels=2,
 _npb=0,_sdim=4,_nx=2,_nx4fft=2,_istart=0x7fedfbe3ff70,_jstart=0x7fedfbe401c0,
 _binindices=0x7fedfc866718,_binxy=2,_centroidw=0x7fedfc866bf0,_fimage=
 0x7fedfd076e30,_fimage2=0x0,_imistart=0x7fedfbc39c50,_imjstart=0x7fedfbc354a0,
 _imistart2=0x7fedfbc36a40,_imjstart2=0x7fedfbc36c90,_unittip=0x7fedfc83c830,
 _unittilt=0x7fedfc8670c0,_lgs_defocuses=0x7fedfc866ec8,_unitdefocus=
 0x7fedfd0dd830,_fimnx=24,_fimny=24,_fimny2=0x0,_yoffset=0x0,_bias=
 0x7fedfd0b3c30,_flat=0x7fedfd0b3230,_domask=1,_submask=0x7fedfc867248,_kernel=
 0x7fedfc867050,_kernels=0x7fedfc053830,_kerfftr=0x7fedfc04d630,_kerffti=
 0x7fedfc04cc30,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fedfd077830,_x=
 0x7fedfd0bcc30,_y=0x7fedfd0a2030,_centroidgain=1,_rayleigh=0x7fedfc866cd0,
 _bckgrdcalib=0x7fedfd0c3e30,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fedfc866c28)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=1,alt=0,hyst=0,push4imat=100,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc845f00,_ctrlden=0x7fedfc866aa0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=20,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbc35320,_xlast=0x7fedfbc38890,_ylast=[0x7fedfc154630,0x7fedfc154630,
 0x7fedfc154630],_y0=0x7fedfc135a30,_signus=0x7fedfbc35760,_puppixoffset=[0,0],
 _nact=80,_def=0x101d4f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=12,_n2=53,_pupil=0x0,_command=0x7fedfbc37130,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc866b10,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.0985,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc845b10,xposition=0x7fedfc846248,yposition=
 0x7fedfc866e20,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc867168,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=1000,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.1238  0.1238  0.1238   0.50  0.25  0.25    2x 2    2x 2    169.5
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0     1406.5   0.003      628.3
Field Avg  1.65                   1406.5   0.003      628.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 2;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 10.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 2;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 0.0972;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 dm(n).iffile	    = “”; 
 dm(n).nxact	        = 20; 
 dm(n).pitch	        = 1; 
 dm(n).nzer          = 80;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01; 
 dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      //Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            //iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           //Telescope diameter, in meters, float
 tel.cobs	       = 0.0985;        //Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)
 
 //-------------------------------
 target.lambda	   = &([1.65]);     //Image wavelengths in micron -H band
 target.xposition   = &([0.]);       //“Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.2;           //Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 5000;          //Total number of iterations
 loop.ittime	       = 2e-3;          //Iteration time (sampling time)
 loop.startskip     = 10;            //Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         //In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         //See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 24,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=64,_cent=32.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051a20,layerfrac=0x7fedfd051888,
 layerspeed=0x7fedfd051910,layeralt=0x7fedfc84da10,winddir=0x7fedfc84d878,
 _layeralt=0x7fedfd051c40)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=
 10,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=2,pixsize=0.123762,npixels=2,
 spotpitch=2,extfield=0.247525,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=0.247525,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fedfc866670,lgs_prof_alt=
 0x7fedfc845f00,nzer=0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fedfbe48720,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fedfbd097f0,_origpixsize=0.0972,_rebinfactor=1,_gsalt=0,_gsdepth=
 0,_nsub=108,_nsub4disp=132,_nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=
 0x0,_tiltsh=0x7fedfd833a30,_masks=0x0,_fluxpersub=0x7fedfbe48970,_rayleighflux=
 0x0,_sodiumflux=0x0,_raylfluxpersub=0x7fedfbe48bc0,_skyfluxpersub=
 0x7fedfbe48e10,_nphotons=169.492,_skynphotons=0,_tt=[-3.05361e-08,
 -3.05361e-08],_lastvalidtt=[-3.05361e-08,-3.05361e-08],_upttcommand=[0,0],
 _refmes=0x7fedfbd062f0,_tiprefv=0x7fedfd839a30,_tiltrefv=0x7fedfd829430,
 _tiprefvn=0x7fedfd83a230,_tiltrefvn=0x7fedfd839030,_reordervec=0x0,_npixels=2,
 _npb=0,_sdim=4,_nx=2,_nx4fft=2,_istart=0x7fedfbd09a40,_jstart=0x7fedfbd09c90,
 _binindices=0x7fedfc83c830,_binxy=2,_centroidw=0x7fedfc866fa8,_fimage=
 0x7fedfd0fa230,_fimage2=0x0,_imistart=0x7fedfbd0a840,_imjstart=0x7fedfbd0aa90,
 _imistart2=0x7fedfbd0ace0,_imjstart2=0x7fedfbd0af30,_unittip=0x7fedfc867130,
 _unittilt=0x7fedfc867018,_lgs_defocuses=0x7fedfc8671d8,_unitdefocus=
 0x7fedfc14e830,_fimnx=24,_fimny=24,_fimny2=0x0,_yoffset=0x0,_bias=
 0x7fedfd099630,_flat=0x7fedfd0b2c30,_domask=1,_submask=0x7fedfc866c98,_kernel=
 0x7fedfc866750,_kernels=0x7fedfd838630,_kerfftr=0x7fedfd837c30,_kerffti=
 0x7fedfd82b830,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fedfd0dbc30,_x=
 0x7fedfd829c30,_y=0x7fedfd82a230,_centroidgain=1,_rayleigh=0x7fedfc866db0,
 _bckgrdcalib=0x7fedfd0dc630,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fedfc866f38)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=1,alt=0,hyst=0,push4imat=100,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc840230,_ctrlden=0x7fedfc866a68,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=20,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbc361c0,_xlast=0x7fedfbc2e630,_ylast=[0x7fedfc036430,0x7fedfc036430,
 0x7fedfc036430],_y0=0x7fedfc073c30,_signus=0x7fedfbc2cd90,_puppixoffset=[0,0],
 _nact=80,_def=0x101d4f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=12,_n2=53,_pupil=0x0,_command=0x7fedfbc352c0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc866bf0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.0985,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc866718,xposition=0x7fedfc867050,yposition=
 0x7fedfc867248,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc8670c0,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.2,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=1000,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.1238  0.1238  0.1238   0.50  0.25  0.25    2x 2    2x 2    169.5
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0     1349.3   0.004      628.3
Field Avg  1.65                   1349.3   0.004      628.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 2;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 10.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 2;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 0.0972;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 dm(n).iffile	    = “”; 
 dm(n).nxact	        = 20; 
 dm(n).pitch	        = 1; 
 dm(n).nzer          = 80;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01; 
 dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      //Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            //iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           //Telescope diameter, in meters, float
 tel.cobs	       = 0.0985;        //Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)
 
 //-------------------------------
 target.lambda	   = &([1.65]);     //Image wavelengths in micron -H band
 target.xposition   = &([0.]);       //“Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.05;           //Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 5000;          //Total number of iterations
 loop.ittime	       = 2e-3;          //Iteration time (sampling time)
 loop.startskip     = 10;            //Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         //In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         //See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 24,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=64,_cent=32.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051888,layerfrac=0x7fedfd051910,
 layerspeed=0x7fedfd051a20,layeralt=0x7fedfc84ded8,winddir=0x7fedfc84dba8,
 _layeralt=0x7fedfd051c40)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=
 10,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=2,pixsize=0.123762,npixels=2,
 spotpitch=2,extfield=0.247525,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=0.247525,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fedfc866670,lgs_prof_alt=
 0x7fedfc840230,nzer=0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fedfbe49a80,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fedfbc36410,_origpixsize=0.0972,_rebinfactor=1,_gsalt=0,_gsdepth=
 0,_nsub=108,_nsub4disp=132,_nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=
 0x0,_tiltsh=0x7fedfd0d8430,_masks=0x0,_fluxpersub=0x7fedfbc2e590,_rayleighflux=
 0x0,_sodiumflux=0x0,_raylfluxpersub=0x7fedfbc36c90,_skyfluxpersub=
 0x7fedfbc372c0,_nphotons=169.492,_skynphotons=0,_tt=[-3.05361e-08,
 -3.05361e-08],_lastvalidtt=[-3.05361e-08,-3.05361e-08],_upttcommand=[0,0],
 _refmes=0x7fedfbe47cb0,_tiprefv=0x7fedfd0c7230,_tiltrefv=0x7fedfd0dc830,
 _tiprefvn=0x7fedfd0fa230,_tiltrefvn=0x7fedfd0d7c30,_reordervec=0x0,_npixels=2,
 _npb=0,_sdim=4,_nx=2,_nx4fft=2,_istart=0x7fedfbc2cd90,_jstart=0x7fedfbc36a40,
 _binindices=0x7fedfc867130,_binxy=2,_centroidw=0x7fedfc846168,_fimage=
 0x7fedfc04cc30,_fimage2=0x0,_imistart=0x7fedfbe48970,_imjstart=0x7fedfbe495e0,
 _imistart2=0x7fedfbe49830,_imjstart2=0x7fedfbe4a3f0,_unittip=0x7fedfc866cd0,
 _unittilt=0x7fedfc845fe0,_lgs_defocuses=0x7fedfc867210,_unitdefocus=
 0x7fedfc179c30,_fimnx=24,_fimny=24,_fimny2=0x0,_yoffset=0x0,_bias=
 0x7fedfc04dc30,_flat=0x7fedfd0c5c30,_domask=1,_submask=0x7fedfc866c28,_kernel=
 0x7fedfc845b10,_kernels=0x7fedfd0c3e30,_kerfftr=0x7fedfd0fec30,_kerffti=
 0x7fedfd0c4830,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fedfc1e5630,_x=
 0x7fedfc04b430,_y=0x7fedfc057030,_centroidgain=1,_rayleigh=0x7fedfc845b48,
 _bckgrdcalib=0x7fedfd0c5230,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fedfc866d40)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=1,alt=0,hyst=0,push4imat=100,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc8671d8,_ctrlden=0x7fedfc866f70,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=20,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbe40300,_xlast=0x7fedfbe3f720,_ylast=[0x7fedfd0b4e30,0x7fedfd0b4e30,
 0x7fedfd0b4e30],_y0=0x7fedfd0b5e30,_signus=0x7fedfbe48050,_puppixoffset=[0,0],
 _nact=80,_def=0x101d4f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=12,_n2=53,_pupil=0x0,_command=0x7fedfbf144b0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc866fa8,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.0985,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc83c830,xposition=0x7fedfc866750,yposition=
 0x7fedfc866c98,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc867018,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.05,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=1000,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.1238  0.1238  0.1238   0.50  0.25  0.25    2x 2    2x 2    169.5
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0     1417.1   0.003      628.3
Field Avg  1.65                   1417.1   0.003      628.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 2;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 10.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 2;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 0.0972;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 dm(n).iffile	    = “”; 
 dm(n).nxact	        = 20; 
 dm(n).pitch	        = 1; 
 dm(n).nzer          = 80;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01; 
 dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      //Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            //iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           //Telescope diameter, in meters, float
 tel.cobs	       = 0.0985;        //Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)
 
 //-------------------------------
 target.lambda	   = &([1.65]);     //Image wavelengths in micron -H band
 target.xposition   = &([0.]);       //“Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 1.0;           //Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 5000;          //Total number of iterations
 loop.ittime	       = 2e-3;          //Iteration time (sampling time)
 loop.startskip     = 10;            //Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         //In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         //See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 24,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=64,_cent=32.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051910,layerfrac=0x7fedfd051a20,
 layerspeed=0x7fedfd051888,layeralt=0x7fedfc84d878,winddir=0x7fedfc84da10,
 _layeralt=0x7fedfd051c40)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=
 10,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=2,pixsize=0.123762,npixels=2,
 spotpitch=2,extfield=0.247525,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=0.247525,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fedfc866670,lgs_prof_alt=
 0x7fedfc8671d8,nzer=0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fedfbc37360,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fedfbc38080,_origpixsize=0.0972,_rebinfactor=1,_gsalt=0,_gsdepth=
 0,_nsub=108,_nsub4disp=132,_nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=
 0x0,_tiltsh=0x7fedfd0fec30,_masks=0x0,_fluxpersub=0x7fedfbc35760,_rayleighflux=
 0x0,_sodiumflux=0x0,_raylfluxpersub=0x7fedfbc38670,_skyfluxpersub=
 0x7fedfbc388c0,_nphotons=169.492,_skynphotons=0,_tt=[-3.05361e-08,
 -3.05361e-08],_lastvalidtt=[-3.05361e-08,-3.05361e-08],_upttcommand=[0,0],
 _refmes=0x7fedfbd0a1b0,_tiprefv=0x7fedfd835830,_tiltrefv=0x7fedfd82ee30,
 _tiprefvn=0x7fedfd836030,_tiltrefvn=0x7fedfd84fe30,_reordervec=0x0,_npixels=2,
 _npb=0,_sdim=4,_nx=2,_nx4fft=2,_istart=0x7fedfbc352c0,_jstart=0x7fedfbc35510,
 _binindices=0x7fedfc866cd0,_binxy=2,_centroidw=0x7fedfc8667c0,_fimage=
 0x7fedfd0c3e30,_fimage2=0x0,_imistart=0x7fedfbe40180,_imjstart=0x7fedfbe47b60,
 _imistart2=0x7fedfbe47db0,_imjstart2=0x7fedfbe48000,_unittip=0x7fedfc866db0,
 _unittilt=0x7fedfc866aa0,_lgs_defocuses=0x7fedfc83c7c0,_unitdefocus=
 0x7fedfc164c30,_fimnx=24,_fimny=24,_fimny2=0x0,_yoffset=0x0,_bias=
 0x7fedfc04dc30,_flat=0x7fedfc04d230,_domask=1,_submask=0x7fedfc866f38,_kernel=
 0x7fedfc866718,_kernels=0x7fedfd0c4830,_kerfftr=0x7fedfd0b2c30,_kerffti=
 0x7fedfd0c5230,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fedfd0e0a30,_x=
 0x7fedfc049830,_y=0x7fedfc04fa30,_centroidgain=1,_rayleigh=0x7fedfc866f00,
 _bckgrdcalib=0x7fedfc1d6830,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fedfc866ad8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=1,alt=0,hyst=0,push4imat=100,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc866830,_ctrlden=0x7fedfc866b48,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=20,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbe45be0,_xlast=0x7fedfbe3f720,_ylast=[0x7fedfd103430,0x7fedfd103430,
 0x7fedfd103430],_y0=0x7fedfd0e1630,_signus=0x7fedfbe3fa20,_puppixoffset=[0,0],
 _nact=80,_def=0x101d4f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=12,_n2=53,_pupil=0x0,_command=0x7fedfbe3f8a0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc846168,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.0985,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc867130,xposition=0x7fedfc845b10,yposition=
 0x7fedfc866c28,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc845fe0,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=1,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=1000,ittime=
 0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,jumps2swapscreen=
 0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.1238  0.1238  0.1238   0.50  0.25  0.25    2x 2    2x 2    169.5
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0     1418.0   0.003      628.3
Field Avg  1.65                   1418.0   0.003      628.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 2;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 10.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 2;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 0.0972;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 dm(n).iffile	    = “”; 
 dm(n).nxact	        = 20; 
 dm(n).pitch	        = 1; 
 dm(n).nzer          = 80;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01; 
 dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      //Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            //iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           //Telescope diameter, in meters, float
 tel.cobs	       = 0.0985;        //Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)
 
 //-------------------------------
 target.lambda	   = &([1.65]);     //Image wavelengths in micron -H band
 target.xposition   = &([0.]);       //“Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 2.0;           //Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 5000;          //Total number of iterations
 loop.ittime	       = 2e-3;          //Iteration time (sampling time)
 loop.startskip     = 10;            //Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         //In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         //See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 24,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=64,_cent=32.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051a20,layerfrac=0x7fedfd051888,
 layerspeed=0x7fedfd051910,layeralt=0x7fedfc84dba8,winddir=0x7fedfc84ded8,
 _layeralt=0x7fedfd051c40)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=
 10,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=2,pixsize=0.123762,npixels=2,
 spotpitch=2,extfield=0.247525,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=0.247525,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fedfc866670,lgs_prof_alt=
 0x7fedfc866830,nzer=0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fedfbc39530,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fedfbe47910,_origpixsize=0.0972,_rebinfactor=1,_gsalt=0,_gsdepth=
 0,_nsub=108,_nsub4disp=132,_nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=
 0x0,_tiltsh=0x7fedfc16ba30,_masks=0x0,_fluxpersub=0x7fedfbe3f970,_rayleighflux=
 0x0,_sodiumflux=0x0,_raylfluxpersub=0x7fedfbe480a0,_skyfluxpersub=
 0x7fedfbe3f720,_nphotons=169.492,_skynphotons=0,_tt=[-3.05361e-08,
 -3.05361e-08],_lastvalidtt=[-3.05361e-08,-3.05361e-08],_upttcommand=[0,0],
 _refmes=0x7fedfbe3ff60,_tiprefv=0x7fedfd0c5230,_tiltrefv=0x7fedfd0fa030,
 _tiprefvn=0x7fedfd077830,_tiltrefvn=0x7fedfd129230,_reordervec=0x0,_npixels=2,
 _npb=0,_sdim=4,_nx=2,_nx4fft=2,_istart=0x7fedfbe47e50,_jstart=0x7fedfbe48380,
 _binindices=0x7fedfc866db0,_binxy=2,_centroidw=0x7fedfc866d08,_fimage=
 0x7fedfc133030,_fimage2=0x0,_imistart=0x7fedfbc398b0,_imjstart=0x7fedfbc36e30,
 _imistart2=0x7fedfbc37080,_imjstart2=0x7fedfbc372d0,_unittip=0x7fedfc845b48,
 _unittilt=0x7fedfc845f00,_lgs_defocuses=0x7fedfc8672f0,_unitdefocus=
 0x7fedfd11c830,_fimnx=24,_fimny=24,_fimny2=0x0,_yoffset=0x0,_bias=
 0x7fedfd099630,_flat=0x7fedfc156c30,_domask=1,_submask=0x7fedfc866d40,_kernel=
 0x7fedfc83c830,_kernels=0x7fedfc133a30,_kerfftr=0x7fedfc1e5630,_kerffti=
 0x7fedfc134430,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fedfc15f230,_x=
 0x7fedfd0bcc30,_y=0x7fedfd129a30,_centroidgain=1,_rayleigh=0x7fedfc866de8,
 _bckgrdcalib=0x7fedfc134e30,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fedfc840230)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=1,alt=0,hyst=0,push4imat=100,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc8671d8,_ctrlden=0x7fedfc845a68,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=20,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbc361c0,_xlast=0x7fedfbc36cb0,_ylast=[0x7fedfc1e6030,0x7fedfc1e6030,
 0x7fedfc1e6030],_y0=0x7fedfc16fc30,_signus=0x7fedfbc38d10,_puppixoffset=[0,0],
 _nact=80,_def=0x101d4f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=12,_n2=53,_pupil=0x0,_command=0x7fedfbc36a40,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc8667c0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.0985,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc866cd0,xposition=0x7fedfc866718,yposition=
 0x7fedfc866f38,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc866aa0,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=2,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,ittime=
 0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,jumps2swapscreen=
 0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.1238  0.1238  0.1238   0.50  0.25  0.25    2x 2    2x 2    169.5
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.1238  0.1238  0.1238   0.50  0.25  0.25    2x 2    2x 2    16949.2
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0     1418.0   0.003      628.3
Field Avg  1.65                   1418.0   0.003      628.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 2;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 5.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 2;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 0.0972;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 dm(n).iffile	    = “”; 
 dm(n).nxact	        = 20; 
 dm(n).pitch	        = 1; 
 dm(n).nzer          = 80;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01; 
 dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      // Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            // iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           // Telescope diameter, in meters, float
 tel.cobs	       = 0.0985;        // Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)
 
 //-------------------------------
 target.lambda	   = &([1.65]);     // Image wavelengths in micron -H band
 target.xposition   = &([0.]);       // “Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.9;           // Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 5000;          // Total number of iterations
 loop.ittime	       = 2e-3;          // Iteration time (sampling time)
 loop.startskip     = 10;            // Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         // In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         // See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 24,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=64,_cent=32.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051888,layerfrac=0x7fedfd051910,
 layerspeed=0x7fedfd051a20,layeralt=0x7fedfc84da10,winddir=0x7fedfc84d878,
 _layeralt=0x7fedfc84d768)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=2,pixsize=0.123762,npixels=2,
 spotpitch=2,extfield=0.247525,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=0.247525,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fedfc866670,lgs_prof_alt=
 0x7fedfc8671d8,nzer=0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fedfbc37430,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fedfbc352c0,_origpixsize=0.0972,_rebinfactor=1,_gsalt=0,_gsdepth=
 0,_nsub=108,_nsub4disp=132,_nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=
 0x0,_tiltsh=0x7fedfd17e030,_masks=0x0,_fluxpersub=0x7fedfbc35840,_rayleighflux=
 0x0,_sodiumflux=0x0,_raylfluxpersub=0x7fedfbc33210,_skyfluxpersub=
 0x7fedfbc41680,_nphotons=16949.2,_skynphotons=0,_tt=[-7.47223e-09,
 -2.93147e-08],_lastvalidtt=[-7.47223e-09,-2.93147e-08],_upttcommand=[0,0],
 _refmes=0x7fedfbf14c40,_tiprefv=0x7fedfc887e30,_tiltrefv=0x7fedfc843030,
 _tiprefvn=0x7fedfc889c30,_tiltrefvn=0x7fedfc88ae30,_reordervec=0x0,_npixels=2,
 _npb=0,_sdim=4,_nx=2,_nx4fft=2,_istart=0x7fedfbc2e590,_jstart=0x7fedfbc36410,
 _binindices=0x7fedfc8667f8,_binxy=2,_centroidw=0x7fedfc866a68,_fimage=
 0x7fedfc11cc30,_fimage2=0x0,_imistart=0x7fedfbe49550,_imjstart=0x7fedfbe3fd60,
 _imistart2=0x7fedfbe3ffb0,_imjstart2=0x7fedfbe48550,_unittip=0x7fedfc8672b8,
 _unittilt=0x7fedfc8666a8,_lgs_defocuses=0x7fedfc866c60,_unitdefocus=
 0x7fedfc179c30,_fimnx=24,_fimny=24,_fimny2=0x0,_yoffset=0x0,_bias=
 0x7fedfc051a30,_flat=0x7fedfd0c5230,_domask=1,_submask=0x7fedfc866ad8,_kernel=
 0x7fedfc866b80,_kernels=0x7fedfd0da630,_kerfftr=0x7fedfd0ea630,_kerffti=
 0x7fedfd0c3e30,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fedfc04de30,_x=
 0x7fedfc049830,_y=0x7fedfc170830,_centroidgain=1,_rayleigh=0x7fedfc845fe0,
 _bckgrdcalib=0x7fedfd0c4830,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fedfc845f38)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=1,alt=0,hyst=0,push4imat=100,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc866f70,_ctrlden=0x7fedfc866d78,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=20,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbe45be0,_xlast=0x7fedfbe40260,_ylast=[0x7fedfd0eb030,0x7fedfd0eb030,
 0x7fedfd0eb030],_y0=0x7fedfd0e1630,_signus=0x7fedfbe3f920,_puppixoffset=[0,0],
 _nact=80,_def=0x101d4f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=12,_n2=53,_pupil=0x0,_command=0x7fedfbe48220,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc866f00,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.0985,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc845f00,xposition=0x7fedfc8670f8,yposition=
 0x7fedfc866db0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc8672f0,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.9,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0     1418.0   0.003      628.3
Field Avg  1.65                   1418.0   0.003      628.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 2;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 5.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 2;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 0.0972;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 dm(n).iffile	    = “”; 
 dm(n).nxact	        = 20; 
 dm(n).pitch	        = 1; 
 dm(n).nzer          = 80;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01; 
 dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      // Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            // iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           // Telescope diameter, in meters, float
 tel.cobs	       = 0.0985;        // Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)
 
 //-------------------------------
 target.lambda	   = &([1.65]);     // Image wavelengths in micron -H band
 target.xposition   = &([0.]);       // “Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.9;           // Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 5000;          // Total number of iterations
 loop.ittime	       = 2e-3;          // Iteration time (sampling time)
 loop.startskip     = 10;            // Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         // In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         // See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 24,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=64,_cent=32.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051888,layerfrac=0x7fedfd051910,
 layerspeed=0x7fedfd051a20,layeralt=0x7fedfc84da10,winddir=0x7fedfc84d878,
 _layeralt=0x7fedfc84d768)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=2,pixsize=0.123762,npixels=2,
 spotpitch=2,extfield=0.247525,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=0.247525,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fedfc866670,lgs_prof_alt=
 0x7fedfc8671d8,nzer=0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fedfbe3fcc0,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fedfbc37ec0,_origpixsize=0.0972,_rebinfactor=1,_gsalt=0,_gsdepth=
 0,_nsub=108,_nsub4disp=132,_nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=
 0x0,_tiltsh=0x7fedfd82ec30,_masks=0x0,_fluxpersub=0x7fedfbd08b70,_rayleighflux=
 0x0,_sodiumflux=0x0,_raylfluxpersub=0x7fedfbd062f0,_skyfluxpersub=
 0x7fedfbd06540,_nphotons=16949.2,_skynphotons=0,_tt=[-7.47223e-09,
 -2.93147e-08],_lastvalidtt=[-7.47223e-09,-2.93147e-08],_upttcommand=[0,0],
 _refmes=0x7fedfbf14c40,_tiprefv=0x7fedfc887e30,_tiltrefv=0x7fedfc843030,
 _tiprefvn=0x7fedfc889c30,_tiltrefvn=0x7fedfc88ae30,_reordervec=0x0,_npixels=2,
 _npb=0,_sdim=4,_nx=2,_nx4fft=2,_istart=0x7fedfbc352c0,_jstart=0x7fedfbc2e590,
 _binindices=0x7fedfc8666a8,_binxy=2,_centroidw=0x7fedfc8671a0,_fimage=
 0x7fedfd0bc230,_fimage2=0x0,_imistart=0x7fedfbc38360,_imjstart=0x7fedfbc385b0,
 _imistart2=0x7fedfbc38800,_imjstart2=0x7fedfbc38a50,_unittip=0x7fedfc846168,
 _unittilt=0x7fedfc866c60,_lgs_defocuses=0x7fedfc846130,_unitdefocus=
 0x7fedfc8eca30,_fimnx=24,_fimny=24,_fimny2=0x0,_yoffset=0x0,_bias=
 0x7fedfc04cc30,_flat=0x7fedfd838830,_domask=1,_submask=0x7fedfc866b80,_kernel=
 0x7fedfc866b48,_kernels=0x7fedfd833830,_kerfftr=0x7fedfd832e30,_kerffti=
 0x7fedfd834230,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fedfd0ea630,_x=
 0x7fedfc052430,_y=0x7fedfc052a30,_centroidgain=1,_rayleigh=0x7fedfc8667f8,
 _bckgrdcalib=0x7fedfd835230,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fedfc845f38)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=1,alt=0,hyst=0,push4imat=100,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc866b10,_ctrlden=0x7fedfc8670c0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=20,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbc361c0,_xlast=0x7fedfbc36f30,_ylast=[0x7fedfc0ff430,0x7fedfc0ff430,
 0x7fedfc0ff430],_y0=0x7fedfc1e4a30,_signus=0x7fedfbc418d0,_puppixoffset=[0,0],
 _nact=80,_def=0x101d4f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=12,_n2=53,_pupil=0x0,_command=0x7fedfbc370b0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc866f00,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.0985,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc845f00,xposition=0x7fedfc8670f8,yposition=
 0x7fedfc866db0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc8672f0,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.9,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.1238  0.1238  0.1238   0.50  0.25  0.25    2x 2    2x 2    16949.2
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.1238  0.1238  0.1238   0.50  0.25  0.25    2x 2    2x 2    16949.2
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0     1418.0   0.003      628.3
Field Avg  1.65                   1418.0   0.003      628.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 43.33
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 2;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 5.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 2;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 0.0972;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 dm(n).iffile	    = “”; 
 dm(n).nxact	        = 20; 
 dm(n).pitch	        = 1; 
 dm(n).nzer          = 80;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01; 
 dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      // Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            // iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           // Telescope diameter, in meters, float
 tel.cobs	       = 0.0985;        // Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)
 
 //-------------------------------
 target.lambda	   = &([1.65]);     // Image wavelengths in micron -H band
 target.xposition   = &([0.]);       // “Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.9;           // Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 5000;          // Total number of iterations
 loop.ittime	       = 2e-3;          // Iteration time (sampling time)
 loop.startskip     = 10;            // Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         // In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         // See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 24,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=64,_cent=32.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051a20,layerfrac=0x7fedfd051888,
 layerspeed=0x7fedfd051910,layeralt=0x7fedfc84d878,winddir=0x7fedfc84da10,
 _layeralt=0x7fedfc84d768)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=2,pixsize=0.123762,npixels=2,
 spotpitch=2,extfield=0.247525,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=0.247525,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fedfc866670,lgs_prof_alt=
 0x7fedfc866c60,nzer=0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fedfbc3b620,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fedfbe48850,_origpixsize=0.0972,_rebinfactor=1,_gsalt=0,_gsdepth=
 0,_nsub=108,_nsub4disp=132,_nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=
 0x0,_tiltsh=0x7fedfc1f9030,_masks=0x0,_fluxpersub=0x7fedfbe45900,_rayleighflux=
 0x0,_sodiumflux=0x0,_raylfluxpersub=0x7fedfbe480e0,_skyfluxpersub=
 0x7fedfbe47910,_nphotons=16949.2,_skynphotons=0,_tt=[-7.47223e-09,
 -2.93147e-08],_lastvalidtt=[-7.47223e-09,-2.93147e-08],_upttcommand=[0,0],
 _refmes=0x7fedfbf0deb0,_tiprefv=0x7fedfc887e30,_tiltrefv=0x7fedfc898030,
 _tiprefvn=0x7fedfc843030,_tiltrefvn=0x7fedfc88a830,_reordervec=0x0,_npixels=2,
 _npb=0,_sdim=4,_nx=2,_nx4fft=2,_istart=0x7fedfbe3d970,_jstart=0x7fedfbe42720,
 _binindices=0x7fedfc845a68,_binxy=2,_centroidw=0x7fedfc866aa0,_fimage=
 0x7fedfc11ec30,_fimage2=0x0,_imistart=0x7fedfbc36ee0,_imjstart=0x7fedfbc37130,
 _imistart2=0x7fedfbc37380,_imjstart2=0x7fedfbc375d0,_unittip=0x7fedfc8667f8,
 _unittilt=0x7fedfc866e90,_lgs_defocuses=0x7fedfc866fa8,_unitdefocus=
 0x7fedfd0d9630,_fimnx=24,_fimny=24,_fimny2=0x0,_yoffset=0x0,_bias=
 0x7fedfd077a30,_flat=0x7fedfd829430,_domask=1,_submask=0x7fedfc846248,_kernel=
 0x7fedfc845f00,_kernels=0x7fedfc1e1a30,_kerfftr=0x7fedfc12ee30,_kerffti=
 0x7fedfc1e2430,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fedfc11fa30,_x=
 0x7fedfd09b230,_y=0x7fedfd076e30,_centroidgain=1,_rayleigh=0x7fedfc8670f8,
 _bckgrdcalib=0x7fedfd828a30,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fedfc867210)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=1,alt=0,hyst=0,push4imat=100,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc8667c0,_ctrlden=0x7fedfc867050,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=20,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbc39e70,_xlast=0x7fedfbc39ff0,_ylast=[0x7fedfc16fc30,0x7fedfc16fc30,
 0x7fedfc16fc30],_y0=0x7fedfc1e6030,_signus=0x7fedfbc3a170,_puppixoffset=[0,0],
 _nact=80,_def=0x101d4f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=12,_n2=53,_pupil=0x0,_command=0x7fedfbc3a950,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc866e20,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.0985,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc845fa8,xposition=0x7fedfc846210,yposition=
 0x7fedfc866de8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc846168,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.9,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.2475  0.1238  0.2475   0.50  0.50  0.50    2x 2    2x 2    16949.2
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0     1418.0   0.002      628.3
Field Avg  1.65                   1418.0   0.002      628.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 43.33
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 2;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 5.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 2;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 0.19;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 dm(n).iffile	    = “”; 
 dm(n).nxact	        = 20; 
 dm(n).pitch	        = 1; 
 dm(n).nzer          = 80;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01; 
 dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      // Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            // iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           // Telescope diameter, in meters, float
 tel.cobs	       = 0.0985;        // Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)
 
 //-------------------------------
 target.lambda	   = &([1.65]);     // Image wavelengths in micron -H band
 target.xposition   = &([0.]);       // “Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.9;           // Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 5000;          // Total number of iterations
 loop.ittime	       = 2e-3;          // Iteration time (sampling time)
 loop.startskip     = 10;            // Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         // In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         // See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 24,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=64,_cent=32.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051888,layerfrac=0x7fedfd051910,
 layerspeed=0x7fedfd051a20,layeralt=0x7fedfc84dba8,winddir=0x7fedfc84ded8,
 _layeralt=0x7fedfc84da10)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=2,pixsize=0.247525,npixels=2,
 spotpitch=2,extfield=0.495049,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=0.495049,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fedfc866670,lgs_prof_alt=
 0x7fedfc8667c0,nzer=0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fedfbc37fd0,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fedfbc36a60,_origpixsize=0.19,_rebinfactor=2,_gsalt=0,_gsdepth=0,
 _nsub=108,_nsub4disp=132,_nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,
 _tiltsh=0x7fedfd137830,_masks=0x0,_fluxpersub=0x7fedfbc3a0f0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fedfbc3a340,_skyfluxpersub=0x7fedfbc38300,
 _nphotons=16949.2,_skynphotons=0,_tt=[0.0272035,0.0341552],_lastvalidtt=
 [0.0272035,0.0341552],_upttcommand=[0,0],_refmes=0x7fedfbc35780,_tiprefv=
 0x7fedfc170830,_tiltrefv=0x7fedfc15f430,_tiprefvn=0x7fedfc04cc30,_tiltrefvn=
 0x7fedfc1e5630,_reordervec=0x0,_npixels=2,_npb=0,_sdim=4,_nx=4,_nx4fft=4,
 _istart=0x7fedfbc39c50,_jstart=0x7fedfbc39ea0,_binindices=0x7fedfc84e428,
 _binxy=2,_centroidw=0x7fedfc845fe0,_fimage=0x7fedfc053430,_fimage2=0x0,
 _imistart=0x7fedfbe48820,_imjstart=0x7fedfbe48a70,_imistart2=0x7fedfbe48cc0,
 _imjstart2=0x7fedfbe48f10,_unittip=0x7fedfc866718,_unittilt=0x7fedfc8665c8,
 _lgs_defocuses=0x7fedfc8671d8,_unitdefocus=0x7fedfc118a30,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fedfd0c6030,_flat=0x7fedfd0c6a30,_domask=1,
 _submask=0x7fedfc84dd40,_kernel=0x7fedfc84e868,_kernels=0x7fedfd0d5630,
 _kerfftr=0x7fedfd0c3e30,_kerffti=0x7fedfd11f430,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7fedfc120a30,_x=0x7fedfc04b430,_y=0x7fedfc049830,_centroidgain=1,
 _rayleigh=0x7fedfc867398,_bckgrdcalib=0x7fedfd121630,_bckgrdinit=0,_bckgrdsub=
 1,_meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],
 _LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=
 0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fedfc8401c0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=1,alt=0,hyst=0,push4imat=100,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc866fa8,_ctrlden=0x7fedfc8670f8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=20,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbe4b520,_xlast=0x7fedfbe47b60,_ylast=[0x7fedfd04d830,0x7fedfd04d830,
 0x7fedfd04d830],_y0=0x7fedfd0bce30,_signus=0x7fedfbe48190,_puppixoffset=[0,0],
 _nact=80,_def=0x101d4f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=12,_n2=53,_pupil=0x0,_command=0x7fedfbe485d0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc866aa0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.0985,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc845a68,xposition=0x7fedfc845f00,yposition=
 0x7fedfc846248,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc866e90,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.9,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.1238  0.1238  0.1238   0.50  0.25  0.25    2x 2    2x 2    16949.2
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0     1418.0   0.003      628.3
Field Avg  1.65                   1418.0   0.003      628.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 43.33
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 2;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 5.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 2;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 0.1;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 dm(n).iffile	    = “”; 
 dm(n).nxact	        = 20; 
 dm(n).pitch	        = 1; 
 dm(n).nzer          = 80;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01; 
 dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      // Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            // iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           // Telescope diameter, in meters, float
 tel.cobs	       = 0.0985;        // Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)
 
 //-------------------------------
 target.lambda	   = &([1.65]);     // Image wavelengths in micron -H band
 target.xposition   = &([0.]);       // “Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.6;           // Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 5000;          // Total number of iterations
 loop.ittime	       = 2e-3;          // Iteration time (sampling time)
 loop.startskip     = 10;            // Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         // In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         // See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 24,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=64,_cent=32.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051910,layerfrac=0x7fedfd051a20,
 layerspeed=0x7fedfd051888,layeralt=0x7fedfc84e868,winddir=0x7fedfc84dd40,
 _layeralt=0x7fedfc84da10)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=2,pixsize=0.123762,npixels=2,
 spotpitch=2,extfield=0.247525,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=0.247525,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fedfc866aa0,lgs_prof_alt=
 0x7fedfc846248,nzer=0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fedfbf0d6f0,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fedfbc36410,_origpixsize=0.1,_rebinfactor=1,_gsalt=0,_gsdepth=0,
 _nsub=108,_nsub4disp=132,_nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,
 _tiltsh=0x7fedfd0f4030,_masks=0x0,_fluxpersub=0x7fedfbc38850,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fedfbc38d60,_skyfluxpersub=0x7fedfbc37830,
 _nphotons=16949.2,_skynphotons=0,_tt=[-7.47223e-09,-2.93147e-08],_lastvalidtt=
 [-7.47223e-09,-2.93147e-08],_upttcommand=[0,0],_refmes=0x7fedfbd06d80,_tiprefv=
 0x7fedfd833c30,_tiltrefv=0x7fedfd83d430,_tiprefvn=0x7fedfd82cc30,_tiltrefvn=
 0x7fedfd82de30,_reordervec=0x0,_npixels=2,_npb=0,_sdim=4,_nx=2,_nx4fft=2,
 _istart=0x7fedfbc380d0,_jstart=0x7fedfbc35780,_binindices=0x7fedfc8667c0,
 _binxy=2,_centroidw=0x7fedfc8671a0,_fimage=0x7fedfd107630,_fimage2=0x0,
 _imistart=0x7fedfbe4ba10,_imjstart=0x7fedfbe4bc60,_imistart2=0x7fedfbe4beb0,
 _imjstart2=0x7fedfbe4c100,_unittip=0x7fedfc867328,_unittilt=0x7fedfc866f00,
 _lgs_defocuses=0x7fedfc83c7c0,_unitdefocus=0x7fedfc118a30,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fedfc1d6e30,_flat=0x7fedfd0c4830,_domask=1,
 _submask=0x7fedfc866c98,_kernel=0x7fedfc845fa8,_kernels=0x7fedfd0f8230,
 _kerfftr=0x7fedfd076e30,_kerffti=0x7fedfd0c3e30,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7fedfd0bc230,_x=0x7fedfc04b430,_y=0x7fedfc124c30,_centroidgain=1,
 _rayleigh=0x7fedfc866bf0,_bckgrdcalib=0x7fedfd0c5230,_bckgrdinit=0,_bckgrdsub=
 1,_meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],
 _LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=
 0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fedfc866c60)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=1,alt=0,hyst=0,push4imat=100,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc846130,_ctrlden=0x7fedfc867280,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=20,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbe482d0,_xlast=0x7fedfbe45330,_ylast=[0x7fedfd0b4230,0x7fedfd0b4230,
 0x7fedfd0b4230],_y0=0x7fedfd04d830,_signus=0x7fedfbe45900,_puppixoffset=[0,0],
 _nact=80,_def=0x101d4f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=12,_n2=53,_pupil=0x0,_command=0x7fedfbe4cba0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc866670,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.0985,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc8670f8,xposition=0x7fedfc8671d8,yposition=
 0x7fedfc8665c8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc845fe0,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.2475  0.1238  0.2475   0.50  0.50  0.50    2x 2    2x 2    16949.2
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0     1418.0   0.002      628.3
Field Avg  1.65                   1418.0   0.002      628.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 43.33
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 2;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 5.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 2;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 0.194;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 dm(n).iffile	    = “”; 
 dm(n).nxact	        = 20; 
 dm(n).pitch	        = 1; 
 dm(n).nzer          = 80;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01; 
 dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      // Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            // iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           // Telescope diameter, in meters, float
 tel.cobs	       = 0.0985;        // Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)
 
 //-------------------------------
 target.lambda	   = &([1.65]);     // Image wavelengths in micron -H band
 target.xposition   = &([0.]);       // “Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.6;           // Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 5000;          // Total number of iterations
 loop.ittime	       = 2e-3;          // Iteration time (sampling time)
 loop.startskip     = 10;            // Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         // In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         // See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 24,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=64,_cent=32.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051a20,layerfrac=0x7fedfd051888,
 layerspeed=0x7fedfd051910,layeralt=0x7fedfc84ded8,winddir=0x7fedfc84dba8,
 _layeralt=0x7fedfc84da10)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=2,pixsize=0.247525,npixels=2,
 spotpitch=2,extfield=0.495049,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=0.495049,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fedfc866aa0,lgs_prof_alt=
 0x7fedfc846130,nzer=0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fedfbc2e590,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fedfbe4c040,_origpixsize=0.194,_rebinfactor=2,_gsalt=0,_gsdepth=
 0,_nsub=108,_nsub4disp=132,_nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=
 0x0,_tiltsh=0x7fedfc179c30,_masks=0x0,_fluxpersub=0x7fedfbe4d400,_rayleighflux=
 0x0,_sodiumflux=0x0,_raylfluxpersub=0x7fedfbe4d650,_skyfluxpersub=
 0x7fedfbe4ba10,_nphotons=16949.2,_skynphotons=0,_tt=[-0.0616249,0.0424649],
 _lastvalidtt=[-0.0616249,0.0424649],_upttcommand=[0,0],_refmes=0x7fedfbc37ae0,
 _tiprefv=0x7fedfc052230,_tiltrefv=0x7fedfc15f430,_tiprefvn=0x7fedfc052a30,
 _tiltrefvn=0x7fedfc1e5630,_reordervec=0x0,_npixels=2,_npb=0,_sdim=4,_nx=4,
 _nx4fft=4,_istart=0x7fedfbe4c5c0,_jstart=0x7fedfbe4d1b0,_binindices=
 0x7fedfc84df60,_binxy=2,_centroidw=0x7fedfc8461d8,_fimage=0x7fedfc15ea30,
 _fimage2=0x0,_imistart=0x7fedfbc37150,_imjstart=0x7fedfbc373a0,_imistart2=
 0x7fedfbc375f0,_imjstart2=0x7fedfbc37840,_unittip=0x7fedfc867398,_unittilt=
 0x7fedfc866d40,_lgs_defocuses=0x7fedfc866cd0,_unitdefocus=0x7fedfd0e6430,
 _fimnx=24,_fimny=24,_fimny2=0x0,_yoffset=0x0,_bias=0x7fedfc1d7c30,_flat=
 0x7fedfc12c030,_domask=1,_submask=0x7fedfc84e428,_kernel=0x7fedfc84da98,
 _kernels=0x7fedfc129e30,_kerfftr=0x7fedfc16dc30,_kerffti=0x7fedfc16ba30,
 _kernelconv=0,_cyclecounter=1,_dispimage=0x7fedfc12d430,_x=0x7fedfd0ea630,_y=
 0x7fedfd099630,_centroidgain=1,_rayleigh=0x7fedfc866ec8,_bckgrdcalib=
 0x7fedfc12ca30,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=1e+11,
 _pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,
 _LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,
 _nkernels=1,_dmnotinpath=0x7fedfc866718)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=1,alt=0,hyst=0,push4imat=100,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc846248,_ctrlden=0x7fedfc867130,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=20,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbc352e0,_xlast=0x7fedfbc35780,_ylast=[0x7fedfc0ff430,0x7fedfc0ff430,
 0x7fedfc0ff430],_y0=0x7fedfc036430,_signus=0x7fedfbc38fb0,_puppixoffset=[0,0],
 _nact=80,_def=0x101d4f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=12,_n2=53,_pupil=0x0,_command=0x7fedfbe45b80,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc8671a0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.0985,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc8667c0,xposition=0x7fedfc845fa8,yposition=
 0x7fedfc866c98,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc866f00,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.2475  0.1238  0.2475   0.50  0.50  0.50    2x 2    2x 2    16949.2
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0     1418.0   0.002      628.3
Field Avg  1.65                   1418.0   0.002      628.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 43.33
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 2;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 5.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 2;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 0.194;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 dm(n).iffile	    = “”; 
 dm(n).nxact	        = 20; 
 dm(n).pitch	        = 1; 
 dm(n).nzer          = 80;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01; 
 dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      // Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            // iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           // Telescope diameter, in meters, float
 tel.cobs	       = 0.0985;        // Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)
 
 //-------------------------------
 target.lambda	   = &([1.65]);     // Image wavelengths in micron -H band
 target.xposition   = &([0.]);       // “Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.1;           // Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 5000;          // Total number of iterations
 loop.ittime	       = 2e-3;          // Iteration time (sampling time)
 loop.startskip     = 10;            // Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         // In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         // See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 24,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=64,_cent=32.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051888,layerfrac=0x7fedfd051910,
 layerspeed=0x7fedfd051a20,layeralt=0x7fedfc84da98,winddir=0x7fedfc84e428,
 _layeralt=0x7fedfc84da10)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=2,pixsize=0.247525,npixels=2,
 spotpitch=2,extfield=0.495049,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=0.495049,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fedfc8671a0,lgs_prof_alt=
 0x7fedfc866c98,nzer=0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fedfbe4c9c0,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fedfbc391b0,_origpixsize=0.194,_rebinfactor=2,_gsalt=0,_gsdepth=
 0,_nsub=108,_nsub4disp=132,_nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=
 0x0,_tiltsh=0x7fedfd824830,_masks=0x0,_fluxpersub=0x7fedfbe45290,_rayleighflux=
 0x0,_sodiumflux=0x0,_raylfluxpersub=0x7fedfbe4ba10,_skyfluxpersub=
 0x7fedfbe4bc60,_nphotons=16949.2,_skynphotons=0,_tt=[-0.0235358,-0.0330653],
 _lastvalidtt=[-0.0235358,-0.0330653],_upttcommand=[0,0],_refmes=0x7fedfbd094c0,
 _tiprefv=0x7fedfc15f230,_tiltrefv=0x7fedfc15ea30,_tiprefvn=0x7fedfc120a30,
 _tiltrefvn=0x7fedfc052230,_reordervec=0x0,_npixels=2,_npb=0,_sdim=4,_nx=4,
 _nx4fft=4,_istart=0x7fedfbc38990,_jstart=0x7fedfbc37e30,_binindices=
 0x7fedfc84e290,_binxy=2,_centroidw=0x7fedfc866bb8,_fimage=0x7fedfd0db630,
 _fimage2=0x0,_imistart=0x7fedfbd09d00,_imjstart=0x7fedfbd09f50,_imistart2=
 0x7fedfbd0a1a0,_imjstart2=0x7fedfbd0a3f0,_unittip=0x7fedfc866bf0,_unittilt=
 0x7fedfc866e20,_lgs_defocuses=0x7fedfc866c28,_unitdefocus=0x7fedfc164c30,
 _fimnx=24,_fimny=24,_fimny2=0x0,_yoffset=0x0,_bias=0x7fedfc052a30,_flat=
 0x7fedfc1d7a30,_domask=1,_submask=0x7fedfc84e758,_kernel=0x7fedfc84dd40,
 _kernels=0x7fedfd833c30,_kerfftr=0x7fedfd82a630,_kerffti=0x7fedfd870230,
 _kernelconv=0,_cyclecounter=1,_dispimage=0x7fedfd0b3a30,_x=0x7fedfc04b430,_y=
 0x7fedfc057030,_centroidgain=1,_rayleigh=0x7fedfc8670f8,_bckgrdcalib=
 0x7fedfc053430,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=1e+11,
 _pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,
 _LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,
 _nkernels=1,_dmnotinpath=0x7fedfc840230)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=1,alt=0,hyst=0,push4imat=100,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc867398,_ctrlden=0x7fedfc8460f8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=20,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbe4b520,_xlast=0x7fedfbe45110,_ylast=[0x7fedfd04d830,0x7fedfd04d830,
 0x7fedfd04d830],_y0=0x7fedfd0b4e30,_signus=0x7fedfbe45900,_puppixoffset=[0,0],
 _nact=80,_def=0x101d4f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=12,_n2=53,_pupil=0x0,_command=0x7fedfbf0cbe0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc866aa0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.0985,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc867130,xposition=0x7fedfc866cd0,yposition=
 0x7fedfc866d40,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc8461d8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.1,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.2475  0.1238  0.2475   0.50  0.50  0.50    2x 2    2x 2    16949.2
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0     1418.0   0.002      628.3
Field Avg  1.65                   1418.0   0.002      628.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 43.33
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 2;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 5.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 2;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 0.194;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 dm(n).iffile	    = “”; 
 dm(n).nxact	        = 20; 
 dm(n).pitch	        = 1; 
 dm(n).nzer          = 80;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01; 
 dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      // Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            // iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           // Telescope diameter, in meters, float
 tel.cobs	       = 0.0985;        // Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)
 
 //-------------------------------
 target.lambda	   = &([1.65]);     // Image wavelengths in micron -H band
 target.xposition   = &([0.]);       // “Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.1;           // Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 5000;          // Total number of iterations
 loop.ittime	       = 2e-3;          // Iteration time (sampling time)
 loop.startskip     = 10;            // Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         // In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         // See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 24,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=64,_cent=32.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051a20,layerfrac=0x7fedfd051888,
 layerspeed=0x7fedfd051910,layeralt=0x7fedfc84df60,winddir=0x7fedfc84d6e0,
 _layeralt=0x7fedfc84da10)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=2,pixsize=0.247525,npixels=2,
 spotpitch=2,extfield=0.495049,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=0.495049,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fedfc866de8,lgs_prof_alt=
 0x7fedfc866d78,nzer=0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fedfbc39c50,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fedfbc2e590,_origpixsize=0.194,_rebinfactor=2,_gsalt=0,_gsdepth=
 0,_nsub=108,_nsub4disp=132,_nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=
 0x0,_tiltsh=0x7fedfd128830,_masks=0x0,_fluxpersub=0x7fedfbc36410,_rayleighflux=
 0x0,_sodiumflux=0x0,_raylfluxpersub=0x7fedfbc38110,_skyfluxpersub=
 0x7fedfbc38360,_nphotons=16949.2,_skynphotons=0,_tt=[-0.0235358,-0.0330653],
 _lastvalidtt=[-0.0235358,-0.0330653],_upttcommand=[0,0],_refmes=0x7fedfbc37990,
 _tiprefv=0x7fedfc1d7630,_tiltrefv=0x7fedfc1d6e30,_tiprefvn=0x7fedfc1d7e30,
 _tiltrefvn=0x7fedfc04d630,_reordervec=0x0,_npixels=2,_npb=0,_sdim=4,_nx=4,
 _nx4fft=4,_istart=0x7fedfbc36a40,_jstart=0x7fedfbc37350,_binindices=
 0x7fedfc84e5c0,_binxy=2,_centroidw=0x7fedfc867398,_fimage=0x7fedfc052c30,
 _fimage2=0x0,_imistart=0x7fedfbe4cbd0,_imjstart=0x7fedfbe4ce20,_imistart2=
 0x7fedfbe4d070,_imjstart2=0x7fedfbe4d2c0,_unittip=0x7fedfc8670f8,_unittilt=
 0x7fedfc866830,_lgs_defocuses=0x7fedfc8667f8,_unitdefocus=0x7fedfc164c30,
 _fimnx=24,_fimny=24,_fimny2=0x0,_yoffset=0x0,_bias=0x7fedfd0bc830,_flat=
 0x7fedfd0b3a30,_domask=1,_submask=0x7fedfd051228,_kernel=0x7fedfc84d7f0,
 _kernels=0x7fedfd0cd230,_kerfftr=0x7fedfd0d0230,_kerffti=0x7fedfd0df830,
 _kernelconv=0,_cyclecounter=1,_dispimage=0x7fedfc04cc30,_x=0x7fedfc049830,_y=
 0x7fedfc124c30,_centroidgain=1,_rayleigh=0x7fedfc866f38,_bckgrdcalib=
 0x7fedfd0cf430,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=1e+11,
 _pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,
 _LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,
 _nkernels=1,_dmnotinpath=0x7fedfc845fe0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=1,alt=0,hyst=0,push4imat=100,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc866aa0,_ctrlden=0x7fedfc866fa8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=20,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbe45330,_xlast=0x7fedfbe4b500,_ylast=[0x7fedfd0eb030,0x7fedfd0eb030,
 0x7fedfd0eb030],_y0=0x7fedfd0d3830,_signus=0x7fedfbe4c140,_puppixoffset=[0,0],
 _nact=80,_def=0x101f84030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=12,_n2=53,_pupil=0x0,_command=0x7fedfbc352c0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc866b48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.0985,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc866c28,xposition=0x7fedfc8401c0,yposition=
 0x7fedfc866d40,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc83c7c0,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.1,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.2475  0.1238  0.2475   0.50  0.50  0.50    2x 2    2x 2    16949.2
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0     1418.0   0.002      628.3
Field Avg  1.65                   1418.0   0.002      628.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 43.33
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 2;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 5.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 2;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 0.194;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 6;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 dm(n).iffile	    = “”; 
 dm(n).nxact	        = 20; 
 dm(n).pitch	        = 1; 
 dm(n).nzer          = 80;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01; 
 dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      // Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            // iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           // Telescope diameter, in meters, float
 tel.cobs	       = 0.0985;        // Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)
 
 //-------------------------------
 target.lambda	   = &([1.65]);     // Image wavelengths in micron -H band
 target.xposition   = &([0.]);       // “Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.1;           // Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 5000;          // Total number of iterations
 loop.ittime	       = 2e-3;          // Iteration time (sampling time)
 loop.startskip     = 10;            // Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         // In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         // See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 24,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=64,_cent=32.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051910,layerfrac=0x7fedfd051a20,
 layerspeed=0x7fedfd051888,layeralt=0x7fedfc84dba8,winddir=0x7fedfc84e538,
 _layeralt=0x7fedfc84da10)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=2,pixsize=0.247525,npixels=2,
 spotpitch=2,extfield=0.495049,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=0.495049,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fedfc845f00,lgs_prof_alt=
 0x7fedfc8670c0,nzer=0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fedfbc3b220,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fedfbe42720,_origpixsize=0.194,_rebinfactor=2,_gsalt=0,_gsdepth=
 0,_nsub=108,_nsub4disp=132,_nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=
 0x0,_tiltsh=0x7fedfc1cb030,_masks=0x0,_fluxpersub=0x7fedfbe4bc60,_rayleighflux=
 0x0,_sodiumflux=0x0,_raylfluxpersub=0x7fedfbe45110,_skyfluxpersub=
 0x7fedfbe4beb0,_nphotons=16949.2,_skynphotons=0,_tt=[-0.0235358,-0.0330653],
 _lastvalidtt=[-0.0235358,-0.0330653],_upttcommand=[0,0],_refmes=0x7fedfbf0d670,
 _tiprefv=0x7fedfc890e30,_tiltrefv=0x7fedfc890630,_tiprefvn=0x7fedfc880430,
 _tiltrefvn=0x7fedfc887c30,_reordervec=0x0,_npixels=2,_npb=0,_sdim=4,_nx=4,
 _nx4fft=4,_istart=0x7fedfbe45900,_jstart=0x7fedfbe4ba10,_binindices=
 0x7fedfc84ddc8,_binxy=2,_centroidw=0x7fedfc840230,_fimage=0x7fedfc1d1e30,
 _fimage2=0x0,_imistart=0x7fedfbc3bbe0,_imjstart=0x7fedfbc3be30,_imistart2=
 0x7fedfbc3c080,_imjstart2=0x7fedfbc3c2d0,_unittip=0x7fedfc866f38,_unittilt=
 0x7fedfc867280,_lgs_defocuses=0x7fedfc866de8,_unitdefocus=0x7fedfd0d8e30,
 _fimnx=24,_fimny=24,_fimny2=0x0,_yoffset=0x0,_bias=0x7fedfd077830,_flat=
 0x7fedfc1e3c30,_domask=1,_submask=0x7fedfc84db20,_kernel=0x7fedfc84d988,
 _kernels=0x7fedfc1cf230,_kerfftr=0x7fedfc1e1a30,_kerffti=0x7fedfc164c30,
 _kernelconv=0,_cyclecounter=1,_dispimage=0x7fedfc1d2830,_x=0x7fedfd0eae30,_y=
 0x7fedfd099c30,_centroidgain=1,_rayleigh=0x7fedfc83c830,_bckgrdcalib=
 0x7fedfc1d1430,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=1e+11,
 _pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,
 _LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,
 _nkernels=1,_dmnotinpath=0x7fedfc8671a0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=1,alt=0,hyst=0,push4imat=100,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc866ec8,_ctrlden=0x7fedfc866bb8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=20,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbc3aa00,_xlast=0x7fedfbc3ab80,_ylast=[0x7fedfc053e30,0x7fedfc053e30,
 0x7fedfc053e30],_y0=0x7fedfc1efe30,_signus=0x7fedfbc3b550,_puppixoffset=[0,0],
 _nact=80,_def=0x101dd0030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=12,_n2=53,_pupil=0x0,_command=0x7fedfbe45b50,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc867050,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.0985,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc866b80,xposition=0x7fedfc866750,yposition=
 0x7fedfc866d40,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc867130,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.1,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.1856  0.0928  0.1856   1.49  0.37  0.37    2x 2    2x 2    17526.8
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.1856  0.0928  0.1856   1.49  0.37  0.37    2x 2    2x 2    17526.8
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0     4247.1   0.000     1885.0
Field Avg  1.65                   4247.1   0.000     1885.0
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 72; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 43.33
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 2;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 5.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 6;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 0.194;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 dm(n).iffile	    = “”; 
 dm(n).nxact	        = 20; 
 dm(n).pitch	        = 1; 
 dm(n).nzer          = 80;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01; 
 dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      // Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            // iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           // Telescope diameter, in meters, float
 tel.cobs	       = 0.0985;        // Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)
 
 //-------------------------------
 target.lambda	   = &([1.65]);     // Image wavelengths in micron -H band
 target.xposition   = &([0.]);       // “Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.1;           // Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 1000;          // Total number of iterations
 loop.ittime	       = 2e-3;          // Iteration time (sampling time)
 loop.startskip     = 10;            // Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         // In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         // See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 72,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051910,layerfrac=0x7fedfd051a20,
 layerspeed=0x7fedfd051888,layeralt=0x7fedfc84e208,winddir=0x7fedfc84e0f8,
 _layeralt=0x7fedfc84da10)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=6,pixsize=0.185644,npixels=2,
 spotpitch=2,extfield=0.371287,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=0.371287,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fedfc867050,lgs_prof_alt=
 0x7fedfc866bb8,nzer=0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fedfbc3be70,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fedfbe4cb50,_origpixsize=0.194,_rebinfactor=2,_gsalt=0,_gsdepth=
 0,_nsub=108,_nsub4disp=132,_nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=
 0x0,_tiltsh=0x102107030,_masks=0x0,_fluxpersub=0x7fedfbe45110,_rayleighflux=
 0x0,_sodiumflux=0x0,_raylfluxpersub=0x7fedfbe4d760,_skyfluxpersub=
 0x7fedfbe4d9b0,_nphotons=17526.8,_skynphotons=0,_tt=[-1.14815e-09,
 -1.30857e-08],_lastvalidtt=[-1.14815e-09,-1.30857e-08],_upttcommand=[0,0],
 _refmes=0x7fedfbd094c0,_tiprefv=0x7fedfd099630,_tiltrefv=0x7fedfd831430,
 _tiprefvn=0x7fedfd099e30,_tiltrefvn=0x7fedfd831c30,_reordervec=0x0,_npixels=2,
 _npb=0,_sdim=16,_nx=4,_nx4fft=4,_istart=0x7fedfbe4c300,_jstart=0x7fedfbe4d0d0,
 _binindices=0x7fedfc84d7f0,_binxy=2,_centroidw=0x7fedfc866c28,_fimage=
 0x7fedfc167030,_fimage2=0x0,_imistart=0x7fedfbc3b010,_imjstart=0x7fedfbc3b260,
 _imistart2=0x7fedfbc3b4b0,_imjstart2=0x7fedfbc3b700,_unittip=0x7fedfd084328,
 _unittilt=0x7fedfd084118,_lgs_defocuses=0x7fedfd0e9220,_unitdefocus=
 0x101ed1030,_fimnx=24,_fimny=24,_fimny2=0x0,_yoffset=0x0,_bias=0x7fedfd0e0230,
 _flat=0x7fedfd0bc830,_domask=1,_submask=0x7fedfc84e4b0,_kernel=0x7fedfc84dc30,
 _kernels=0x7fedfc16dc30,_kerfftr=0x7fedfc16ba30,_kerffti=0x7fedfc131430,
 _kernelconv=0,_cyclecounter=1,_dispimage=0x7fedfc04cc30,_x=0x7fedfd0e9e30,_y=
 0x7fedfd0b2c30,_centroidgain=1,_rayleigh=0x7fedfc866aa0,_bckgrdcalib=
 0x7fedfd0e0c30,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=1e+11,
 _pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,
 _LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,
 _nkernels=1,_dmnotinpath=0x7fedfc8671a0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=1,alt=0,hyst=0,push4imat=100,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc8672b8,_ctrlden=0x7fedfc8666a8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=20,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbc350b0,_xlast=0x7fedfbc35270,_ylast=[0x7fedfc0ff430,0x7fedfc0ff430,
 0x7fedfc0ff430],_y0=0x7fedfc0db030,_signus=0x7fedfbc36410,_puppixoffset=[0,0],
 _nact=80,_def=0x105eca030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=84,_n2=173,_pupil=0x0,_command=0x7fedfbc3b950,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc845f00,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.0985,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc866de8,xposition=0x7fedfc866db0,yposition=
 0x7fedfc866ec8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc866e20,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.1,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=1000,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.2475  0.1238  0.2475   0.50  0.50  0.50    2x 2    2x 2    16949.2
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0     1418.0   0.003      628.3
Field Avg  1.65                   1418.0   0.003      628.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 43.33
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 2;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 5.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 2;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 0.194;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 dm(n).iffile	    = “”; 
 dm(n).nxact	        = 20; 
 dm(n).pitch	        = 1; 
 dm(n).nzer          = 80;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01; 
 dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      // Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            // iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           // Telescope diameter, in meters, float
 tel.cobs	       = 0.0985;        // Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)
 
 //-------------------------------
 target.lambda	   = &([1.65]);     // Image wavelengths in micron -H band
 target.xposition   = &([0.]);       // “Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.1;           // Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 1000;          // Total number of iterations
 loop.ittime	       = 2e-3;          // Iteration time (sampling time)
 loop.startskip     = 10;            // Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         // In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         // See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 24,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=64,_cent=32.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051888,layerfrac=0x7fedfd051910,
 layerspeed=0x7fedfd051a20,layeralt=0x7fedfc84e0f8,winddir=0x7fedfc84e208,
 _layeralt=0x7fedfc84da10)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=2,pixsize=0.247525,npixels=2,
 spotpitch=2,extfield=0.495049,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=0.495049,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fedfc845b48,lgs_prof_alt=
 0x7fedfc867130,nzer=0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fedfbd0a350,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fedfbf14ab0,_origpixsize=0.194,_rebinfactor=2,_gsalt=0,_gsdepth=
 0,_nsub=108,_nsub4disp=132,_nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=
 0x0,_tiltsh=0x7fedfc19e830,_masks=0x0,_fluxpersub=0x7fedfbe45110,_rayleighflux=
 0x0,_sodiumflux=0x0,_raylfluxpersub=0x7fedfbe4d120,_skyfluxpersub=
 0x7fedfbe4c3c0,_nphotons=16949.2,_skynphotons=0,_tt=[0.00505972,-0.0170479],
 _lastvalidtt=[0.00505972,-0.0170479],_upttcommand=[0,0],_refmes=0x7fedfbe45900,
 _tiprefv=0x7fedfd0b2c30,_tiltrefv=0x7fedfd0e8630,_tiprefvn=0x7fedfd0f7430,
 _tiltrefvn=0x7fedfd0c6a30,_reordervec=0x0,_npixels=2,_npb=0,_sdim=4,_nx=4,
 _nx4fft=4,_istart=0x7fedfbf14d00,_jstart=0x7fedfbf14f50,_binindices=
 0x7fedfd051c40,_binxy=2,_centroidw=0x7fedfc8671d8,_fimage=0x7fedfd827630,
 _fimage2=0x0,_imistart=0x7fedfbc3aba0,_imjstart=0x7fedfbc3adf0,_imistart2=
 0x7fedfbc3b040,_imjstart2=0x7fedfbc3b290,_unittip=0x7fedfc866aa0,_unittilt=
 0x7fedfc846210,_lgs_defocuses=0x7fedfc867600,_unitdefocus=0x7fedfc88c430,
 _fimnx=24,_fimny=24,_fimny2=0x0,_yoffset=0x0,_bias=0x7fedfd0b3430,_flat=
 0x7fedfc134030,_domask=1,_submask=0x7fedfd051998,_kernel=0x7fedfc84e648,
 _kernels=0x7fedfc131e30,_kerfftr=0x7fedfc165c30,_kerffti=0x7fedfc129c30,
 _kernelconv=0,_cyclecounter=1,_dispimage=0x7fedfd828030,_x=0x7fedfc82c630,_y=
 0x7fedfc890630,_centroidgain=1,_rayleigh=0x7fedfc867280,_bckgrdcalib=
 0x7fedfc15ea30,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=1e+11,
 _pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,
 _LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,
 _nkernels=1,_dmnotinpath=0x7fedfc8670f8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=1,alt=0,hyst=0,push4imat=100,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc8672b8,_ctrlden=0x7fedfc8672f0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=20,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbe42720,_xlast=0x7fedfbe428a0,_ylast=[0x7fedfd0b4e30,0x7fedfd0b4e30,
 0x7fedfd0b4e30],_y0=0x7fedfd04d830,_signus=0x7fedfbe4cce0,_puppixoffset=[0,0],
 _nact=80,_def=0x102695030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=12,_n2=53,_pupil=0x0,_command=0x7fedfbc3a950,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfd0e9220,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.0985,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc845f00,xposition=0x7fedfc866de8,yposition=
 0x7fedfc866ec8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc867050,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.1,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=1000,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.2475  0.1238  0.2475   0.50  0.50  0.50    2x 2    2x 2    16949.2
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0     1418.0   0.003      628.3
Field Avg  1.65                   1418.0   0.003      628.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 43.33
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 2;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 5.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 2;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 0.194;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 dm(n).iffile	    = “”; 
 dm(n).nxact	        = 20; 
 dm(n).pitch	        = 1; 
 dm(n).nzer          = 80;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01; 
 dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      // Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            // iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           // Telescope diameter, in meters, float
 tel.cobs	       = 0.0985;        // Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)
 
 //-------------------------------
 target.lambda	   = &([1.65]);     // Image wavelengths in micron -H band
 target.xposition   = &([0.]);       // “Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.1;           // Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 1000;          // Total number of iterations
 loop.ittime	       = 2e-3;          // Iteration time (sampling time)
 loop.startskip     = 10;            // Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         // In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         // See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 24,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=64,_cent=32.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051a20,layerfrac=0x7fedfd051888,
 layerspeed=0x7fedfd051910,layeralt=0x7fedfc84dc30,winddir=0x7fedfc84d5d0,
 _layeralt=0x7fedfc84da10)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=2,pixsize=0.247525,npixels=2,
 spotpitch=2,extfield=0.495049,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=0.495049,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fedfc866b10,lgs_prof_alt=
 0x7fedfc866e20,nzer=0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fedfbe45900,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fedfbc35780,_origpixsize=0.194,_rebinfactor=2,_gsalt=0,_gsdepth=
 0,_nsub=108,_nsub4disp=132,_nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=
 0x0,_tiltsh=0x7fedfd127e30,_masks=0x0,_fluxpersub=0x7fedfbc3a0f0,_rayleighflux=
 0x0,_sodiumflux=0x0,_raylfluxpersub=0x7fedfbc3a990,_skyfluxpersub=
 0x7fedfbc3abe0,_nphotons=16949.2,_skynphotons=0,_tt=[0.00505972,-0.0170479],
 _lastvalidtt=[0.00505972,-0.0170479],_upttcommand=[0,0],_refmes=0x7fedfbc3b8c0,
 _tiprefv=0x7fedfc120a30,_tiltrefv=0x7fedfc053630,_tiprefvn=0x7fedfc121230,
 _tiltrefvn=0x7fedfc12f430,_reordervec=0x0,_npixels=2,_npb=0,_sdim=4,_nx=4,
 _nx4fft=4,_istart=0x7fedfbc39c50,_jstart=0x7fedfbc39ea0,_binindices=
 0x7fedfc84e538,_binxy=2,_centroidw=0x7fedfc867520,_fimage=0x7fedfd0f7430,
 _fimage2=0x0,_imistart=0x7fedfbe4ca90,_imjstart=0x7fedfbe4cce0,_imistart2=
 0x7fedfbe4da80,_imjstart2=0x7fedfbe4dcd0,_unittip=0x7fedfc867280,_unittilt=
 0x7fedfc8673d0,_lgs_defocuses=0x7fedfc8670c0,_unitdefocus=0x7fedfc129e30,
 _fimnx=24,_fimny=24,_fimny2=0x0,_yoffset=0x0,_bias=0x7fedfc052230,_flat=
 0x7fedfd0b2c30,_domask=1,_submask=0x7fedfc84e868,_kernel=0x7fedfc84e0f8,
 _kernels=0x7fedfd0c3e30,_kerfftr=0x7fedfd0e6430,_kerffti=0x7fedfd0dae30,
 _kernelconv=0,_cyclecounter=1,_dispimage=0x7fedfd0f7e30,_x=0x7fedfc16fa30,_y=
 0x7fedfc04b430,_centroidgain=1,_rayleigh=0x7fedfc867360,_bckgrdcalib=
 0x7fedfd0c6030,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=1e+11,
 _pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,
 _LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,
 _nkernels=1,_dmnotinpath=0x7fedfc8671a0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=1,alt=0,hyst=0,push4imat=100,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc866ad8,_ctrlden=0x7fedfc845a68,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=20,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbe4b5a0,_xlast=0x7fedfbe45360,_ylast=[0x7fedfd0b4e30,0x7fedfd0b4e30,
 0x7fedfd0b4e30],_y0=0x7fedfd04d830,_signus=0x7fedfbe4d500,_puppixoffset=[0,0],
 _nact=80,_def=0x101f84030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=12,_n2=53,_pupil=0x0,_command=0x7fedfbe4cf30,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc867600,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.0985,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc8672f0,xposition=0x7fedfc866ec8,yposition=
 0x7fedfd0e9220,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc8671d8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.1,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=1000,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.6704  0.6704  0.6704   2.68  1.34  1.34    2x 2    2x 2    17648.3
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 100 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0     7680.8   0.000     3403.5
Field Avg  1.65                   7680.8   0.000     3403.5
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 130; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 43.33
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 2;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 5.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 2;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 0.194;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 dm(n).iffile	    = “”; 
 dm(n).nxact	        = 20; 
 dm(n).pitch	        = 1; 
 dm(n).nzer          = 80;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01; 
 dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      // Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            // iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           // Telescope diameter, in meters, float
 tel.cobs	       = 0.0985;        // Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)
 
 //-------------------------------
 target.lambda	   = &([1.65]);     // Image wavelengths in micron -H band
 target.xposition   = &([0.]);       // “Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.1;           // Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 1000;          // Total number of iterations
 loop.ittime	       = 2e-3;          // Iteration time (sampling time)
 loop.startskip     = 10;            // Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         // In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         // See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 130,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051888,layerfrac=0x7fedfd051910,
 layerspeed=0x7fedfd051a20,layeralt=0x7fedfc84e0f8,winddir=0x7fedfc84e868,
 _layeralt=0x7fedfc84da10)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=2,pixsize=0.670379,npixels=2,
 spotpitch=2,extfield=1.34076,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=1.34076,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fedfc867600,lgs_prof_alt=
 0x7fedfd0e9220,nzer=0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fedfbc3ad50,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fedfbe4bdd0,_origpixsize=0.194,_rebinfactor=1,_gsalt=0,_gsdepth=
 0,_nsub=100,_nsub4disp=112,_nmes=200,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=
 0x0,_tiltsh=0x1021e8030,_masks=0x0,_fluxpersub=0x7fedfbc3cbd0,_rayleighflux=
 0x0,_sodiumflux=0x0,_raylfluxpersub=0x7fedfbf14ab0,_skyfluxpersub=
 0x7fedfbf15070,_nphotons=17648.3,_skynphotons=0,_tt=[0.000586054,-0.00130357],
 _lastvalidtt=[0.000586054,-0.00130357],_upttcommand=[0,0],_refmes=
 0x7fedfbe4cf90,_tiprefv=0x7fedfc884630,_tiltrefv=0x7fedfc880c30,_tiprefvn=
 0x7fedfc884e30,_tiltrefvn=0x7fedfc880230,_reordervec=0x0,_npixels=2,_npb=0,
 _sdim=4,_nx=2,_nx4fft=2,_istart=0x7fedfbe4b500,_jstart=0x7fedfbe4c230,
 _binindices=0x7fedfc866e20,_binxy=2,_centroidw=0x7fedfc866830,_fimage=
 0x7fedfc04d430,_fimage2=0x0,_imistart=0x7fedfbc3ba50,_imjstart=0x7fedfbc3c210,
 _imistart2=0x7fedfbc3c410,_imjstart2=0x7fedfbc3c610,_unittip=0x7fedfc866b80,
 _unittilt=0x7fedfc867018,_lgs_defocuses=0x7fedfc8401c0,_unitdefocus=
 0x108e25030,_fimnx=24,_fimny=24,_fimny2=0x0,_yoffset=0x0,_bias=0x7fedfc881e30,
 _flat=0x7fedfc82c630,_domask=1,_submask=0x7fedfc866bf0,_kernel=0x7fedfc866de8,
 _kernels=0x7fedfc052a30,_kerfftr=0x7fedfc052230,_kerffti=0x7fedfc053230,
 _kernelconv=0,_cyclecounter=1,_dispimage=0x7fedfc1f6c30,_x=0x7fedfbe4f780,_y=
 0x7fedfbe4fb40,_centroidgain=1,_rayleigh=0x7fedfd0e9300,_bckgrdcalib=
 0x7fedfc883c30,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=1e+11,
 _pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,
 _LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,
 _nkernels=1,_dmnotinpath=0x7fedfc845b48)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=1,alt=0,hyst=0,push4imat=100,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc866ad8,_ctrlden=0x7fedfc840150,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=20,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbc35330,_xlast=0x7fedfbc3b5e0,_ylast=[0x7fedfc1e6030,0x7fedfc1e6030,
 0x7fedfc1e6030],_y0=0x7fedfc135230,_signus=0x7fedfbc39c50,_puppixoffset=[0,0],
 _nact=80,_def=0x106b65030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=183,_n2=330,_pupil=0x0,_command=0x7fedfbf15270,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc866b10,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.0985,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc845a68,xposition=0x7fedfc8670c0,yposition=
 0x7fedfc8673d0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc867520,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.1,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=1000,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.7426  0.7426  0.7426   2.97  1.49  1.49    2x 2    2x 2    17655.7
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 92 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 1000 iterations
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.2475  0.1238  0.2475   0.50  0.50  0.50    2x 2    2x 2    16949.2
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0     1418.0   0.003      628.3
Field Avg  1.65                   1418.0   0.003      628.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 43.33
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 2;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 5.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 2;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 0.194;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 dm(n).iffile	    = “”; 
 dm(n).nxact	        = 20; 
 dm(n).pitch	        = 1; 
 dm(n).nzer          = 80;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01; 
 dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      // Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            // iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           // Telescope diameter, in meters, float
 tel.cobs	       = 0.0985;        // Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)
 
 //-------------------------------
 target.lambda	   = &([1.65]);     // Image wavelengths in micron -H band
 target.xposition   = &([0.]);       // “Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.1;           // Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 1000;          // Total number of iterations
 loop.ittime	       = 2e-3;          // Iteration time (sampling time)
 loop.startskip     = 10;            // Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         // In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         // See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 24,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=64,_cent=32.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051a20,layerfrac=0x7fedfd051888,
 layerspeed=0x7fedfd051910,layeralt=0x7fedfc84e868,winddir=0x7fedfc84e0f8,
 _layeralt=0x7fedfc84da10)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=2,pixsize=0.247525,npixels=2,
 spotpitch=2,extfield=0.495049,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=0.495049,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fedfc867600,lgs_prof_alt=
 0x7fedfc867018,nzer=0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fedfbe47b60,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fedfbe47910,_origpixsize=0.194,_rebinfactor=2,_gsalt=0,_gsdepth=
 0,_nsub=108,_nsub4disp=132,_nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=
 0x0,_tiltsh=0x7fedfc1d0030,_masks=0x0,_fluxpersub=0x7fedfbe4bc60,_rayleighflux=
 0x0,_sodiumflux=0x0,_raylfluxpersub=0x7fedfbe4beb0,_skyfluxpersub=
 0x7fedfbe4c100,_nphotons=16949.2,_skynphotons=0,_tt=[0.00505972,-0.0170479],
 _lastvalidtt=[0.00505972,-0.0170479],_upttcommand=[0,0],_refmes=0x7fedfbe47f00,
 _tiprefv=0x7fedfd081230,_tiltrefv=0x7fedfd0e9e30,_tiprefvn=0x7fedfd0f7430,
 _tiltrefvn=0x7fedfd0b3630,_reordervec=0x0,_npixels=2,_npb=0,_sdim=4,_nx=4,
 _nx4fft=4,_istart=0x7fedfbe45900,_jstart=0x7fedfbe4ba10,_binindices=
 0x7fedfd051778,_binxy=2,_centroidw=0x7fedfc867398,_fimage=0x7fedfd0efe30,
 _fimage2=0x0,_imistart=0x7fedfbc3aa00,_imjstart=0x7fedfbc39e50,_imistart2=
 0x7fedfbc3a0a0,_imjstart2=0x7fedfbc350b0,_unittip=0x7fedfd0e9300,_unittilt=
 0x7fedfc866c28,_lgs_defocuses=0x7fedfd0e9370,_unitdefocus=0x7fedfd0da430,
 _fimnx=24,_fimny=24,_fimny2=0x0,_yoffset=0x0,_bias=0x7fedfc04de30,_flat=
 0x7fedfc053630,_domask=1,_submask=0x7fedfc84d900,_kernel=0x7fedfc84e4b0,
 _kernels=0x7fedfc132030,_kerfftr=0x7fedfc1e1a30,_kerffti=0x7fedfc164c30,
 _kernelconv=0,_cyclecounter=1,_dispimage=0x7fedfd0de630,_x=0x7fedfd0e8830,_y=
 0x7fedfd0eae30,_centroidgain=1,_rayleigh=0x7fedfc845a68,_bckgrdcalib=
 0x7fedfc1e3c30,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=1e+11,
 _pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,
 _LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,
 _nkernels=1,_dmnotinpath=0x7fedfc866bb8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=1,alt=0,hyst=0,push4imat=100,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc866ad8,_ctrlden=0x7fedfc866b10,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=20,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbc35320,_xlast=0x7fedfbc2e590,_ylast=[0x7fedfc065a30,0x7fedfc065a30,
 0x7fedfc065a30],_y0=0x7fedfc1e6030,_signus=0x7fedfbc36410,_puppixoffset=[0,0],
 _nact=80,_def=0x101d7d030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=12,_n2=53,_pupil=0x0,_command=0x7fedfbe45b50,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc866d78,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.0985,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc845f38,xposition=0x7fedfc8671a0,yposition=
 0x7fedfc867750,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc866b80,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.1,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=1000,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    17648.8
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 1), 108 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       61.9   0.218      307.4
Field Avg  1.65                     61.9   0.218      307.4
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;//24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 43.33
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 1;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 5.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 11;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 1.2;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 wfs(n).fssize      = 2.4;
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 //dm(n).iffile	    = “”; 
 //dm(n).nxact	        = 20; 
 dm(n).pitch	        = 7; //miss some actuators...
 dm(n).nzer          = 80;
 //dm(n).alt           = 0.;
 //dm(n).unitpervolt   = 0.01; 
 //dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      // Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            // iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           // Telescope diameter, in meters, float
 tel.cobs	       = 0.1;        // Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)64/6.5
 
 //-------------------------------
 target.lambda	   = &([1.65]);     // Image wavelengths in micron -H band
 target.xposition   = &([0.]);       // “Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.1;           // Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 1000;          // Total number of iterations
 loop.ittime	       = 2e-3;          // Iteration time (sampling time)
 loop.startskip     = 10;            // Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         // In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         // See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051888,layerfrac=0x7fedfd051910,
 layerspeed=0x7fedfd051a20,layeralt=0x7fedfc84e4b0,winddir=0x7fedfc84d900,
 _layeralt=0x7fedfc84da10)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=1,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=0,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fedfc866d78,lgs_prof_alt=0x7fedfc867750,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=1,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fedfbe48030,
 _origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=108,_nsub4disp=108,
 _nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x101f84030,
 _masks=0x0,_fluxpersub=0x7fedfbc2e590,_rayleighflux=0x0,_sodiumflux=0x0,
 _raylfluxpersub=0x7fedfbc36410,_skyfluxpersub=0x7fedfbc35450,_nphotons=17648.8,
 _skynphotons=0,_tt=[0.012628,0.00365407],_lastvalidtt=[0.012628,0.00365407],
 _upttcommand=[0,0],_refmes=0x7fedfbc350b0,_tiprefv=0x7fedfc880c30,_tiltrefv=
 0x7fedfd0d5a30,_tiprefvn=0x7fedfc883c30,_tiltrefvn=0x7fedfd081230,_reordervec=
 0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,_istart=0x7fedfbe49fb0,
 _jstart=0x7fedfbe4a1a0,_binindices=0x7fedfd0e3c30,_binxy=2,_centroidw=
 0x7fedfc867718,_fimage=0x7fedfd0c7030,_fimage2=0x0,_imistart=0x7fedfbe48650,
 _imjstart=0x7fedfbe4a580,_imistart2=0x7fedfbe4a770,_imjstart2=0x7fedfbe4a960,
 _unittip=0x7fedfbe47bd0,_unittilt=0x7fedfbe47e00,_lgs_defocuses=0x7fedfc840150,
 _unitdefocus=0x107fff030,_fimnx=24,_fimny=24,_fimny2=0x0,_yoffset=0x0,_bias=
 0x7fedfd077830,_flat=0x7fedfd076e30,_domask=1,_submask=0x7fedfc17ce30,_kernel=
 0x7fedfc87fa30,_kernels=0x102352030,_kerfftr=0x1020d8030,_kerffti=0x102085030,
 _kernelconv=0,_cyclecounter=1,_dispimage=0x7fedfd0b3630,_x=0x7fedfbe49130,_y=
 0x7fedfbe494d0,_centroidgain=1,_rayleigh=0x7fedfd0e9220,_bckgrdcalib=
 0x7fedfd0dfc30,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=1e+11,
 _pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,
 _LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,
 _nkernels=1,_dmnotinpath=0x7fedfc8667c0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc8670f8,_ctrlden=0x7fedfc8676e0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbe45b10,_xlast=0x7fedfbe42720,_ylast=[0x7fedfd0b5e30,0x7fedfd0b5e30,
 0x7fedfd0b5e30],_y0=0x7fedfd0f0830,_signus=0x7fedfbe47910,_puppixoffset=[0,0],
 _nact=80,_def=0x107921030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fedfbc361c0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc845a68,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc867600,xposition=0x7fedfd0e9370,yposition=
 0x7fedfc866c28,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc867398,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.1,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=1000,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    17648.8
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 1), 108 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.8   0.567      128.4
Field Avg  1.65                     54.8   0.567      128.4
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;//24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 43.33
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 1;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 5.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 11;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 1.2;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 wfs(n).fssize      = 2.4;
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 //dm(n).iffile	    = “”; 
 //dm(n).nxact	        = 20; 
 dm(n).pitch	        = 7; //miss some actuators...
 dm(n).nzer          = 80;
 //dm(n).alt           = 0.;
 //dm(n).unitpervolt   = 0.01; 
 //dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      // Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            // iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           // Telescope diameter, in meters, float
 tel.cobs	       = 0.1;        // Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)64/6.5
 
 //-------------------------------
 target.lambda	   = &([1.65]);     // Image wavelengths in micron -H band
 target.xposition   = &([0.]);       // “Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.5;           // Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 1000;          // Total number of iterations
 loop.ittime	       = 2e-3;          // Iteration time (sampling time)
 loop.startskip     = 10;            // Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         // In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         // See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051910,layerfrac=0x7fedfd051a20,
 layerspeed=0x7fedfd051888,layeralt=0x7fedfc84e0f8,winddir=0x7fedfc84e868,
 _layeralt=0x7fedfc84da10)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=1,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=0,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fedfc866c28,lgs_prof_alt=0x7fedfc867600,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=1,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fedfbe42720,
 _origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=108,_nsub4disp=108,
 _nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x102615030,
 _masks=0x0,_fluxpersub=0x7fedfbf0e0d0,_rayleighflux=0x0,_sodiumflux=0x0,
 _raylfluxpersub=0x7fedfbf0e2c0,_skyfluxpersub=0x7fedfbf0e850,_nphotons=17648.8,
 _skynphotons=0,_tt=[0.00206884,-0.000326474],_lastvalidtt=[0.00206884,
 -0.000326474],_upttcommand=[0,0],_refmes=0x7fedfbc3a000,_tiprefv=
 0x7fedfc17ae30,_tiltrefv=0x7fedfc17a630,_tiprefvn=0x7fedfc17b630,_tiltrefvn=
 0x7fedfc165c30,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fedfbe49dd0,_jstart=0x7fedfbe49fc0,_binindices=0x7fedfd0bc230,
 _binxy=2,_centroidw=0x7fedfc866d40,_fimage=0x7fedfd0c7030,_fimage2=0x0,
 _imistart=0x7fedfbe48470,_imjstart=0x7fedfbe4a3a0,_imistart2=0x7fedfbe4a590,
 _imjstart2=0x7fedfbe4a780,_unittip=0x7fedfbe47ef0,_unittilt=0x7fedfbe3d970,
 _lgs_defocuses=0x7fedfc866ad8,_unitdefocus=0x106562030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fedfc881e30,_flat=0x7fedfc82c630,_domask=1,
 _submask=0x7fedfc883c30,_kernel=0x7fedfd0ec630,_kernels=0x102271030,_kerfftr=
 0x1020d8030,_kerffti=0x102085030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fedfd0ebc30,_x=0x7fedfbe48f50,_y=0x7fedfbe492f0,_centroidgain=1,_rayleigh=
 0x7fedfc867018,_bckgrdcalib=0x7fedfc87fa30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fedfc866bf0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc867750,_ctrlden=0x7fedfc866b10,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbc361c0,_xlast=0x7fedfbc33400,_ylast=[0x7fedfc121a30,0x7fedfc121a30,
 0x7fedfc121a30],_y0=0x7fedfc214e30,_signus=0x7fedfbc36410,_puppixoffset=[0,0],
 _nact=80,_def=0x106c66030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fedfbe4a1b0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfd0e9220,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc8670f8,xposition=0x7fedfc840150,yposition=
 0x7fedfc867718,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc866d78,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=1000,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    17648.8
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 1), 108 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       55.1   0.567      128.4
Field Avg  1.65                     55.1   0.567      128.4
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;//24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 43.33
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 1;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 5.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 11;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 1.2;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 wfs(n).fssize      = 2.4;
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 //dm(n).iffile	    = “”; 
 //dm(n).nxact	        = 20; 
 dm(n).pitch	        = 7; //miss some actuators...
 dm(n).nzer          = 80;
 //dm(n).alt           = 0.;
 //dm(n).unitpervolt   = 0.01; 
 //dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      // Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            // iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           // Telescope diameter, in meters, float
 tel.cobs	       = 0.1;        // Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)64/6.5
 
 //-------------------------------
 target.lambda	   = &([1.65]);     // Image wavelengths in micron -H band
 target.xposition   = &([0.]);       // “Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.8;           // Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 1000;          // Total number of iterations
 loop.ittime	       = 2e-3;          // Iteration time (sampling time)
 loop.startskip     = 10;            // Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         // In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         // See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051a20,layerfrac=0x7fedfd051888,
 layerspeed=0x7fedfd051910,layeralt=0x7fedfc84d900,winddir=0x7fedfc84e4b0,
 _layeralt=0x7fedfc84da10)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=1,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=0,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fedfc867718,lgs_prof_alt=0x7fedfc8670f8,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=1,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fedfbc33210,
 _origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=108,_nsub4disp=108,
 _nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x1029f1030,
 _masks=0x0,_fluxpersub=0x7fedfbe3e040,_rayleighflux=0x0,_sodiumflux=0x0,
 _raylfluxpersub=0x7fedfbe3e230,_skyfluxpersub=0x7fedfbe3e7c0,_nphotons=17648.8,
 _skynphotons=0,_tt=[0.000519597,0.000189446],_lastvalidtt=[0.000519597,
 0.000189446],_upttcommand=[0,0],_refmes=0x7fedfbe48470,_tiprefv=0x7fedfc885a30,
 _tiltrefv=0x7fedfd0c5630,_tiprefvn=0x7fedfc886230,_tiltrefvn=0x7fedfd0b2c30,
 _reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,_istart=
 0x7fedfbc350f0,_jstart=0x7fedfbc42f30,_binindices=0x7fedfc134030,_binxy=2,
 _centroidw=0x7fedfc8672b8,_fimage=0x7fedfc121430,_fimage2=0x0,_imistart=
 0x7fedfbc41690,_imjstart=0x7fedfbc37470,_imistart2=0x7fedfbc37660,_imjstart2=
 0x7fedfbc37850,_unittip=0x7fedfbc36410,_unittilt=0x7fedfbc2e590,_lgs_defocuses=
 0x7fedfd0e9370,_unitdefocus=0x106762030,_fimnx=24,_fimny=24,_fimny2=0x0,
 _yoffset=0x0,_bias=0x7fedfd0c6e30,_flat=0x7fedfc17a630,_domask=1,_submask=
 0x7fedfd0bc230,_kernel=0x7fedfc17c030,_kernels=0x102352030,_kerfftr=
 0x1020d8030,_kerffti=0x102085030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fedfc179c30,_x=0x7fedfbc427f0,_y=0x7fedfbc42b90,_centroidgain=1,_rayleigh=
 0x7fedfc866d08,_bckgrdcalib=0x7fedfc1d7630,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fedfc8401c0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc867600,_ctrlden=0x7fedfc866e20,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbe4b500,_xlast=0x7fedfbe3d970,_ylast=[0x7fedfd0b5e30,0x7fedfd0b5e30,
 0x7fedfd0b5e30],_y0=0x7fedfd0f0830,_signus=0x7fedfbe45a80,_puppixoffset=[0,0],
 _nact=80,_def=0x10a99d030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fedfbe428a0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc867018,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc867750,xposition=0x7fedfc866ad8,yposition=
 0x7fedfc866d40,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc866c28,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.8,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=1000,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    8824.4
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 1), 108 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.0   0.592      114.9
Field Avg  1.65                     54.0   0.592      114.9
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;//24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 43.33
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 1;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 5.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 11;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 1.2;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 wfs(n).fssize      = 2.4;
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 //dm(n).iffile	    = “”; 
 //dm(n).nxact	        = 20; 
 dm(n).pitch	        = 7; //miss some actuators...
 dm(n).nzer          = 80;
 //dm(n).alt           = 0.;
 //dm(n).unitpervolt   = 0.01; 
 //dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      // Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            // iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           // Telescope diameter, in meters, float
 tel.cobs	       = 0.1;        // Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)64/6.5
 
 //-------------------------------
 target.lambda	   = &([1.65]);     // Image wavelengths in micron -H band
 target.xposition   = &([0.]);       // “Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.8;           // Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 1000;          // Total number of iterations
 loop.ittime	       = 1e-3;          // Iteration time (sampling time)
 loop.startskip     = 10;            // Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         // In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         // See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051888,layerfrac=0x7fedfd051910,
 layerspeed=0x7fedfd051a20,layeralt=0x7fedfc84e868,winddir=0x7fedfc84e0f8,
 _layeralt=0x7fedfc84da10)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=1,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=0,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fedfc866d40,lgs_prof_alt=0x7fedfc867750,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=1,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fedfbe4a430,
 _origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=108,_nsub4disp=108,
 _nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x102b9f030,
 _masks=0x0,_fluxpersub=0x7fedfbc2e590,_rayleighflux=0x0,_sodiumflux=0x0,
 _raylfluxpersub=0x7fedfbc39210,_skyfluxpersub=0x7fedfbc39400,_nphotons=8824.39,
 _skynphotons=0,_tt=[0.00165042,-0.000486338],_lastvalidtt=[0.00165042,
 -0.000486338],_upttcommand=[0,0],_refmes=0x7fedfbc38e70,_tiprefv=
 0x7fedfc82c630,_tiltrefv=0x7fedfd825030,_tiprefvn=0x7fedfc87fa30,_tiltrefvn=
 0x7fedfd825830,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fedfbe49fe0,_jstart=0x7fedfbe3e750,_binindices=0x7fedfd0dfc30,
 _binxy=2,_centroidw=0x7fedfc866ec8,_fimage=0x7fedfd081230,_fimage2=0x0,
 _imistart=0x7fedfbe48680,_imjstart=0x7fedfbe4d350,_imistart2=0x7fedfbe4d540,
 _imjstart2=0x7fedfbe4d730,_unittip=0x7fedfbe4aac0,_unittilt=0x7fedfbe3d970,
 _lgs_defocuses=0x7fedfc867670,_unitdefocus=0x102716030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fedfc053630,_flat=0x7fedfc121430,_domask=1,
 _submask=0x7fedfc11a430,_kernel=0x7fedfd0bc230,_kernels=0x10227f030,_kerfftr=
 0x1020d8030,_kerffti=0x102085030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fedfd0e8230,_x=0x7fedfbe49160,_y=0x7fedfbe49500,_centroidgain=1,_rayleigh=
 0x7fedfc83c7c0,_bckgrdcalib=0x7fedfc11b230,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fedfc867398)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc866c28,_ctrlden=0x7fedfd0e9220,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbc361c0,_xlast=0x7fedfbc42e70,_ylast=[0x7fedfc065a30,0x7fedfc065a30,
 0x7fedfc065a30],_y0=0x7fedfc11d230,_signus=0x7fedfbc36410,_puppixoffset=[0,0],
 _nact=80,_def=0x107445030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fedfbc42ff0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc866d08,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc867600,xposition=0x7fedfd0e9370,yposition=
 0x7fedfc8672b8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc867718,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.8,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=1000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    8824.4
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 1), 108 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 1000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.0   0.592      114.9
Field Avg  1.65                     54.0   0.592      114.9
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;//24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 43.33
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 1;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 5.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 11;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 1.2;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 wfs(n).fssize      = 2.4;
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 //dm(n).iffile	    = “”; 
 //dm(n).nxact	        = 20; 
 dm(n).pitch	        = 7; //miss some actuators...
 dm(n).nzer          = 80;
 //dm(n).alt           = 0.;
 //dm(n).unitpervolt   = 0.01; 
 //dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      // Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            // iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           // Telescope diameter, in meters, float
 tel.cobs	       = 0.1;        // Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)64/6.5
 
 //-------------------------------
 target.lambda	   = &([1.65]);     // Image wavelengths in micron -H band
 target.xposition   = &([0.]);       // “Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.8;           // Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 1000;          // Total number of iterations
 loop.ittime	       = 1e-3;          // Iteration time (sampling time)
 loop.startskip     = 10;            // Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         // In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         // See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873398,layerfrac=0x7fee59873310,
 layerspeed=0x7fee59873288,layeralt=0x7fee598735b8,winddir=0x7fee598730f0,
 _layeralt=0x7fee598727e8)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=1,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=0,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5914c0c8,lgs_prof_alt=0x7fee59142988,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=1,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fee58d2f5f0,
 _origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=108,_nsub4disp=108,
 _nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x11b4fb030,
 _masks=0x0,_fluxpersub=0x7fee58d28ab0,_rayleighflux=0x0,_sodiumflux=0x0,
 _raylfluxpersub=0x7fee58c51c10,_skyfluxpersub=0x7fee58c55980,_nphotons=8824.39,
 _skynphotons=0,_tt=[0.00165042,-0.000486338],_lastvalidtt=[0.00165042,
 -0.000486338],_upttcommand=[0,0],_refmes=0x7fee58c52390,_tiprefv=
 0x7fee5918be30,_tiltrefv=0x7fee59217030,_tiprefvn=0x7fee59237630,_tiltrefvn=
 0x7fee59239a30,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58d302d0,_jstart=0x7fee58d22d50,_binindices=0x7fee598aec30,
 _binxy=2,_centroidw=0x7fee5916bfe8,_fimage=0x7fee598b8030,_fimage2=0x0,
 _imistart=0x7fee58d2fb90,_imjstart=0x7fee58d28140,_imistart2=0x7fee58d28330,
 _imjstart2=0x7fee58d28520,_unittip=0x7fee58d2f200,_unittilt=0x7fee58d22b20,
 _lgs_defocuses=0x7fee5914c2c0,_unitdefocus=0x1120f7030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee59231e30,_flat=0x7fee59231430,_domask=1,
 _submask=0x7fee598c6e30,_kernel=0x7fee598b5c30,_kernels=0x11274b030,_kerfftr=
 0x11ba50030,_kerffti=0x11b9fd030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee598b8a30,_x=0x7fee58d27470,_y=0x7fee58d27810,_centroidgain=1,_rayleigh=
 0x7fee5916bf40,_bckgrdcalib=0x7fee59216230,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916b838)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5914c3a0,_ctrlden=0x7fee5916ba30,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c54770,_xlast=0x7fee58c50940,_ylast=[0x7fee5906bc30,0x7fee5906bc30,
 0x7fee5906bc30],_y0=0x7fee59081430,_signus=0x7fee58c52730,_puppixoffset=[0,0],
 _nact=80,_def=0x11d6db030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58d232d0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916b8a8,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5914c2f8,xposition=0x7fee5914c410,yposition=
 0x7fee5914c3d8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5914c368,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.8,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=1000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    8824.4
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 1), 108 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 10000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       55.1   0.574      125.0
Field Avg  1.65                     55.1   0.574      125.0
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;//24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 43.33
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 1;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 5.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 11;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 1.2;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 wfs(n).fssize      = 2.4;
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 //dm(n).iffile	    = “”; 
 //dm(n).nxact	        = 20; 
 dm(n).pitch	        = 7; //miss some actuators...
 dm(n).nzer          = 80;
 //dm(n).alt           = 0.;
 //dm(n).unitpervolt   = 0.01; 
 //dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      // Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            // iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           // Telescope diameter, in meters, float
 tel.cobs	       = 0.1;        // Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)64/6.5
 
 //-------------------------------
 target.lambda	   = &([1.65]);     // Image wavelengths in micron -H band
 target.xposition   = &([0.]);       // “Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.8;           // Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 10000;          // Total number of iterations
 loop.ittime	       = 1e-3;          // Iteration time (sampling time)
 loop.startskip     = 10;            // Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         // In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         // See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873310,layerfrac=0x7fee59873288,
 layerspeed=0x7fee59873398,layeralt=0x7fee59873200,winddir=0x7fee598728f8,
 _layeralt=0x7fee598727e8)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=1,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=0,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5914c3d8,lgs_prof_alt=0x7fee5914c2f8,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=1,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fee58d2ff30,
 _origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=108,_nsub4disp=108,
 _nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x11b3fa030,
 _masks=0x0,_fluxpersub=0x7fee58c51360,_rayleighflux=0x0,_sodiumflux=0x0,
 _raylfluxpersub=0x7fee58c55780,_skyfluxpersub=0x7fee58c55d10,_nphotons=8824.39,
 _skynphotons=0,_tt=[-0.000355949,-0.000131788],_lastvalidtt=[-0.000355949,
 -0.000131788],_upttcommand=[0,0],_refmes=0x7fee58c52540,_tiprefv=
 0x7fee598a8c30,_tiltrefv=0x7fee5922a230,_tiprefvn=0x7fee5989ae30,_tiltrefvn=
 0x7fee5922aa30,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58d27bb0,_jstart=0x7fee58d28400,_binindices=0x7fee598b8030,
 _binxy=2,_centroidw=0x7fee5914bc68,_fimage=0x7fee598a7430,_fimage2=0x0,
 _imistart=0x7fee58d28060,_imjstart=0x7fee58d285f0,_imistart2=0x7fee58d287e0,
 _imjstart2=0x7fee58d289d0,_unittip=0x7fee58d22b20,_unittilt=0x7fee58d20df0,
 _lgs_defocuses=0x7fee5916c100,_unitdefocus=0x111df4030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee59226630,_flat=0x7fee598df630,_domask=1,
 _submask=0x7fee5922e830,_kernel=0x7fee598de830,_kernels=0x112bf6030,_kerfftr=
 0x11b9fd030,_kerffti=0x11ba50030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee598a7e30,_x=0x7fee58d270d0,_y=0x7fee58d27470,_centroidgain=1,_rayleigh=
 0x7fee5916c1e0,_bckgrdcalib=0x7fee598aec30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916b950)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916b918,_ctrlden=0x7fee5914bd48,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c539d0,_xlast=0x7fee58c528e0,_ylast=[0x7fee59081430,0x7fee59081430,
 0x7fee59081430],_y0=0x7fee5922b230,_signus=0x7fee58c56090,_puppixoffset=[0,0],
 _nact=80,_def=0x11511e030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58c53090,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916bf40,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5914c3a0,xposition=0x7fee5914c2c0,yposition=
 0x7fee5916bfe8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5914c0c8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.8,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=10000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    8824.4
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 1), 108 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 10000 iterations
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    8824.4
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 10000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       61.4   0.304      310.8
Field Avg  1.65                     61.4   0.304      310.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;//24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 43.33
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 2;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 5.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 11;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 1.2;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 wfs(n).fssize      = 2.4;
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 //dm(n).iffile	    = “”; 
 //dm(n).nxact	        = 20; 
 dm(n).pitch	        = 7; //miss some actuators...
 dm(n).nzer          = 80;
 //dm(n).alt           = 0.;
 //dm(n).unitpervolt   = 0.01; 
 //dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      // Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            // iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           // Telescope diameter, in meters, float
 tel.cobs	       = 0.1;        // Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)64/6.5
 
 //-------------------------------
 target.lambda	   = &([1.65]);     // Image wavelengths in micron -H band
 target.xposition   = &([0.]);       // “Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.8;           // Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 10000;          // Total number of iterations
 loop.ittime	       = 1e-3;          // Iteration time (sampling time)
 loop.startskip     = 10;            // Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         // In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         // See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873310,layerfrac=0x7fee59873288,
 layerspeed=0x7fee59873398,layeralt=0x7fee59153e30,winddir=0x7fee591539f0,
 _layeralt=0x7fee598727e8)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5914c3a0,lgs_prof_alt=0x7fee5914bd10,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58f03740,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58d220e0,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=108,
 _nsub4disp=132,_nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x111ff6030,_masks=0x0,_fluxpersub=0x7fee58c55700,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58c55950,_skyfluxpersub=0x7fee58c55ba0,
 _nphotons=8824.39,_skynphotons=0,_tt=[0.0137275,-0.0324977],_lastvalidtt=
 [0.0137275,-0.0324977],_upttcommand=[0,0],_refmes=0x7fee58f049c0,_tiprefv=
 0x7fee5a01de30,_tiltrefv=0x7fee59864a30,_tiprefvn=0x7fee5a000030,_tiltrefvn=
 0x7fee59865230,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58d22330,_jstart=0x7fee58d22580,_binindices=0x7fee59215e30,
 _binxy=2,_centroidw=0x7fee5916c480,_fimage=0x7fee59217630,_fimage2=0x0,
 _imistart=0x7fee58c54dc0,_imjstart=0x7fee58c55010,_imistart2=0x7fee58c55260,
 _imjstart2=0x7fee58c554b0,_unittip=0x7fee58d302a0,_unittilt=0x7fee58d21eb0,
 _lgs_defocuses=0x7fee59146430,_unitdefocus=0x113c97030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee5922a430,_flat=0x7fee5922c630,_domask=1,
 _submask=0x7fee59218e30,_kernel=0x7fee59218030,_kernels=0x10f4c4030,_kerfftr=
 0x11255e030,_kerffti=0x1125dd030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee5922d830,_x=0x7fee598aec30,_y=0x7fee598af230,_centroidgain=1,_rayleigh=
 0x7fee5914bd48,_bckgrdcalib=0x7fee5922ae30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5914c368)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5914c0c8,_ctrlden=0x7fee5916c250,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c52920,_xlast=0x7fee58c515d0,_ylast=[0x7fee5906bc30,0x7fee5906bc30,
 0x7fee5906bc30],_y0=0x7fee59081430,_signus=0x7fee58c50940,_puppixoffset=[0,0],
 _nact=80,_def=0x1165b8030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58d2f5d0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916c2f8,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5916bd80,xposition=0x7fee5916c288,yposition=
 0x7fee5916bf08,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5916bd10,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.8,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=10000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    8824.4
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 10000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       61.4   0.304      310.8
Field Avg  1.65                     61.4   0.304      310.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;//24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 43.33
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 2;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 5.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 11;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 1.2;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 wfs(n).fssize      = 2.4;
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 //dm(n).iffile	    = “”; 
 //dm(n).nxact	        = 20; 
 dm(n).pitch	        = 7; //miss some actuators...
 dm(n).nzer          = 80;
 //dm(n).alt           = 0.;
 //dm(n).unitpervolt   = 0.01; 
 //dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      // Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            // iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           // Telescope diameter, in meters, float
 tel.cobs	       = 0.1;        // Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)64/6.5
 
 //-------------------------------
 target.lambda	   = &([1.65]);     // Image wavelengths in micron -H band
 target.xposition   = &([0.]);       // “Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.8;           // Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 10000;          // Total number of iterations
 loop.ittime	       = 1e-3;          // Iteration time (sampling time)
 loop.startskip     = 10;            // Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         // In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         // See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873288,layerfrac=0x7fee59873398,
 layerspeed=0x7fee59873310,layeralt=0x7fee59873200,winddir=0x7fee598728f8,
 _layeralt=0x7fee598727e8)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916bf08,lgs_prof_alt=0x7fee5916bd80,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58c52760,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58d2f7f0,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=108,
 _nsub4disp=132,_nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x111ef5030,_masks=0x0,_fluxpersub=0x7fee58f03e40,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58f04090,_skyfluxpersub=0x7fee58f042e0,
 _nphotons=8824.39,_skynphotons=0,_tt=[0.0137275,-0.0324977],_lastvalidtt=
 [0.0137275,-0.0324977],_upttcommand=[0,0],_refmes=0x7fee58e07340,_tiprefv=
 0x7fee598aec30,_tiltrefv=0x7fee5a822e30,_tiprefvn=0x7fee598af430,_tiltrefvn=
 0x7fee5a823630,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58d2fa40,_jstart=0x7fee58d2fc90,_binindices=0x7fee59215e30,
 _binxy=2,_centroidw=0x7fee5916bdb8,_fimage=0x7fee59214e30,_fimage2=0x0,
 _imistart=0x7fee58c54380,_imjstart=0x7fee58c57770,_imistart2=0x7fee58c579c0,
 _imjstart2=0x7fee58c57c10,_unittip=0x7fee58d20df0,_unittilt=0x7fee58d26d20,
 _lgs_defocuses=0x7fee5916bed0,_unitdefocus=0x1123f9030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee5a820830,_flat=0x7fee5a81fe30,_domask=1,
 _submask=0x7fee5a81d030,_kernel=0x7fee5928b630,_kernels=0x10eee9030,_kerfftr=
 0x10ee83030,_kerffti=0x1125dd030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee5922ee30,_x=0x7fee598b8830,_y=0x7fee598b8030,_centroidgain=1,_rayleigh=
 0x7fee5914c2f8,_bckgrdcalib=0x7fee5a821230,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916b870)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916b800,_ctrlden=0x7fee5916c410,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c52460,_xlast=0x7fee58c525e0,_ylast=[0x7fee5906bc30,0x7fee5906bc30,
 0x7fee5906bc30],_y0=0x7fee59081430,_signus=0x7fee58c56910,_puppixoffset=[0,0],
 _nact=80,_def=0x114698030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58f04530,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5914bd48,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5914c0c8,xposition=0x7fee59146430,yposition=
 0x7fee5916c480,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5914c3a0,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.8,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=10000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    8824.4
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 1), 108 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 10000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       55.1   0.574      125.0
Field Avg  1.65                     55.1   0.574      125.0
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //MMT H band wave front sensor, lambda = 1.65 microns
 //——————————————— sim outline ——————————— 
 sim.name           = "SH12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;//24; //pupil diameter in the units of pixels D/r0*3=6.5m/15cm*3 = 130(pixel),according to section 3.1.1, only 120 works... I do not know why... 
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //——————————————— atm parameters ——————— 
 atm.dr0at05mic     = 43.33;                   // Dr0 at 0.5 microns, at zenith  D/r0, r0 at 0.5 micron…?(what???)  6.5m/15cm = 43.33
 //from Brusa 2003
 atm.screen	       = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits"); // Phase screen file names 
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);    // Layer fraction. Sum to one is insured in aoinit 
 atm.layerspeed     = &([11.,20.,29.,35.]);    // layer speed; meter/sec  
 atm.layeralt	   = &([0.,400.,6000.,9000.]);// Layer altitude, at Zenith  ;meter
 atm.winddir        = &([0,0,0,0]);            // Wind dir (not operational, use 0 for now) 
 
 
 //————————  WFS —————————    
 nwfs               = 1;          // number of WFSs (>1 if e.g. mcao) now is SCAO
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann"; // type of the WFS
 wfs(n).lambda	   = 0.65;       // WFS wavelength in microns ??? Infrared or the optical…
 wfs(n).shmethod	   = 1;          // 1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation… so this is which type???
 
 wfs(n).gspos       = [0.,0.];    // WFS guide star position [x,y] unit:arc-sec …???
 wfs(n).gsalt       = 0.;         // WFS guide star altitude, at zenith. 0 for infinity. unit:meter
 wfs(n).gsmag       = 5.;        // WFS guide star magnitude. For LGSs, see below. Beware to set to something bright when doing your iMat
 
 wfs(n).shnxsub	   = 12;         // # of subapertures in telescope diameter, listed in McGuire(1999) table 1.(number of sub-apertures)
 wfs(n).npixpersub  = 11;          // # of pixels per sub-aperture
 wfs(n).pixsize     = 1.2;  //0.15;       // Focal plane: Subaperture CCD pixel size in arcsec;  72um/(6.5m*23.5)*206265 = 0.0972 arcsec, Suresh told that the f-number should be 15 of this telescope
 // so the field of view per sub-aperture should be 4*0.15 = 0.6 arc sec,  1.65um / 6.5 m *24 = 1.25 arcsec
 
 wfs(n).npixels     = 2;          // Focal plane: Final # of pixels per subaperture; int
 wfs(n).fracIllum   = 0.75;       // Fraction of sub-aperture illuminated. 108./144=0.75
 
 wfs(n).noise       = 5;          // Enable noise (photon noise & read out noise), there is no units here. what is it !!!
 //4.5 -5 for in the abstract/McGuiqre(1999) table1
 wfs(n).ron         = 3.7;        // Read out noise (float)
 //EEV manufacturing specification3.7 e at 170 kHz in McGuire(1999) Section 3.1
 
 wfs(n).shthreshold = 0.;         // Threshold for the computation of the subaperture signal from CCD spots >= 0
 wfs(n).nintegcycles= 1;          // # of iterations over which to integrate before delivering slopes
 wfs(n).fstop       = "square";
 wfs(n).fssize      = 2.4;
 
 //———————————————Deformable mirrors————————————
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 //dm(n).type	        = "stackarray"; // Valid types are "bimorph", "stackarray" "tiptilt", "zernike", "diskharmonic", "kl", "segmented", "aniso" or "user_function", where user_function is the name of a function provided by the user
 //what does the stack array here means
 //dm(n).iffile	    = “”;           // Influence function file name. Leave it alone.
 //dm(n).nxact	        = 18;           // Number of actuator in pupil diameter,which is listed in the last sentence before the section 4.
 //dm(n).pitch	        = 1;            // Actuator pitch (pixel). (“stackarray/segmented” only) pitch size/pixel size = 144/24 =6 ,64cm/20=32mm,32mm/72um = 444
 //dm(n).alt           = 0.;           // Conjugation altitude, at zenith
 //dm(n).unitpervolt   = 0.01;         // Influence function sensitivity in unit/volt(what does the volt here means). Stackarray: micron/Volt, Tip-tilt: //arcsec/Volt.
 //dm(n).push4imat     = 100;          // Voltage to apply for iMat calibration. Note: the default is not OK for many configs. Change at will
 dm(n).type          = "zernike";
 //dm(n).iffile	    = “”; 
 //dm(n).nxact	        = 20; 
 dm(n).pitch	        = 7; //miss some actuators...
 dm(n).nzer          = 80;
 //dm(n).alt           = 0.;
 //dm(n).unitpervolt   = 0.01; 
 //dm(n).push4imat     = 100; 
 
 
 //n  =2;
 //dm(n).type	     = "tiptilt";
 //dm(n).iffile	     = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);      // Condition numbers for SVD, per subsystem.
 mat.file	       = “”;            // iMat and cMat filename. Leave it alone.
 
 //-------------------------------
 tel.diam	       = 6.5;           // Telescope diameter, in meters, float
 tel.cobs	       = 0.1;        // Central obstruction / telescope diameter ratio (the cover in the centre compared with the total diameter of the telescope)64/6.5
 
 //-------------------------------
 target.lambda	   = &([1.65]);     // Image wavelengths in micron -H band
 target.xposition   = &([0.]);       // “Targets" X positions in the field of view
 target.yposition   = &([0]);        // "Targets" Y positions in the field of view
 target.dispzoom    = &([1.]);       // Display zoom, useful for multi-targets. Typically around 1
 
 //-------------------------------
 gs.zeropoint	   = 1e11;          // Photometric zero point (#photons@pupil/s/full_aper, mag0 star).
 
 //———————————————Looping parameters——————————— 
 loop.gain	       = 0.8;           // Loop gain. Optional, but important!
 loop.framedelay    = 1;             // Loop delay (# of frames). Regular CCD 1 frame integration -> framedelay=1 + readout & Calculation -> framedelay=2
 loop.niter	       = 10000;          // Total number of iterations
 loop.ittime	       = 1e-3;          // Iteration time (sampling time)
 loop.startskip     = 10;            // Number of iteration to skip before collecting statistics
 loop.skipevery     = 10000;         // In phase screen, skip by "skipby" steps every "skipevery" iterations (0=none). See doc
 loop.skipby        = 10000;         // See above. This is to get better statistical coverage
 loop.modalgainfile = "simulModeGains.fits"; //Name of file with mode gains
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH12x12 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873398,layerfrac=0x7fee59873310,
 layerspeed=0x7fee59873288,layeralt=0x7fee591539f0,winddir=0x7fee59153e30,
 _layeralt=0x7fee598727e8)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.7,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=1,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=0,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.75,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916c480,lgs_prof_alt=0x7fee5914c0c8,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=1,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fee58c53090,
 _origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=108,_nsub4disp=108,
 _nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x111cf3030,
 _masks=0x0,_fluxpersub=0x7fee58c59580,_rayleighflux=0x0,_sodiumflux=0x0,
 _raylfluxpersub=0x7fee58c534f0,_skyfluxpersub=0x7fee58c59b10,_nphotons=8824.39,
 _skynphotons=0,_tt=[-0.000355949,-0.000131788],_lastvalidtt=[-0.000355949,
 -0.000131788],_upttcommand=[0,0],_refmes=0x7fee58d26350,_tiprefv=
 0x7fee59864a30,_tiltrefv=0x7fee598dce30,_tiprefvn=0x7fee5989ae30,_tiltrefvn=
 0x7fee598b8830,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58c564a0,_jstart=0x7fee58c56ac0,_binindices=0x7fee591b1230,
 _binxy=2,_centroidw=0x7fee5916c100,_fimage=0x7fee5922c630,_fimage2=0x0,
 _imistart=0x7fee58c57270,_imjstart=0x7fee58c58c10,_imistart2=0x7fee58c58e00,
 _imjstart2=0x7fee58c58ff0,_unittip=0x7fee58c532c0,_unittilt=0x7fee58c50940,
 _lgs_defocuses=0x7fee5916bfb0,_unitdefocus=0x11e497030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee5927ca30,_flat=0x7fee5922d830,_domask=1,
 _submask=0x7fee5927bc30,_kernel=0x7fee5927ae30,_kernels=0x10ef4f030,_kerfftr=
 0x10eda5030,_kerffti=0x10ee83030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee5922ee30,_x=0x7fee58c57d50,_y=0x7fee58c580f0,_centroidgain=1,_rayleigh=
 0x7fee5916c288,_bckgrdcalib=0x7fee59277a30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5914bd10)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916b988,_ctrlden=0x7fee5916c2f8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c5d860,_xlast=0x7fee58c5d1d0,_ylast=[0x7fee5906bc30,0x7fee5906bc30,
 0x7fee5906bc30],_y0=0x7fee59081430,_signus=0x7fee58c56d50,_puppixoffset=[0,0],
 _nact=80,_def=0x115b32030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58c59770,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5914c2f8,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5916b800,xposition=0x7fee5916bed0,yposition=
 0x7fee5916bdb8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5916bf08,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.8,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=10000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
