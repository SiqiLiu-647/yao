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
=============================
SH6x6 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    882438.8
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 2000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0     7798.9   0.000     3455.8
Field Avg  1.65                   7798.9   0.000     3455.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH6x6 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 //wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 //wfs(n).noise       = 1;
 //wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).iffile	   = "";
 dm(n).nxact	       = 20;
 dm(n).nzer         = 80;
 //dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.01;
 dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.6;
 loop.framedelay    = 1;
 loop.niter	       = 2000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH6x6 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051910,layerfrac=0x7fedfd051a20,
 layerspeed=0x7fedfd051888,layeralt=0x7fedfc84e4b0,winddir=0x7fedfc84d900,
 _layeralt=0x7fedfc84da10)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=0,ron=0,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=0,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,
 pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,
 shmethod=2,shnxsub=12,npixpersub=0,pixsize=1.19121,npixels=2,spotpitch=2,
 extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,shcalibseeing=
 0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",fssize=2.4,
 fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fedfc8672b8,lgs_prof_alt=0x7fedfc866c28,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fedfbc38510,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fedfbc39210,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x102898030,_masks=0x0,_fluxpersub=0x7fedfbe47910,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fedfbe47b60,_skyfluxpersub=0x7fedfbe47db0,
 _nphotons=882439,_skynphotons=0,_tt=[0.000214677,6.53312e-05],_lastvalidtt=
 [0.000214677,6.53312e-05],_upttcommand=[0,0],_refmes=0x7fedfc036430,_tiprefv=
 0x7fedfd0c4630,_tiltrefv=0x7fedfc1d7630,_tiprefvn=0x7fedfd0c4e30,_tiltrefvn=
 0x7fedfc1d7e30,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fedfbc37130,_jstart=0x7fedfbc37380,_binindices=0x7fedfc166830,
 _binxy=2,_centroidw=0x7fedfc866e20,_fimage=0x7fedfc11ca30,_fimage2=0x0,
 _imistart=0x7fedfbc3b7a0,_imjstart=0x7fedfbc37e20,_imistart2=0x7fedfbc38070,
 _imjstart2=0x7fedfbc382c0,_unittip=0x7fedfbc38fe0,_unittilt=0x7fedfbc36f00,
 _lgs_defocuses=0x7fedfc845f38,_unitdefocus=0x10242a030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fedfd077830,_flat=0x7fedfc17c830,_domask=1,
 _submask=0x7fedfd0dfc30,_kernel=0x7fedfd0bc230,_kernels=0x102352030,_kerfftr=
 0x102591030,_kerffti=0x10252b030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fedfc052230,_x=0x7fedfc124c30,_y=0x7fedfc053630,_centroidgain=1,_rayleigh=
 0x7fedfd0e9220,_bckgrdcalib=0x7fedfc132630,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fedfc8670f8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=0,alt=0,hyst=0,push4imat=100,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc867590,_ctrlden=0x7fedfc867018,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=20,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbc37ca0,_xlast=0x7fedfbc38830,_ylast=[0x7fedfc060a30,0x7fedfc060a30,
 0x7fedfc060a30],_y0=0x7fedfc065a30,_signus=0x7fedfbc33210,_puppixoffset=[0,0],
 _nact=80,_def=0x106c66030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fedfbe42720,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc867750,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc866d08,xposition=0x7fedfc867360,yposition=
 0x7fedfc867670,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc866ec8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=2000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH6x6 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  1.19  1.19    1x 1    1x 1    882438.8
=============================
SH6x6 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  1.19  1.19    1x 1    1x 1    882438.8
=============================
SH6x6 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    882438.8
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 2000 iterations
=============================
SH6x6 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    882438.8
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 2000 iterations
=============================
SH6x6 w/ TT mirror and WFS, full diffraction WFS
=============================
SH6x6 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    882438.8
=============================
SH6x6 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    882438.8
 
Summary:
Mirror #1, stackarray, 148 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 2000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       56.0   0.287      594.6
Field Avg  1.65                     56.0   0.287      594.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH6x6 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 //wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 //wfs(n).noise       = 1;
 //wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "stackarray";
 //dm(n).iffile	   = "";
 dm(n).nxact	       = 20;
 //dm(n).nzer         = 80;
 dm(n).pitch	       =11;
 //dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.01;
 dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.6;
 loop.framedelay    = 1;
 loop.niter	       = 2000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH6x6 w/ TT mirror and WFS, full diffraction WFS",pupildiam=
 132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=
 0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051a20,layerfrac=0x7fedfd051888,
 layerspeed=0x7fedfd051910,layeralt=0x7fedfc84e868,winddir=0x7fedfc84e0f8,
 _layeralt=0x7fedfc84da10)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=0,ron=0,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=0,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,
 pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,
 shmethod=2,shnxsub=12,npixpersub=0,pixsize=1.19121,npixels=2,spotpitch=2,
 extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,shcalibseeing=
 0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",fssize=2.4,
 fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fedfc867440,lgs_prof_alt=0x7fedfc845b10,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fedfbc3dc40,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fedfbe49090,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x107344030,_masks=0x0,_fluxpersub=0x7fedfbd09590,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fedfbd097e0,_skyfluxpersub=0x7fedfbd09a30,
 _nphotons=882439,_skynphotons=0,_tt=[-0.00409721,-0.000699109],_lastvalidtt=
 [-0.00409721,-0.000699109],_upttcommand=[0,0],_refmes=0x7fedfd0f8c30,_tiprefv=
 0x7fedfc885c30,_tiltrefv=0x7fedfc17a430,_tiprefvn=0x7fedfc886430,_tiltrefvn=
 0x7fedfc1d7630,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fedfbe48060,_jstart=0x7fedfbe482b0,_binindices=0x7fedfc11bc30,
 _binxy=2,_centroidw=0x7fedfc866de8,_fimage=0x7fedfc121430,_fimage2=0x0,
 _imistart=0x7fedfbc3dee0,_imjstart=0x7fedfbc3e130,_imistart2=0x7fedfbc3ef60,
 _imjstart2=0x7fedfbc3f1b0,_unittip=0x7fedfbe47930,_unittilt=0x7fedfbe47e30,
 _lgs_defocuses=0x7fedfc8671d8,_unitdefocus=0x106762030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fedfd826e30,_flat=0x7fedfd826430,_domask=1,
 _submask=0x7fedfd824830,_kernel=0x7fedfc17ba30,_kernels=0x102af2030,_kerfftr=
 0x10213e030,_kerffti=0x1020b1030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fedfc120a30,_x=0x7fedfd081230,_y=0x7fedfd0c4830,_centroidgain=1,_rayleigh=
 0x7fedfc867558,_bckgrdcalib=0x7fedfd825630,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fedfc846168)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=11,alt=0,hyst=0,push4imat=100,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc866aa0,_ctrlden=0x7fedfc845f38,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=20,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,
 regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fedfbc3a820,_xlast=0x7fedfbc3cbd0,_ylast=[0x7fedfc1d7e30,
 0x7fedfc1d7e30,0x7fedfc1d7e30],_y0=0x7fedfc166830,_signus=0x7fedfc17ac30,
 _puppixoffset=[0,0],_nact=148,_def=0x10f562030,_x=0x7fedfbc3bfd0,_y=
 0x7fedfbc3c260,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,_indval=0x7fedfc1e5e30,
 _indext=0x7fedfc134e30,_eiffile="sh12x12-if1-ext.fits",_edef=0x109abd030,_ex=
 0x7fedfbc3c4f0,_ey=0x7fedfbc3c860,_enact=204,_n1=182,_n2=331,_pupil=0x0,
 _command=0x7fedfbf15e10,_flat_command=0x0,_extrapcmat=0x102393030,_eltdefsize=
 0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc867670,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc846248,xposition=0x7fedfc867d08,yposition=
 0x7fedfc8672b8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc8671a0,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=2000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    882438.8

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      378.1   0.014      567.5
Field Avg  1.65                    378.1   0.014      567.5
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 //wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 //wfs(n).noise       = 1;
 //wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "stackarray";
 //dm(n).iffile	   = "";
 dm(n).nxact	       = 20;
 //dm(n).nzer         = 80;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.01;
 dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.6;
 loop.framedelay    = 1;
 loop.niter	       = 2000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051888,layerfrac=0x7fedfd051910,
 layerspeed=0x7fedfd051a20,layeralt=0x7fedfc84e4b0,winddir=0x7fedfc84d900,
 _layeralt=0x7fedfc84da10)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=0,ron=0,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=0,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,
 pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,
 shmethod=2,shnxsub=12,npixpersub=0,pixsize=1.19121,npixels=2,spotpitch=2,
 extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,shcalibseeing=
 0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",fssize=2.4,
 fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fedfc8672b8,lgs_prof_alt=0x7fedfc846248,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fedfbe4a7e0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fedfbe4a1e0,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x105a60030,_masks=0x0,_fluxpersub=0x7fedfbc2e590,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fedfbc35860,_skyfluxpersub=0x7fedfbc3db40,
 _nphotons=882439,_skynphotons=0,_tt=[-0.0218702,0.0854573],_lastvalidtt=
 [-0.0218702,0.0854573],_upttcommand=[0,0],_refmes=0x7fedfc0ff430,_tiprefv=
 0x7fedfc17a430,_tiltrefv=0x7fedfd0d5830,_tiprefvn=0x7fedfc1d7630,_tiltrefvn=
 0x7fedfd076e30,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fedfbe47910,_jstart=0x7fedfbe47b60,_binindices=0x7fedfd0e5430,
 _binxy=2,_centroidw=0x7fedfc867c98,_fimage=0x7fedfc16ba30,_fimage2=0x0,
 _imistart=0x7fedfbe4ade0,_imjstart=0x7fedfbe4b030,_imistart2=0x7fedfbe3dca0,
 _imjstart2=0x7fedfbe3def0,_unittip=0x7fedfbe3d990,_unittilt=0x7fedfbe42720,
 _lgs_defocuses=0x7fedfc8677c0,_unitdefocus=0x101d7d030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fedfd0e7630,_flat=0x7fedfd0e8030,_domask=1,
 _submask=0x7fedfc11bc30,_kernel=0x7fedfc1da630,_kernels=0x102229030,_kerfftr=
 0x10213e030,_kerffti=0x1020b1030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fedfc16da30,_x=0x7fedfd0c4630,_y=0x7fedfd0c4c30,_centroidgain=1,_rayleigh=
 0x7fedfc8677f8,_bckgrdcalib=0x7fedfd0e2230,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fedfc867018)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=100,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc845a68,_ctrlden=0x7fedfc840150,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=20,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,
 regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fedfd09b230,_xlast=0x7fedfd0eae30,_ylast=[0x7fedfd0eec30,
 0x7fedfd0eec30,0x7fedfd0eec30],_y0=0x7fedfd0ed430,_signus=0x7fedfd077630,
 _puppixoffset=[0,0],_nact=324,_def=0x109abd030,_x=0x7fedfd081230,_y=
 0x7fedfd0bc230,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,_indval=0x7fedfd0b2c30,
 _indext=0x7fedfbe45110,_eiffile="sh12x12-if1-ext.fits",_edef=0x107445030,_ex=
 0x7fedfc1e7898,_ey=0x7fedfc1e6e48,_enact=28,_n1=182,_n2=331,_pupil=0x0,
 _command=0x7fedfc057030,_flat_command=0x0,_extrapcmat=0x7fedfd0fa030,
 _eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc866aa0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc845f38,xposition=0x7fedfc8671d8,yposition=
 0x7fedfc866de8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc867440,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=2000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    882438.8
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 2000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0     7798.9   0.000     3455.8
Field Avg  1.65                   7798.9   0.000     3455.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 //wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 //wfs(n).noise       = 1;
 //wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 //dm(n).iffile	   = "";
 dm(n).nxact	       = 20;
 dm(n).nzer         = 80;
 dm(n).pitch	       = 6;
 //dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.01;
 dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.6;
 loop.framedelay    = 1;
 loop.niter	       = 2000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051910,layerfrac=0x7fedfd051a20,
 layerspeed=0x7fedfd051888,layeralt=0x7fedfc84e0f8,winddir=0x7fedfc84e868,
 _layeralt=0x7fedfc84da10)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=0,ron=0,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=0,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,
 pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,
 shmethod=2,shnxsub=12,npixpersub=0,pixsize=1.19121,npixels=2,spotpitch=2,
 extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,shcalibseeing=
 0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",fssize=2.4,
 fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fedfc866de8,lgs_prof_alt=0x7fedfc845f38,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fedfbc3dab0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fedfbe40c20,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x102898030,_masks=0x0,_fluxpersub=0x7fedfbe41310,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fedfbe41560,_skyfluxpersub=0x7fedfbe417b0,
 _nphotons=882439,_skynphotons=0,_tt=[0.000214677,6.53312e-05],_lastvalidtt=
 [0.000214677,6.53312e-05],_upttcommand=[0,0],_refmes=0x7fedfc121a30,_tiprefv=
 0x7fedfd0bca30,_tiltrefv=0x7fedfd0bc230,_tiprefvn=0x7fedfd0ed430,_tiltrefvn=
 0x7fedfd077830,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fedfbe40e70,_jstart=0x7fedfbe410c0,_binindices=0x7fedfc16d430,
 _binxy=2,_centroidw=0x7fedfc8670c0,_fimage=0x7fedfd081230,_fimage2=0x0,
 _imistart=0x7fedfbc3c550,_imjstart=0x7fedfbc36410,_imistart2=0x7fedfbc3d4d0,
 _imjstart2=0x7fedfbc3a9a0,_unittip=0x7fedfbe42720,_unittilt=0x7fedfbe45960,
 _lgs_defocuses=0x7fedfc866830,_unitdefocus=0x101f84030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fedfc1da630,_flat=0x7fedfc04d430,_domask=1,
 _submask=0x7fedfd0ee230,_kernel=0x7fedfc15e630,_kernels=0x102817030,_kerfftr=
 0x10213e030,_kerffti=0x1020b1030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fedfd076e30,_x=0x7fedfd0b3a30,_y=0x7fedfd0e9e30,_centroidgain=1,_rayleigh=
 0x7fedfc845b10,_bckgrdcalib=0x7fedfc04de30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fedfd0e9300)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=6,alt=0,hyst=0,push4imat=100,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc867440,_ctrlden=0x7fedfc867558,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=20,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbc361c0,_xlast=0x7fedfbc3a820,_ylast=[0x7fedfc11c830,0x7fedfc11c830,
 0x7fedfc11c830],_y0=0x7fedfc0ff430,_signus=0x7fedfbc3c290,_puppixoffset=[0,0],
 _nact=80,_def=0x108927030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fedfbe45b90,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc8677f8,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc840150,xposition=0x7fedfc8677c0,yposition=
 0x7fedfc867c98,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc8672b8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=2000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    882438.8
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 2000 iterations
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    882438.8
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 2000 iterations
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    882438.8
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 2000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.8   0.555      135.1
Field Avg  1.65                     54.8   0.555      135.1
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 //wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 //wfs(n).noise       = 1;
 //wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).nzer         = 80;
 //dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.6;
 loop.framedelay    = 1;
 loop.niter	       = 2000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfc84e4b0,layerfrac=0x7fedfd051888,
 layerspeed=0x7fedfd051910,layeralt=0x7fedfc84da10,winddir=0x7fedfc84d900,
 _layeralt=0x7fedfd050de8)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=0,ron=0,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=0,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,
 pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,
 shmethod=2,shnxsub=12,npixpersub=0,pixsize=1.19121,npixels=2,spotpitch=2,
 extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,shcalibseeing=
 0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",fssize=2.4,
 fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fedfc845b10,lgs_prof_alt=0x7fedfc8674e8,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fedfbe4c3e0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fedfbf0d750,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x105b61030,_masks=0x0,_fluxpersub=0x7fedfbd0a7e0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fedfbd0bb10,_skyfluxpersub=0x7fedfbd09870,
 _nphotons=882439,_skynphotons=0,_tt=[0.000388243,0.0030352],_lastvalidtt=
 [0.000388243,0.0030352],_upttcommand=[0,0],_refmes=0x7fedfc83d030,_tiprefv=
 0x7fedfd82c030,_tiltrefv=0x7fedfd0e5a30,_tiprefvn=0x7fedfd828830,_tiltrefvn=
 0x7fedfd0e2230,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fedfbf0ddd0,_jstart=0x7fedfbf0e020,_binindices=0x7fedfc16ec30,
 _binxy=2,_centroidw=0x7fedfc866d08,_fimage=0x7fedfd0b3c30,_fimage2=0x0,
 _imistart=0x7fedfbc33210,_imjstart=0x7fedfbc371c0,_imistart2=0x7fedfbc37410,
 _imjstart2=0x7fedfbc37660,_unittip=0x7fedfbf0d2f0,_unittilt=0x7fedfbf0d520,
 _lgs_defocuses=0x7fedfc867de8,_unitdefocus=0x104ede030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fedfd825230,_flat=0x7fedfd824830,_domask=1,
 _submask=0x7fedfd0bc230,_kernel=0x7fedfd0dfc30,_kernels=0x1025d2030,_kerfftr=
 0x102bed030,_kerffti=0x1021f3030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fedfd081230,_x=0x7fedfc87ec30,_y=0x7fedfc87f230,_centroidgain=1,_rayleigh=
 0x7fedfc1333f0,_bckgrdcalib=0x7fedfd829a30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fedfc866bb8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=0,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc845fe0,_ctrlden=0x7fedfc867c98,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbd0bd80,_xlast=0x7fedfbd0bf00,_ylast=[0x7fedfd82b430,0x7fedfd82b430,
 0x7fedfd82b430],_y0=0x7fedfd826030,_signus=0x7fedfbd0c080,_puppixoffset=[0,0],
 _nact=80,_def=0x109abd030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fedfbe45bc0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc866e20,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc845f38,xposition=0x7fedfc846210,yposition=
 0x7fedfc8677f8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc867280,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=2000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    882438.8
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 1), 120 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 2000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      143.7   0.082      331.1
Field Avg  1.65                    143.7   0.082      331.1
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 //wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 1; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 //wfs(n).noise       = 1;
 //wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).nzer         = 80;
 //dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.6;
 loop.framedelay    = 1;
 loop.niter	       = 2000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051888,layerfrac=0x7fedfd051910,
 layerspeed=0x7fedfc84e4b0,layeralt=0x7fedfd051a20,winddir=0x7fedfc84e868,
 _layeralt=0x7fedfd050de8)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=0,ron=0,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=0,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,
 pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,
 shmethod=1,shnxsub=12,npixpersub=0,pixsize=1.19121,npixels=2,spotpitch=2,
 extfield=2.38243,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=
 0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",fssize=2.4,
 fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fedfc8677f8,lgs_prof_alt=0x7fedfc845f38,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=1,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fedfbe4dab0,
 _origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,_nsub4disp=120,
 _nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x102292030,
 _masks=0x0,_fluxpersub=0x7fedfbe4ea70,_rayleighflux=0x0,_sodiumflux=0x0,
 _raylfluxpersub=0x7fedfbe4ec90,_skyfluxpersub=0x7fedfbe4eeb0,_nphotons=882439,
 _skynphotons=0,_tt=[0.0109677,0.111806],_lastvalidtt=[0.0109677,0.111806],
 _upttcommand=[0,0],_refmes=0x7fedfc036430,_tiprefv=0x7fedfc17a430,_tiltrefv=
 0x7fedfc87ec30,_tiprefvn=0x7fedfc164c30,_tiltrefvn=0x7fedfc887c30,_reordervec=
 0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,_istart=0x7fedfbe4dcd0,
 _jstart=0x7fedfbe4def0,_binindices=0x7fedfd0e5430,_binxy=2,_centroidw=
 0x7fedfc866e20,_fimage=0x7fedfd076e30,_fimage2=0x0,_imistart=0x7fedfbe4e550,
 _imjstart=0x7fedfbe4f6d0,_imistart2=0x7fedfbe4f8f0,_imjstart2=0x7fedfbe4fb10,
 _unittip=0x7fedfbe45110,_unittilt=0x7fedfbe4cba0,_lgs_defocuses=0x7fedfc867718,
 _unitdefocus=0x1029f1030,_fimnx=24,_fimny=24,_fimny2=0x0,_yoffset=0x0,_bias=
 0x7fedfd0c4630,_flat=0x7fedfd081230,_domask=1,_submask=0x7fedfd0ed430,_kernel=
 0x7fedfd0bc230,_kernels=0x101eca030,_kerfftr=0x102bed030,_kerffti=0x1021f3030,
 _kernelconv=0,_cyclecounter=1,_dispimage=0x7fedfd0e8230,_x=0x7fedfd0b5e30,_y=
 0x7fedfd0b4e30,_centroidgain=1,_rayleigh=0x7fedfc867638,_bckgrdcalib=
 0x7fedfd0c5030,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=1e+11,
 _pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,
 _LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,
 _nkernels=1,_dmnotinpath=0x7fedfc867590)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=0,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc845a68,_ctrlden=0x7fedfc867018,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbc361c0,_xlast=0x7fedfbc3ad30,_ylast=[0x7fedfc0ff430,0x7fedfc0ff430,
 0x7fedfc0ff430],_y0=0x7fedfc17da30,_signus=0x7fedfbc36410,_puppixoffset=[0,0],
 _nact=80,_def=0x106c66030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fedfbd09870,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc1333f0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc867c98,xposition=0x7fedfc867de8,yposition=
 0x7fedfc866d08,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc845b10,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=2000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    882438.8
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 1), 120 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 2000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0      146.1   0.077      337.8
Field Avg  1.65                    146.1   0.077      337.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 //wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 1; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 //wfs(n).noise       = 1;
 //wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).nzer         = 80;
 //dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.2;
 loop.framedelay    = 1;
 loop.niter	       = 2000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051910,layerfrac=0x7fedfc84e4b0,
 layerspeed=0x7fedfd051888,layeralt=0x7fedfc84d900,winddir=0x7fedfc84da10,
 _layeralt=0x7fedfd050de8)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=0,ron=0,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=0,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,
 pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,
 shmethod=1,shnxsub=12,npixpersub=0,pixsize=1.19121,npixels=2,spotpitch=2,
 extfield=2.38243,pupoffset=[0,0],shthmethod=0,shthreshold=0,shcalibseeing=
 0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",fssize=2.4,
 fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fedfc866d08,lgs_prof_alt=0x7fedfc867c98,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=1,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fedfbc35180,
 _origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,_nsub4disp=120,
 _nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x101d7d030,
 _masks=0x0,_fluxpersub=0x7fedfbc3e800,_rayleighflux=0x0,_sodiumflux=0x0,
 _raylfluxpersub=0x7fedfbc3ea20,_skyfluxpersub=0x7fedfbe45130,_nphotons=882439,
 _skynphotons=0,_tt=[0.00853547,0.111026],_lastvalidtt=[0.00853547,0.111026],
 _upttcommand=[0,0],_refmes=0x7fedfd0b4e30,_tiprefv=0x7fedfd0e7230,_tiltrefv=
 0x7fedfc1da630,_tiprefvn=0x7fedfd0e7a30,_tiltrefvn=0x7fedfc04de30,_reordervec=
 0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,_istart=0x7fedfbc3d700,
 _jstart=0x7fedfbc3d920,_binindices=0x7fedfc11bc30,_binxy=2,_centroidw=
 0x7fedfc1333f0,_fimage=0x7fedfc134230,_fimage2=0x0,_imistart=0x7fedfbc3df80,
 _imjstart=0x7fedfbc3e1a0,_imistart2=0x7fedfbc3e3c0,_imjstart2=0x7fedfbc3e5e0,
 _unittip=0x7fedfbc33210,_unittilt=0x7fedfbc3d4d0,_lgs_defocuses=0x7fedfc867aa0,
 _unitdefocus=0x102716030,_fimnx=24,_fimny=24,_fimny2=0x0,_yoffset=0x0,_bias=
 0x7fedfd077830,_flat=0x7fedfd081230,_domask=1,_submask=0x7fedfc17ba30,_kernel=
 0x7fedfc15e630,_kernels=0x1025d2030,_kerfftr=0x1021f3030,_kerffti=0x101eca030,
 _kernelconv=0,_cyclecounter=1,_dispimage=0x7fedfc134c30,_x=0x7fedfc0ff430,_y=
 0x7fedfc060a30,_centroidgain=1,_rayleigh=0x7fedfc8670c0,_bckgrdcalib=
 0x7fedfd0dfc30,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=1e+11,
 _pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,
 _LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,
 _nkernels=1,_dmnotinpath=0x7fedfc8671a0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=0,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc866bb8,_ctrlden=0x7fedfc867520,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbf0e380,_xlast=0x7fedfbf0e500,_ylast=[0x7fedfc89a230,0x7fedfc89a230,
 0x7fedfc89a230],_y0=0x7fedfc83d030,_signus=0x7fedfbf0e680,_puppixoffset=[0,0],
 _nact=80,_def=0x1096bd030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fedfbc3db40,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc867638,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc867018,xposition=0x7fedfc867718,yposition=
 0x7fedfc866e20,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc8677f8,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.2,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=2000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    882438.8
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 2000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       55.4   0.534      152.0
Field Avg  1.65                     55.4   0.534      152.0
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 //wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 //wfs(n).noise       = 1;
 //wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).nzer         = 80;
 //dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.2;
 loop.framedelay    = 1;
 loop.niter	       = 2000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfc84e4b0,layerfrac=0x7fedfd051888,
 layerspeed=0x7fedfd051910,layeralt=0x7fedfc84e868,winddir=0x7fedfd051a20,
 _layeralt=0x7fedfd050de8)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=0,ron=0,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=0,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,
 pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,
 shmethod=2,shnxsub=12,npixpersub=0,pixsize=1.19121,npixels=2,spotpitch=2,
 extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,shcalibseeing=
 0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",fssize=2.4,
 fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fedfc866e20,lgs_prof_alt=0x7fedfc867018,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fedfbd0a450,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fedfbc3dab0,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x104ede030,_masks=0x0,_fluxpersub=0x7fedfbe4d590,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fedfbe41310,_skyfluxpersub=0x7fedfbe41560,
 _nphotons=882439,_skynphotons=0,_tt=[0.000538176,0.00245693],_lastvalidtt=
 [0.000538176,0.00245693],_upttcommand=[0,0],_refmes=0x7fedfd0b4e30,_tiprefv=
 0x7fedfc134230,_tiltrefv=0x7fedfc121430,_tiprefvn=0x7fedfc134a30,_tiltrefvn=
 0x7fedfc17c430,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fedfbc3dd00,_jstart=0x7fedfbc3ebf0,_binindices=0x7fedfd076e30,
 _binxy=2,_centroidw=0x7fedfc866b80,_fimage=0x7fedfd0ed430,_fimage2=0x0,
 _imistart=0x7fedfbe410c0,_imjstart=0x7fedfbe4c260,_imistart2=0x7fedfbe4ba10,
 _imjstart2=0x7fedfbe4d340,_unittip=0x7fedfbc3e740,_unittilt=0x7fedfbc35860,
 _lgs_defocuses=0x7fedfc8671d8,_unitdefocus=0x101f84030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fedfd162230,_flat=0x7fedfd081230,_domask=1,
 _submask=0x7fedfd0c5a30,_kernel=0x7fedfd161430,_kernels=0x102259030,_kerfftr=
 0x1025d2030,_kerffti=0x1021f3030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fedfd0ede30,_x=0x7fedfc049830,_y=0x7fedfc04b430,_centroidgain=1,_rayleigh=
 0x7fedfc867638,_bckgrdcalib=0x7fedfd0c6830,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fedfc845b10)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=0,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc867590,_ctrlden=0x7fedfc845a68,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbe45bc0,_xlast=0x7fedfbe4c0e0,_ylast=[0x7fedfd0b5e30,0x7fedfd0b5e30,
 0x7fedfd0b5e30],_y0=0x7fedfd01e830,_signus=0x7fedfbe4cf20,_puppixoffset=[0,0],
 _nact=80,_def=0x109d9b030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fedfbe4d7e0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc8670c0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc867520,xposition=0x7fedfc867aa0,yposition=
 0x7fedfc1333f0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc866d08,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.2,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=2000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    8824.4
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 2000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       55.4   0.534      152.0
Field Avg  1.65                     55.4   0.534      152.0
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 //wfs(n).noise       = 1;
 //wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).nzer         = 80;
 //dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.2;
 loop.framedelay    = 1;
 loop.niter	       = 2000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051888,layerfrac=0x7fedfd051910,
 layerspeed=0x7fedfc84e4b0,layeralt=0x7fedfc84da10,winddir=0x7fedfc84d900,
 _layeralt=0x7fedfd050de8)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=0,ron=0,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,
 pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,
 shmethod=2,shnxsub=12,npixpersub=0,pixsize=1.19121,npixels=2,spotpitch=2,
 extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,shcalibseeing=
 0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",fssize=2.4,
 fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fedfc1333f0,lgs_prof_alt=0x7fedfc867520,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fedfbf0ce40,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fedfbe40c20,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x1029f1030,_masks=0x0,_fluxpersub=0x7fedfbe3f1a0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fedfbe41310,_skyfluxpersub=0x7fedfbe4ba10,
 _nphotons=8824.39,_skynphotons=0,_tt=[0.000538165,0.00245687],_lastvalidtt=
 [0.000538165,0.00245687],_upttcommand=[0,0],_refmes=0x7fedfc17ae30,_tiprefv=
 0x7fedfd077c30,_tiltrefv=0x7fedfc1d7630,_tiprefvn=0x7fedfd0e9e30,_tiltrefvn=
 0x7fedfc1d7e30,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fedfbe40e70,_jstart=0x7fedfbe410c0,_binindices=0x7fedfc11bc30,
 _binxy=2,_centroidw=0x7fedfc867bb8,_fimage=0x7fedfc17c430,_fimage2=0x0,
 _imistart=0x7fedfbc3de40,_imjstart=0x7fedfbc3e090,_imistart2=0x7fedfbc3e2e0,
 _imjstart2=0x7fedfbc3e530,_unittip=0x7fedfbe45110,_unittilt=0x7fedfbe4c6b0,
 _lgs_defocuses=0x7fedfc866aa0,_unitdefocus=0x106b65030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fedfc132630,_flat=0x7fedfc053030,_domask=1,
 _submask=0x7fedfd076e30,_kernel=0x7fedfd835830,_kernels=0x102bed030,_kerfftr=
 0x1025d2030,_kerffti=0x1021f3030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fedfd0bc830,_x=0x7fedfd081230,_y=0x7fedfd0bc230,_centroidgain=1,_rayleigh=
 0x7fedfc8670c0,_bckgrdcalib=0x7fedfc166430,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fedfd0e9300)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=0,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc866d08,_ctrlden=0x7fedfc866bb8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbc361c0,_xlast=0x7fedfbc35180,_ylast=[0x7fedfc073c30,0x7fedfc073c30,
 0x7fedfc073c30],_y0=0x7fedfc0ff430,_signus=0x7fedfbc3fce0,_puppixoffset=[0,0],
 _nact=80,_def=0x108fdf030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fedfbd09a20,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc867590,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc845a68,xposition=0x7fedfc8671d8,yposition=
 0x7fedfc866b80,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc866e20,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.2,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=2000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    8824.4
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.9   0.527      158.8
Field Avg  1.65                     54.9   0.527      158.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 //wfs(n).noise       = 1;
 //wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).nzer         = 80;
 //dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.2;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fedfd051910,layerfrac=0x7fedfc84e4b0,
 layerspeed=0x7fedfd051888,layeralt=0x7fedfd051a20,winddir=0x7fedfc84e868,
 _layeralt=0x7fedfd050de8)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=0,ron=0,darkcurrent=
 0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,nsubperring=0x0,
 angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,
 pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,
 shmethod=2,shnxsub=12,npixpersub=0,pixsize=1.19121,npixels=2,spotpitch=2,
 extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,shcalibseeing=
 0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",fssize=2.4,
 fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],
 LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fedfc866b80,lgs_prof_alt=0x7fedfc845a68,nzer=0,
 ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fedfbc3ec60,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fedfbe3f8f0,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x102716030,_masks=0x0,_fluxpersub=0x7fedfbe45110,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fedfbe4c330,_skyfluxpersub=0x7fedfbe4c580,
 _nphotons=8824.39,_skynphotons=0,_tt=[0.00230778,0.00246452],_lastvalidtt=
 [0.00230778,0.00246452],_upttcommand=[0,0],_refmes=0x7fedfc17ae30,_tiprefv=
 0x7fedfd0bc230,_tiltrefv=0x7fedfd0e9e30,_tiprefvn=0x7fedfd0bca30,_tiltrefvn=
 0x7fedfd0edc30,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fedfbe4ba10,_jstart=0x7fedfbe4c0e0,_binindices=0x7fedfc052230,
 _binxy=2,_centroidw=0x7fedfc8677c0,_fimage=0x7fedfc04d430,_fimage2=0x0,
 _imistart=0x7fedfbc44ec0,_imjstart=0x7fedfbc3d720,_imistart2=0x7fedfbc3d970,
 _imjstart2=0x7fedfbc3de80,_unittip=0x7fedfbe3f490,_unittilt=0x7fedfbe3f6c0,
 _lgs_defocuses=0x7fedfc866db0,_unitdefocus=0x105b61030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fedfc04de30,_flat=0x7fedfc224c30,_domask=1,
 _submask=0x7fedfd0b2c30,_kernel=0x7fedfc16ee30,_kernels=0x102259030,_kerfftr=
 0x1025d2030,_kerffti=0x1021f3030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fedfc16e230,_x=0x7fedfd0dfc30,_y=0x7fedfd0c6630,_centroidgain=1,_rayleigh=
 0x7fedfc867590,_bckgrdcalib=0x7fedfc17ba30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fedfc8671a0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=0,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fedfc845b10,_ctrlden=0x7fedfc867718,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fedfbc361c0,_xlast=0x7fedfbc33390,_ylast=[0x7fedfc17da30,0x7fedfc17da30,
 0x7fedfc17da30],_y0=0x7fedfc0ff430,_signus=0x7fedfbc3dbc0,_puppixoffset=[0,0],
 _nact=80,_def=0x1096bd030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fedfbd09870,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fedfc866d08,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fedfc866bb8,xposition=0x7fedfc866aa0,yposition=
 0x7fedfc867bb8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fedfc1333f0,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.2,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    8824.4
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    8824.4
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.9   0.527      158.8
Field Avg  1.65                     54.9   0.527      158.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 //dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.2;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873288,layerfrac=0x7fee59873398,
 layerspeed=0x7fee59873310,layeralt=0x7fee591541e8,winddir=0x7fee59154518,
 _layeralt=0x7fee598727e8)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916b790,lgs_prof_alt=0x7fee5916c330,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58d262b0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58d2fda0,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x10f706030,_masks=0x0,_fluxpersub=0x7fee58f03140,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58f03390,_skyfluxpersub=0x7fee58f035e0,
 _nphotons=8824.39,_skynphotons=0,_tt=[0.00230778,0.00246452],_lastvalidtt=
 [0.00230778,0.00246452],_upttcommand=[0,0],_refmes=0x7fee598b2830,_tiprefv=
 0x7fee5a000a30,_tiltrefv=0x7fee59284a30,_tiprefvn=0x7fee5a022c30,_tiltrefvn=
 0x7fee5927d430,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58d2fff0,_jstart=0x7fee58d30240,_binindices=0x7fee5922d830,
 _binxy=2,_centroidw=0x7fee5916c3d8,_fimage=0x7fee59864a30,_fimage2=0x0,
 _imistart=0x7fee58c52720,_imjstart=0x7fee58c57ee0,_imistart2=0x7fee58c58130,
 _imjstart2=0x7fee58c58380,_unittip=0x7fee58d2fae0,_unittilt=0x7fee58d21870,
 _lgs_defocuses=0x7fee5916b988,_unitdefocus=0x113c97030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee5a823a30,_flat=0x7fee5a802e30,_domask=1,
 _submask=0x7fee5a822c30,_kernel=0x7fee5925ca30,_kernels=0x10f19a030,_kerfftr=
 0x10ee83030,_kerffti=0x1125dd030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee598b8a30,_x=0x7fee5989ae30,_y=0x7fee598abc30,_centroidgain=1,_rayleigh=
 0x7fee5916b838,_bckgrdcalib=0x7fee5a824430,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5914bd48)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=0,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916bf08,_ctrlden=0x7fee5914c138,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c53860,_xlast=0x7fee58c573e0,_ylast=[0x7fee59285230,0x7fee59285230,
 0x7fee59285230],_y0=0x7fee591b1c30,_signus=0x7fee58c57560,_puppixoffset=[0,0],
 _nact=80,_def=0x11680d030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58c53610,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5914c3a0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5916c448,xposition=0x7fee5916b8a8,yposition=
 0x7fee5916b800,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5914c100,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.2,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    8824.4
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.9   0.527      158.8
Field Avg  1.65                     54.9   0.527      158.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.2;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873398,layerfrac=0x7fee59873310,
 layerspeed=0x7fee59873288,layeralt=0x7fee59873200,winddir=0x7fee598728f8,
 _layeralt=0x7fee598727e8)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916b800,lgs_prof_alt=0x7fee5916c448,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58d2f1c0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58d27300,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x1120f7030,_masks=0x0,_fluxpersub=0x7fee58d30dd0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58d31020,_skyfluxpersub=0x7fee58d31270,
 _nphotons=8824.39,_skynphotons=0,_tt=[0.00230778,0.00246452],_lastvalidtt=
 [0.00230778,0.00246452],_upttcommand=[0,0],_refmes=0x7fee5a016430,_tiprefv=
 0x7fee59964c30,_tiltrefv=0x7fee59964430,_tiprefvn=0x7fee59965430,_tiltrefvn=
 0x7fee59865230,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58d306d0,_jstart=0x7fee58d30920,_binindices=0x7fee59227e30,
 _binxy=2,_centroidw=0x7fee5916b870,_fimage=0x7fee59993830,_fimage2=0x0,
 _imistart=0x7fee58c58020,_imjstart=0x7fee58c58270,_imistart2=0x7fee58c584c0,
 _imjstart2=0x7fee58c52460,_unittip=0x7fee58d284a0,_unittilt=0x7fee58d270d0,
 _lgs_defocuses=0x7fee5916bf40,_unitdefocus=0x112760030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee59969c30,_flat=0x7fee59969230,_domask=1,
 _submask=0x7fee59968430,_kernel=0x7fee59223230,_kernels=0x10efee030,_kerfftr=
 0x10ef35030,_kerffti=0x10ee83030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee598aec30,_x=0x7fee598a8430,_y=0x7fee598a8a30,_centroidgain=1,_rayleigh=
 0x7fee5916bc68,_bckgrdcalib=0x7fee59224030,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916bdb8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916bfe8,_ctrlden=0x7fee5914c3d8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58d2f5d0,_xlast=0x7fee58d302c0,_ylast=[0x7fee598b2830,0x7fee598b2830,
 0x7fee598b2830],_y0=0x7fee59822830,_signus=0x7fee58d28060,_puppixoffset=[0,0],
 _nact=80,_def=0x116054030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58d25ad0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916bf08,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5914c138,xposition=0x7fee5916b988,yposition=
 0x7fee5916c3d8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5916b790,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.2,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    8824.4
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       57.0   0.421      226.3
Field Avg  1.65                     57.0   0.421      226.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.2;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873398,layerfrac=0x7fee59873310,
 layerspeed=0x7fee59873288,layeralt=0x7fee59873200,winddir=0x7fee598728f8,
 _layeralt=0x7fee591546b0)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916b800,lgs_prof_alt=0x7fee5916c448,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58d22ef0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58d21bf0,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x111df4030,_masks=0x0,_fluxpersub=0x7fee58c56000,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58c52460,_skyfluxpersub=0x7fee58c569b0,
 _nphotons=8824.39,_skynphotons=0,_tt=[0.00276647,0.005492],_lastvalidtt=
 [0.00276647,0.005492],_upttcommand=[0,0],_refmes=0x7fee59082430,_tiprefv=
 0x7fee5989b430,_tiltrefv=0x7fee599a9230,_tiprefvn=0x7fee59964c30,_tiltrefvn=
 0x7fee59964430,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58d21e40,_jstart=0x7fee58d22430,_binindices=0x7fee599a6030,
 _binxy=2,_centroidw=0x7fee5916bd80,_fimage=0x7fee598c7e30,_fimage2=0x0,
 _imistart=0x7fee58d22b20,_imjstart=0x7fee58d30880,_imistart2=0x7fee58d270d0,
 _imjstart2=0x7fee58d27320,_unittip=0x7fee58d20df0,_unittilt=0x7fee58d30080,
 _lgs_defocuses=0x7fee5914bd10,_unitdefocus=0x10fac4030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee59214e30,_flat=0x7fee598aec30,_domask=1,
 _submask=0x7fee59215830,_kernel=0x7fee598c8830,_kernels=0x10f180030,_kerfftr=
 0x10f11a030,_kerffti=0x10efee030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee599a7e30,_x=0x7fee598b8830,_y=0x7fee59865230,_centroidgain=1,_rayleigh=
 0x7fee5916bc68,_bckgrdcalib=0x7fee599a8830,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916bed0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916bdb8,_ctrlden=0x7fee5916bfe8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c538f0,_xlast=0x7fee58c53090,_ylast=[0x7fee59081430,0x7fee59081430,
 0x7fee59081430],_y0=0x7fee5922f630,_signus=0x7fee58c566f0,_puppixoffset=[0,0],
 _nact=80,_def=0x115298030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58e06300,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916bf08,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5914c138,xposition=0x7fee5916c330,yposition=
 0x7fee5914c2c0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5916b790,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.1,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    8824.4
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    8824.4
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.4   0.544      148.6
Field Avg  1.65                     54.4   0.544      148.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.2;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873398,layerfrac=0x7fee59873310,
 layerspeed=0x7fee59873288,layeralt=0x7fee59873200,winddir=0x7fee598728f8,
 _layeralt=0x7fee59153c10)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916b800,lgs_prof_alt=0x7fee5916c448,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58f03be0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58d28290,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x114098030,_masks=0x0,_fluxpersub=0x7fee58c54e40,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58c55090,_skyfluxpersub=0x7fee58c552e0,
 _nphotons=8824.39,_skynphotons=0,_tt=[0.00148985,0.00096981],_lastvalidtt=
 [0.00148985,0.00096981],_upttcommand=[0,0],_refmes=0x7fee59176230,_tiprefv=
 0x7fee59218030,_tiltrefv=0x7fee598a9630,_tiprefvn=0x7fee59216830,_tiltrefvn=
 0x7fee59865230,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58d306d0,_jstart=0x7fee58d284e0,_binindices=0x7fee5922d830,
 _binxy=2,_centroidw=0x7fee5916c330,_fimage=0x7fee598bf430,_fimage2=0x0,
 _imistart=0x7fee58c542d0,_imjstart=0x7fee58c54520,_imistart2=0x7fee58c549a0,
 _imjstart2=0x7fee58c54bf0,_unittip=0x7fee58d28060,_unittilt=0x7fee58d20df0,
 _lgs_defocuses=0x7fee591429c0,_unitdefocus=0x1121f8030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee5928c230,_flat=0x7fee598e1e30,_domask=1,
 _submask=0x7fee5928f630,_kernel=0x7fee598ab030,_kernels=0x10efec030,_kerfftr=
 0x10f31b030,_kerffti=0x10ee85030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee598aec30,_x=0x7fee598b8e30,_y=0x7fee598a8c30,_centroidgain=1,_rayleigh=
 0x7fee5916c560,_bckgrdcalib=0x7fee598e2830,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5914c2c0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916c218,_ctrlden=0x7fee5916bdb8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c56c10,_xlast=0x7fee58c564a0,_ylast=[0x7fee5922f630,0x7fee5922f630,
 0x7fee5922f630],_y0=0x7fee59082430,_signus=0x7fee58c56000,_puppixoffset=[0,0],
 _nact=80,_def=0x114199030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58f029d0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916bf08,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5914c138,xposition=0x7fee5916b9c0,yposition=
 0x7fee5916bed0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5916b790,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.3,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    8824.4
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.7   0.548      145.3
Field Avg  1.65                     54.7   0.548      145.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.2;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873398,layerfrac=0x7fee59873310,
 layerspeed=0x7fee59873288,layeralt=0x7fee59873200,winddir=0x7fee598728f8,
 _layeralt=0x7fee591548d0)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916b800,lgs_prof_alt=0x7fee5916c448,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58d21bf0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58e066a0,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x112760030,_masks=0x0,_fluxpersub=0x7fee58c55700,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58c55950,_skyfluxpersub=0x7fee58c55ba0,
 _nphotons=8824.39,_skynphotons=0,_tt=[0.000462957,0.000134901],_lastvalidtt=
 [0.000462957,0.000134901],_upttcommand=[0,0],_refmes=0x7fee59822830,_tiprefv=
 0x7fee5a822430,_tiltrefv=0x7fee5928de30,_tiprefvn=0x7fee5a81d630,_tiltrefvn=
 0x7fee5928e630,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58e07260,_jstart=0x7fee58e074b0,_binindices=0x7fee5922d830,
 _binxy=2,_centroidw=0x7fee59142a30,_fimage=0x7fee598f3a30,_fimage2=0x0,
 _imistart=0x7fee58c54dc0,_imjstart=0x7fee58c55010,_imistart2=0x7fee58c55260,
 _imjstart2=0x7fee58c554b0,_unittip=0x7fee58e06ce0,_unittilt=0x7fee58e05f80,
 _lgs_defocuses=0x7fee5916c138,_unitdefocus=0x111cf3030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee598a8c30,_flat=0x7fee598a9630,_domask=1,
 _submask=0x7fee59293030,_kernel=0x7fee59292230,_kernels=0x10f11a030,_kerfftr=
 0x10ee85030,_kerffti=0x10efec030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee598f4a30,_x=0x7fee5a000630,_y=0x7fee5a01b430,_centroidgain=1,_rayleigh=
 0x7fee5916c560,_bckgrdcalib=0x7fee598ba430,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5914c410)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5914c3d8,_ctrlden=0x7fee5916c218,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58f03a60,_xlast=0x7fee58f03be0,_ylast=[0x7fee5a824830,0x7fee5a824830,
 0x7fee5a824830],_y0=0x7fee5a801230,_signus=0x7fee58f04080,_puppixoffset=[0,0],
 _nact=80,_def=0x115197030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58c56b60,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916bf08,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5914c138,xposition=0x7fee5916bdf0,yposition=
 0x7fee5916b838,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5916b790,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.4,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    8824.4
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    8824.4
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.7   0.549      141.9
Field Avg  1.65                     54.7   0.549      141.9
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.2;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873398,layerfrac=0x7fee59873310,
 layerspeed=0x7fee59873288,layeralt=0x7fee59873200,winddir=0x7fee598728f8,
 _layeralt=0x7fee591539f0)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916b800,lgs_prof_alt=0x7fee5916c448,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58c526c0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58d26910,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x10f706030,_masks=0x0,_fluxpersub=0x7fee58d306d0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58d30920,_skyfluxpersub=0x7fee58d30b70,
 _nphotons=8824.39,_skynphotons=0,_tt=[-0.00040061,-0.00041062],_lastvalidtt=
 [-0.00040061,-0.00041062],_upttcommand=[0,0],_refmes=0x7fee59157830,_tiprefv=
 0x7fee5922a430,_tiltrefv=0x7fee59291a30,_tiprefvn=0x7fee59293030,_tiltrefvn=
 0x7fee5922ac30,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58d30060,_jstart=0x7fee58d21e20,_binindices=0x7fee5922d830,
 _binxy=2,_centroidw=0x7fee5916bdf0,_fimage=0x7fee598f1830,_fimage2=0x0,
 _imistart=0x7fee58c58110,_imjstart=0x7fee58c58360,_imistart2=0x7fee58c556f0,
 _imjstart2=0x7fee58c53e30,_unittip=0x7fee58d21bf0,_unittilt=0x7fee58d26390,
 _lgs_defocuses=0x7fee5916be60,_unitdefocus=0x10eeeb030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee59284c30,_flat=0x7fee59226630,_domask=1,
 _submask=0x7fee598dfa30,_kernel=0x7fee59288630,_kernels=0x10efec030,_kerfftr=
 0x10f41c030,_kerffti=0x10f180030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee598aec30,_x=0x7fee598ab030,_y=0x7fee598b8830,_centroidgain=1,_rayleigh=
 0x7fee59142988,_bckgrdcalib=0x7fee59227030,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916b838)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916c5d0,_ctrlden=0x7fee5914c3d8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c56e90,_xlast=0x7fee58c57010,_ylast=[0x7fee59286a30,0x7fee59286a30,
 0x7fee59286a30],_y0=0x7fee59176230,_signus=0x7fee58c55fb0,_puppixoffset=[0,0],
 _nact=80,_def=0x115197030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58d25b30,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916bf08,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5914c138,xposition=0x7fee5914c410,yposition=
 0x7fee5916bd10,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5916b790,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    8824.4
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.7   0.548      141.9
Field Avg  1.65                     54.7   0.548      141.9
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.2;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873398,layerfrac=0x7fee59873310,
 layerspeed=0x7fee59873288,layeralt=0x7fee59873200,winddir=0x7fee598728f8,
 _layeralt=0x7fee59153c98)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916b800,lgs_prof_alt=0x7fee5916c448,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58c538f0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58d21bf0,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x1121f8030,_masks=0x0,_fluxpersub=0x7fee58c543d0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58c58540,_skyfluxpersub=0x7fee58c58790,
 _nphotons=8824.39,_skynphotons=0,_tt=[-0.00133284,-0.00135035],_lastvalidtt=
 [-0.00133284,-0.00135035],_upttcommand=[0,0],_refmes=0x7fee59822830,_tiprefv=
 0x7fee598e3030,_tiltrefv=0x7fee5a000a30,_tiprefvn=0x7fee598e3830,_tiltrefvn=
 0x7fee5a018430,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58d2f040,_jstart=0x7fee58d20df0,_binindices=0x7fee5a017230,
 _binxy=2,_centroidw=0x7fee5916c4b8,_fimage=0x7fee59291830,_fimage2=0x0,
 _imistart=0x7fee58e06c50,_imjstart=0x7fee58e06ea0,_imistart2=0x7fee58e070f0,
 _imjstart2=0x7fee58e07340,_unittip=0x7fee58d26130,_unittilt=0x7fee58d302b0,
 _lgs_defocuses=0x7fee5914c2c0,_unitdefocus=0x1123f9030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee59229e30,_flat=0x7fee59905230,_domask=1,
 _submask=0x7fee5922d830,_kernel=0x7fee5a01f830,_kernels=0x10ee85030,_kerfftr=
 0x10f180030,_kerffti=0x10efec030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee59286030,_x=0x7fee598ab030,_y=0x7fee598ab630,_centroidgain=1,_rayleigh=
 0x7fee59142988,_bckgrdcalib=0x7fee598af230,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916c410)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916bdb8,_ctrlden=0x7fee5916c5d0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c60540,_xlast=0x7fee58c606c0,_ylast=[0x7fee59176230,0x7fee59176230,
 0x7fee59176230],_y0=0x7fee5906bc30,_signus=0x7fee58c56e20,_puppixoffset=[0,0],
 _nact=80,_def=0x11459a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58f029d0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916bf08,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5914c138,xposition=0x7fee5916c330,yposition=
 0x7fee5916bfe8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5916b790,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    8824.4
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       55.4   0.515      165.5
Field Avg  1.65                     55.4   0.515      165.5
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.2;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873398,layerfrac=0x7fee59873310,
 layerspeed=0x7fee59873288,layeralt=0x7fee59873200,winddir=0x7fee598728f8,
 _layeralt=0x7fee59153b88)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916b800,lgs_prof_alt=0x7fee5916c448,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58d28060,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58d26130,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x10fac4030,_masks=0x0,_fluxpersub=0x7fee58d27a60,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58d284d0,_skyfluxpersub=0x7fee58d28720,
 _nphotons=8824.39,_skynphotons=0,_tt=[-0.00608481,0.00306611],_lastvalidtt=
 [-0.00608481,0.00306611],_upttcommand=[0,0],_refmes=0x7fee598aba30,_tiprefv=
 0x7fee598ab030,_tiltrefv=0x7fee5a01be30,_tiprefvn=0x7fee598e3030,_tiltrefvn=
 0x7fee5a000a30,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58d275c0,_jstart=0x7fee58d27810,_binindices=0x7fee5922d830,
 _binxy=2,_centroidw=0x7fee5916b9c0,_fimage=0x7fee59938430,_fimage2=0x0,
 _imistart=0x7fee58c56940,_imjstart=0x7fee58c56b90,_imistart2=0x7fee58c56de0,
 _imjstart2=0x7fee58c581c0,_unittip=0x7fee58d20df0,_unittilt=0x7fee58d2f290,
 _lgs_defocuses=0x7fee5914c410,_unitdefocus=0x10fbc5030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee5992b630,_flat=0x7fee5928b430,_domask=1,
 _submask=0x7fee59929830,_kernel=0x7fee59227430,_kernels=0x10eeeb030,_kerfftr=
 0x10efec030,_kerffti=0x10ee85030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee59937a30,_x=0x7fee598a9630,_y=0x7fee5989b430,_centroidgain=1,_rayleigh=
 0x7fee59142988,_bckgrdcalib=0x7fee5928aa30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916b870)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916c170,_ctrlden=0x7fee5916bdb8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c538f0,_xlast=0x7fee58c53e30,_ylast=[0x7fee5906bc30,0x7fee5906bc30,
 0x7fee5906bc30],_y0=0x7fee59291e30,_signus=0x7fee58c54270,_puppixoffset=[0,0],
 _nact=80,_def=0x115197030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58f03140,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916bf08,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5914c138,xposition=0x7fee5916b838,yposition=
 0x7fee5916c480,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5916b790,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.7,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    8824.4
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       60.0   0.348      280.4
Field Avg  1.65                     60.0   0.348      280.4
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.2;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873398,layerfrac=0x7fee59873310,
 layerspeed=0x7fee59873288,layeralt=0x7fee59873200,winddir=0x7fee598728f8,
 _layeralt=0x7fee59154380)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916b800,lgs_prof_alt=0x7fee5916c448,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58d26b70,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58c58080,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x115096030,_masks=0x0,_fluxpersub=0x7fee58c58770,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58c589c0,_skyfluxpersub=0x7fee58c564a0,
 _nphotons=8824.39,_skynphotons=0,_tt=[-0.00707261,-0.0094574],_lastvalidtt=
 [-0.00707261,-0.0094574],_upttcommand=[0,0],_refmes=0x7fee5a801230,_tiprefv=
 0x7fee598aec30,_tiltrefv=0x7fee5989b430,_tiprefvn=0x7fee598ab030,_tiltrefvn=
 0x7fee59929c30,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58c582d0,_jstart=0x7fee58c58520,_binindices=0x7fee5996ba30,
 _binxy=2,_centroidw=0x7fee5916bd48,_fimage=0x7fee59973030,_fimage2=0x0,
 _imistart=0x7fee58d2bd00,_imjstart=0x7fee58d2bf50,_imistart2=0x7fee58d2c1a0,
 _imjstart2=0x7fee58d30060,_unittip=0x7fee58c57c20,_unittilt=0x7fee58c57e50,
 _lgs_defocuses=0x7fee5916c250,_unitdefocus=0x10f31b030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee59969630,_flat=0x7fee5996e030,_domask=1,
 _submask=0x7fee5922d830,_kernel=0x7fee5996d230,_kernels=0x10ef51030,_kerfftr=
 0x10ee85030,_kerffti=0x10eeeb030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee5996c830,_x=0x7fee5922b630,_y=0x7fee59228230,_centroidgain=1,_rayleigh=
 0x7fee59142988,_bckgrdcalib=0x7fee5996ea30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5914bd10)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916b870,_ctrlden=0x7fee5916c170,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c56c00,_xlast=0x7fee58c538f0,_ylast=[0x7fee59291e30,0x7fee59291e30,
 0x7fee59291e30],_y0=0x7fee59081430,_signus=0x7fee58c56d80,_puppixoffset=[0,0],
 _nact=80,_def=0x11459a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58d2f5f0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916bf08,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5914c138,xposition=0x7fee5916c218,yposition=
 0x7fee5916c410,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5916b790,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.8,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    8824.4
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       68.5   0.163      388.5
Field Avg  1.65                     68.5   0.163      388.5
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.2;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873398,layerfrac=0x7fee59873310,
 layerspeed=0x7fee59873288,layeralt=0x7fee59873200,winddir=0x7fee598728f8,
 _layeralt=0x7fee59154a68)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916b800,lgs_prof_alt=0x7fee5916c448,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58c57220,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58c59150,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x10f907030,_masks=0x0,_fluxpersub=0x7fee58c56e50,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58c57c10,_skyfluxpersub=0x7fee58c57e60,
 _nphotons=8824.39,_skynphotons=0,_tt=[0.0237107,0.0135297],_lastvalidtt=
 [0.0237107,0.0135297],_upttcommand=[0,0],_refmes=0x7fee5906bc30,_tiprefv=
 0x7fee59288630,_tiltrefv=0x7fee5a01de30,_tiprefvn=0x7fee59288e30,_tiltrefvn=
 0x7fee5a01ba30,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58c580c0,_jstart=0x7fee58c58310,_binindices=0x7fee5927e430,
 _binxy=2,_centroidw=0x7fee5916c1e0,_fimage=0x7fee59228830,_fimage2=0x0,
 _imistart=0x7fee58c58b60,_imjstart=0x7fee58c57770,_imistart2=0x7fee58c579c0,
 _imjstart2=0x7fee58c56c00,_unittip=0x7fee58c564c0,_unittilt=0x7fee58c538f0,
 _lgs_defocuses=0x7fee5916c3a0,_unitdefocus=0x10f21a030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee5922b030,_flat=0x7fee598b8830,_domask=1,
 _submask=0x7fee59289e30,_kernel=0x7fee59282230,_kernels=0x10efb7030,_kerfftr=
 0x10eeeb030,_kerffti=0x10ef51030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee59227430,_x=0x7fee59228230,_y=0x7fee5927a430,_centroidgain=1,_rayleigh=
 0x7fee59142988,_bckgrdcalib=0x7fee598ab030,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5914c100)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5914bd10,_ctrlden=0x7fee5916b870,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58d20df0,_xlast=0x7fee58d27890,_ylast=[0x7fee59801430,0x7fee59801430,
 0x7fee59801430],_y0=0x7fee59822830,_signus=0x7fee58d27a10,_puppixoffset=[0,0],
 _nact=80,_def=0x115197030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58d306d0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916bf08,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5914c138,xposition=0x7fee5916c0c8,yposition=
 0x7fee5914c3d8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5916b790,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.9,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    88.2
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       66.8   0.167      388.5
Field Avg  1.65                     66.8   0.167      388.5
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.2;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873398,layerfrac=0x7fee59873310,
 layerspeed=0x7fee59873288,layeralt=0x7fee59873200,winddir=0x7fee598728f8,
 _layeralt=0x7fee591537d0)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=
 10,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916b800,lgs_prof_alt=0x7fee5916c448,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58c598d0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58c56920,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x1123f9030,_masks=0x0,_fluxpersub=0x7fee58e07110,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58e07360,_skyfluxpersub=0x7fee58e075b0,
 _nphotons=88.2439,_skynphotons=0,_tt=[-0.00472266,-0.0269029],_lastvalidtt=
 [-0.00472266,-0.0269029],_upttcommand=[0,0],_refmes=0x7fee598af830,_tiprefv=
 0x7fee59950830,_tiltrefv=0x7fee5a000a30,_tiprefvn=0x7fee59951030,_tiltrefvn=
 0x7fee59950030,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58c56b70,_jstart=0x7fee58c56dc0,_binindices=0x7fee5999ee30,
 _binxy=2,_centroidw=0x7fee5916bed0,_fimage=0x7fee5927a430,_fimage2=0x0,
 _imistart=0x7fee58d265d0,_imjstart=0x7fee58d26820,_imistart2=0x7fee58d26a70,
 _imjstart2=0x7fee58d26cc0,_unittip=0x7fee58c564c0,_unittilt=0x7fee58c566f0,
 _lgs_defocuses=0x7fee5916c138,_unitdefocus=0x1120f7030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee5a049e30,_flat=0x7fee5a019a30,_domask=1,
 _submask=0x7fee5a01b430,_kernel=0x7fee59949630,_kernels=0x10ee85030,_kerfftr=
 0x10ef51030,_kerffti=0x10efb7030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee59291630,_x=0x7fee5922e030,_y=0x7fee5922b430,_centroidgain=1,_rayleigh=
 0x7fee59142988,_bckgrdcalib=0x7fee5a04a830,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916be98)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916bdb8,_ctrlden=0x7fee5914bd10,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58d25b40,_xlast=0x7fee58d2f300,_ylast=[0x7fee59822830,0x7fee59822830,
 0x7fee59822830],_y0=0x7fee598aba30,_signus=0x7fee58d20df0,_puppixoffset=[0,0],
 _nact=80,_def=0x11459a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58f029d0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916bf08,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5914c138,xposition=0x7fee5916b988,yposition=
 0x7fee5916c5d0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5916b790,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.9,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    88.2
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       60.0   0.346      280.4
Field Avg  1.65                     60.0   0.346      280.4
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.2;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873398,layerfrac=0x7fee59873310,
 layerspeed=0x7fee59873288,layeralt=0x7fee59873200,winddir=0x7fee598728f8,
 _layeralt=0x7fee59153d20)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=
 10,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916b800,lgs_prof_alt=0x7fee5916c448,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58d28c00,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58c57360,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x10fbc5030,_masks=0x0,_fluxpersub=0x7fee58d20df0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58d27280,_skyfluxpersub=0x7fee58d26390,
 _nphotons=88.2439,_skynphotons=0,_tt=[0.000305179,-0.00451818],_lastvalidtt=
 [0.000305179,-0.00451818],_upttcommand=[0,0],_refmes=0x7fee59801430,_tiprefv=
 0x7fee5a018630,_tiltrefv=0x7fee5a017e30,_tiprefvn=0x7fee5a01be30,_tiltrefvn=
 0x7fee5a000a30,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58c575b0,_jstart=0x7fee58c57800,_binindices=0x7fee5928d230,
 _binxy=2,_centroidw=0x7fee5916be28,_fimage=0x7fee592bf030,_fimage2=0x0,
 _imistart=0x7fee58c58050,_imjstart=0x7fee58c582a0,_imistart2=0x7fee58c584f0,
 _imjstart2=0x7fee58c58740,_unittip=0x7fee58c59b60,_unittilt=0x7fee58c57130,
 _lgs_defocuses=0x7fee5916bfb0,_unitdefocus=0x111df4030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee5928fe30,_flat=0x7fee59290830,_domask=1,
 _submask=0x7fee5992c630,_kernel=0x7fee5928f030,_kernels=0x10eeeb030,_kerfftr=
 0x10efb7030,_kerffti=0x10ee85030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee5922d830,_x=0x7fee5922ac30,_y=0x7fee5922b230,_centroidgain=1,_rayleigh=
 0x7fee59142988,_bckgrdcalib=0x7fee59291230,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916bdf0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916be98,_ctrlden=0x7fee5916bdb8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58d302c0,_xlast=0x7fee58d25ad0,_ylast=[0x7fee598aba30,0x7fee598aba30,
 0x7fee598aba30],_y0=0x7fee59933430,_signus=0x7fee58d315b0,_puppixoffset=[0,0],
 _nact=80,_def=0x115197030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58c57a50,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916bf08,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5914c138,xposition=0x7fee5914c100,yposition=
 0x7fee5916c100,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5916b790,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.8,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    88.2
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       55.4   0.515      165.5
Field Avg  1.65                     55.4   0.515      165.5
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.2;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873398,layerfrac=0x7fee59873310,
 layerspeed=0x7fee59873288,layeralt=0x7fee59873200,winddir=0x7fee598728f8,
 _layeralt=0x7fee591542f8)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=
 10,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916b800,lgs_prof_alt=0x7fee5916c448,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58c573e0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58d20df0,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x10f31b030,_masks=0x0,_fluxpersub=0x7fee58d30920,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58d2bdd0,_skyfluxpersub=0x7fee58d2c020,
 _nphotons=88.2439,_skynphotons=0,_tt=[-0.00608566,0.0030561],_lastvalidtt=
 [-0.00608566,0.0030561],_upttcommand=[0,0],_refmes=0x7fee5a016430,_tiprefv=
 0x7fee59288e30,_tiltrefv=0x7fee59288630,_tiprefvn=0x7fee59289e30,_tiltrefvn=
 0x7fee5928a630,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58d2f060,_jstart=0x7fee58d306d0,_binindices=0x7fee59291430,
 _binxy=2,_centroidw=0x7fee5916c528,_fimage=0x7fee59290230,_fimage2=0x0,
 _imistart=0x7fee58c56aa0,_imjstart=0x7fee58c56cf0,_imistart2=0x7fee58c56f40,
 _imjstart2=0x7fee58c57190,_unittip=0x7fee58d30290,_unittilt=0x7fee58d28060,
 _lgs_defocuses=0x7fee5916c3d8,_unitdefocus=0x114098030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee5922ee30,_flat=0x7fee5922d830,_domask=1,
 _submask=0x7fee598aec30,_kernel=0x7fee5928dc30,_kernels=0x10ef51030,_kerfftr=
 0x10ee85030,_kerffti=0x10eeeb030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee5928f430,_x=0x7fee598ab830,_y=0x7fee598a8c30,_centroidgain=1,_rayleigh=
 0x7fee59142988,_bckgrdcalib=0x7fee5928ea30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916c2f8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916bdf0,_ctrlden=0x7fee5916be98,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c538f0,_xlast=0x7fee58c58270,_ylast=[0x7fee59176230,0x7fee59176230,
 0x7fee59176230],_y0=0x7fee59082430,_signus=0x7fee58c583f0,_puppixoffset=[0,0],
 _nact=80,_def=0x11459a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58d25ad0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916bf08,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5914c138,xposition=0x7fee5916bf40,yposition=
 0x7fee5916c170,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5916b790,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.7,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    88.2
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.7   0.548      141.9
Field Avg  1.65                     54.7   0.548      141.9
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.2;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873398,layerfrac=0x7fee59873310,
 layerspeed=0x7fee59873288,layeralt=0x7fee59873200,winddir=0x7fee598728f8,
 _layeralt=0x7fee59153968)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=
 10,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916b800,lgs_prof_alt=0x7fee5916c448,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58d28060,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58c58270,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x10f21a030,_masks=0x0,_fluxpersub=0x7fee58c56c70,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58c56ec0,_skyfluxpersub=0x7fee58c569f0,
 _nphotons=88.2439,_skynphotons=0,_tt=[-0.0013329,-0.00135038],_lastvalidtt=
 [-0.0013329,-0.00135038],_upttcommand=[0,0],_refmes=0x7fee59157830,_tiprefv=
 0x7fee5a017a30,_tiltrefv=0x7fee59288e30,_tiprefvn=0x7fee5a000a30,_tiltrefvn=
 0x7fee59288630,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58c584c0,_jstart=0x7fee58c58710,_binindices=0x7fee5a81f430,
 _binxy=2,_centroidw=0x7fee5916bd10,_fimage=0x7fee5995e030,_fimage2=0x0,
 _imistart=0x7fee58f05ac0,_imjstart=0x7fee58f05d10,_imistart2=0x7fee58f03140,
 _imjstart2=0x7fee58f03390,_unittip=0x7fee58c538f0,_unittilt=0x7fee58c53090,
 _lgs_defocuses=0x7fee5914c2c0,_unitdefocus=0x112760030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee598b8830,_flat=0x7fee598a8c30,_domask=1,
 _submask=0x7fee5928b830,_kernel=0x7fee5a018230,_kernels=0x10efb7030,_kerfftr=
 0x10eeeb030,_kerffti=0x10ef51030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee5995c630,_x=0x7fee5928a630,_y=0x7fee5928ac30,_centroidgain=1,_rayleigh=
 0x7fee59142988,_bckgrdcalib=0x7fee598aec30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5914c218)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5914bd10,_ctrlden=0x7fee5916bdf0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58f04210,_xlast=0x7fee58f04390,_ylast=[0x7fee5a801230,0x7fee5a801230,
 0x7fee5a801230],_y0=0x7fee5a820430,_signus=0x7fee58f05200,_puppixoffset=[0,0],
 _nact=80,_def=0x115197030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58d2f5d0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916bf08,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5914c138,xposition=0x7fee5916b870,yposition=
 0x7fee5916bc68,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5916b790,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    88.2
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.7   0.549      141.9
Field Avg  1.65                     54.7   0.549      141.9
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.2;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873398,layerfrac=0x7fee59873310,
 layerspeed=0x7fee59873288,layeralt=0x7fee59873200,winddir=0x7fee598728f8,
 _layeralt=0x7fee591545a0)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=
 10,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916b800,lgs_prof_alt=0x7fee5916c448,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58d27980,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58d2f270,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x1120f7030,_masks=0x0,_fluxpersub=0x7fee58c54200,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58e07110,_skyfluxpersub=0x7fee58e07360,
 _nphotons=88.2439,_skynphotons=0,_tt=[-0.000400608,-0.000410616],_lastvalidtt=
 [-0.000400608,-0.000410616],_upttcommand=[0,0],_refmes=0x7fee5922ba30,_tiprefv=
 0x7fee5a81fa30,_tiltrefv=0x7fee5a017c30,_tiprefvn=0x7fee5a821230,_tiltrefvn=
 0x7fee5a01a430,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58d30060,_jstart=0x7fee58d306d0,_binindices=0x7fee59222830,
 _binxy=2,_centroidw=0x7fee5916c218,_fimage=0x7fee59949e30,_fimage2=0x0,
 _imistart=0x7fee58c54c60,_imjstart=0x7fee58c54eb0,_imistart2=0x7fee58c55100,
 _imjstart2=0x7fee58c53fb0,_unittip=0x7fee58d20e10,_unittilt=0x7fee58d2f040,
 _lgs_defocuses=0x7fee5916bf40,_unitdefocus=0x111cf3030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee5a019a30,_flat=0x7fee5a017230,_domask=1,
 _submask=0x7fee59289e30,_kernel=0x7fee59224a30,_kernels=0x10ee85030,_kerfftr=
 0x10ef51030,_kerffti=0x10efb7030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee59949430,_x=0x7fee598ab830,_y=0x7fee598b8e30,_centroidgain=1,_rayleigh=
 0x7fee59142988,_bckgrdcalib=0x7fee5a018430,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916bd80)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916bdb8,_ctrlden=0x7fee5914bd10,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c52460,_xlast=0x7fee58c569d0,_ylast=[0x7fee5906bc30,0x7fee5906bc30,
 0x7fee5906bc30],_y0=0x7fee59157830,_signus=0x7fee58c564a0,_puppixoffset=[0,0],
 _nact=80,_def=0x11459a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58f029d0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916bf08,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5914c138,xposition=0x7fee5916c2f8,yposition=
 0x7fee5916be60,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5916b790,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    88.2
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.7   0.548      145.3
Field Avg  1.65                     54.7   0.548      145.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.2;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873398,layerfrac=0x7fee59873310,
 layerspeed=0x7fee59873288,layeralt=0x7fee59873200,winddir=0x7fee598728f8,
 _layeralt=0x7fee591536c0)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=
 10,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916b800,lgs_prof_alt=0x7fee5916c448,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58d32060,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58d27c10,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x111df4030,_masks=0x0,_fluxpersub=0x7fee58c526b0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58d30060,_skyfluxpersub=0x7fee58d306d0,
 _nphotons=88.2439,_skynphotons=0,_tt=[0.000462932,0.000134863],_lastvalidtt=
 [0.000462932,0.000134863],_upttcommand=[0,0],_refmes=0x7fee5a016430,_tiprefv=
 0x7fee59949430,_tiltrefv=0x7fee598aec30,_tiprefvn=0x7fee598d8230,_tiltrefvn=
 0x7fee598d9430,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58d20df0,_jstart=0x7fee58d2f040,_binindices=0x7fee5922d830,
 _binxy=2,_centroidw=0x7fee5916c0c8,_fimage=0x7fee598d7830,_fimage2=0x0,
 _imistart=0x7fee58c54390,_imjstart=0x7fee58c545e0,_imistart2=0x7fee58c54830,
 _imjstart2=0x7fee58c52460,_unittip=0x7fee58d27320,_unittilt=0x7fee58d302b0,
 _lgs_defocuses=0x7fee5916b870,_unitdefocus=0x10f706030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee5996de30,_flat=0x7fee5996fe30,_domask=1,
 _submask=0x7fee59225830,_kernel=0x7fee5928e430,_kernels=0x10eeeb030,_kerfftr=
 0x10efb7030,_kerffti=0x10ee85030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee598e1e30,_x=0x7fee59949c30,_y=0x7fee59970e30,_centroidgain=1,_rayleigh=
 0x7fee59142988,_bckgrdcalib=0x7fee5995c830,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5914c2f8)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5914c0c8,_ctrlden=0x7fee5916bdb8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58d25ad0,_xlast=0x7fee58d2f5d0,_ylast=[0x7fee59822830,0x7fee59822830,
 0x7fee59822830],_y0=0x7fee59801430,_signus=0x7fee58d27950,_puppixoffset=[0,0],
 _nact=80,_def=0x115197030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58d26130,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916bf08,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5914c138,xposition=0x7fee5916b8a8,yposition=
 0x7fee5914c218,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5916b790,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.4,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    88.2
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.4   0.544      148.6
Field Avg  1.65                     54.4   0.544      148.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.2;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873398,layerfrac=0x7fee59873310,
 layerspeed=0x7fee59873288,layeralt=0x7fee59873200,winddir=0x7fee598728f8,
 _layeralt=0x7fee591549e0)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=
 10,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916b800,lgs_prof_alt=0x7fee5916c448,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58c551a0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58d27300,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x114098030,_masks=0x0,_fluxpersub=0x7fee58d306f0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58d30940,_skyfluxpersub=0x7fee58d30b90,
 _nphotons=88.2439,_skynphotons=0,_tt=[0.00148981,0.000969775],_lastvalidtt=
 [0.00148981,0.000969775],_upttcommand=[0,0],_refmes=0x7fee5a000030,_tiprefv=
 0x7fee59290630,_tiltrefv=0x7fee598af430,_tiprefvn=0x7fee59290e30,_tiltrefvn=
 0x7fee598aec30,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58d27550,_jstart=0x7fee58d277a0,_binindices=0x7fee5922b030,
 _binxy=2,_centroidw=0x7fee5916b838,_fimage=0x7fee59218630,_fimage2=0x0,
 _imistart=0x7fee58c55a20,_imjstart=0x7fee58c55c70,_imistart2=0x7fee58c55ec0,
 _imjstart2=0x7fee58c56110,_unittip=0x7fee58d2f180,_unittilt=0x7fee58d270d0,
 _lgs_defocuses=0x7fee5916c2f8,_unitdefocus=0x1121f8030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee5922a630,_flat=0x7fee5922d830,_domask=1,
 _submask=0x7fee598cec30,_kernel=0x7fee5927ae30,_kernels=0x10ef51030,_kerfftr=
 0x10ee85030,_kerffti=0x10eeeb030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee59216c30,_x=0x7fee598a8c30,_y=0x7fee598b8830,_centroidgain=1,_rayleigh=
 0x7fee59142988,_bckgrdcalib=0x7fee5927bc30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916c330)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5914c2f8,_ctrlden=0x7fee5914c0c8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c53470,_xlast=0x7fee58c52900,_ylast=[0x7fee59224430,0x7fee59224430,
 0x7fee59224430],_y0=0x7fee59227a30,_signus=0x7fee58c53e30,_puppixoffset=[0,0],
 _nact=80,_def=0x11459a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58d25ad0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916bf08,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5914c138,xposition=0x7fee5916bd80,yposition=
 0x7fee5916be98,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5916b790,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.3,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    88.2
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.9   0.527      158.8
Field Avg  1.65                     54.9   0.527      158.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.2;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873398,layerfrac=0x7fee59873310,
 layerspeed=0x7fee59873288,layeralt=0x7fee59873200,winddir=0x7fee598728f8,
 _layeralt=0x7fee591546b0)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=
 10,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916b800,lgs_prof_alt=0x7fee5916c448,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58c55090,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58d277f0,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x112760030,_masks=0x0,_fluxpersub=0x7fee58d2cf70,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58d2dbd0,_skyfluxpersub=0x7fee58d2de20,
 _nphotons=88.2439,_skynphotons=0,_tt=[0.00230777,0.00246451],_lastvalidtt=
 [0.00230777,0.00246451],_upttcommand=[0,0],_refmes=0x7fee5a01a830,_tiprefv=
 0x7fee5a000830,_tiltrefv=0x7fee5a000030,_tiprefvn=0x7fee5a02a830,_tiltrefvn=
 0x7fee5a02d030,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58d27a40,_jstart=0x7fee58d2cd20,_binindices=0x7fee59291430,
 _binxy=2,_centroidw=0x7fee5914c3d8,_fimage=0x7fee5927c230,_fimage2=0x0,
 _imistart=0x7fee58c54450,_imjstart=0x7fee58c546a0,_imistart2=0x7fee58c548f0,
 _imjstart2=0x7fee58c54b40,_unittip=0x7fee58d27390,_unittilt=0x7fee58d275c0,
 _lgs_defocuses=0x7fee5916c138,_unitdefocus=0x10fac4030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee5927a430,_flat=0x7fee5922b030,_domask=1,
 _submask=0x7fee598a8c30,_kernel=0x7fee59289e30,_kernels=0x10efb7030,_kerfftr=
 0x10eeeb030,_kerffti=0x10ef51030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee5927d030,_x=0x7fee59899c30,_y=0x7fee598b8830,_centroidgain=1,_rayleigh=
 0x7fee59142988,_bckgrdcalib=0x7fee5928ac30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916b950)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5914bd10,_ctrlden=0x7fee5914c2f8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c532e0,_xlast=0x7fee58c53460,_ylast=[0x7fee59227a30,0x7fee59227a30,
 0x7fee59227a30],_y0=0x7fee59082430,_signus=0x7fee58c52720,_puppixoffset=[0,0],
 _nact=80,_def=0x115197030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58e01360,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916bf08,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5914c138,xposition=0x7fee5916bdf0,yposition=
 0x7fee5916c058,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5916b790,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.2,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    88.2
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       57.0   0.421      226.3
Field Avg  1.65                     57.0   0.421      226.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.2;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873398,layerfrac=0x7fee59873310,
 layerspeed=0x7fee59873288,layeralt=0x7fee59873200,winddir=0x7fee598728f8,
 _layeralt=0x7fee59154848)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=
 10,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916b800,lgs_prof_alt=0x7fee5916c448,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58d28d60,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58d28290,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x111cf3030,_masks=0x0,_fluxpersub=0x7fee58c54730,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58c54980,_skyfluxpersub=0x7fee58c565e0,
 _nphotons=88.2439,_skynphotons=0,_tt=[0.00276645,0.005492],_lastvalidtt=
 [0.00276645,0.005492],_upttcommand=[0,0],_refmes=0x7fee5922ba30,_tiprefv=
 0x7fee59228630,_tiltrefv=0x7fee5921de30,_tiprefvn=0x7fee59216230,_tiltrefvn=
 0x7fee5922a030,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58d284e0,_jstart=0x7fee58d28730,_binindices=0x7fee59288630,
 _binxy=2,_centroidw=0x7fee5916c5d0,_fimage=0x7fee598dd430,_fimage2=0x0,
 _imistart=0x7fee58c55be0,_imjstart=0x7fee58c55e30,_imistart2=0x7fee58c54290,
 _imjstart2=0x7fee58c544e0,_unittip=0x7fee58d2f290,_unittilt=0x7fee58d28060,
 _lgs_defocuses=0x7fee5916bfb0,_unitdefocus=0x115096030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee598c8830,_flat=0x7fee598c9230,_domask=1,
 _submask=0x7fee5928e830,_kernel=0x7fee59228e30,_kernels=0x10ee85030,_kerfftr=
 0x10ef51030,_kerffti=0x10efb7030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee598dca30,_x=0x7fee598ab830,_y=0x7fee598c7c30,_centroidgain=1,_rayleigh=
 0x7fee59142988,_bckgrdcalib=0x7fee598c9c30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916c528)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916bdb8,_ctrlden=0x7fee5914bd10,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c53fb0,_xlast=0x7fee58c53240,_ylast=[0x7fee59082430,0x7fee59082430,
 0x7fee59082430],_y0=0x7fee59157830,_signus=0x7fee58c56af0,_puppixoffset=[0,0],
 _nact=80,_def=0x11459a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58e06300,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916bf08,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5914c138,xposition=0x7fee5916c330,yposition=
 0x7fee5916bd10,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5916b790,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.1,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    17648.8
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       55.4   0.524      162.2
Field Avg  1.65                     55.4   0.524      162.2
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.2;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873398,layerfrac=0x7fee59873310,
 layerspeed=0x7fee59873288,layeralt=0x7fee59873200,winddir=0x7fee598728f8,
 _layeralt=0x7fee591548d0)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916b800,lgs_prof_alt=0x7fee5916c448,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58c56620,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58d29460,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x10f706030,_masks=0x0,_fluxpersub=0x7fee58d2a420,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58d2a670,_skyfluxpersub=0x7fee58d2a8c0,
 _nphotons=17648.8,_skynphotons=0,_tt=[-0.00709864,-0.000668633],_lastvalidtt=
 [-0.00709864,-0.000668633],_upttcommand=[0,0],_refmes=0x7fee59801430,_tiprefv=
 0x7fee5a017a30,_tiltrefv=0x7fee598c7630,_tiprefvn=0x7fee5a000a30,_tiltrefvn=
 0x7fee598c7e30,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58d2a1d0,_jstart=0x7fee58d28060,_binindices=0x7fee5922d830,
 _binxy=2,_centroidw=0x7fee5916c100,_fimage=0x7fee59228630,_fimage2=0x0,
 _imistart=0x7fee58c55070,_imjstart=0x7fee58c52720,_imistart2=0x7fee58c53fb0,
 _imjstart2=0x7fee58c54200,_unittip=0x7fee58d28750,_unittilt=0x7fee58d29df0,
 _lgs_defocuses=0x7fee5916bfe8,_unitdefocus=0x10f907030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee59229030,_flat=0x7fee5928b830,_domask=1,
 _submask=0x7fee598ce830,_kernel=0x7fee59226a30,_kernels=0x10eeeb030,_kerfftr=
 0x10efb7030,_kerffti=0x10ee85030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee59226030,_x=0x7fee598cc430,_y=0x7fee598c8630,_centroidgain=1,_rayleigh=
 0x7fee59142988,_bckgrdcalib=0x7fee5928c230,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916b918)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916c528,_ctrlden=0x7fee5916bdb8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c53e30,_xlast=0x7fee58c53090,_ylast=[0x7fee59157830,0x7fee59157830,
 0x7fee59157830],_y0=0x7fee5922a430,_signus=0x7fee58c52460,_puppixoffset=[0,0],
 _nact=80,_def=0x115197030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58e01360,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916bf08,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5914c138,xposition=0x7fee5916b950,yposition=
 0x7fee5916c3a0,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5916b790,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    264.7
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.9   0.559      148.6
Field Avg  1.65                     53.9   0.559      148.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.2;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873398,layerfrac=0x7fee59873310,
 layerspeed=0x7fee59873288,layeralt=0x7fee59873200,winddir=0x7fee598728f8,
 _layeralt=0x7fee5900da50)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916b800,lgs_prof_alt=0x7fee5916c448,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58c56870,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58f03860,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x1121f8030,_masks=0x0,_fluxpersub=0x7fee58c53fb0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58c56620,_skyfluxpersub=0x7fee58c538f0,
 _nphotons=264.732,_skynphotons=0,_tt=[3.0548e-05,-3.83987e-05],_lastvalidtt=
 [3.0548e-05,-3.83987e-05],_upttcommand=[0,0],_refmes=0x7fee598b9030,_tiprefv=
 0x7fee598ba430,_tiltrefv=0x7fee59280830,_tiprefvn=0x7fee5a017a30,_tiltrefvn=
 0x7fee59281030,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58f03ab0,_jstart=0x7fee58f03d00,_binindices=0x7fee598aec30,
 _binxy=2,_centroidw=0x7fee5916c170,_fimage=0x7fee592c9030,_fimage2=0x0,
 _imistart=0x7fee58d287d0,_imjstart=0x7fee58d28a20,_imistart2=0x7fee58d28c70,
 _imjstart2=0x7fee58d28ec0,_unittip=0x7fee58f03400,_unittilt=0x7fee58f03630,
 _lgs_defocuses=0x7fee5916c480,_unitdefocus=0x1123f9030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee598cb830,_flat=0x7fee598cc230,_domask=1,
 _submask=0x7fee5922a830,_kernel=0x7fee598caa30,_kernels=0x10ef51030,_kerfftr=
 0x10ee85030,_kerffti=0x10eeeb030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee5922ee30,_x=0x7fee5a803430,_y=0x7fee5a81d630,_centroidgain=1,_rayleigh=
 0x7fee59142988,_bckgrdcalib=0x7fee598ccc30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916c218)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916b918,_ctrlden=0x7fee5916c528,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c56c50,_xlast=0x7fee58c53e30,_ylast=[0x7fee5922a430,0x7fee5922a430,
 0x7fee5922a430],_y0=0x7fee59176230,_signus=0x7fee58c55fc0,_puppixoffset=[0,0],
 _nact=80,_def=0x11459a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58d25af0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916bf08,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5914c138,xposition=0x7fee5914c0c8,yposition=
 0x7fee5914c410,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5916b790,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=3e-05,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    88.2
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.1   0.531      192.6
Field Avg  1.65                     54.1   0.531      192.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.2;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873398,layerfrac=0x7fee59873310,
 layerspeed=0x7fee59873288,layeralt=0x7fee59873200,winddir=0x7fee598728f8,
 _layeralt=0x7fee59154af0)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916b800,lgs_prof_alt=0x7fee5916c448,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58c564a0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58e07e90,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x10fac4030,_masks=0x0,_fluxpersub=0x7fee58d306d0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58d270d0,_skyfluxpersub=0x7fee58d20df0,
 _nphotons=88.2439,_skynphotons=0,_tt=[-0.00029809,7.27152e-05],_lastvalidtt=
 [-0.00029809,7.27152e-05],_upttcommand=[0,0],_refmes=0x7fee598b9030,_tiprefv=
 0x7fee59229c30,_tiltrefv=0x7fee59229430,_tiprefvn=0x7fee59225e30,_tiltrefvn=
 0x7fee59280830,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58e080e0,_jstart=0x7fee58e07340,_binindices=0x7fee5922a430,
 _binxy=2,_centroidw=0x7fee5916b8a8,_fimage=0x7fee59214e30,_fimage2=0x0,
 _imistart=0x7fee58c548c0,_imjstart=0x7fee58c54b10,_imistart2=0x7fee58c54d60,
 _imjstart2=0x7fee58c54fb0,_unittip=0x7fee58e07c60,_unittilt=0x7fee58e07110,
 _lgs_defocuses=0x7fee5916b950,_unitdefocus=0x10fbc5030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee59228630,_flat=0x7fee59284c30,_domask=1,
 _submask=0x7fee598a8c30,_kernel=0x7fee59288630,_kernels=0x10efb7030,_kerfftr=
 0x10eeeb030,_kerffti=0x10ef51030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee59286030,_x=0x7fee5a017a30,_y=0x7fee5a019c30,_centroidgain=1,_rayleigh=
 0x7fee59142988,_bckgrdcalib=0x7fee59285630,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916c2c0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916b988,_ctrlden=0x7fee5916b918,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c538f0,_xlast=0x7fee58c54200,_ylast=[0x7fee59176230,0x7fee59176230,
 0x7fee59176230],_y0=0x7fee59291e30,_signus=0x7fee58c52460,_puppixoffset=[0,0],
 _nact=80,_def=0x115197030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58e06300,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916bf08,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5914c138,xposition=0x7fee5914c2f8,yposition=
 0x7fee5916c250,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5916b790,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=1e-05,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    88.2
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    8824.4
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       55.4   0.507      168.9
Field Avg  1.65                     55.4   0.507      168.9
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 wfs(n).fracIllum   = 0.75;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873310,layerfrac=0x7fee59873288,
 layerspeed=0x7fee59873398,layeralt=0x7fee59154518,winddir=0x7fee591541e8,
 _layeralt=0x7fee59153fc8)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
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
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5914bd10,lgs_prof_alt=0x7fee5914c138,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58c54da0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58d2e260,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=108,
 _nsub4disp=132,_nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x10f907030,_masks=0x0,_fluxpersub=0x7fee58e05f80,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58d2e950,_skyfluxpersub=0x7fee58d2d440,
 _nphotons=8824.39,_skynphotons=0,_tt=[-0.000913937,0.00122641],_lastvalidtt=
 [-0.000913937,0.00122641],_upttcommand=[0,0],_refmes=0x7fee58d2dec0,_tiprefv=
 0x7fee5a019230,_tiltrefv=0x7fee5a018a30,_tiprefvn=0x7fee5a019a30,_tiltrefvn=
 0x7fee5a018030,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58d2e4b0,_jstart=0x7fee58d2e700,_binindices=0x7fee5927fa30,
 _binxy=2,_centroidw=0x7fee5916bfb0,_fimage=0x7fee598a9230,_fimage2=0x0,
 _imistart=0x7fee58c54ff0,_imjstart=0x7fee58c55240,_imistart2=0x7fee58c55490,
 _imjstart2=0x7fee58c55780,_unittip=0x7fee58d20e10,_unittilt=0x7fee58d2f7f0,
 _lgs_defocuses=0x7fee5916c1e0,_unitdefocus=0x10f31b030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee5a802e30,_flat=0x7fee5a81d030,_domask=1,
 _submask=0x7fee5a017230,_kernel=0x7fee59285c30,_kernels=0x10f01d030,_kerfftr=
 0x10efb7030,_kerffti=0x10eeeb030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee598aec30,_x=0x7fee598ab830,_y=0x7fee598a8c30,_centroidgain=1,_rayleigh=
 0x7fee5916bfe8,_bckgrdcalib=0x7fee5a81da30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916c288)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916c448,_ctrlden=0x7fee5916be98,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c53090,_xlast=0x7fee58c54590,_ylast=[0x7fee59176230,0x7fee59176230,
 0x7fee59176230],_y0=0x7fee5927dc30,_signus=0x7fee58c54710,_puppixoffset=[0,0],
 _nact=80,_def=0x116d0f030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58d2eba0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916c410,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5916b918,xposition=0x7fee5916c2f8,yposition=
 0x7fee5916c560,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5916b800,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    264.7
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 108 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.4   0.503      185.8
Field Avg  1.65                     54.4   0.503      185.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 wfs(n).fracIllum   = 0.75;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873310,layerfrac=0x7fee59873288,
 layerspeed=0x7fee59873398,layeralt=0x7fee59154518,winddir=0x7fee591541e8,
 _layeralt=0x7fee59153a78)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
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
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5914bd10,lgs_prof_alt=0x7fee5914c138,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58c54dd0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58d20df0,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=108,
 _nsub4disp=132,_nmes=216,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x1123f9030,_masks=0x0,_fluxpersub=0x7fee58d28060,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58d284a0,_skyfluxpersub=0x7fee58d286f0,
 _nphotons=264.732,_skynphotons=0,_tt=[-3.37219e-05,0.000124635],_lastvalidtt=
 [-3.37219e-05,0.000124635],_upttcommand=[0,0],_refmes=0x7fee58c53e30,_tiprefv=
 0x7fee5922ee30,_tiltrefv=0x7fee5a81e230,_tiprefvn=0x7fee59288630,_tiltrefvn=
 0x7fee5a81ea30,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58d2f7f0,_jstart=0x7fee58d2e240,_binindices=0x7fee5922d830,
 _binxy=2,_centroidw=0x7fee5916be60,_fimage=0x7fee59290630,_fimage2=0x0,
 _imistart=0x7fee58c59620,_imjstart=0x7fee58c511e0,_imistart2=0x7fee58c51430,
 _imjstart2=0x7fee58c54590,_unittip=0x7fee58d2ed20,_unittilt=0x7fee58d2dd60,
 _lgs_defocuses=0x7fee5916c138,_unitdefocus=0x10f21a030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee59228630,_flat=0x7fee5927c230,_domask=1,
 _submask=0x7fee598cce30,_kernel=0x7fee5928a830,_kernels=0x10ef0d030,_kerfftr=
 0x10eea7030,_kerffti=0x10f01d030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee59289e30,_x=0x7fee598ab830,_y=0x7fee598a9230,_centroidgain=1,_rayleigh=
 0x7fee5916c218,_bckgrdcalib=0x7fee59226c30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916c368)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916c288,_ctrlden=0x7fee5916c448,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c52460,_xlast=0x7fee58c53090,_ylast=[0x7fee5927dc30,0x7fee5927dc30,
 0x7fee5927dc30],_y0=0x7fee5922f630,_signus=0x7fee58c56760,_puppixoffset=[0,0],
 _nact=80,_def=0x11459a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58e01360,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916c410,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5916b918,xposition=0x7fee5916b790,yposition=
 0x7fee5916bdb8,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5916b800,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=3e-05,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    8824.4
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.7   0.549      141.9
Field Avg  1.65                     54.7   0.549      141.9
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).fracIllum   = 0.75;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873288,layerfrac=0x7fee59873398,
 layerspeed=0x7fee59873310,layeralt=0x7fee598728f8,winddir=0x7fee59873200,
 _layeralt=0x7fee59153a78)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916bdb8,lgs_prof_alt=0x7fee5916b918,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58d282c0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58d28d30,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x115096030,_masks=0x0,_fluxpersub=0x7fee58d2a390,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58d2a5e0,_skyfluxpersub=0x7fee58d2a830,
 _nphotons=8824.39,_skynphotons=0,_tt=[-0.00040061,-0.00041062],_lastvalidtt=
 [-0.00040061,-0.00041062],_upttcommand=[0,0],_refmes=0x7fee59291e30,_tiprefv=
 0x7fee59290630,_tiltrefv=0x7fee59227630,_tiprefvn=0x7fee59289e30,_tiltrefvn=
 0x7fee59228630,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58d29ef0,_jstart=0x7fee58d2a140,_binindices=0x7fee5922a830,
 _binxy=2,_centroidw=0x7fee5916b870,_fimage=0x7fee598ccc30,_fimage2=0x0,
 _imistart=0x7fee58c542d0,_imjstart=0x7fee58c54520,_imistart2=0x7fee58c54770,
 _imjstart2=0x7fee58c549c0,_unittip=0x7fee58d29220,_unittilt=0x7fee58d29450,
 _lgs_defocuses=0x7fee5916c330,_unitdefocus=0x1120f7030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee598cc230,_flat=0x7fee59288630,_domask=1,
 _submask=0x7fee598caa30,_kernel=0x7fee59290e30,_kernels=0x10f11a030,_kerfftr=
 0x10eea7030,_kerffti=0x10f01d030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee598cb830,_x=0x7fee598c9830,_y=0x7fee598c9e30,_centroidgain=1,_rayleigh=
 0x7fee5916c5d0,_bckgrdcalib=0x7fee592d8c30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916bed0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916b800,_ctrlden=0x7fee5916bd10,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c51430,_xlast=0x7fee58c53090,_ylast=[0x7fee59176230,0x7fee59176230,
 0x7fee59176230],_y0=0x7fee5922e230,_signus=0x7fee58c56010,_puppixoffset=[0,0],
 _nact=80,_def=0x1173ed030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58f029d0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916c288,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5916c448,xposition=0x7fee5916c138,yposition=
 0x7fee5916be60,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5914bd10,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    88.2
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.1   0.531      192.6
Field Avg  1.65                     54.1   0.531      192.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).fracIllum   = 0.75;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873288,layerfrac=0x7fee59873398,
 layerspeed=0x7fee59873310,layeralt=0x7fee598728f8,winddir=0x7fee59873200,
 _layeralt=0x7fee591549e0)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916bdb8,lgs_prof_alt=0x7fee5916b918,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58c53090,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58d28f50,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x10fbc5030,_masks=0x0,_fluxpersub=0x7fee58d306d0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58d28060,_skyfluxpersub=0x7fee58d291a0,
 _nphotons=88.2439,_skynphotons=0,_tt=[-0.00029809,7.27152e-05],_lastvalidtt=
 [-0.00029809,7.27152e-05],_upttcommand=[0,0],_refmes=0x7fee5a801230,_tiprefv=
 0x7fee5a017a30,_tiltrefv=0x7fee5a017230,_tiprefvn=0x7fee5a000a30,_tiltrefvn=
 0x7fee5a000030,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58d282b0,_jstart=0x7fee58d28500,_binindices=0x7fee59226830,
 _binxy=2,_centroidw=0x7fee5916bd80,_fimage=0x7fee5a802e30,_fimage2=0x0,
 _imistart=0x7fee58c532e0,_imjstart=0x7fee58c555f0,_imistart2=0x7fee58c55840,
 _imjstart2=0x7fee58c55a90,_unittip=0x7fee58d20df0,_unittilt=0x7fee58d28d20,
 _lgs_defocuses=0x7fee5916bdf0,_unitdefocus=0x111df4030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee598c5e30,_flat=0x7fee5922ee30,_domask=1,
 _submask=0x7fee598aec30,_kernel=0x7fee5928cc30,_kernels=0x10edf7030,_kerfftr=
 0x10ef0d030,_kerffti=0x10f11a030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee5a81d030,_x=0x7fee598c8630,_y=0x7fee598a8c30,_centroidgain=1,_rayleigh=
 0x7fee5916c5d0,_bckgrdcalib=0x7fee5928da30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916c598)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916be98,_ctrlden=0x7fee5916b800,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c528a0,_xlast=0x7fee58c538f0,_ylast=[0x7fee5922e230,0x7fee5922e230,
 0x7fee5922e230],_y0=0x7fee59157830,_signus=0x7fee58c52460,_puppixoffset=[0,0],
 _nact=80,_def=0x11459a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58f03140,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916c288,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5916c448,xposition=0x7fee5916c2c0,yposition=
 0x7fee5914c138,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5914bd10,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=1e-05,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    264.7
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       53.9   0.559      148.6
Field Avg  1.65                     53.9   0.559      148.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).fracIllum   = 0.75;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873288,layerfrac=0x7fee59873398,
 layerspeed=0x7fee59873310,layeralt=0x7fee598728f8,winddir=0x7fee59873200,
 _layeralt=0x7fee59153858)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916bdb8,lgs_prof_alt=0x7fee5916b918,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58c57170,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58d284c0,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x10f21a030,_masks=0x0,_fluxpersub=0x7fee58d21df0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58c549e0,_skyfluxpersub=0x7fee58c54540,
 _nphotons=264.732,_skynphotons=0,_tt=[3.0548e-05,-3.83987e-05],_lastvalidtt=
 [3.0548e-05,-3.83987e-05],_upttcommand=[0,0],_refmes=0x7fee5a81da30,_tiprefv=
 0x7fee598ca630,_tiltrefv=0x7fee598c9e30,_tiprefvn=0x7fee598cae30,_tiltrefvn=
 0x7fee598cc030,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58d28710,_jstart=0x7fee58d2f040,_binindices=0x7fee59225a30,
 _binxy=2,_centroidw=0x7fee5916b950,_fimage=0x7fee592d8a30,_fimage2=0x0,
 _imistart=0x7fee58c5d4e0,_imjstart=0x7fee58c5d730,_imistart2=0x7fee58c5d980,
 _imjstart2=0x7fee58c54790,_unittip=0x7fee58d28060,_unittilt=0x7fee58d28290,
 _lgs_defocuses=0x7fee5916c138,_unitdefocus=0x114098030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee59228630,_flat=0x7fee59291430,_domask=1,
 _submask=0x7fee598c8630,_kernel=0x7fee598cc830,_kernels=0x10ee5d030,_kerfftr=
 0x10ef73030,_kerffti=0x10edf7030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee5928ee30,_x=0x7fee598a8c30,_y=0x7fee598a9230,_centroidgain=1,_rayleigh=
 0x7fee5916c5d0,_bckgrdcalib=0x7fee59229030,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916c218)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916c528,_ctrlden=0x7fee5916be98,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c52720,_xlast=0x7fee58c528a0,_ylast=[0x7fee59157830,0x7fee59157830,
 0x7fee59157830],_y0=0x7fee59176230,_signus=0x7fee58c564a0,_puppixoffset=[0,0],
 _nact=80,_def=0x115875030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58c5dbd0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916c288,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5916c448,xposition=0x7fee5916bed0,yposition=
 0x7fee5916b988,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5914bd10,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=3e-05,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    441.2
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.1   0.564      135.1
Field Avg  1.65                     54.1   0.564      135.1
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).fracIllum   = 0.75;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873288,layerfrac=0x7fee59873398,
 layerspeed=0x7fee59873310,layeralt=0x7fee598728f8,winddir=0x7fee59873200,
 _layeralt=0x7fee59153c10)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916bdb8,lgs_prof_alt=0x7fee5916b918,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58c55ad0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58c51960,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x112f99030,_masks=0x0,_fluxpersub=0x7fee58f035e0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58f03830,_skyfluxpersub=0x7fee58c53e30,
 _nphotons=441.219,_skynphotons=0,_tt=[-0.000561291,1.45121e-05],_lastvalidtt=
 [-0.000561291,1.45121e-05],_upttcommand=[0,0],_refmes=0x7fee598cd230,_tiprefv=
 0x7fee59971c30,_tiltrefv=0x7fee598cc830,_tiprefvn=0x7fee598ca630,_tiltrefvn=
 0x7fee598c9e30,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58c51bb0,_jstart=0x7fee58c54080,_binindices=0x7fee598aec30,
 _binxy=2,_centroidw=0x7fee5916c2f8,_fimage=0x7fee59223a30,_fimage2=0x0,
 _imistart=0x7fee58d31020,_imjstart=0x7fee58d31270,_imistart2=0x7fee58d314c0,
 _imjstart2=0x7fee58d31710,_unittip=0x7fee58c511e0,_unittilt=0x7fee58c538f0,
 _lgs_defocuses=0x7fee5916b8a8,_unitdefocus=0x1123f9030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee5922d830,_flat=0x7fee59288630,_domask=1,
 _submask=0x7fee5a821230,_kernel=0x7fee5a81f230,_kernels=0x10ef0d030,_kerfftr=
 0x10edf7030,_kerffti=0x10ee5d030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee592d8830,_x=0x7fee59291430,_y=0x7fee592dfc30,_centroidgain=1,_rayleigh=
 0x7fee5916c1e0,_bckgrdcalib=0x7fee5922ee30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916c528)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916c3d8,_ctrlden=0x7fee5916b988,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c52460,_xlast=0x7fee58c52720,_ylast=[0x7fee59176230,0x7fee59176230,
 0x7fee59176230],_y0=0x7fee59291e30,_signus=0x7fee58c56760,_puppixoffset=[0,0],
 _nact=80,_def=0x11459a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58d25b10,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916c288,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5916c448,xposition=0x7fee5916bd10,yposition=
 0x7fee5914c138,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5914bd10,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=5e-05,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    617.7
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.4   0.564      135.1
Field Avg  1.65                     54.4   0.564      135.1
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).fracIllum   = 0.75;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873288,layerfrac=0x7fee59873398,
 layerspeed=0x7fee59873310,layeralt=0x7fee598728f8,winddir=0x7fee59873200,
 _layeralt=0x7fee59154738)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916bdb8,lgs_prof_alt=0x7fee5916b918,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58d29690,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58d28060,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x112760030,_masks=0x0,_fluxpersub=0x7fee58c518a0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58c51af0,_skyfluxpersub=0x7fee58c54b40,
 _nphotons=617.707,_skynphotons=0,_tt=[-0.000475329,-9.1892e-05],_lastvalidtt=
 [-0.000475329,-9.1892e-05],_upttcommand=[0,0],_refmes=0x7fee598b9030,_tiprefv=
 0x7fee59288630,_tiltrefv=0x7fee59223a30,_tiprefvn=0x7fee59288e30,_tiltrefvn=
 0x7fee592da830,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58d282b0,_jstart=0x7fee58d28500,_binindices=0x7fee59226a30,
 _binxy=2,_centroidw=0x7fee5916c0c8,_fimage=0x7fee5a823630,_fimage2=0x0,
 _imistart=0x7fee58c511e0,_imjstart=0x7fee58c542c0,_imistart2=0x7fee58c54510,
 _imjstart2=0x7fee58c54760,_unittip=0x7fee58d2dfb0,_unittilt=0x7fee58d270d0,
 _lgs_defocuses=0x7fee5916c330,_unitdefocus=0x111cf3030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee598c8c30,_flat=0x7fee598ccc30,_domask=1,
 _submask=0x7fee59228630,_kernel=0x7fee598a8c30,_kernels=0x10ef73030,_kerfftr=
 0x10efd9030,_kerffti=0x10ef0d030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee5a81d030,_x=0x7fee5989ae30,_y=0x7fee598c8630,_centroidgain=1,_rayleigh=
 0x7fee5916c1e0,_bckgrdcalib=0x7fee5997a430,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916bed0)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916b800,_ctrlden=0x7fee5916c3d8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c549c0,_xlast=0x7fee58c52460,_ylast=[0x7fee59291e30,0x7fee59291e30,
 0x7fee59291e30],_y0=0x7fee59157830,_signus=0x7fee58c55260,_puppixoffset=[0,0],
 _nact=80,_def=0x115875030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58e06300,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916c288,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5916c448,xposition=0x7fee5916c218,yposition=
 0x7fee5916c598,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5914bd10,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=7e-05,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    882.4
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.9   0.563      131.7
Field Avg  1.65                     54.9   0.563      131.7
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).fracIllum   = 0.75;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873288,layerfrac=0x7fee59873398,
 layerspeed=0x7fee59873310,layeralt=0x7fee598728f8,winddir=0x7fee59873200,
 _layeralt=0x7fee591548d0)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,
 skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916bdb8,lgs_prof_alt=0x7fee5916b918,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58d27580,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58d27a10,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x10f21a030,_masks=0x0,_fluxpersub=0x7fee58c55d00,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58c515e0,_skyfluxpersub=0x7fee58c511e0,
 _nphotons=882.439,_skynphotons=0,_tt=[-0.00105446,-0.000446982],_lastvalidtt=
 [-0.00105446,-0.000446982],_upttcommand=[0,0],_refmes=0x7fee598b9030,_tiprefv=
 0x7fee598af430,_tiltrefv=0x7fee598aec30,_tiprefvn=0x7fee598c1c30,_tiltrefvn=
 0x7fee598c3630,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58d27c60,_jstart=0x7fee58d2a040,_binindices=0x7fee59226a30,
 _binxy=2,_centroidw=0x7fee5914bd48,_fimage=0x7fee598ba430,_fimage2=0x0,
 _imistart=0x7fee58c553c0,_imjstart=0x7fee58c55610,_imistart2=0x7fee58c55860,
 _imjstart2=0x7fee58c55ab0,_unittip=0x7fee58d29680,_unittilt=0x7fee58d28b50,
 _lgs_defocuses=0x7fee5916b870,_unitdefocus=0x1121f8030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee59214c30,_flat=0x7fee598c8630,_domask=1,
 _submask=0x7fee59294430,_kernel=0x7fee598c5c30,_kernels=0x10edd8030,_kerfftr=
 0x10ee5d030,_kerffti=0x10ef73030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee598cc830,_x=0x7fee598c2430,_y=0x7fee598c2a30,_centroidgain=1,_rayleigh=
 0x7fee5916c1e0,_bckgrdcalib=0x7fee598c9030,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916bd80)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916bed0,_ctrlden=0x7fee5916b800,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c550c0,_xlast=0x7fee58c53350,_ylast=[0x7fee59157830,0x7fee59157830,
 0x7fee59157830],_y0=0x7fee59176230,_signus=0x7fee58c52460,_puppixoffset=[0,0],
 _nact=80,_def=0x11459a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58f029d0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916c288,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5916c448,xposition=0x7fee59142988,yposition=
 0x7fee5916c528,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5914bd10,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.0001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    8.8
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 43.3; 5000 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       54.9   0.563      131.7
Field Avg  1.65                     54.9   0.563      131.7
Field rms  1.65                      0.0   0.000        0.0

Average images written in sh12x12-imav.fits
Some other graphics in sh12x12.ps

Original parameter file: sh12x12.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12 w/ TT mirror and WFS, full diffraction WFS";
 sim.pupildiam      = 132;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 43.33;  // this is r0=0.166 at 550 nm
 atm.screen	       = &("~/.yorick/data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt	   = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type	       = "hartmann";
 wfs(n).lambda	   = 0.65;
 //wfs(n).gspos       = [0.,0.];
 //wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod	   = 2; //1= Geometric, simple gradient average over subaperture. 2=Diffractive, full propagation
 wfs(n).shnxsub	   = 12; //# of subapertures in telescope diameter
 wfs(n).pixsize     = 1.2; //Focal plane: Subaperture CCD pixel size in arcsec 72um/60um = 1.2, plate scale is 60 um/arcsec
 wfs(n).npixels     = 2; //Focal plane: Final # of pixels per subaperture
 wfs.npixpersub     = 11;
 wfs(n).noise       = 5;
 wfs(n).ron         = 3.5;
 //wfs(n).fracIllum   = 0.75;
 //wfs(n).shthreshold = 0.;
 //wfs(n).nintegcycles= 1;
 //wfs(n).nzer        = 80;
 wfs(n).fssize      = 2.4;
 wfs(n).fstop       = "square";
 //-------------------------------
 ndm                = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type	       = "zernike";
 dm(n).nzer         = 80;
 //dm(n).iffile	   = "";
 //dm(n).nxact	       = 20;
 dm(n).pitch	       = 7;
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt  = 0.01;
 //dm(n).push4imat    = 100;
 
 //n  =2;
 //dm(n).type	   = "tiptilt";
 //dm(n).iffile	   = "";
 //dm(n).alt          = 0.;
 //dm(n).unitpervolt   = 0.0005;
 //dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.condition      = &([15.]);
 mat.file	       = "";
 
 //-------------------------------
 tel.diam	   = 6.5;
 tel.cobs	   = 0.1;// 64cm/6.5m = 0.1
 
 //-------------------------------
 target.lambda	   = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint	   = 1e11;
 
 //-------------------------------
 loop.gain	       = 0.5;
 loop.framedelay    = 1;
 loop.niter	       = 5000;
 loop.ittime	       = 1e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12 w/ TT mirror and WFS, full diffraction WFS",
 pupildiam=132,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=512,_cent=256.5)
 atm_struct(dr0at05mic=43.33,screen=0x7fee59873288,layerfrac=0x7fee59873398,
 layerspeed=0x7fee59873310,layeralt=0x7fee598728f8,winddir=0x7fee59873200,
 _layeralt=0x7fee59154408)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=5,ron=3.5,
 darkcurrent=0,excessnoise=1,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=
 10,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,dmnotinpath=0x0,framedelay=-1,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=12,npixpersub=11,pixsize=1.19121,npixels=2,
 spotpitch=2,extfield=2.38243,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.4,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,
 LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=
 0,lgs_focus_alt=0,lgs_prof_amp=0x7fee5916bdb8,lgs_prof_alt=0x7fee5916b918,nzer=
 0,ndh=0,ndhfiltered=0,_framedelay=1,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fee58d29480,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fee58d27390,_origpixsize=1.2,_rebinfactor=14,_gsalt=0,_gsdepth=0,_nsub=120,
 _nsub4disp=132,_nmes=240,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x112a98030,_masks=0x0,_fluxpersub=0x7fee58d28060,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fee58d282b0,_skyfluxpersub=0x7fee58d28500,
 _nphotons=8.82439,_skynphotons=0,_tt=[-0.0010545,-0.000446963],_lastvalidtt=
 [-0.0010545,-0.000446963],_upttcommand=[0,0],_refmes=0x7fee5a016430,_tiprefv=
 0x7fee59222e30,_tiltrefv=0x7fee59222630,_tiprefvn=0x7fee59223630,_tiltrefvn=
 0x7fee59292a30,_reordervec=0x0,_npixels=2,_npb=0,_sdim=32,_nx=28,_nx4fft=28,
 _istart=0x7fee58d28750,_jstart=0x7fee58d289a0,_binindices=0x7fee5922d830,
 _binxy=2,_centroidw=0x7fee5916c058,_fimage=0x7fee598c5030,_fimage2=0x0,
 _imistart=0x7fee58c51430,_imjstart=0x7fee58c51680,_imistart2=0x7fee58c518d0,
 _imjstart2=0x7fee58c51b20,_unittip=0x7fee58d27c70,_unittilt=0x7fee58d20df0,
 _lgs_defocuses=0x7fee5916c138,_unitdefocus=0x1120f5030,_fimnx=24,_fimny=24,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fee598c5c30,_flat=0x7fee5922ee30,_domask=1,
 _submask=0x7fee598c2430,_kernel=0x7fee5928a830,_kernels=0x10efd9030,_kerfftr=
 0x10ef0d030,_kerffti=0x10edd8030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fee598ca430,_x=0x7fee59899c30,_y=0x7fee598a9230,_centroidgain=1,_rayleigh=
 0x7fee5916c1e0,_bckgrdcalib=0x7fee59226a30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1,_dmnotinpath=0x7fee5916c170)]
 [dm_struct(type="zernike",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "sh12x12-if1.fits",pitch=7,alt=0,hyst=0,push4imat=20,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fee5916b988,_ctrlden=0x7fee5916bed0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,actlocfile=0x0,nelperring=0x0,angleoffset=
 0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="sh12x12-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=80,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fee58c53e30,_xlast=0x7fee58c55010,_ylast=[0x7fee59176230,0x7fee59176230,
 0x7fee59176230],_y0=0x7fee59081430,_signus=0x7fee58c52720,_puppixoffset=[0,0],
 _nact=80,_def=0x115875030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="sh12x12-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=182,_n2=331,_pupil=0x0,_command=0x7fee58c511e0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fee5916c288,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="sh12x12-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=6.5,cobs=0.1,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fee5916c448,xposition=0x7fee5916bc68,yposition=
 0x7fee5916be98,xspeed=0x0,yspeed=0x0,dispzoom=0x7fee5914bd10,ncpdm=0x0,
 _ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.5,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=5000,
 ittime=0.0001,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12 w/ TT mirror and WFS, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      1.1912  0.0851  1.1912   2.72  2.38  2.38    2x 2    2x 2    3513.1
 
Summary:
Mirror #1, zernike, 80 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 120 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 35.0; 5000 iterations
