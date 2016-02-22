=============================
SH 12x12, quick method, with separate Quadcell and TT mirror
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.1273  0.0636  0.1273   1.02  0.25  0.25    2x 2    2x 2    52447.6
 2      0.5012  0.0080  0.5012   1.02  1.00  1.00    2x 2    2x 2    300.7
 
Summary:
Mirror #1, stackarray, 144 actuators, conjugated @ 0 m
Mirror #2, tiptilt, 2 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 1), 116 subap., offaxis (+0.0",+0.0"), noise disabled
WFS # 2, hartmann (meth. 2),  1 subap., offaxis (+5.0",+0.0"), noise enabled
D/r0 (500nm) = 40.0; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       45.2   0.780       55.8
Field Avg  1.65                     45.2   0.780       55.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in test2-imav.fits
Some other graphics in test2.ps

Original parameter file: test2.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12, quick method, with separate Quadcell and TT mirror";
 sim.pupildiam      = 60;
 sim.debug          = 0;
 sim.verbose        = 0;
 
 //-------------------------------
 atm.dr0at05mic     = 40.;
 atm.screen         = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt       = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs = 2; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type        = "hartmann";
 wfs(n).subsystem   = 1;
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod    = 1;
 wfs(n).shnxsub     = 12;
 wfs(n).filtertilt  = 1;  // using a dedicated TT guide star, so I filter this one.
 wfs(n).skymag      = 18.;
 
 n   = 2;
 wfs(n).type        = "hartmann";
 wfs(n).subsystem   = 2;
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [5.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 16.;
 wfs(n).skymag      = 20.5;
 wfs(n).shmethod    = 2;
 wfs(n).shnxsub     = 1;
 wfs(n).npixels     = 2;
 wfs(n).pixsize     = 0.5;
 wfs(n).noise       = 1;
 wfs(n).ron         = 0.;
 wfs(n).darkcurrent = 500.;
 wfs(n).dispzoom    = 0.1;
 
 //-------------------------------
 ndm = 2;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type         = "stackarray";
 dm(n).subsystem    = 1;
 dm(n).iffile       = "";
 dm(n).nxact        = 13;
 dm(n).pitch        = 5;
 dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.01;
 dm(n).push4imat    = 2;
 
 n  =2;
 dm(n).type         = "tiptilt";
 dm(n).subsystem    = 2;
 dm(n).iffile       = "";
 dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.0005;
 dm(n).push4imat    = 2;
 dm(n).gain         = 0.5;
 
 //-------------------------------
 mat.condition      = &([15.,100.]);
 
 //-------------------------------
 tel.diam           = 7.9;
 tel.cobs           = 0.1125;
 
 //-------------------------------
 target.lambda      = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0.]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint       = 3e11;
 
 //-------------------------------
 loop.gain          = 0.6;
 loop.framedelay    = 0;
 loop.niter         = 500;
 loop.ittime        = 2e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12, quick method, with separate Quadcell and TT mirror",
 pupildiam=60,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=128,_cent=64.5)
 atm_struct(dr0at05mic=40,screen=0x7fab3291af38,layerfrac=0x7fab3291aeb0,
 layerspeed=0x7fab3291afc0,layeralt=0x7fab3301cff8,winddir=0x7fab3301bcd8,
 _layeralt=0x7fab3291ac90)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=0,ron=0,darkcurrent=
 0,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=18,filtertilt=1,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,
 fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,
 pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=1,shnxsub=12,npixpersub=0,pixsize=
 0.127287,npixels=2,spotpitch=2,extfield=0.254574,pupoffset=[0,0],shthmethod=0,
 shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,
 fstop=0x0,fssize=0,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fab3380cb80,lgs_prof_alt=
 0x7fab3380b6a8,nzer=0,ndh=0,ndhfiltered=0,_initkernels=1,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fab3242f250,
 _origpixsize=0.1,_rebinfactor=2,_gsalt=0,_gsdepth=0,_nsub=116,_nsub4disp=116,
 _nmes=232,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x7fab338efe30,
 _masks=0x0,_fluxpersub=0x7fab32432790,_rayleighflux=0x0,_sodiumflux=0x0,
 _raylfluxpersub=0x7fab324329a0,_skyfluxpersub=0x7fab32631170,_nphotons=52447.6,
 _skynphotons=0.00536161,_tt=[-0.00145932,0.00513743],_lastvalidtt=[-0.00145932,
 0.00513743],_upttcommand=[0,0],_refmes=0x7fab324323b0,_tiprefv=0x7fab3285bc30,
 _tiltrefv=0x7fab33038e30,_tiprefvn=0x7fab3285c430,_tiltrefvn=0x7fab3300f430,
 _reordervec=0x0,_npixels=2,_npb=0,_sdim=16,_nx=4,_nx4fft=4,_istart=
 0x7fab3242fc90,_jstart=0x7fab32431960,_binindices=0x7fab3301c668,_binxy=2,
 _centroidw=0x7fab3380b830,_fimage=0x7fab32859e30,_fimage2=0x0,_imistart=
 0x7fab3242f8b0,_imjstart=0x7fab32431d80,_imistart2=0x7fab32431f90,_imjstart2=
 0x7fab324321a0,_unittip=0x7fab340a7940,_unittilt=0x7fab338defe0,_lgs_defocuses=
 0x7fab3380c280,_unitdefocus=0x7fab32958230,_fimnx=24,_fimny=24,_fimny2=0x0,
 _yoffset=0x0,_bias=0x7fab33889030,_flat=0x7fab33909630,_domask=0,_submask=0x0,
 _kernel=0x7fab3301c338,_kernels=0x7fab329f0830,_kerfftr=0x7fab329f2630,
 _kerffti=0x7fab329ed030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fab3285b230,_x=0x7fab324309e0,_y=0x7fab32430dc0,_centroidgain=1,_rayleigh=
 0x7fab3380c0f8,_bckgrdcalib=0x7fab3383aa30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=2,lambda=0.65,noise=1,ron=0,darkcurrent=500,gspos=[5,0],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=16,skymag=20.5,filtertilt=0,correctUpTT=0,
 uplinkgain=0,dispzoom=0.1,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,
 ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=1,npixpersub=0,pixsize=0.501194,npixels=2,
 spotpitch=2,extfield=1.00239,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=1.00239,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fab3380ca68,lgs_prof_alt=
 0x7fab3380be20,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fab3380cad8,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fab3380c600,_origpixsize=0.5,_rebinfactor=63,_gsalt=0,_gsdepth=0,_nsub=1,
 _nsub4disp=1,_nmes=2,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x7fab32968430,_masks=0x0,_fluxpersub=0x7fab3380c0c0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fab3380bad8,_skyfluxpersub=0x7fab3380c050,
 _nphotons=300.668,_skynphotons=1.19701,_tt=[0.0147872,0.0304442],_lastvalidtt=
 [0.0147872,0.0304442],_upttcommand=[0,0],_refmes=0x7fab3380bd78,_tiprefv=
 0x7fab3380c4e8,_tiltrefv=0x7fab3380c7f8,_tiprefvn=0x7fab3380bfa8,_tiltrefvn=
 0x7fab3380cd78,_reordervec=0x0,_npixels=2,_npb=0,_sdim=128,_nx=126,_nx4fft=126,
 _istart=0x7fab3380c830,_jstart=0x7fab3380c670,_binindices=0x7fab33989030,
 _binxy=2,_centroidw=0x7fab3380c3d0,_fimage=0x7fab3380b788,_fimage2=0x0,
 _imistart=0x7fab3380c2f0,_imjstart=0x7fab3380cf00,_imistart2=0x7fab3380cb48,
 _imjstart2=0x7fab3380c520,_unittip=0x7fab3390a830,_unittilt=0x7fab339cac30,
 _lgs_defocuses=0x7fab3380c398,_unitdefocus=0x7fab339baa30,_fimnx=2,_fimny=2,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fab3380cfe0,_flat=0x7fab3380b750,_domask=1,
 _submask=0x7fab339e1030,_kernel=0x7fab34091630,_kernels=0x7fab33a00230,
 _kerfftr=0x7fab338b2230,_kerffti=0x7fab338c1c30,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7fab3380d1d8,_x=0x7fab3380cc98,_y=0x7fab3380c750,_centroidgain=1,
 _rayleigh=0x7fab3380bbb8,_bckgrdcalib=0x7fab3380c328,_bckgrdinit=0,_bckgrdsub=
 1,_meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],
 _LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=
 0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test2-if1.fits",pitch=5,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fab3380c718,_ctrlden=0x7fab3380c168,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=13,pitchMargin=0,coupling=0.2,
 ecmatfile="test2-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fab32634c90,_xlast=0x7fab32635160,_ylast=[0x7fab3390a030,0x7fab3390a030,
 0x7fab3390a030],_y0=0x7fab33988830,_signus=0x7fab33889a30,_puppixoffset=[0,0],
 _nact=144,_def=0x102b49030,_x=0x7fab32432f40,_y=0x7fab324311a0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x7fab32858e30,_indext=0x7fab328fcc10,_eiffile=
 "test2-if1-ext.fits",_edef=0x100cb7030,_ex=0x7fab3301af28,_ey=0x7fab3291b048,
 _enact=13,_n1=26,_n2=103,_pupil=0x0,_command=0x7fab32431420,_flat_command=0x0,
 _extrapcmat=0x7fab340aee30,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0),dm_struct(
 type="tiptilt",subsystem=2,virtual=0,dmfit_which=0x0,iffile="test2-if2.fits",
 pitch=0,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,unitpervolt=0.0005,maxvolt=
 0,gain=0.5,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7fab3380cdb0,_ctrlden=
 0x7fab3380c130,misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],disjointpup=0,
 pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,use_def_of=0,
 ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=0x0,
 supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,ecmatfile=
 "test2-ecmat2.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,nzer=0,
 minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,regmatrix=0x0,
 _alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fab3380c6e0,_xlast=0x7fab3380c478,_ylast=[0x7fab3301b458,0x7fab3301b458,
 0x7fab3301b458],_y0=0x7fab3301b568,_signus=0x7fab3380c2b8,_puppixoffset=[0,0],
 _nact=2,_def=0x7fab3394ac30,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test2-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=26,_n2=103,_pupil=0x0,_command=0x7fab3380ce58,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fab3380cc28,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test2-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fab3380c088,xposition=0x7fab3380c248,yposition=
 0x7fab3380c5c8,dispzoom=0x7fab3380c4b0,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=0,niter=500,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       45.2   0.780       55.8
Field Avg  1.65                     45.2   0.780       55.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in test2-imav.fits
Some other graphics in test2.ps

Original parameter file: test2.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12, quick method, with separate Quadcell and TT mirror";
 sim.pupildiam      = 60;
 sim.debug          = 0;
 sim.verbose        = 0;
 
 //-------------------------------
 atm.dr0at05mic     = 40.;
 atm.screen         = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt       = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs = 2; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type        = "hartmann";
 wfs(n).subsystem   = 1;
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod    = 1;
 wfs(n).shnxsub     = 12;
 wfs(n).filtertilt  = 1;  // using a dedicated TT guide star, so I filter this one.
 wfs(n).skymag      = 18.;
 
 n   = 2;
 wfs(n).type        = "hartmann";
 wfs(n).subsystem   = 2;
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [5.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 16.;
 wfs(n).skymag      = 20.5;
 wfs(n).shmethod    = 2;
 wfs(n).shnxsub     = 1;
 wfs(n).npixels     = 2;
 wfs(n).pixsize     = 0.5;
 wfs(n).noise       = 1;
 wfs(n).ron         = 0.;
 wfs(n).darkcurrent = 500.;
 wfs(n).dispzoom    = 0.1;
 
 //-------------------------------
 ndm = 2;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type         = "stackarray";
 dm(n).subsystem    = 1;
 dm(n).iffile       = "";
 dm(n).nxact        = 13;
 dm(n).pitch        = 5;
 dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.01;
 dm(n).push4imat    = 2;
 
 n  =2;
 dm(n).type         = "tiptilt";
 dm(n).subsystem    = 2;
 dm(n).iffile       = "";
 dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.0005;
 dm(n).push4imat    = 2;
 dm(n).gain         = 0.5;
 
 //-------------------------------
 mat.condition      = &([15.,100.]);
 
 //-------------------------------
 tel.diam           = 7.9;
 tel.cobs           = 0.1125;
 
 //-------------------------------
 target.lambda      = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0.]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint       = 3e11;
 
 //-------------------------------
 loop.gain          = 0.6;
 loop.framedelay    = 0;
 loop.niter         = 500;
 loop.ittime        = 2e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12, quick method, with separate Quadcell and TT mirror",
 pupildiam=60,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=128,_cent=64.5)
 atm_struct(dr0at05mic=40,screen=0x7fab3291af38,layerfrac=0x7fab3291aeb0,
 layerspeed=0x7fab3291afc0,layeralt=0x7fab3301cff8,winddir=0x7fab3301bcd8,
 _layeralt=0x7fab3291ac90)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=0,ron=0,darkcurrent=
 0,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=18,filtertilt=1,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,
 fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,
 pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=1,shnxsub=12,npixpersub=0,pixsize=
 0.127287,npixels=2,spotpitch=2,extfield=0.254574,pupoffset=[0,0],shthmethod=0,
 shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,
 fstop=0x0,fssize=0,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fab3380cb80,lgs_prof_alt=
 0x7fab3380b6a8,nzer=0,ndh=0,ndhfiltered=0,_initkernels=1,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fab3242f250,
 _origpixsize=0.1,_rebinfactor=2,_gsalt=0,_gsdepth=0,_nsub=116,_nsub4disp=116,
 _nmes=232,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x7fab338efe30,
 _masks=0x0,_fluxpersub=0x7fab32432790,_rayleighflux=0x0,_sodiumflux=0x0,
 _raylfluxpersub=0x7fab324329a0,_skyfluxpersub=0x7fab32631170,_nphotons=52447.6,
 _skynphotons=0.00536161,_tt=[-0.00145932,0.00513743],_lastvalidtt=[-0.00145932,
 0.00513743],_upttcommand=[0,0],_refmes=0x7fab324323b0,_tiprefv=0x7fab3285bc30,
 _tiltrefv=0x7fab33038e30,_tiprefvn=0x7fab3285c430,_tiltrefvn=0x7fab3300f430,
 _reordervec=0x0,_npixels=2,_npb=0,_sdim=16,_nx=4,_nx4fft=4,_istart=
 0x7fab3242fc90,_jstart=0x7fab32431960,_binindices=0x7fab3301c668,_binxy=2,
 _centroidw=0x7fab3380b830,_fimage=0x7fab32859e30,_fimage2=0x0,_imistart=
 0x7fab3242f8b0,_imjstart=0x7fab32431d80,_imistart2=0x7fab32431f90,_imjstart2=
 0x7fab324321a0,_unittip=0x7fab340a7940,_unittilt=0x7fab338defe0,_lgs_defocuses=
 0x7fab3380c280,_unitdefocus=0x7fab32958230,_fimnx=24,_fimny=24,_fimny2=0x0,
 _yoffset=0x0,_bias=0x7fab33889030,_flat=0x7fab33909630,_domask=0,_submask=0x0,
 _kernel=0x7fab3301b458,_kernels=0x7fab329f0830,_kerfftr=0x7fab329f2630,
 _kerffti=0x7fab329ed030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fab32856e30,_x=0x7fab324309e0,_y=0x7fab32430dc0,_centroidgain=1,_rayleigh=
 0x7fab3380c0f8,_bckgrdcalib=0x7fab3383aa30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=2,lambda=0.65,noise=1,ron=0,darkcurrent=500,gspos=[5,0],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=16,skymag=20.5,filtertilt=0,correctUpTT=0,
 uplinkgain=0,dispzoom=0.1,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,
 ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=1,npixpersub=0,pixsize=0.501194,npixels=2,
 spotpitch=2,extfield=1.00239,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=1.00239,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fab3380ca68,lgs_prof_alt=
 0x7fab3380be20,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fab3380bdb0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fab3380c600,_origpixsize=0.5,_rebinfactor=63,_gsalt=0,_gsdepth=0,_nsub=1,
 _nsub4disp=1,_nmes=2,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x7fab32968430,_masks=0x0,_fluxpersub=0x7fab3380c0c0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fab3380bad8,_skyfluxpersub=0x7fab3380c050,
 _nphotons=300.668,_skynphotons=1.19701,_tt=[0.0147872,0.0304442],_lastvalidtt=
 [0.0147872,0.0304442],_upttcommand=[0,0],_refmes=0x7fab3380bd78,_tiprefv=
 0x7fab3380c4e8,_tiltrefv=0x7fab3380c7f8,_tiprefvn=0x7fab3380bfa8,_tiltrefvn=
 0x7fab3380cd78,_reordervec=0x0,_npixels=2,_npb=0,_sdim=128,_nx=126,_nx4fft=126,
 _istart=0x7fab3380c830,_jstart=0x7fab3380c670,_binindices=0x7fab33989030,
 _binxy=2,_centroidw=0x7fab3380c3d0,_fimage=0x7fab3380bb10,_fimage2=0x0,
 _imistart=0x7fab3380c2f0,_imjstart=0x7fab3380cf00,_imistart2=0x7fab3380cb48,
 _imjstart2=0x7fab3380c520,_unittip=0x7fab3390a830,_unittilt=0x7fab339cac30,
 _lgs_defocuses=0x7fab3380c398,_unitdefocus=0x7fab339baa30,_fimnx=2,_fimny=2,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fab3380cfe0,_flat=0x7fab3380b750,_domask=1,
 _submask=0x7fab339e1030,_kernel=0x7fab329d9230,_kernels=0x7fab33a00230,
 _kerfftr=0x7fab338b2230,_kerffti=0x7fab338c1c30,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7fab3380d168,_x=0x7fab3380cc98,_y=0x7fab3380c750,_centroidgain=1,
 _rayleigh=0x7fab3380bbb8,_bckgrdcalib=0x7fab3380c328,_bckgrdinit=0,_bckgrdsub=
 1,_meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],
 _LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=
 0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test2-if1.fits",pitch=5,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fab3380c478,_ctrlden=0x7fab3380c788,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=13,pitchMargin=0,coupling=0.2,
 ecmatfile="test2-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fab324341f0,_xlast=0x7fab32433370,_ylast=[0x7fab32866430,0x7fab32866430,
 0x7fab32866430],_y0=0x7fab32865c30,_signus=0x7fab329efa30,_puppixoffset=[0,0],
 _nact=144,_def=0x102b49030,_x=0x7fab32432f40,_y=0x7fab324311a0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x7fab32858e30,_indext=0x7fab328fcc10,_eiffile=
 "test2-if1-ext.fits",_edef=0x100cb7030,_ex=0x7fab3301af28,_ey=0x7fab3291b048,
 _enact=13,_n1=26,_n2=103,_pupil=0x0,_command=0x7fab32433c70,_flat_command=0x0,
 _extrapcmat=0x7fab340aee30,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0),dm_struct(
 type="tiptilt",subsystem=2,virtual=0,dmfit_which=0x0,iffile="test2-if2.fits",
 pitch=0,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,unitpervolt=0.0005,maxvolt=
 0,gain=0.5,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7fab3380ce58,_ctrlden=
 0x7fab3380d280,misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],disjointpup=0,
 pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,use_def_of=0,
 ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=0x0,
 supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,ecmatfile=
 "test2-ecmat2.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,nzer=0,
 minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,regmatrix=0x0,
 _alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fab3380c718,_xlast=0x7fab3380c130,_ylast=[0x7fab3301bab8,0x7fab3301bab8,
 0x7fab3301bab8],_y0=0x7fab3301bbc8,_signus=0x7fab3380c6e0,_puppixoffset=[0,0],
 _nact=2,_def=0x7fab3394ac30,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test2-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=26,_n2=103,_pupil=0x0,_command=0x7fab3380d1d8,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fab3380cc28,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test2-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fab3380c088,xposition=0x7fab3380c248,yposition=
 0x7fab3380c5c8,dispzoom=0x7fab3380c4b0,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=0,niter=500,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12, quick method, with separate Quadcell and TT mirror
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.1273  0.0636  0.1273   1.02  0.25  0.25    2x 2    2x 2    52447.6
 2      0.5012  0.0080  0.5012   1.02  1.00  1.00    2x 2    2x 2    300.7
 
Summary:
Mirror #1, stackarray, 144 actuators, conjugated @ 0 m
Mirror #2, tiptilt, 2 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 1), 116 subap., offaxis (+0.0",+0.0"), noise disabled
WFS # 2, hartmann (meth. 2),  1 subap., offaxis (+5.0",+0.0"), noise enabled
D/r0 (500nm) = 40.0; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       45.2   0.780       55.8
Field Avg  1.65                     45.2   0.780       55.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in test2-imav.fits
Some other graphics in test2.ps

Original parameter file: test2.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12, quick method, with separate Quadcell and TT mirror";
 sim.pupildiam      = 60;
 sim.debug          = 0;
 sim.verbose        = 0;
 
 //-------------------------------
 atm.dr0at05mic     = 40.;
 atm.screen         = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt       = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs = 2; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type        = "hartmann";
 wfs(n).subsystem   = 1;
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod    = 1;
 wfs(n).shnxsub     = 12;
 wfs(n).filtertilt  = 1;  // using a dedicated TT guide star, so I filter this one.
 wfs(n).skymag      = 18.;
 
 n   = 2;
 wfs(n).type        = "hartmann";
 wfs(n).subsystem   = 2;
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [5.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 16.;
 wfs(n).skymag      = 20.5;
 wfs(n).shmethod    = 2;
 wfs(n).shnxsub     = 1;
 wfs(n).npixels     = 2;
 wfs(n).pixsize     = 0.5;
 wfs(n).noise       = 1;
 wfs(n).ron         = 0.;
 wfs(n).darkcurrent = 500.;
 wfs(n).dispzoom    = 0.1;
 
 //-------------------------------
 ndm = 2;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type         = "stackarray";
 dm(n).subsystem    = 1;
 dm(n).iffile       = "";
 dm(n).nxact        = 13;
 dm(n).pitch        = 5;
 dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.01;
 dm(n).push4imat    = 2;
 
 n  =2;
 dm(n).type         = "tiptilt";
 dm(n).subsystem    = 2;
 dm(n).iffile       = "";
 dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.0005;
 dm(n).push4imat    = 2;
 dm(n).gain         = 0.5;
 
 //-------------------------------
 mat.condition      = &([15.,100.]);
 
 //-------------------------------
 tel.diam           = 7.9;
 tel.cobs           = 0.1125;
 
 //-------------------------------
 target.lambda      = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0.]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint       = 3e11;
 
 //-------------------------------
 loop.gain          = 0.6;
 loop.framedelay    = 0;
 loop.niter         = 500;
 loop.ittime        = 2e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12, quick method, with separate Quadcell and TT mirror",
 pupildiam=60,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=128,_cent=64.5)
 atm_struct(dr0at05mic=40,screen=0x7fa51a85ff38,layerfrac=0x7fa51a85feb0,
 layerspeed=0x7fa51a85ffc0,layeralt=0x7fa51a8d93f8,winddir=0x7fa51a8d80d8,
 _layeralt=0x7fa51a85fc90)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=0,ron=0,darkcurrent=
 0,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=18,filtertilt=1,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,
 fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,
 pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=1,shnxsub=12,npixpersub=0,pixsize=
 0.127287,npixels=2,spotpitch=2,extfield=0.254574,pupoffset=[0,0],shthmethod=0,
 shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,
 fstop=0x0,fssize=0,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fa51a8a2228,lgs_prof_alt=
 0x7fa51a8a20d8,nzer=0,ndh=0,ndhfiltered=0,_initkernels=1,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fa518c1a8b0,
 _origpixsize=0.1,_rebinfactor=2,_gsalt=0,_gsdepth=0,_nsub=116,_nsub4disp=116,
 _nmes=232,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x7fa51a04fa30,
 _masks=0x0,_fluxpersub=0x7fa518f3ee80,_rayleighflux=0x0,_sodiumflux=0x0,
 _raylfluxpersub=0x7fa518f3f090,_skyfluxpersub=0x7fa518c1aac0,_nphotons=52447.6,
 _skynphotons=0.00536161,_tt=[-0.00145932,0.00513743],_lastvalidtt=[-0.00145932,
 0.00513743],_upttcommand=[0,0],_refmes=0x7fa518e10490,_tiprefv=0x7fa51a046230,
 _tiltrefv=0x7fa51904e030,_tiprefvn=0x7fa51a048e30,_tiltrefvn=0x7fa51904e830,
 _reordervec=0x0,_npixels=2,_npb=0,_sdim=16,_nx=4,_nx4fft=4,_istart=
 0x7fa518c1ca30,_jstart=0x7fa518c1cc40,_binindices=0x7fa51a8d8a68,_binxy=2,
 _centroidw=0x7fa51a867830,_fimage=0x7fa51985da30,_fimage2=0x0,_imistart=
 0x7fa518d0ad40,_imjstart=0x7fa518d0b540,_imistart2=0x7fa518d0b750,_imjstart2=
 0x7fa518d0b960,_unittip=0x7fa519049d40,_unittilt=0x7fa51a96abe0,_lgs_defocuses=
 0x7fa51a8a1880,_unitdefocus=0x7fa5190e3a30,_fimnx=24,_fimny=24,_fimny2=0x0,
 _yoffset=0x0,_bias=0x7fa5190dd430,_flat=0x7fa5190dde30,_domask=0,_submask=0x0,
 _kernel=0x7fa51a8d8738,_kernels=0x7fa51a99d430,_kerfftr=0x7fa51a99f230,
 _kerffti=0x7fa51a967230,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fa51a9bf630,_x=0x7fa518c1bab0,_y=0x7fa518c1be90,_centroidgain=1,_rayleigh=
 0x7fa51a8a16f8,_bckgrdcalib=0x7fa5190dca30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=2,lambda=0.65,noise=1,ron=0,darkcurrent=500,gspos=[5,0],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=16,skymag=20.5,filtertilt=0,correctUpTT=0,
 uplinkgain=0,dispzoom=0.1,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,
 ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=1,npixpersub=0,pixsize=0.501194,npixels=2,
 spotpitch=2,extfield=1.00239,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=1.00239,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fa51a8a1420,lgs_prof_alt=
 0x7fa51a8a1a78,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fa51a8a2148,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fa51a8a2378,_origpixsize=0.5,_rebinfactor=63,_gsalt=0,_gsdepth=0,_nsub=1,
 _nsub4disp=1,_nmes=2,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x7fa51a9e3230,_masks=0x0,_fluxpersub=0x7fa51a8a1df8,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fa51a8a25e0,_skyfluxpersub=0x7fa51a8a1650,
 _nphotons=300.668,_skynphotons=1.19701,_tt=[0.0147872,0.0304442],_lastvalidtt=
 [0.0147872,0.0304442],_upttcommand=[0,0],_refmes=0x7fa51a8a1378,_tiprefv=
 0x7fa51a8a1110,_tiltrefv=0x7fa51a8a2068,_tiprefvn=0x7fa51a8a1e30,_tiltrefvn=
 0x7fa51a8a1ae8,_reordervec=0x0,_npixels=2,_npb=0,_sdim=128,_nx=126,_nx4fft=126,
 _istart=0x7fa51a8a2688,_jstart=0x7fa51a8a16c0,_binindices=0x7fa51917ce30,
 _binxy=2,_centroidw=0x7fa51a8a13e8,_fimage=0x7fa51a8a1148,_fimage2=0x0,
 _imistart=0x7fa51a8a18f0,_imjstart=0x7fa51a8a2618,_imistart2=0x7fa51a8a2110,
 _imjstart2=0x7fa51a8a1b20,_unittip=0x7fa51a9c0830,_unittilt=0x7fa51a9c4230,
 _lgs_defocuses=0x7fa51a8a1998,_unitdefocus=0x7fa51a9a9430,_fimnx=2,_fimny=2,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fa51a8a1928,_flat=0x7fa51a8a1d18,_domask=1,
 _submask=0x7fa51aa50430,_kernel=0x7fa519050830,_kernels=0x7fa51aa21630,
 _kerfftr=0x7fa51aa31030,_kerffti=0x7fa51aa40a30,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7fa51a8a27d8,_x=0x7fa51a8a13b0,_y=0x7fa51a8a1b90,_centroidgain=1,
 _rayleigh=0x7fa51a8a2458,_bckgrdcalib=0x7fa51a8a27a0,_bckgrdinit=0,_bckgrdsub=
 1,_meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],
 _LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=
 0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test2-if1.fits",pitch=5,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fa51a8a2730,_ctrlden=0x7fa51a8a10a0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=13,pitchMargin=0,coupling=0.2,
 ecmatfile="test2-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fa518d0b0f0,_xlast=0x7fa518d0bb70,_ylast=[0x7fa51985a030,0x7fa51985a030,
 0x7fa51985a030],_y0=0x7fa519859830,_signus=0x7fa51985a830,_puppixoffset=[0,0],
 _nact=144,_def=0x106fd5030,_x=0x7fa518e0ff80,_y=0x7fa518e10870,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x7fa51a01b430,_indext=0x7fa51909da10,_eiffile=
 "test2-if1-ext.fits",_edef=0x105121030,_ex=0x7fa51a8d0328,_ey=0x7fa51a860048,
 _enact=13,_n1=26,_n2=103,_pupil=0x0,_command=0x7fa518c1b250,_flat_command=0x0,
 _extrapcmat=0x7fa51aa64030,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0),dm_struct(
 type="tiptilt",subsystem=2,virtual=0,dmfit_which=0x0,iffile="test2-if2.fits",
 pitch=0,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,unitpervolt=0.0005,maxvolt=
 0,gain=0.5,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7fa51a8a2308,_ctrlden=
 0x7fa51a8a21f0,misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],disjointpup=0,
 pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,use_def_of=0,
 ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=0x0,
 supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,ecmatfile=
 "test2-ecmat2.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,nzer=0,
 minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,regmatrix=0x0,
 _alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fa51a8676e0,_xlast=0x7fa51a8a1c70,_ylast=[0x7fa51a8d7858,0x7fa51a8d7858,
 0x7fa51a8d7858],_y0=0x7fa51a8d7968,_signus=0x7fa51a8a1d50,_puppixoffset=[0,0],
 _nact=2,_def=0x7fa519894a30,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test2-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=26,_n2=103,_pupil=0x0,_command=0x7fa51a8676a8,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fa51a8a2180,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test2-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fa51a8a2340,xposition=0x7fa51a8a1848,yposition=
 0x7fa51a8a1bc8,dispzoom=0x7fa51a8a1ab0,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=0,niter=500,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       45.2   0.780       55.8
Field Avg  1.65                     45.2   0.780       55.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in test2-imav.fits
Some other graphics in test2.ps

Original parameter file: test2.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12, quick method, with separate Quadcell and TT mirror";
 sim.pupildiam      = 60;
 sim.debug          = 0;
 sim.verbose        = 0;
 
 //-------------------------------
 atm.dr0at05mic     = 40.;
 atm.screen         = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt       = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs = 2; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type        = "hartmann";
 wfs(n).subsystem   = 1;
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod    = 1;
 wfs(n).shnxsub     = 12;
 wfs(n).filtertilt  = 1;  // using a dedicated TT guide star, so I filter this one.
 wfs(n).skymag      = 18.;
 
 n   = 2;
 wfs(n).type        = "hartmann";
 wfs(n).subsystem   = 2;
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [5.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 16.;
 wfs(n).skymag      = 20.5;
 wfs(n).shmethod    = 2;
 wfs(n).shnxsub     = 1;
 wfs(n).npixels     = 2;
 wfs(n).pixsize     = 0.5;
 wfs(n).noise       = 1;
 wfs(n).ron         = 0.;
 wfs(n).darkcurrent = 500.;
 wfs(n).dispzoom    = 0.1;
 
 //-------------------------------
 ndm = 2;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type         = "stackarray";
 dm(n).subsystem    = 1;
 dm(n).iffile       = "";
 dm(n).nxact        = 13;
 dm(n).pitch        = 5;
 dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.01;
 dm(n).push4imat    = 2;
 
 n  =2;
 dm(n).type         = "tiptilt";
 dm(n).subsystem    = 2;
 dm(n).iffile       = "";
 dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.0005;
 dm(n).push4imat    = 2;
 dm(n).gain         = 0.5;
 
 //-------------------------------
 mat.condition      = &([15.,100.]);
 
 //-------------------------------
 tel.diam           = 7.9;
 tel.cobs           = 0.1125;
 
 //-------------------------------
 target.lambda      = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0.]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint       = 3e11;
 
 //-------------------------------
 loop.gain          = 0.6;
 loop.framedelay    = 0;
 loop.niter         = 500;
 loop.ittime        = 2e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12, quick method, with separate Quadcell and TT mirror",
 pupildiam=60,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=128,_cent=64.5)
 atm_struct(dr0at05mic=40,screen=0x7fa51a85ff38,layerfrac=0x7fa51a85feb0,
 layerspeed=0x7fa51a85ffc0,layeralt=0x7fa51a8d93f8,winddir=0x7fa51a8d80d8,
 _layeralt=0x7fa51a85fc90)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=0,ron=0,darkcurrent=
 0,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=18,filtertilt=1,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,
 fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,
 pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=1,shnxsub=12,npixpersub=0,pixsize=
 0.127287,npixels=2,spotpitch=2,extfield=0.254574,pupoffset=[0,0],shthmethod=0,
 shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,
 fstop=0x0,fssize=0,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fa51a8a2228,lgs_prof_alt=
 0x7fa51a8a20d8,nzer=0,ndh=0,ndhfiltered=0,_initkernels=1,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fa518c1a8b0,
 _origpixsize=0.1,_rebinfactor=2,_gsalt=0,_gsdepth=0,_nsub=116,_nsub4disp=116,
 _nmes=232,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x7fa51a04fa30,
 _masks=0x0,_fluxpersub=0x7fa518f3ee80,_rayleighflux=0x0,_sodiumflux=0x0,
 _raylfluxpersub=0x7fa518f3f090,_skyfluxpersub=0x7fa518c1aac0,_nphotons=52447.6,
 _skynphotons=0.00536161,_tt=[-0.00145932,0.00513743],_lastvalidtt=[-0.00145932,
 0.00513743],_upttcommand=[0,0],_refmes=0x7fa518e10490,_tiprefv=0x7fa51a046230,
 _tiltrefv=0x7fa51904e030,_tiprefvn=0x7fa51a048e30,_tiltrefvn=0x7fa51904e830,
 _reordervec=0x0,_npixels=2,_npb=0,_sdim=16,_nx=4,_nx4fft=4,_istart=
 0x7fa518c1ca30,_jstart=0x7fa518c1cc40,_binindices=0x7fa51a8d8a68,_binxy=2,
 _centroidw=0x7fa51a867830,_fimage=0x7fa51985da30,_fimage2=0x0,_imistart=
 0x7fa518d0ad40,_imjstart=0x7fa518d0b540,_imistart2=0x7fa518d0b750,_imjstart2=
 0x7fa518d0b960,_unittip=0x7fa519049d40,_unittilt=0x7fa51a96abe0,_lgs_defocuses=
 0x7fa51a8a1880,_unitdefocus=0x7fa5190e3a30,_fimnx=24,_fimny=24,_fimny2=0x0,
 _yoffset=0x0,_bias=0x7fa5190dd430,_flat=0x7fa5190dde30,_domask=0,_submask=0x0,
 _kernel=0x7fa51a8d7858,_kernels=0x7fa51a99d430,_kerfftr=0x7fa51a99f230,
 _kerffti=0x7fa51a967230,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fa5190fb030,_x=0x7fa518c1bab0,_y=0x7fa518c1be90,_centroidgain=1,_rayleigh=
 0x7fa51a8a16f8,_bckgrdcalib=0x7fa5190dca30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=2,lambda=0.65,noise=1,ron=0,darkcurrent=500,gspos=[5,0],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=16,skymag=20.5,filtertilt=0,correctUpTT=0,
 uplinkgain=0,dispzoom=0.1,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,
 ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=1,npixpersub=0,pixsize=0.501194,npixels=2,
 spotpitch=2,extfield=1.00239,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=1.00239,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fa51a8a1420,lgs_prof_alt=
 0x7fa51a8a1a78,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fa51a8a23b0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fa51a8a2378,_origpixsize=0.5,_rebinfactor=63,_gsalt=0,_gsdepth=0,_nsub=1,
 _nsub4disp=1,_nmes=2,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x7fa51a9e3230,_masks=0x0,_fluxpersub=0x7fa51a8a1df8,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fa51a8a25e0,_skyfluxpersub=0x7fa51a8a1650,
 _nphotons=300.668,_skynphotons=1.19701,_tt=[0.0147872,0.0304442],_lastvalidtt=
 [0.0147872,0.0304442],_upttcommand=[0,0],_refmes=0x7fa51a8a1378,_tiprefv=
 0x7fa51a8a1110,_tiltrefv=0x7fa51a8a2068,_tiprefvn=0x7fa51a8a1e30,_tiltrefvn=
 0x7fa51a8a1ae8,_reordervec=0x0,_npixels=2,_npb=0,_sdim=128,_nx=126,_nx4fft=126,
 _istart=0x7fa51a8a2688,_jstart=0x7fa51a8a16c0,_binindices=0x7fa51917ce30,
 _binxy=2,_centroidw=0x7fa51a8a13e8,_fimage=0x7fa51a8a18b8,_fimage2=0x0,
 _imistart=0x7fa51a8a18f0,_imjstart=0x7fa51a8a2618,_imistart2=0x7fa51a8a2110,
 _imjstart2=0x7fa51a8a1b20,_unittip=0x7fa51a9c0830,_unittilt=0x7fa51a9c4230,
 _lgs_defocuses=0x7fa51a8a1998,_unitdefocus=0x7fa51a9a9430,_fimnx=2,_fimny=2,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fa51a8a1928,_flat=0x7fa51a8a1d18,_domask=1,
 _submask=0x7fa51aa50430,_kernel=0x7fa51aa83e30,_kernels=0x7fa51aa21630,
 _kerfftr=0x7fa51aa31030,_kerffti=0x7fa51aa40a30,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7fa51a8a2768,_x=0x7fa51a8a13b0,_y=0x7fa51a8a1b90,_centroidgain=1,
 _rayleigh=0x7fa51a8a2458,_bckgrdcalib=0x7fa51a8a27a0,_bckgrdinit=0,_bckgrdsub=
 1,_meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],
 _LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=
 0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test2-if1.fits",pitch=5,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fa51a8a2880,_ctrlden=0x7fa51a8a1260,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=13,pitchMargin=0,coupling=0.2,
 ecmatfile="test2-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fa518c19570,_xlast=0x7fa518c1b4d0,_ylast=[0x7fa5190f9030,0x7fa5190f9030,
 0x7fa5190f9030],_y0=0x7fa5190de830,_signus=0x7fa5190df030,_puppixoffset=[0,0],
 _nact=144,_def=0x106fd5030,_x=0x7fa518e0ff80,_y=0x7fa518e10870,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x7fa51a01b430,_indext=0x7fa51909da10,_eiffile=
 "test2-if1-ext.fits",_edef=0x105121030,_ex=0x7fa51a8d0328,_ey=0x7fa51a860048,
 _enact=13,_n1=26,_n2=103,_pupil=0x0,_command=0x7fa518f3d220,_flat_command=0x0,
 _extrapcmat=0x7fa51aa64030,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0),dm_struct(
 type="tiptilt",subsystem=2,virtual=0,dmfit_which=0x0,iffile="test2-if2.fits",
 pitch=0,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,unitpervolt=0.0005,maxvolt=
 0,gain=0.5,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7fa51a8a2298,_ctrlden=
 0x7fa51a8676a8,misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],disjointpup=0,
 pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,use_def_of=0,
 ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=0x0,
 supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,ecmatfile=
 "test2-ecmat2.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,nzer=0,
 minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,regmatrix=0x0,
 _alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fa51a8a2730,_xlast=0x7fa51a8a21f0,_ylast=[0x7fa51a8d7eb8,0x7fa51a8d7eb8,
 0x7fa51a8d7eb8],_y0=0x7fa51a8d7fc8,_signus=0x7fa51a8676e0,_puppixoffset=[0,0],
 _nact=2,_def=0x7fa519894a30,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test2-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=26,_n2=103,_pupil=0x0,_command=0x7fa51a8a27d8,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fa51a8a2180,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test2-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fa51a8a2340,xposition=0x7fa51a8a1848,yposition=
 0x7fa51a8a1bc8,dispzoom=0x7fa51a8a1ab0,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=0,niter=500,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
SH 12x12, quick method, with separate Quadcell and TT mirror
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.1273  0.0636  0.1273   1.02  0.25  0.25    2x 2    2x 2    52447.6
 2      0.5012  0.0080  0.5012   1.02  1.00  1.00    2x 2    2x 2    300.7
 
Summary:
Mirror #1, stackarray, 144 actuators, conjugated @ 0 m
Mirror #2, tiptilt, 2 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 1), 116 subap., offaxis (+0.0",+0.0"), noise disabled
WFS # 2, hartmann (meth. 2),  1 subap., offaxis (+5.0",+0.0"), noise enabled
D/r0 (500nm) = 40.0; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       45.2   0.780       55.8
Field Avg  1.65                     45.2   0.780       55.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in test2-imav.fits
Some other graphics in test2.ps

Original parameter file: test2.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12, quick method, with separate Quadcell and TT mirror";
 sim.pupildiam      = 60;
 sim.debug          = 0;
 sim.verbose        = 0;
 
 //-------------------------------
 atm.dr0at05mic     = 40.;
 atm.screen         = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt       = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs = 2; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type        = "hartmann";
 wfs(n).subsystem   = 1;
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod    = 1;
 wfs(n).shnxsub     = 12;
 wfs(n).filtertilt  = 1;  // using a dedicated TT guide star, so I filter this one.
 wfs(n).skymag      = 18.;
 
 n   = 2;
 wfs(n).type        = "hartmann";
 wfs(n).subsystem   = 2;
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [5.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 16.;
 wfs(n).skymag      = 20.5;
 wfs(n).shmethod    = 2;
 wfs(n).shnxsub     = 1;
 wfs(n).npixels     = 2;
 wfs(n).pixsize     = 0.5;
 wfs(n).noise       = 1;
 wfs(n).ron         = 0.;
 wfs(n).darkcurrent = 500.;
 wfs(n).dispzoom    = 0.1;
 
 //-------------------------------
 ndm = 2;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type         = "stackarray";
 dm(n).subsystem    = 1;
 dm(n).iffile       = "";
 dm(n).nxact        = 13;
 dm(n).pitch        = 5;
 dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.01;
 dm(n).push4imat    = 2;
 
 n  =2;
 dm(n).type         = "tiptilt";
 dm(n).subsystem    = 2;
 dm(n).iffile       = "";
 dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.0005;
 dm(n).push4imat    = 2;
 dm(n).gain         = 0.5;
 
 //-------------------------------
 mat.condition      = &([15.,100.]);
 
 //-------------------------------
 tel.diam           = 7.9;
 tel.cobs           = 0.1125;
 
 //-------------------------------
 target.lambda      = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0.]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint       = 3e11;
 
 //-------------------------------
 loop.gain          = 0.6;
 loop.framedelay    = 0;
 loop.niter         = 500;
 loop.ittime        = 2e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12, quick method, with separate Quadcell and TT mirror",
 pupildiam=60,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=128,_cent=64.5)
 atm_struct(dr0at05mic=40,screen=0x7faf8b0c6938,layerfrac=0x7faf8b0c68b0,
 layerspeed=0x7faf8b0c69c0,layeralt=0x7faf8a0c6bf8,winddir=0x7faf8a0c58d8,
 _layeralt=0x7faf8b0c6690)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=0,ron=0,darkcurrent=
 0,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=18,filtertilt=1,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,
 fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,
 pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=1,shnxsub=12,npixpersub=0,pixsize=
 0.127287,npixels=2,spotpitch=2,extfield=0.254574,pupoffset=[0,0],shthmethod=0,
 shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,
 fstop=0x0,fssize=0,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7faf8a099820,lgs_prof_alt=
 0x7faf8a099f90,nzer=0,ndh=0,ndhfiltered=0,_initkernels=1,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7faf89c1bb20,
 _origpixsize=0.1,_rebinfactor=2,_gsalt=0,_gsdepth=0,_nsub=116,_nsub4disp=116,
 _nmes=232,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x7faf8b83da30,
 _masks=0x0,_fluxpersub=0x7faf89d0c080,_rayleighflux=0x0,_sodiumflux=0x0,
 _raylfluxpersub=0x7faf89d0c290,_skyfluxpersub=0x7faf89f1bd30,_nphotons=52447.6,
 _skynphotons=0.00536161,_tt=[-0.00145932,0.00513743],_lastvalidtt=[-0.00145932,
 0.00513743],_upttcommand=[0,0],_refmes=0x7faf89d0c4a0,_tiprefv=0x7faf8a162030,
 _tiltrefv=0x7faf8a895e30,_tiprefvn=0x7faf8a162830,_tiltrefvn=0x7faf8a896630,
 _reordervec=0x0,_npixels=2,_npb=0,_sdim=16,_nx=4,_nx4fft=4,_istart=
 0x7faf89c1dca0,_jstart=0x7faf89c1deb0,_binindices=0x7faf8a0c6268,_binxy=2,
 _centroidw=0x7faf8a07c830,_fimage=0x7faf8b816230,_fimage2=0x0,_imistart=
 0x7faf89e32ad0,_imjstart=0x7faf89f1bb20,_imistart2=0x7faf89f1cf40,_imjstart2=
 0x7faf89f1bfc0,_unittip=0x7faf8b12e740,_unittilt=0x7faf8b81bbe0,_lgs_defocuses=
 0x7faf8a099c80,_unitdefocus=0x7faf8a85a430,_fimnx=24,_fimny=24,_fimny2=0x0,
 _yoffset=0x0,_bias=0x7faf8b819230,_flat=0x7faf8b173430,_domask=0,_submask=0x0,
 _kernel=0x7faf8a0c5f38,_kernels=0x7faf8a83b630,_kerfftr=0x7faf8a83d430,
 _kerffti=0x7faf8a84b030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7faf8a84e630,_x=0x7faf89c1cd20,_y=0x7faf89c1d100,_centroidgain=1,_rayleigh=
 0x7faf8a099af8,_bckgrdcalib=0x7faf8b818830,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=2,lambda=0.65,noise=1,ron=0,darkcurrent=500,gspos=[5,0],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=16,skymag=20.5,filtertilt=0,correctUpTT=0,
 uplinkgain=0,dispzoom=0.1,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,
 ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=1,npixpersub=0,pixsize=0.501194,npixels=2,
 spotpitch=2,extfield=1.00239,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=1.00239,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7faf8a09a230,lgs_prof_alt=
 0x7faf8a09a188,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7faf8a09a708,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7faf8a0997e8,_origpixsize=0.5,_rebinfactor=63,_gsalt=0,_gsdepth=0,_nsub=1,
 _nsub4disp=1,_nmes=2,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x7faf8a885430,_masks=0x0,_fluxpersub=0x7faf8a0999a8,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7faf8a09a9a8,_skyfluxpersub=0x7faf8a099a50,
 _nphotons=300.668,_skynphotons=1.19701,_tt=[0.0147872,0.0304442],_lastvalidtt=
 [0.0147872,0.0304442],_upttcommand=[0,0],_refmes=0x7faf8a099778,_tiprefv=
 0x7faf8a07c6e0,_tiltrefv=0x7faf8a0997b0,_tiprefvn=0x7faf8a09a510,_tiltrefvn=
 0x7faf8a09a7b0,_reordervec=0x0,_npixels=2,_npb=0,_sdim=128,_nx=126,_nx4fft=126,
 _istart=0x7faf8a099dd0,_jstart=0x7faf8a09a9e0,_binindices=0x7faf8b88c030,
 _binxy=2,_centroidw=0x7faf8a09a070,_fimage=0x7faf8a099b68,_fimage2=0x0,
 _imistart=0x7faf8a099cf0,_imjstart=0x7faf8a09aa50,_imistart2=0x7faf8a099660,
 _imjstart2=0x7faf8a099f20,_unittip=0x7faf8a881a30,_unittilt=0x7faf8a896e30,
 _lgs_defocuses=0x7faf8a099d98,_unitdefocus=0x7faf8a86a630,_fimnx=2,_fimny=2,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7faf8a099ee8,_flat=0x7faf8a099ac0,_domask=1,
 _submask=0x7faf8a110430,_kernel=0x7faf8a908c30,_kernels=0x7faf8a0d4230,
 _kerfftr=0x7faf8a1b6e30,_kerffti=0x7faf8a100a30,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7faf8a09abd8,_x=0x7faf8a09a150,_y=0x7faf8a09a000,_centroidgain=1,
 _rayleigh=0x7faf8a09a938,_bckgrdcalib=0x7faf8a09a900,_bckgrdinit=0,_bckgrdsub=
 1,_meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],
 _LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=
 0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test2-if1.fits",pitch=5,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7faf8a09a628,_ctrlden=0x7faf8a099b30,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=13,pitchMargin=0,coupling=0.2,
 ecmatfile="test2-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf89c1d4e0,_xlast=0x7faf89c1b810,_ylast=[0x7faf8a163030,0x7faf8a163030,
 0x7faf8a163030],_y0=0x7faf8a176c30,_signus=0x7faf8a0fc030,_puppixoffset=[0,0],
 _nact=144,_def=0x109d3d030,_x=0x7faf89e2f270,_y=0x7faf89e2fcc0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x7faf8b131630,_indext=0x7faf8b0a8610,_eiffile=
 "test2-if1-ext.fits",_edef=0x107e89030,_ex=0x7faf8a0c4b28,_ey=0x7faf8b0c6a48,
 _enact=13,_n1=26,_n2=103,_pupil=0x0,_command=0x7faf89d0c880,_flat_command=0x0,
 _extrapcmat=0x7faf8b156230,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0),dm_struct(
 type="tiptilt",subsystem=2,virtual=0,dmfit_which=0x0,iffile="test2-if2.fits",
 pitch=0,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,unitpervolt=0.0005,maxvolt=
 0,gain=0.5,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7faf8a09a1f8,_ctrlden=
 0x7faf8a0994d8,misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],disjointpup=0,
 pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,use_def_of=0,
 ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=0x0,
 supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,ecmatfile=
 "test2-ecmat2.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,nzer=0,
 minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,regmatrix=0x0,
 _alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf8a099510,_xlast=0x7faf8a0998c8,_ylast=[0x7faf8a0c5058,0x7faf8a0c5058,
 0x7faf8a0c5058],_y0=0x7faf8a0c5168,_signus=0x7faf8a09a580,_puppixoffset=[0,0],
 _nact=2,_def=0x7faf8a8d0830,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test2-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=26,_n2=103,_pupil=0x0,_command=0x7faf8a09aaf8,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7faf8a099d28,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test2-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7faf8a099548,xposition=0x7faf8a099c48,yposition=
 0x7faf8a09a0e0,dispzoom=0x7faf8a099eb0,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=0,niter=500,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       45.2   0.780       55.8
Field Avg  1.65                     45.2   0.780       55.8
Field rms  1.65                      0.0   0.000        0.0

Average images written in test2-imav.fits
Some other graphics in test2.ps

Original parameter file: test2.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "SH 12x12, quick method, with separate Quadcell and TT mirror";
 sim.pupildiam      = 60;
 sim.debug          = 0;
 sim.verbose        = 0;
 
 //-------------------------------
 atm.dr0at05mic     = 40.;
 atm.screen         = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt       = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 nwfs = 2; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type        = "hartmann";
 wfs(n).subsystem   = 1;
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 5.;
 wfs(n).shmethod    = 1;
 wfs(n).shnxsub     = 12;
 wfs(n).filtertilt  = 1;  // using a dedicated TT guide star, so I filter this one.
 wfs(n).skymag      = 18.;
 
 n   = 2;
 wfs(n).type        = "hartmann";
 wfs(n).subsystem   = 2;
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [5.,0.];
 wfs(n).gsalt       = 0.;
 wfs(n).gsmag       = 16.;
 wfs(n).skymag      = 20.5;
 wfs(n).shmethod    = 2;
 wfs(n).shnxsub     = 1;
 wfs(n).npixels     = 2;
 wfs(n).pixsize     = 0.5;
 wfs(n).noise       = 1;
 wfs(n).ron         = 0.;
 wfs(n).darkcurrent = 500.;
 wfs(n).dispzoom    = 0.1;
 
 //-------------------------------
 ndm = 2;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type         = "stackarray";
 dm(n).subsystem    = 1;
 dm(n).iffile       = "";
 dm(n).nxact        = 13;
 dm(n).pitch        = 5;
 dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.01;
 dm(n).push4imat    = 2;
 
 n  =2;
 dm(n).type         = "tiptilt";
 dm(n).subsystem    = 2;
 dm(n).iffile       = "";
 dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.0005;
 dm(n).push4imat    = 2;
 dm(n).gain         = 0.5;
 
 //-------------------------------
 mat.condition      = &([15.,100.]);
 
 //-------------------------------
 tel.diam           = 7.9;
 tel.cobs           = 0.1125;
 
 //-------------------------------
 target.lambda      = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0.]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint       = 3e11;
 
 //-------------------------------
 loop.gain          = 0.6;
 loop.framedelay    = 0;
 loop.niter         = 500;
 loop.ittime        = 2e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 loop.modalgainfile = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="SH 12x12, quick method, with separate Quadcell and TT mirror",
 pupildiam=60,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=128,_cent=64.5)
 atm_struct(dr0at05mic=40,screen=0x7faf8b0c6938,layerfrac=0x7faf8b0c68b0,
 layerspeed=0x7faf8b0c69c0,layeralt=0x7faf8a0c6bf8,winddir=0x7faf8a0c58d8,
 _layeralt=0x7faf8b0c6690)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=0,ron=0,darkcurrent=
 0,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=18,filtertilt=1,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,
 fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,
 pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=1,shnxsub=12,npixpersub=0,pixsize=
 0.127287,npixels=2,spotpitch=2,extfield=0.254574,pupoffset=[0,0],shthmethod=0,
 shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,
 fstop=0x0,fssize=0,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7faf8a099820,lgs_prof_alt=
 0x7faf8a099f90,nzer=0,ndh=0,ndhfiltered=0,_initkernels=1,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7faf89c1bb20,
 _origpixsize=0.1,_rebinfactor=2,_gsalt=0,_gsdepth=0,_nsub=116,_nsub4disp=116,
 _nmes=232,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x7faf8b83da30,
 _masks=0x0,_fluxpersub=0x7faf89d0c080,_rayleighflux=0x0,_sodiumflux=0x0,
 _raylfluxpersub=0x7faf89d0c290,_skyfluxpersub=0x7faf89f1bd30,_nphotons=52447.6,
 _skynphotons=0.00536161,_tt=[-0.00145932,0.00513743],_lastvalidtt=[-0.00145932,
 0.00513743],_upttcommand=[0,0],_refmes=0x7faf89d0c4a0,_tiprefv=0x7faf8a162030,
 _tiltrefv=0x7faf8a895e30,_tiprefvn=0x7faf8a162830,_tiltrefvn=0x7faf8a896630,
 _reordervec=0x0,_npixels=2,_npb=0,_sdim=16,_nx=4,_nx4fft=4,_istart=
 0x7faf89c1dca0,_jstart=0x7faf89c1deb0,_binindices=0x7faf8a0c6268,_binxy=2,
 _centroidw=0x7faf8a07c830,_fimage=0x7faf8b816230,_fimage2=0x0,_imistart=
 0x7faf89e32ad0,_imjstart=0x7faf89f1bb20,_imistart2=0x7faf89f1cf40,_imjstart2=
 0x7faf89f1bfc0,_unittip=0x7faf8b12e740,_unittilt=0x7faf8b81bbe0,_lgs_defocuses=
 0x7faf8a099c80,_unitdefocus=0x7faf8a85a430,_fimnx=24,_fimny=24,_fimny2=0x0,
 _yoffset=0x0,_bias=0x7faf8b819230,_flat=0x7faf8b173430,_domask=0,_submask=0x0,
 _kernel=0x7faf8a0c5058,_kernels=0x7faf8a83b630,_kerfftr=0x7faf8a83d430,
 _kerffti=0x7faf8a84b030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7faf8b82b030,_x=0x7faf89c1cd20,_y=0x7faf89c1d100,_centroidgain=1,_rayleigh=
 0x7faf8a099af8,_bckgrdcalib=0x7faf8b818830,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=2,lambda=0.65,noise=1,ron=0,darkcurrent=500,gspos=[5,0],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=16,skymag=20.5,filtertilt=0,correctUpTT=0,
 uplinkgain=0,dispzoom=0.1,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,
 ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=1,npixpersub=0,pixsize=0.501194,npixels=2,
 spotpitch=2,extfield=1.00239,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=1.00239,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7faf8a09a230,lgs_prof_alt=
 0x7faf8a09a188,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7faf8a07c750,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7faf8a0997e8,_origpixsize=0.5,_rebinfactor=63,_gsalt=0,_gsdepth=0,_nsub=1,
 _nsub4disp=1,_nmes=2,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x7faf8a885430,_masks=0x0,_fluxpersub=0x7faf8a0999a8,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7faf8a09a9a8,_skyfluxpersub=0x7faf8a099a50,
 _nphotons=300.668,_skynphotons=1.19701,_tt=[0.0147872,0.0304442],_lastvalidtt=
 [0.0147872,0.0304442],_upttcommand=[0,0],_refmes=0x7faf8a099778,_tiprefv=
 0x7faf8a07c6e0,_tiltrefv=0x7faf8a0997b0,_tiprefvn=0x7faf8a09a510,_tiltrefvn=
 0x7faf8a09a7b0,_reordervec=0x0,_npixels=2,_npb=0,_sdim=128,_nx=126,_nx4fft=126,
 _istart=0x7faf8a099dd0,_jstart=0x7faf8a09a9e0,_binindices=0x7faf8b88c030,
 _binxy=2,_centroidw=0x7faf8a09a070,_fimage=0x7faf8a099cb8,_fimage2=0x0,
 _imistart=0x7faf8a099cf0,_imjstart=0x7faf8a09aa50,_imistart2=0x7faf8a099660,
 _imjstart2=0x7faf8a099f20,_unittip=0x7faf8a881a30,_unittilt=0x7faf8a896e30,
 _lgs_defocuses=0x7faf8a099d98,_unitdefocus=0x7faf8a86a630,_fimnx=2,_fimny=2,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7faf8a099ee8,_flat=0x7faf8a099ac0,_domask=1,
 _submask=0x7faf8a110430,_kernel=0x7faf8b17a430,_kernels=0x7faf8a0d4230,
 _kerfftr=0x7faf8a1b6e30,_kerffti=0x7faf8a100a30,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7faf8a09ab68,_x=0x7faf8a09a150,_y=0x7faf8a09a000,_centroidgain=1,
 _rayleigh=0x7faf8a09a938,_bckgrdcalib=0x7faf8a09a900,_bckgrdinit=0,_bckgrdsub=
 1,_meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],
 _LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=
 0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test2-if1.fits",pitch=5,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7faf8a09ac80,_ctrlden=0x7faf8a09a468,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=13,pitchMargin=0,coupling=0.2,
 ecmatfile="test2-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf89f1c4e0,_xlast=0x7faf89f1c760,_ylast=[0x7faf8b824e30,0x7faf8b824e30,
 0x7faf8b824e30],_y0=0x7faf8b831e30,_signus=0x7faf8b832630,_puppixoffset=[0,0],
 _nact=144,_def=0x109d3d030,_x=0x7faf89e2f270,_y=0x7faf89e2fcc0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x7faf8b131630,_indext=0x7faf8b0a8610,_eiffile=
 "test2-if1-ext.fits",_edef=0x107e89030,_ex=0x7faf8a0c4b28,_ey=0x7faf8b0c6a48,
 _enact=13,_n1=26,_n2=103,_pupil=0x0,_command=0x7faf89e2e4a0,_flat_command=0x0,
 _extrapcmat=0x7faf8b156230,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0),dm_struct(
 type="tiptilt",subsystem=2,virtual=0,dmfit_which=0x0,iffile="test2-if2.fits",
 pitch=0,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,unitpervolt=0.0005,maxvolt=
 0,gain=0.5,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7faf8a07c788,_ctrlden=
 0x7faf8a09ac10,misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],disjointpup=0,
 pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,use_def_of=0,
 ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=0x0,
 supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,ecmatfile=
 "test2-ecmat2.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,nzer=0,
 minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,regmatrix=0x0,
 _alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf8a09a628,_xlast=0x7faf8a0994d8,_ylast=[0x7faf8a0c56b8,0x7faf8a0c56b8,
 0x7faf8a0c56b8],_y0=0x7faf8a0c57c8,_signus=0x7faf8a099510,_puppixoffset=[0,0],
 _nact=2,_def=0x7faf8a8d0830,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test2-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=26,_n2=103,_pupil=0x0,_command=0x7faf8a09abd8,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7faf8a099d28,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test2-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7faf8a099548,xposition=0x7faf8a099c48,yposition=
 0x7faf8a09a0e0,dispzoom=0x7faf8a099eb0,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=0,niter=500,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
