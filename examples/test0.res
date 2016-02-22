=============================
Simple SH6x6 w/ TT mirror, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.0955  0.0318  0.0955   1.02  0.95  8.02   10x10   10x10    69930.1
 
Summary:
Mirror #1, stackarray, 45 actuators, conjugated @ 0 m
Mirror #2, tiptilt, 2 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 32 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 42.4; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       45.2   0.472      192.6
Field Avg  1.65                     45.2   0.472      192.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in test0-imav.fits
Some other graphics in test0.ps

Original parameter file: test0.par:
 // YAO parameter file
 //-------------------------------
 sim.name            = "Simple SH6x6 w/ TT mirror, full diffraction WFS";
 sim.pupildiam       = 60;
 sim.debug           = 0;
 sim.verbose         = 0;
 
 //-------------------------------
 atm.dr0at05mic      = 42.44;  // this is r0=0.166 at 550 nm
 atm.screen          = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac       = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed      = &([11.,20,29,35]);
 atm.layeralt        = &([0.,400,6000,9000]);
 atm.winddir         = &([0,0,0,0]);
 
 //-------------------------------
 nwfs                = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 5.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 6;
 wfs(n).pixsize      = 0.1;
 wfs(n).npixels      = 10;
 wfs(n).noise        = 1;
 wfs(n).ron          = 3.5;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 wfs(1).extfield     = 8.;
 wfs(1).spotpitch    = 24;
 wfs(1).fstop        = "square";
 wfs(1).fssize       = 1.6;
 
 
 //-------------------------------
 ndm                 = 2;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type          = "stackarray";
 dm(n).iffile        = "";
 dm(n).nxact         = 7;
 dm(n).pitch         = 10;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01;
 dm(n).push4imat     = 50;
 dm(n).elt           = 1;
 
 n  =2;
 dm(n).type          = "tiptilt";
 dm(n).iffile        = "";
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.0005;
 dm(n).push4imat     = 50;
 
 //-------------------------------
 mat.condition       = &([15.]);
 mat.file            = "";
 
 //-------------------------------
 tel.diam            = 7.9;
 tel.cobs            = 0.1125;
 
 //-------------------------------
 target.lambda       = &([1.65]);
 target.xposition    = &([0.]);
 target.yposition    = &([0]);
 target.dispzoom     = &([1.]);
 
 //-------------------------------
 gs.zeropoint        = 1e11;
 gs.zenithangle      = 0.;
 
 //-------------------------------
 loop.gain           = 0.6;
 loop.framedelay     = 1;
 loop.niter          = 1000;
 loop.ittime         = 2e-3;
 loop.startskip      = 10;
 loop.skipevery      = 1000;
 loop.skipby         = 10000;
 loop.modalgainfile  = "simulModeGains.fits";
 
 
==== dump of structures ====
 sim_struct(name="Simple SH6x6 w/ TT mirror, full diffraction WFS",pupildiam=60,
 pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,
 shmkey=0,semkey=0,_size=128,_cent=64.5)
 atm_struct(dr0at05mic=42.44,screen=0x7fab3291aeb0,layerfrac=0x7fab3291afc0,
 layerspeed=0x7fab3291af38,layeralt=0x7fab3301af28,winddir=0x7fab3301b5f0,
 _layeralt=0x7fab3291ac90)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=3.5,
 darkcurrent=0,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,
 rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,
 pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=6,npixpersub=0,
 pixsize=0.0954654,npixels=10,spotpitch=24,extfield=8.0191,pupoffset=[0,0],
 shthmethod=1,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,
 fsname=0x0,fstop="square",fssize=1.6,fsoffset=[0,0],kernel=0,nintegcycles=1,
 fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,
 LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fab3380cd40,
 lgs_prof_alt=0x7fab3380c750,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fab338de278,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fab338df2f8,_origpixsize=0.1,_rebinfactor=3,_gsalt=0,_gsdepth=0,
 _nsub=32,_nsub4disp=36,_nmes=64,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,
 _tiltsh=0x7fab32963430,_masks=0x0,_fluxpersub=0x7fab340a7d60,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fab338df928,_skyfluxpersub=0x7fab328fca00,
 _nphotons=69930.1,_skynphotons=0,_tt=[-0.000716063,-0.000184347],_lastvalidtt=
 [-0.000716063,-0.000184347],_upttcommand=[0,0],_refmes=0x7fab3262dcd0,_tiprefv=
 0x7fab3262fca0,_tiltrefv=0x7fab3242f7d0,_tiprefvn=0x7fab3262fee0,_tiltrefvn=
 0x7fab3242fce0,_reordervec=0x0,_npixels=84,_npb=74,_sdim=32,_nx=252,_nx4fft=
 252,_istart=0x7fab340a7940,_jstart=0x7fab340a8078,_binindices=0x1017c0030,
 _binxy=84,_centroidw=0x7fab3242fb50,_fimage=0x100e3c030,_fimage2=0x0,_imistart=
 0x7fab338df0e8,_imjstart=0x7fab338df718,_imistart2=0x7fab338df1f0,_imjstart2=
 0x7fab338de698,_unittip=0x7fab32630f70,_unittilt=0x7fab32631140,_lgs_defocuses=
 0x7fab3380c6e0,_unitdefocus=0x7fab338e1c30,_fimnx=204,_fimny=204,_fimny2=0x0,
 _yoffset=0x0,_bias=0x100bbc030,_flat=0x100be5030,_domask=1,_submask=
 0x101bea030,_kernel=0x100c37030,_kernels=0x1083e9030,_kerfftr=0x103af0030,
 _kerffti=0x108ca2030,_kernelconv=0,_cyclecounter=1,_dispimage=0x100e8e030,_x=
 0x7fab3262dfe0,_y=0x7fab32631310,_centroidgain=1,_rayleigh=0x7fab3380bcd0,
 _bckgrdcalib=0x100b59030,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=
 1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,
 _LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,
 _nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test0-if1.fits",pitch=10,alt=0,hyst=0,push4imat=50,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fab3380bdb0,_ctrlden=0x7fab3380cb48,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=7,pitchMargin=0,coupling=0.2,
 ecmatfile="test0-ecmat1.fits",noextrap=0,elt=1,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fab338de7a0,_xlast=0x7fab328fcc10,_ylast=[0x7fab3262f0e0,0x7fab3262f0e0,
 0x7fab3262f0e0],_y0=0x7fab3262fa40,_signus=0x7fab326301f0,_puppixoffset=[0,0],
 _nact=45,_def=0x10188d030,_x=0x7fab328fd030,_y=0x7fab338de8a8,_i1=
 0x7fab338de380,_j1=0x7fab340a7b50,_ei1=0x7fab3380bd08,_ej1=0x7fab3380bb80,
 _indval=0x7fab324302d0,_indext=0x7fab3301b4e0,_eiffile="test0-if1-ext.fits",
 _edef=0x7fab329dea30,_ex=0x7fab3380b750,_ey=0x7fab3380bd78,_enact=4,_n1=26,_n2=
 103,_pupil=0x0,_command=0x7fab338debc0,_flat_command=0x0,_extrapcmat=
 0x7fab32917830,_eltdefsize=38,_regmatrix=0x0,_fMat=0x0),dm_struct(type=
 "tiptilt",subsystem=1,virtual=0,dmfit_which=0x0,iffile="test0-if2.fits",pitch=
 0,alt=0,hyst=0,push4imat=50,thresholdresp=0.3,unitpervolt=0.0005,maxvolt=0,
 gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7fab3380bad8,_ctrlden=0x7fab3380c0c0,
 misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],disjointpup=0,pegged=0x0,epegged=
 0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,use_def_of=0,ifunrot=0,xscale=0,
 nelperring=0x0,angleoffset=0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=
 0,nxact=0,pitchMargin=0,coupling=0.2,ecmatfile="test0-ecmat2.fits",noextrap=0,
 elt=0,irexp=0,irfact=0,filtertilt=0,nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,
 fradius=0,regparam=0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,
 0.63,0.89],_w=[0.2,0.35,0.45],_x0=0x7fab3380c2f0,_xlast=0x7fab3380bec8,_ylast=
 [0x7fab3301b568,0x7fab3301b568,0x7fab3301b568],_y0=0x7fab3301b678,_signus=
 0x7fab3380c520,_puppixoffset=[0,0],_nact=2,_def=0x7fab32979630,_x=0x0,_y=0x0,
 _i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile=
 "test0-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=26,_n2=103,_pupil=
 0x0,_command=0x7fab3380ba68,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,
 _regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fab3380c168,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test0-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fab3380c398,xposition=0x7fab3380c830,yposition=
 0x7fab3380c670,dispzoom=0x7fab3380bbb8,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       45.2   0.472      192.6
Field Avg  1.65                     45.2   0.472      192.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in test0-imav.fits
Some other graphics in test0.ps

Original parameter file: test0.par:
 // YAO parameter file
 //-------------------------------
 sim.name            = "Simple SH6x6 w/ TT mirror, full diffraction WFS";
 sim.pupildiam       = 60;
 sim.debug           = 0;
 sim.verbose         = 0;
 
 //-------------------------------
 atm.dr0at05mic      = 42.44;  // this is r0=0.166 at 550 nm
 atm.screen          = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac       = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed      = &([11.,20,29,35]);
 atm.layeralt        = &([0.,400,6000,9000]);
 atm.winddir         = &([0,0,0,0]);
 
 //-------------------------------
 nwfs                = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 5.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 6;
 wfs(n).pixsize      = 0.1;
 wfs(n).npixels      = 10;
 wfs(n).noise        = 1;
 wfs(n).ron          = 3.5;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 wfs(1).extfield     = 8.;
 wfs(1).spotpitch    = 24;
 wfs(1).fstop        = "square";
 wfs(1).fssize       = 1.6;
 
 
 //-------------------------------
 ndm                 = 2;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type          = "stackarray";
 dm(n).iffile        = "";
 dm(n).nxact         = 7;
 dm(n).pitch         = 10;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01;
 dm(n).push4imat     = 50;
 dm(n).elt           = 1;
 
 n  =2;
 dm(n).type          = "tiptilt";
 dm(n).iffile        = "";
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.0005;
 dm(n).push4imat     = 50;
 
 //-------------------------------
 mat.condition       = &([15.]);
 mat.file            = "";
 
 //-------------------------------
 tel.diam            = 7.9;
 tel.cobs            = 0.1125;
 
 //-------------------------------
 target.lambda       = &([1.65]);
 target.xposition    = &([0.]);
 target.yposition    = &([0]);
 target.dispzoom     = &([1.]);
 
 //-------------------------------
 gs.zeropoint        = 1e11;
 gs.zenithangle      = 0.;
 
 //-------------------------------
 loop.gain           = 0.6;
 loop.framedelay     = 1;
 loop.niter          = 1000;
 loop.ittime         = 2e-3;
 loop.startskip      = 10;
 loop.skipevery      = 1000;
 loop.skipby         = 10000;
 loop.modalgainfile  = "simulModeGains.fits";
 
 
==== dump of structures ====
 sim_struct(name="Simple SH6x6 w/ TT mirror, full diffraction WFS",pupildiam=60,
 pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,
 shmkey=0,semkey=0,_size=128,_cent=64.5)
 atm_struct(dr0at05mic=42.44,screen=0x7fab3291aeb0,layerfrac=0x7fab3291afc0,
 layerspeed=0x7fab3291af38,layeralt=0x7fab3301af28,winddir=0x7fab3301b5f0,
 _layeralt=0x7fab3291ac90)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=3.5,
 darkcurrent=0,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,
 rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,
 pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=6,npixpersub=0,
 pixsize=0.0954654,npixels=10,spotpitch=24,extfield=8.0191,pupoffset=[0,0],
 shthmethod=1,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,
 fsname=0x0,fstop="square",fssize=1.6,fsoffset=[0,0],kernel=0,nintegcycles=1,
 fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,
 LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fab3380cd40,
 lgs_prof_alt=0x7fab3380c750,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fab340a7c58,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fab338df2f8,_origpixsize=0.1,_rebinfactor=3,_gsalt=0,_gsdepth=0,
 _nsub=32,_nsub4disp=36,_nmes=64,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,
 _tiltsh=0x7fab32963430,_masks=0x0,_fluxpersub=0x7fab340a7d60,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fab338df928,_skyfluxpersub=0x7fab328fca00,
 _nphotons=69930.1,_skynphotons=0,_tt=[-0.000716063,-0.000184347],_lastvalidtt=
 [-0.000716063,-0.000184347],_upttcommand=[0,0],_refmes=0x7fab3262dcd0,_tiprefv=
 0x7fab3262fca0,_tiltrefv=0x7fab3242f7d0,_tiprefvn=0x7fab3262fee0,_tiltrefvn=
 0x7fab3242fce0,_reordervec=0x0,_npixels=84,_npb=74,_sdim=32,_nx=252,_nx4fft=
 252,_istart=0x7fab340a7940,_jstart=0x7fab340a8078,_binindices=0x1017c0030,
 _binxy=84,_centroidw=0x7fab3242fb50,_fimage=0x100c0e030,_fimage2=0x0,_imistart=
 0x7fab338df0e8,_imjstart=0x7fab338df718,_imistart2=0x7fab338df1f0,_imjstart2=
 0x7fab338de698,_unittip=0x7fab32630f70,_unittilt=0x7fab32631140,_lgs_defocuses=
 0x7fab3380c6e0,_unitdefocus=0x7fab338e1c30,_fimnx=204,_fimny=204,_fimny2=0x0,
 _yoffset=0x0,_bias=0x100bbc030,_flat=0x100be5030,_domask=1,_submask=
 0x101bea030,_kernel=0x101ab1030,_kernels=0x1083e9030,_kerfftr=0x103af0030,
 _kerffti=0x108ca2030,_kernelconv=0,_cyclecounter=1,_dispimage=0x100e8e030,_x=
 0x7fab3262dfe0,_y=0x7fab32631310,_centroidgain=1,_rayleigh=0x7fab3380bcd0,
 _bckgrdcalib=0x100b59030,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=
 1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,
 _LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,
 _nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test0-if1.fits",pitch=10,alt=0,hyst=0,push4imat=50,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fab3380cdb0,_ctrlden=0x7fab3380cad8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=7,pitchMargin=0,coupling=0.2,
 ecmatfile="test0-ecmat1.fits",noextrap=0,elt=1,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fab33818bd0,_xlast=0x7fab338de7a0,_ylast=[0x7fab32505940,0x7fab32505940,
 0x7fab32505940],_y0=0x7fab325056e0,_signus=0x7fab32505ba0,_puppixoffset=[0,0],
 _nact=45,_def=0x10188d030,_x=0x7fab328fd030,_y=0x7fab338de8a8,_i1=
 0x7fab338de380,_j1=0x7fab340a7b50,_ei1=0x7fab3380bd08,_ej1=0x7fab3380bb80,
 _indval=0x7fab324302d0,_indext=0x7fab3301b4e0,_eiffile="test0-if1-ext.fits",
 _edef=0x7fab329dea30,_ex=0x7fab3380b750,_ey=0x7fab3380bd78,_enact=4,_n1=26,_n2=
 103,_pupil=0x0,_command=0x7fab338df508,_flat_command=0x0,_extrapcmat=
 0x7fab32917830,_eltdefsize=38,_regmatrix=0x0,_fMat=0x0),dm_struct(type=
 "tiptilt",subsystem=1,virtual=0,dmfit_which=0x0,iffile="test0-if2.fits",pitch=
 0,alt=0,hyst=0,push4imat=50,thresholdresp=0.3,unitpervolt=0.0005,maxvolt=0,
 gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7fab3380b6e0,_ctrlden=0x7fab3380c718,
 misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],disjointpup=0,pegged=0x0,epegged=
 0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,use_def_of=0,ifunrot=0,xscale=0,
 nelperring=0x0,angleoffset=0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=
 0,nxact=0,pitchMargin=0,coupling=0.2,ecmatfile="test0-ecmat2.fits",noextrap=0,
 elt=0,irexp=0,irfact=0,filtertilt=0,nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,
 fradius=0,regparam=0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,
 0.63,0.89],_w=[0.2,0.35,0.45],_x0=0x7fab3380bdb0,_xlast=0x7fab3380c0c0,_ylast=
 [0x7fab3301b238,0x7fab3301b238,0x7fab3301b238],_y0=0x7fab3291ada0,_signus=
 0x7fab3380c2f0,_puppixoffset=[0,0],_nact=2,_def=0x7fab32979630,_x=0x0,_y=0x0,
 _i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile=
 "test0-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=26,_n2=103,_pupil=
 0x0,_command=0x7fab3380c520,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,
 _regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fab3380c168,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test0-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fab3380c398,xposition=0x7fab3380c830,yposition=
 0x7fab3380c670,dispzoom=0x7fab3380bbb8,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
Simple SH6x6 w/ TT mirror, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.0955  0.0318  0.0955   1.02  0.95  8.02   10x10   10x10    69930.1
 
Summary:
Mirror #1, stackarray, 45 actuators, conjugated @ 0 m
Mirror #2, tiptilt, 2 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 32 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 42.4; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       45.2   0.472      192.6
Field Avg  1.65                     45.2   0.472      192.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in test0-imav.fits
Some other graphics in test0.ps

Original parameter file: test0.par:
 // YAO parameter file
 //-------------------------------
 sim.name            = "Simple SH6x6 w/ TT mirror, full diffraction WFS";
 sim.pupildiam       = 60;
 sim.debug           = 0;
 sim.verbose         = 0;
 
 //-------------------------------
 atm.dr0at05mic      = 42.44;  // this is r0=0.166 at 550 nm
 atm.screen          = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac       = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed      = &([11.,20,29,35]);
 atm.layeralt        = &([0.,400,6000,9000]);
 atm.winddir         = &([0,0,0,0]);
 
 //-------------------------------
 nwfs                = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 5.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 6;
 wfs(n).pixsize      = 0.1;
 wfs(n).npixels      = 10;
 wfs(n).noise        = 1;
 wfs(n).ron          = 3.5;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 wfs(1).extfield     = 8.;
 wfs(1).spotpitch    = 24;
 wfs(1).fstop        = "square";
 wfs(1).fssize       = 1.6;
 
 
 //-------------------------------
 ndm                 = 2;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type          = "stackarray";
 dm(n).iffile        = "";
 dm(n).nxact         = 7;
 dm(n).pitch         = 10;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01;
 dm(n).push4imat     = 50;
 dm(n).elt           = 1;
 
 n  =2;
 dm(n).type          = "tiptilt";
 dm(n).iffile        = "";
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.0005;
 dm(n).push4imat     = 50;
 
 //-------------------------------
 mat.condition       = &([15.]);
 mat.file            = "";
 
 //-------------------------------
 tel.diam            = 7.9;
 tel.cobs            = 0.1125;
 
 //-------------------------------
 target.lambda       = &([1.65]);
 target.xposition    = &([0.]);
 target.yposition    = &([0]);
 target.dispzoom     = &([1.]);
 
 //-------------------------------
 gs.zeropoint        = 1e11;
 gs.zenithangle      = 0.;
 
 //-------------------------------
 loop.gain           = 0.6;
 loop.framedelay     = 1;
 loop.niter          = 1000;
 loop.ittime         = 2e-3;
 loop.startskip      = 10;
 loop.skipevery      = 1000;
 loop.skipby         = 10000;
 loop.modalgainfile  = "simulModeGains.fits";
 
 
==== dump of structures ====
 sim_struct(name="Simple SH6x6 w/ TT mirror, full diffraction WFS",pupildiam=60,
 pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,
 shmkey=0,semkey=0,_size=128,_cent=64.5)
 atm_struct(dr0at05mic=42.44,screen=0x7fa51a85feb0,layerfrac=0x7fa51a85ffc0,
 layerspeed=0x7fa51a85ff38,layeralt=0x7fa51a8d0328,winddir=0x7fa51a8d79f0,
 _layeralt=0x7fa51a85fc90)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=3.5,
 darkcurrent=0,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,
 rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,
 pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=6,npixpersub=0,
 pixsize=0.0954654,npixels=10,spotpitch=24,extfield=8.0191,pupoffset=[0,0],
 shthmethod=1,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,
 fsname=0x0,fstop="square",fssize=1.6,fsoffset=[0,0],kernel=0,nintegcycles=1,
 fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,
 LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fa51a8a1ce0,
 lgs_prof_alt=0x7fa51a8a1b90,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fa51a969e78,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fa51a96aef8,_origpixsize=0.1,_rebinfactor=3,_gsalt=0,_gsdepth=0,
 _nsub=32,_nsub4disp=36,_nmes=64,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,
 _tiltsh=0x7fa5190e4a30,_masks=0x0,_fluxpersub=0x7fa51904a160,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fa51a96b528,_skyfluxpersub=0x7fa51909d800,
 _nphotons=69930.1,_skynphotons=0,_tt=[-0.000716063,-0.000184347],_lastvalidtt=
 [-0.000716063,-0.000184347],_upttcommand=[0,0],_refmes=0x7fa518e09c20,_tiprefv=
 0x7fa518c1ace0,_tiltrefv=0x7fa518e107b0,_tiprefvn=0x7fa518c1af20,_tiltrefvn=
 0x7fa518e109f0,_reordervec=0x0,_npixels=84,_npb=74,_sdim=32,_nx=252,_nx4fft=
 252,_istart=0x7fa519049d40,_jstart=0x7fa51904a478,_binindices=0x105c2e030,
 _binxy=84,_centroidw=0x7fa518f3d380,_fimage=0x1052aa030,_fimage2=0x0,_imistart=
 0x7fa51a96ace8,_imjstart=0x7fa51a96b318,_imistart2=0x7fa51a96adf0,_imjstart2=
 0x7fa51a96a298,_unittip=0x7fa518e0fb90,_unittilt=0x7fa518e0fd60,_lgs_defocuses=
 0x7fa51a8676e0,_unitdefocus=0x7fa51a071430,_fimnx=204,_fimny=204,_fimny2=0x0,
 _yoffset=0x0,_bias=0x10502a030,_flat=0x105053030,_domask=1,_submask=
 0x106037030,_kernel=0x1050a5030,_kernels=0x10c836030,_kerfftr=0x107f3d030,
 _kerffti=0x10d0ef030,_kernelconv=0,_cyclecounter=1,_dispimage=0x1052fc030,_x=
 0x7fa518e057d0,_y=0x7fa518e0ff30,_centroidgain=1,_rayleigh=0x7fa51a8a12d0,
 _bckgrdcalib=0x104fc7030,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=
 1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,
 _LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,
 _nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test0-if1.fits",pitch=10,alt=0,hyst=0,push4imat=50,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fa51a8a15a8,_ctrlden=0x7fa51a8a2110,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=7,pitchMargin=0,coupling=0.2,
 ecmatfile="test0-ecmat1.fits",noextrap=0,elt=1,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fa51a96a3a0,_xlast=0x7fa51909da10,_ylast=[0x7fa518f3dac0,0x7fa518f3dac0,
 0x7fa518f3dac0],_y0=0x7fa518f3ec30,_signus=0x7fa518f3dd20,_puppixoffset=[0,0],
 _nact=45,_def=0x105cfb030,_x=0x7fa51909de30,_y=0x7fa51a96a4a8,_i1=
 0x7fa51a969f80,_j1=0x7fa519049f50,_ei1=0x7fa51a8a1308,_ej1=0x7fa51a8a1180,
 _indval=0x7fa518d09b00,_indext=0x7fa51a8d78e0,_eiffile="test0-if1-ext.fits",
 _edef=0x7fa51a10fa30,_ex=0x7fa51a867750,_ey=0x7fa51a8a1378,_enact=4,_n1=26,_n2=
 103,_pupil=0x0,_command=0x7fa51a96a7c0,_flat_command=0x0,_extrapcmat=
 0x7fa51a01b430,_eltdefsize=38,_regmatrix=0x0,_fMat=0x0),dm_struct(type=
 "tiptilt",subsystem=1,virtual=0,dmfit_which=0x0,iffile="test0-if2.fits",pitch=
 0,alt=0,hyst=0,push4imat=50,thresholdresp=0.3,unitpervolt=0.0005,maxvolt=0,
 gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7fa51a8a16c0,_ctrlden=0x7fa51a8a1df8,
 misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],disjointpup=0,pegged=0x0,epegged=
 0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,use_def_of=0,ifunrot=0,xscale=0,
 nelperring=0x0,angleoffset=0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=
 0,nxact=0,pitchMargin=0,coupling=0.2,ecmatfile="test0-ecmat2.fits",noextrap=0,
 elt=0,irexp=0,irfact=0,filtertilt=0,nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,
 fradius=0,regparam=0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,
 0.63,0.89],_w=[0.2,0.35,0.45],_x0=0x7fa51a8a18f0,_xlast=0x7fa51a8a2068,_ylast=
 [0x7fa51a8d7968,0x7fa51a8d7968,0x7fa51a8d7968],_y0=0x7fa51a8d7a78,_signus=
 0x7fa51a8a1b20,_puppixoffset=[0,0],_nact=2,_def=0x7fa51a9b8830,_x=0x0,_y=0x0,
 _i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile=
 "test0-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=26,_n2=103,_pupil=
 0x0,_command=0x7fa51a8a1068,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,
 _regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fa51a8a1768,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test0-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fa51a8a1998,xposition=0x7fa51a8a1928,yposition=
 0x7fa51a8a1c70,dispzoom=0x7fa51a8a11b8,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       45.2   0.472      192.6
Field Avg  1.65                     45.2   0.472      192.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in test0-imav.fits
Some other graphics in test0.ps

Original parameter file: test0.par:
 // YAO parameter file
 //-------------------------------
 sim.name            = "Simple SH6x6 w/ TT mirror, full diffraction WFS";
 sim.pupildiam       = 60;
 sim.debug           = 0;
 sim.verbose         = 0;
 
 //-------------------------------
 atm.dr0at05mic      = 42.44;  // this is r0=0.166 at 550 nm
 atm.screen          = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac       = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed      = &([11.,20,29,35]);
 atm.layeralt        = &([0.,400,6000,9000]);
 atm.winddir         = &([0,0,0,0]);
 
 //-------------------------------
 nwfs                = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 5.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 6;
 wfs(n).pixsize      = 0.1;
 wfs(n).npixels      = 10;
 wfs(n).noise        = 1;
 wfs(n).ron          = 3.5;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 wfs(1).extfield     = 8.;
 wfs(1).spotpitch    = 24;
 wfs(1).fstop        = "square";
 wfs(1).fssize       = 1.6;
 
 
 //-------------------------------
 ndm                 = 2;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type          = "stackarray";
 dm(n).iffile        = "";
 dm(n).nxact         = 7;
 dm(n).pitch         = 10;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01;
 dm(n).push4imat     = 50;
 dm(n).elt           = 1;
 
 n  =2;
 dm(n).type          = "tiptilt";
 dm(n).iffile        = "";
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.0005;
 dm(n).push4imat     = 50;
 
 //-------------------------------
 mat.condition       = &([15.]);
 mat.file            = "";
 
 //-------------------------------
 tel.diam            = 7.9;
 tel.cobs            = 0.1125;
 
 //-------------------------------
 target.lambda       = &([1.65]);
 target.xposition    = &([0.]);
 target.yposition    = &([0]);
 target.dispzoom     = &([1.]);
 
 //-------------------------------
 gs.zeropoint        = 1e11;
 gs.zenithangle      = 0.;
 
 //-------------------------------
 loop.gain           = 0.6;
 loop.framedelay     = 1;
 loop.niter          = 1000;
 loop.ittime         = 2e-3;
 loop.startskip      = 10;
 loop.skipevery      = 1000;
 loop.skipby         = 10000;
 loop.modalgainfile  = "simulModeGains.fits";
 
 
==== dump of structures ====
 sim_struct(name="Simple SH6x6 w/ TT mirror, full diffraction WFS",pupildiam=60,
 pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,
 shmkey=0,semkey=0,_size=128,_cent=64.5)
 atm_struct(dr0at05mic=42.44,screen=0x7fa51a85feb0,layerfrac=0x7fa51a85ffc0,
 layerspeed=0x7fa51a85ff38,layeralt=0x7fa51a8d0328,winddir=0x7fa51a8d79f0,
 _layeralt=0x7fa51a85fc90)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=3.5,
 darkcurrent=0,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,
 rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,
 pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=6,npixpersub=0,
 pixsize=0.0954654,npixels=10,spotpitch=24,extfield=8.0191,pupoffset=[0,0],
 shthmethod=1,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,
 fsname=0x0,fstop="square",fssize=1.6,fsoffset=[0,0],kernel=0,nintegcycles=1,
 fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,
 LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fa51a8a1ce0,
 lgs_prof_alt=0x7fa51a8a1b90,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fa51904a058,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fa51a96aef8,_origpixsize=0.1,_rebinfactor=3,_gsalt=0,_gsdepth=0,
 _nsub=32,_nsub4disp=36,_nmes=64,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,
 _tiltsh=0x7fa5190e4a30,_masks=0x0,_fluxpersub=0x7fa51904a160,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fa51a96b528,_skyfluxpersub=0x7fa51909d800,
 _nphotons=69930.1,_skynphotons=0,_tt=[-0.000716063,-0.000184347],_lastvalidtt=
 [-0.000716063,-0.000184347],_upttcommand=[0,0],_refmes=0x7fa518e09c20,_tiprefv=
 0x7fa518c1ace0,_tiltrefv=0x7fa518e107b0,_tiprefvn=0x7fa518c1af20,_tiltrefvn=
 0x7fa518e109f0,_reordervec=0x0,_npixels=84,_npb=74,_sdim=32,_nx=252,_nx4fft=
 252,_istart=0x7fa519049d40,_jstart=0x7fa51904a478,_binindices=0x105c2e030,
 _binxy=84,_centroidw=0x7fa518f3d380,_fimage=0x10507c030,_fimage2=0x0,_imistart=
 0x7fa51a96ace8,_imjstart=0x7fa51a96b318,_imistart2=0x7fa51a96adf0,_imjstart2=
 0x7fa51a96a298,_unittip=0x7fa518e0fb90,_unittilt=0x7fa518e0fd60,_lgs_defocuses=
 0x7fa51a8676e0,_unitdefocus=0x7fa51a071430,_fimnx=204,_fimny=204,_fimny2=0x0,
 _yoffset=0x0,_bias=0x10502a030,_flat=0x105053030,_domask=1,_submask=
 0x106037030,_kernel=0x105efe030,_kernels=0x10c836030,_kerfftr=0x107f3d030,
 _kerffti=0x10d0ef030,_kernelconv=0,_cyclecounter=1,_dispimage=0x1052fc030,_x=
 0x7fa518e057d0,_y=0x7fa518e0ff30,_centroidgain=1,_rayleigh=0x7fa51a8a12d0,
 _bckgrdcalib=0x104fc7030,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=
 1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,
 _LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,
 _nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test0-if1.fits",pitch=10,alt=0,hyst=0,push4imat=50,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fa51a8a2308,_ctrlden=0x7fa51a8a2148,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=7,pitchMargin=0,coupling=0.2,
 ecmatfile="test0-ecmat1.fits",noextrap=0,elt=1,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fa51901f5d0,_xlast=0x7fa51a96a3a0,_ylast=[0x7fa518c1b3c0,0x7fa518c1b3c0,
 0x7fa518c1b3c0],_y0=0x7fa518c1b160,_signus=0x7fa518c1aaa0,_puppixoffset=[0,0],
 _nact=45,_def=0x105cfb030,_x=0x7fa51909de30,_y=0x7fa51a96a4a8,_i1=
 0x7fa51a969f80,_j1=0x7fa519049f50,_ei1=0x7fa51a8a1308,_ej1=0x7fa51a8a1180,
 _indval=0x7fa518d09b00,_indext=0x7fa51a8d78e0,_eiffile="test0-if1-ext.fits",
 _edef=0x7fa51a10fa30,_ex=0x7fa51a867750,_ey=0x7fa51a8a1378,_enact=4,_n1=26,_n2=
 103,_pupil=0x0,_command=0x7fa51a96b108,_flat_command=0x0,_extrapcmat=
 0x7fa51a01b430,_eltdefsize=38,_regmatrix=0x0,_fMat=0x0),dm_struct(type=
 "tiptilt",subsystem=1,virtual=0,dmfit_which=0x0,iffile="test0-if2.fits",pitch=
 0,alt=0,hyst=0,push4imat=50,thresholdresp=0.3,unitpervolt=0.0005,maxvolt=0,
 gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7fa51a8a23b0,_ctrlden=0x7fa51a8a1148,
 misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],disjointpup=0,pegged=0x0,epegged=
 0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,use_def_of=0,ifunrot=0,xscale=0,
 nelperring=0x0,angleoffset=0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=
 0,nxact=0,pitchMargin=0,coupling=0.2,ecmatfile="test0-ecmat2.fits",noextrap=0,
 elt=0,irexp=0,irfact=0,filtertilt=0,nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,
 fradius=0,regparam=0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,
 0.63,0.89],_w=[0.2,0.35,0.45],_x0=0x7fa51a8a15a8,_xlast=0x7fa51a8a1df8,_ylast=
 [0x7fa51a8d7638,0x7fa51a8d7638,0x7fa51a8d7638],_y0=0x7fa51a85fda0,_signus=
 0x7fa51a8a18f0,_puppixoffset=[0,0],_nact=2,_def=0x7fa51a9b8830,_x=0x0,_y=0x0,
 _i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile=
 "test0-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=26,_n2=103,_pupil=
 0x0,_command=0x7fa51a8a1b20,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,
 _regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fa51a8a1768,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test0-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fa51a8a1998,xposition=0x7fa51a8a1928,yposition=
 0x7fa51a8a1c70,dispzoom=0x7fa51a8a11b8,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
Simple SH6x6 w/ TT mirror, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.0955  0.0318  0.0955   1.02  0.95  8.02   10x10   10x10    69930.1
 
Summary:
Mirror #1, stackarray, 45 actuators, conjugated @ 0 m
Mirror #2, tiptilt, 2 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 32 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 42.4; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       45.2   0.472      192.6
Field Avg  1.65                     45.2   0.472      192.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in test0-imav.fits
Some other graphics in test0.ps

Original parameter file: test0.par:
 // YAO parameter file
 //-------------------------------
 sim.name            = "Simple SH6x6 w/ TT mirror, full diffraction WFS";
 sim.pupildiam       = 60;
 sim.debug           = 0;
 sim.verbose         = 0;
 
 //-------------------------------
 atm.dr0at05mic      = 42.44;  // this is r0=0.166 at 550 nm
 atm.screen          = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac       = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed      = &([11.,20,29,35]);
 atm.layeralt        = &([0.,400,6000,9000]);
 atm.winddir         = &([0,0,0,0]);
 
 //-------------------------------
 nwfs                = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 5.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 6;
 wfs(n).pixsize      = 0.1;
 wfs(n).npixels      = 10;
 wfs(n).noise        = 1;
 wfs(n).ron          = 3.5;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 wfs(1).extfield     = 8.;
 wfs(1).spotpitch    = 24;
 wfs(1).fstop        = "square";
 wfs(1).fssize       = 1.6;
 
 
 //-------------------------------
 ndm                 = 2;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type          = "stackarray";
 dm(n).iffile        = "";
 dm(n).nxact         = 7;
 dm(n).pitch         = 10;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01;
 dm(n).push4imat     = 50;
 dm(n).elt           = 1;
 
 n  =2;
 dm(n).type          = "tiptilt";
 dm(n).iffile        = "";
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.0005;
 dm(n).push4imat     = 50;
 
 //-------------------------------
 mat.condition       = &([15.]);
 mat.file            = "";
 
 //-------------------------------
 tel.diam            = 7.9;
 tel.cobs            = 0.1125;
 
 //-------------------------------
 target.lambda       = &([1.65]);
 target.xposition    = &([0.]);
 target.yposition    = &([0]);
 target.dispzoom     = &([1.]);
 
 //-------------------------------
 gs.zeropoint        = 1e11;
 gs.zenithangle      = 0.;
 
 //-------------------------------
 loop.gain           = 0.6;
 loop.framedelay     = 1;
 loop.niter          = 1000;
 loop.ittime         = 2e-3;
 loop.startskip      = 10;
 loop.skipevery      = 1000;
 loop.skipby         = 10000;
 loop.modalgainfile  = "simulModeGains.fits";
 
 
==== dump of structures ====
 sim_struct(name="Simple SH6x6 w/ TT mirror, full diffraction WFS",pupildiam=60,
 pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,
 shmkey=0,semkey=0,_size=128,_cent=64.5)
 atm_struct(dr0at05mic=42.44,screen=0x7faf8b0c68b0,layerfrac=0x7faf8b0c69c0,
 layerspeed=0x7faf8b0c6938,layeralt=0x7faf8a0c4b28,winddir=0x7faf8a0c51f0,
 _layeralt=0x7faf8b0c6690)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=3.5,
 darkcurrent=0,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,
 rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,
 pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=6,npixpersub=0,
 pixsize=0.0954654,npixels=10,spotpitch=24,extfield=8.0191,pupoffset=[0,0],
 shthmethod=1,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,
 fsname=0x0,fstop="square",fssize=1.6,fsoffset=[0,0],kernel=0,nintegcycles=1,
 fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,
 LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7faf8a09a740,
 lgs_prof_alt=0x7faf8a09a000,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7faf8b81ae78,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7faf8b81bef8,_origpixsize=0.1,_rebinfactor=3,_gsalt=0,_gsdepth=0,
 _nsub=32,_nsub4disp=36,_nmes=64,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,
 _tiltsh=0x7faf8a102030,_masks=0x0,_fluxpersub=0x7faf8b12eb60,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7faf8b81c528,_skyfluxpersub=0x7faf8b0a8400,
 _nphotons=69930.1,_skynphotons=0,_tt=[-0.000716063,-0.000184347],_lastvalidtt=
 [-0.000716063,-0.000184347],_upttcommand=[0,0],_refmes=0x7faf89c12a10,_tiprefv=
 0x7faf89f1aff0,_tiltrefv=0x7faf89e2d9a0,_tiprefvn=0x7faf89f1b230,_tiltrefvn=
 0x7faf89e2faa0,_reordervec=0x0,_npixels=84,_npb=74,_sdim=32,_nx=252,_nx4fft=
 252,_istart=0x7faf8b12e740,_jstart=0x7faf8b12ee78,_binindices=0x108996030,
 _binxy=84,_centroidw=0x7faf89e2f6e0,_fimage=0x108012030,_fimage2=0x0,_imistart=
 0x7faf8b81bce8,_imjstart=0x7faf8b81c318,_imistart2=0x7faf8b81bdf0,_imjstart2=
 0x7faf8b81b298,_unittip=0x7faf89d0a7f0,_unittilt=0x7faf89d0aee0,_lgs_defocuses=
 0x7faf8a099510,_unitdefocus=0x7faf8a855030,_fimnx=204,_fimny=204,_fimny2=0x0,
 _yoffset=0x0,_bias=0x107d92030,_flat=0x107dbb030,_domask=1,_submask=
 0x108d9f030,_kernel=0x107e0d030,_kernels=0x10f59e030,_kerfftr=0x10aca5030,
 _kerffti=0x10fe57030,_kernelconv=0,_cyclecounter=1,_dispimage=0x108064030,_x=
 0x7faf89c17470,_y=0x7faf89c10300,_centroidgain=1,_rayleigh=0x7faf8a0996d0,
 _bckgrdcalib=0x107d2f030,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=
 1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,
 _LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,
 _nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test0-if1.fits",pitch=10,alt=0,hyst=0,push4imat=50,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7faf8a099ac0,_ctrlden=0x7faf8a099660,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=7,pitchMargin=0,coupling=0.2,
 ecmatfile="test0-ecmat1.fits",noextrap=0,elt=1,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf8b81b3a0,_xlast=0x7faf8b0a8610,_ylast=[0x7faf89e30540,0x7faf89e30540,
 0x7faf89e30540],_y0=0x7faf89e2dbe0,_signus=0x7faf89e2f8d0,_puppixoffset=[0,0],
 _nact=45,_def=0x108a63030,_x=0x7faf8b0a8a30,_y=0x7faf8b81b4a8,_i1=
 0x7faf8b81af80,_j1=0x7faf8b12e950,_ei1=0x7faf8a099708,_ej1=0x7faf8a099580,
 _indval=0x7faf89f1da90,_indext=0x7faf8a0c50e0,_eiffile="test0-if1-ext.fits",
 _edef=0x7faf8b854430,_ex=0x7faf8a07c750,_ey=0x7faf8a099778,_enact=4,_n1=26,_n2=
 103,_pupil=0x0,_command=0x7faf8b81b7c0,_flat_command=0x0,_extrapcmat=
 0x7faf8b10ca30,_eltdefsize=38,_regmatrix=0x0,_fMat=0x0),dm_struct(type=
 "tiptilt",subsystem=1,virtual=0,dmfit_which=0x0,iffile="test0-if2.fits",pitch=
 0,alt=0,hyst=0,push4imat=50,thresholdresp=0.3,unitpervolt=0.0005,maxvolt=0,
 gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7faf8a0994d8,_ctrlden=0x7faf8a0999a8,
 misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],disjointpup=0,pegged=0x0,epegged=
 0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,use_def_of=0,ifunrot=0,xscale=0,
 nelperring=0x0,angleoffset=0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=
 0,nxact=0,pitchMargin=0,coupling=0.2,ecmatfile="test0-ecmat2.fits",noextrap=0,
 elt=0,irexp=0,irfact=0,filtertilt=0,nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,
 fradius=0,regparam=0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,
 0.63,0.89],_w=[0.2,0.35,0.45],_x0=0x7faf8a099cf0,_xlast=0x7faf8a099e78,_ylast=
 [0x7faf8a0c5168,0x7faf8a0c5168,0x7faf8a0c5168],_y0=0x7faf8a0c5278,_signus=
 0x7faf8a099f20,_puppixoffset=[0,0],_nact=2,_def=0x7faf8b18a630,_x=0x0,_y=0x0,
 _i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile=
 "test0-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=26,_n2=103,_pupil=
 0x0,_command=0x7faf8a099468,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,
 _regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7faf8a099b68,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test0-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7faf8a099d98,xposition=0x7faf8a09a4a0,yposition=
 0x7faf8a09a070,dispzoom=0x7faf8a0995b8,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       45.2   0.472      192.6
Field Avg  1.65                     45.2   0.472      192.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in test0-imav.fits
Some other graphics in test0.ps

Original parameter file: test0.par:
 // YAO parameter file
 //-------------------------------
 sim.name            = "Simple SH6x6 w/ TT mirror, full diffraction WFS";
 sim.pupildiam       = 60;
 sim.debug           = 0;
 sim.verbose         = 0;
 
 //-------------------------------
 atm.dr0at05mic      = 42.44;  // this is r0=0.166 at 550 nm
 atm.screen          = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac       = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed      = &([11.,20,29,35]);
 atm.layeralt        = &([0.,400,6000,9000]);
 atm.winddir         = &([0,0,0,0]);
 
 //-------------------------------
 nwfs                = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 5.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 6;
 wfs(n).pixsize      = 0.1;
 wfs(n).npixels      = 10;
 wfs(n).noise        = 1;
 wfs(n).ron          = 3.5;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 wfs(1).extfield     = 8.;
 wfs(1).spotpitch    = 24;
 wfs(1).fstop        = "square";
 wfs(1).fssize       = 1.6;
 
 
 //-------------------------------
 ndm                 = 2;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type          = "stackarray";
 dm(n).iffile        = "";
 dm(n).nxact         = 7;
 dm(n).pitch         = 10;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01;
 dm(n).push4imat     = 50;
 dm(n).elt           = 1;
 
 n  =2;
 dm(n).type          = "tiptilt";
 dm(n).iffile        = "";
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.0005;
 dm(n).push4imat     = 50;
 
 //-------------------------------
 mat.condition       = &([15.]);
 mat.file            = "";
 
 //-------------------------------
 tel.diam            = 7.9;
 tel.cobs            = 0.1125;
 
 //-------------------------------
 target.lambda       = &([1.65]);
 target.xposition    = &([0.]);
 target.yposition    = &([0]);
 target.dispzoom     = &([1.]);
 
 //-------------------------------
 gs.zeropoint        = 1e11;
 gs.zenithangle      = 0.;
 
 //-------------------------------
 loop.gain           = 0.6;
 loop.framedelay     = 1;
 loop.niter          = 1000;
 loop.ittime         = 2e-3;
 loop.startskip      = 10;
 loop.skipevery      = 1000;
 loop.skipby         = 10000;
 loop.modalgainfile  = "simulModeGains.fits";
 
 
==== dump of structures ====
 sim_struct(name="Simple SH6x6 w/ TT mirror, full diffraction WFS",pupildiam=60,
 pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,
 shmkey=0,semkey=0,_size=128,_cent=64.5)
 atm_struct(dr0at05mic=42.44,screen=0x7faf8b0c68b0,layerfrac=0x7faf8b0c69c0,
 layerspeed=0x7faf8b0c6938,layeralt=0x7faf8a0c4b28,winddir=0x7faf8a0c51f0,
 _layeralt=0x7faf8b0c6690)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=3.5,
 darkcurrent=0,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,
 rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,
 pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=6,npixpersub=0,
 pixsize=0.0954654,npixels=10,spotpitch=24,extfield=8.0191,pupoffset=[0,0],
 shthmethod=1,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,
 fsname=0x0,fstop="square",fssize=1.6,fsoffset=[0,0],kernel=0,nintegcycles=1,
 fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,
 LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7faf8a09a740,
 lgs_prof_alt=0x7faf8a09a000,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7faf8b12ea58,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7faf8b81bef8,_origpixsize=0.1,_rebinfactor=3,_gsalt=0,_gsdepth=0,
 _nsub=32,_nsub4disp=36,_nmes=64,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,
 _tiltsh=0x7faf8a102030,_masks=0x0,_fluxpersub=0x7faf8b12eb60,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7faf8b81c528,_skyfluxpersub=0x7faf8b0a8400,
 _nphotons=69930.1,_skynphotons=0,_tt=[-0.000716063,-0.000184347],_lastvalidtt=
 [-0.000716063,-0.000184347],_upttcommand=[0,0],_refmes=0x7faf89c12a10,_tiprefv=
 0x7faf89f1aff0,_tiltrefv=0x7faf89e2d9a0,_tiprefvn=0x7faf89f1b230,_tiltrefvn=
 0x7faf89e2faa0,_reordervec=0x0,_npixels=84,_npb=74,_sdim=32,_nx=252,_nx4fft=
 252,_istart=0x7faf8b12e740,_jstart=0x7faf8b12ee78,_binindices=0x108996030,
 _binxy=84,_centroidw=0x7faf89e2f6e0,_fimage=0x107de4030,_fimage2=0x0,_imistart=
 0x7faf8b81bce8,_imjstart=0x7faf8b81c318,_imistart2=0x7faf8b81bdf0,_imjstart2=
 0x7faf8b81b298,_unittip=0x7faf89d0a7f0,_unittilt=0x7faf89d0aee0,_lgs_defocuses=
 0x7faf8a099510,_unitdefocus=0x7faf8a855030,_fimnx=204,_fimny=204,_fimny2=0x0,
 _yoffset=0x0,_bias=0x107d92030,_flat=0x107dbb030,_domask=1,_submask=
 0x108d9f030,_kernel=0x108c66030,_kernels=0x10f59e030,_kerfftr=0x10aca5030,
 _kerffti=0x10fe57030,_kernelconv=0,_cyclecounter=1,_dispimage=0x108064030,_x=
 0x7faf89c17470,_y=0x7faf89c10300,_centroidgain=1,_rayleigh=0x7faf8a0996d0,
 _bckgrdcalib=0x107d2f030,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=
 1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,
 _LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,
 _nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test0-if1.fits",pitch=10,alt=0,hyst=0,push4imat=50,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7faf8a09a660,_ctrlden=0x7faf8a09a708,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=7,pitchMargin=0,coupling=0.2,
 ecmatfile="test0-ecmat1.fits",noextrap=0,elt=1,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf8a026dd0,_xlast=0x7faf8b81b3a0,_ylast=[0x7faf89c1b8b0,0x7faf89c1b8b0,
 0x7faf89c1b8b0],_y0=0x7faf89c1b650,_signus=0x7faf89c1bb10,_puppixoffset=[0,0],
 _nact=45,_def=0x108a63030,_x=0x7faf8b0a8a30,_y=0x7faf8b81b4a8,_i1=
 0x7faf8b81af80,_j1=0x7faf8b12e950,_ei1=0x7faf8a099708,_ej1=0x7faf8a099580,
 _indval=0x7faf89f1da90,_indext=0x7faf8a0c50e0,_eiffile="test0-if1-ext.fits",
 _edef=0x7faf8b854430,_ex=0x7faf8a07c750,_ey=0x7faf8a099778,_enact=4,_n1=26,_n2=
 103,_pupil=0x0,_command=0x7faf8b81c108,_flat_command=0x0,_extrapcmat=
 0x7faf8b10ca30,_eltdefsize=38,_regmatrix=0x0,_fMat=0x0),dm_struct(type=
 "tiptilt",subsystem=1,virtual=0,dmfit_which=0x0,iffile="test0-if2.fits",pitch=
 0,alt=0,hyst=0,push4imat=50,thresholdresp=0.3,unitpervolt=0.0005,maxvolt=0,
 gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7faf8a099ee8,_ctrlden=0x7faf8a09a628,
 misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],disjointpup=0,pegged=0x0,epegged=
 0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,use_def_of=0,ifunrot=0,xscale=0,
 nelperring=0x0,angleoffset=0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=
 0,nxact=0,pitchMargin=0,coupling=0.2,ecmatfile="test0-ecmat2.fits",noextrap=0,
 elt=0,irexp=0,irfact=0,filtertilt=0,nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,
 fradius=0,regparam=0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,
 0.63,0.89],_w=[0.2,0.35,0.45],_x0=0x7faf8a099ac0,_xlast=0x7faf8a0999a8,_ylast=
 [0x7faf8a0c4e38,0x7faf8a0c4e38,0x7faf8a0c4e38],_y0=0x7faf8b0c67a0,_signus=
 0x7faf8a099cf0,_puppixoffset=[0,0],_nact=2,_def=0x7faf8b18a630,_x=0x0,_y=0x0,
 _i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile=
 "test0-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=26,_n2=103,_pupil=
 0x0,_command=0x7faf8a099f20,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,
 _regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7faf8a099b68,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test0-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7faf8a099d98,xposition=0x7faf8a09a4a0,yposition=
 0x7faf8a09a070,dispzoom=0x7faf8a0995b8,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
