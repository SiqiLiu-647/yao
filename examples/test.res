=============================
Simple SH6x6 w/ TT mirror, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.0955  0.0318  0.0955   1.02  0.95  0.95   10x10   10x10    69930.1
 
Summary:
Mirror #1, stackarray, 45 actuators, conjugated @ 0 m
Mirror #2, tiptilt, 2 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 32 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 42.4; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       45.2   0.472      192.6
Field Avg  1.65                     45.2   0.472      192.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in test-imav.fits
Some other graphics in test.ps

Original parameter file: test.par:
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
 if (yao_major_version&&(yao_major_version>=4)&&(yao_minor_version>=10)) {
   wfs(n).extfield = 2.;
 }
 
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
 atm_struct(dr0at05mic=42.44,screen=0x7fab3291af38,layerfrac=0x7fab3291aeb0,
 layerspeed=0x7fab3291afc0,layeralt=0x7fab3291b048,winddir=0x7fab3291b0d0,
 _layeralt=0x7fab3291ac90)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=3.5,
 darkcurrent=0,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,
 rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,
 pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=6,npixpersub=0,
 pixsize=0.0954654,npixels=10,spotpitch=10,extfield=0.954654,pupoffset=[0,0],
 shthmethod=1,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,
 fsname=0x0,fstop="square",fssize=0.954654,fsoffset=[0,0],kernel=0,nintegcycles=
 1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,
 LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fab3380bbb8,
 lgs_prof_alt=0x7fab3380bb80,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fab338decc8,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fab328fcc10,_origpixsize=0.1,_rebinfactor=3,_gsalt=0,_gsdepth=0,
 _nsub=32,_nsub4disp=36,_nmes=64,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,
 _tiltsh=0x7fab33058e30,_masks=0x0,_fluxpersub=0x7fab338ddd50,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fab338dde58,_skyfluxpersub=0x7fab338de380,
 _nphotons=69930.1,_skynphotons=0,_tt=[-0.000744282,-0.000280935],_lastvalidtt=
 [-0.000744282,-0.000280935],_upttcommand=[0,0],_refmes=0x7fab3242e310,_tiprefv=
 0x7fab3242f700,_tiltrefv=0x7fab3242f4c0,_tiprefvn=0x7fab3242f940,_tiltrefvn=
 0x7fab3242fdc0,_reordervec=0x0,_npixels=10,_npb=0,_sdim=32,_nx=30,_nx4fft=30,
 _istart=0x7fab328fcd18,_jstart=0x7fab328fce20,_binindices=0x7fab338d7a30,
 _binxy=10,_centroidw=0x7fab3301af28,_fimage=0x7fab32988430,_fimage2=0x0,
 _imistart=0x7fab328fcf28,_imjstart=0x7fab338dda38,_imistart2=0x7fab338ddb40,
 _imjstart2=0x7fab338ddc48,_unittip=0x7fab32505120,_unittilt=0x7fab325052f0,
 _lgs_defocuses=0x7fab3380bdb0,_unitdefocus=0x7fab33048c30,_fimnx=60,_fimny=60,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fab338f5e30,_flat=0x7fab338f9830,_domask=1,
 _submask=0x7fab3300e630,_kernel=0x7fab328ec230,_kernels=0x7fab33087e30,
 _kerfftr=0x7fab330c0830,_kerffti=0x7fab330e0430,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7fab3299ea30,_x=0x7fab32424950,_y=0x7fab324244a0,_centroidgain=1,
 _rayleigh=0x7fab3380bfe0,_bckgrdcalib=0x7fab338f2430,_bckgrdinit=0,_bckgrdsub=
 1,_meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],
 _LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=
 0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test-if1.fits",pitch=10,alt=0,hyst=0,push4imat=50,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fab3380ca68,_ctrlden=0x7fab3380cad8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=7,pitchMargin=0,coupling=0.2,
 ecmatfile="test-ecmat1.fits",noextrap=0,elt=1,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fab32811508,_xlast=0x7fab338debc0,_ylast=[0x7fab32714150,0x7fab32714150,
 0x7fab32714150],_y0=0x7fab32713ef0,_signus=0x7fab327129a0,_puppixoffset=[0,0],
 _nact=45,_def=0x1018d3030,_x=0x7fab338defe0,_y=0x7fab338ddf60,_i1=
 0x7fab328fd030,_j1=0x7fab338de170,_ei1=0x7fab3380be90,_ej1=0x7fab3380c0c0,
 _indval=0x7fab32634300,_indext=0x7fab3301b2c0,_eiffile="test-if1-ext.fits",
 _edef=0x7fab33934030,_ex=0x7fab3380bfa8,_ey=0x7fab3380bec8,_enact=4,_n1=26,_n2=
 103,_pupil=0x0,_command=0x7fab33818bd0,_flat_command=0x0,_extrapcmat=
 0x7fab3383da30,_eltdefsize=38,_regmatrix=0x0,_fMat=0x0),dm_struct(type=
 "tiptilt",subsystem=1,virtual=0,dmfit_which=0x0,iffile="test-if2.fits",pitch=0,
 alt=0,hyst=0,push4imat=50,thresholdresp=0.3,unitpervolt=0.0005,maxvolt=0,gain=
 1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7fab3380bc60,_ctrlden=0x7fab3380c830,
 misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],disjointpup=0,pegged=0x0,epegged=
 0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,use_def_of=0,ifunrot=0,xscale=0,
 nelperring=0x0,angleoffset=0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=
 0,nxact=0,pitchMargin=0,coupling=0.2,ecmatfile="test-ecmat2.fits",noextrap=0,
 elt=0,irexp=0,irfact=0,filtertilt=0,nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,
 fradius=0,regparam=0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,
 0.63,0.89],_w=[0.2,0.35,0.45],_x0=0x7fab3380c168,_xlast=0x7fab3380bbf0,_ylast=
 [0x7fab3301b3d0,0x7fab3301b3d0,0x7fab3301b3d0],_y0=0x7fab3301ad90,_signus=
 0x7fab3380c398,_puppixoffset=[0,0],_nact=2,_def=0x7fab338dfc30,_x=0x0,_y=0x0,
 _i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile=
 "test-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=26,_n2=103,_pupil=
 0x0,_command=0x7fab3380bd40,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,
 _regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fab3380b788,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test-mat.fits",fit_simple=
 0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fab3380baa0,xposition=0x7fab3380bad8,yposition=
 0x7fab3380b440,dispzoom=0x7fab3380ba68,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       45.2   0.472      192.6
Field Avg  1.65                     45.2   0.472      192.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in test-imav.fits
Some other graphics in test.ps

Original parameter file: test.par:
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
 if (yao_major_version&&(yao_major_version>=4)&&(yao_minor_version>=10)) {
   wfs(n).extfield = 2.;
 }
 
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
 atm_struct(dr0at05mic=42.44,screen=0x7fab3291af38,layerfrac=0x7fab3291aeb0,
 layerspeed=0x7fab3291afc0,layeralt=0x7fab3291b048,winddir=0x7fab3291b0d0,
 _layeralt=0x7fab3291ac90)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=3.5,
 darkcurrent=0,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,
 rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,
 pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=6,npixpersub=0,
 pixsize=0.0954654,npixels=10,spotpitch=10,extfield=0.954654,pupoffset=[0,0],
 shthmethod=1,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,
 fsname=0x0,fstop="square",fssize=0.954654,fsoffset=[0,0],kernel=0,nintegcycles=
 1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,
 LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fab3380bbb8,
 lgs_prof_alt=0x7fab3380bb80,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fab338df400,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fab328fcc10,_origpixsize=0.1,_rebinfactor=3,_gsalt=0,_gsdepth=0,
 _nsub=32,_nsub4disp=36,_nmes=64,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,
 _tiltsh=0x7fab33058e30,_masks=0x0,_fluxpersub=0x7fab338ddd50,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fab338dde58,_skyfluxpersub=0x7fab338de380,
 _nphotons=69930.1,_skynphotons=0,_tt=[-0.000744282,-0.000280935],_lastvalidtt=
 [-0.000744282,-0.000280935],_upttcommand=[0,0],_refmes=0x7fab3242e310,_tiprefv=
 0x7fab3242f700,_tiltrefv=0x7fab3242f4c0,_tiprefvn=0x7fab3242f940,_tiltrefvn=
 0x7fab3242fdc0,_reordervec=0x0,_npixels=10,_npb=0,_sdim=32,_nx=30,_nx4fft=30,
 _istart=0x7fab328fcd18,_jstart=0x7fab328fce20,_binindices=0x7fab338d7a30,
 _binxy=10,_centroidw=0x7fab3301af28,_fimage=0x7fab340a9a30,_fimage2=0x0,
 _imistart=0x7fab328fcf28,_imjstart=0x7fab338dda38,_imistart2=0x7fab338ddb40,
 _imjstart2=0x7fab338ddc48,_unittip=0x7fab32505120,_unittilt=0x7fab325052f0,
 _lgs_defocuses=0x7fab3380bdb0,_unitdefocus=0x7fab33048c30,_fimnx=60,_fimny=60,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fab338f5e30,_flat=0x7fab338f9830,_domask=1,
 _submask=0x7fab3300e630,_kernel=0x7fab340bb030,_kernels=0x7fab33087e30,
 _kerfftr=0x7fab330c0830,_kerffti=0x7fab330e0430,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7fab340ad430,_x=0x7fab32424950,_y=0x7fab324244a0,_centroidgain=1,
 _rayleigh=0x7fab3380bfe0,_bckgrdcalib=0x7fab338f2430,_bckgrdinit=0,_bckgrdsub=
 1,_meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],
 _LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=
 0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test-if1.fits",pitch=10,alt=0,hyst=0,push4imat=50,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fab3380c6e0,_ctrlden=0x7fab3380c328,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=7,pitchMargin=0,coupling=0.2,
 ecmatfile="test-ecmat1.fits",noextrap=0,elt=1,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fab338dedd0,_xlast=0x7fab32811508,_ylast=[0x7fab32430260,0x7fab32430260,
 0x7fab32430260],_y0=0x7fab32430000,_signus=0x7fab3242fb80,_puppixoffset=[0,0],
 _nact=45,_def=0x1018d3030,_x=0x7fab338defe0,_y=0x7fab338ddf60,_i1=
 0x7fab328fd030,_j1=0x7fab338de170,_ei1=0x7fab3380be90,_ej1=0x7fab3380c0c0,
 _indval=0x7fab32634300,_indext=0x7fab3301b2c0,_eiffile="test-if1-ext.fits",
 _edef=0x7fab33934030,_ex=0x7fab3380bfa8,_ey=0x7fab3380bec8,_enact=4,_n1=26,_n2=
 103,_pupil=0x0,_command=0x7fab338de068,_flat_command=0x0,_extrapcmat=
 0x7fab3383da30,_eltdefsize=38,_regmatrix=0x0,_fMat=0x0),dm_struct(type=
 "tiptilt",subsystem=1,virtual=0,dmfit_which=0x0,iffile="test-if2.fits",pitch=0,
 alt=0,hyst=0,push4imat=50,thresholdresp=0.3,unitpervolt=0.0005,maxvolt=0,gain=
 1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7fab3380cd40,_ctrlden=0x7fab3380c750,
 misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],disjointpup=0,pegged=0x0,epegged=
 0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,use_def_of=0,ifunrot=0,xscale=0,
 nelperring=0x0,angleoffset=0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=
 0,nxact=0,pitchMargin=0,coupling=0.2,ecmatfile="test-ecmat2.fits",noextrap=0,
 elt=0,irexp=0,irfact=0,filtertilt=0,nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,
 fradius=0,regparam=0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,
 0.63,0.89],_w=[0.2,0.35,0.45],_x0=0x7fab3380ca68,_xlast=0x7fab3380c830,_ylast=
 [0x7fab3301b458,0x7fab3301b458,0x7fab3301b458],_y0=0x7fab3301b5f0,_signus=
 0x7fab3380c168,_puppixoffset=[0,0],_nact=2,_def=0x7fab338dfc30,_x=0x0,_y=0x0,
 _i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile=
 "test-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=26,_n2=103,_pupil=
 0x0,_command=0x7fab3380c398,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,
 _regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fab3380b788,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test-mat.fits",fit_simple=
 0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fab3380baa0,xposition=0x7fab3380bad8,yposition=
 0x7fab3380b440,dispzoom=0x7fab3380ba68,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
Simple SH6x6 w/ TT mirror, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.0955  0.0318  0.0955   1.02  0.95  0.95   10x10   10x10    69930.1
 
Summary:
Mirror #1, stackarray, 45 actuators, conjugated @ 0 m
Mirror #2, tiptilt, 2 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 32 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 42.4; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       45.2   0.472      192.6
Field Avg  1.65                     45.2   0.472      192.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in test-imav.fits
Some other graphics in test.ps

Original parameter file: test.par:
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
 if (yao_major_version&&(yao_major_version>=4)&&(yao_minor_version>=10)) {
   wfs(n).extfield = 2.;
 }
 
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
 atm_struct(dr0at05mic=42.44,screen=0x7fa51a85ff38,layerfrac=0x7fa51a85feb0,
 layerspeed=0x7fa51a85ffc0,layeralt=0x7fa51a860048,winddir=0x7fa51a8600d0,
 _layeralt=0x7fa51a85fc90)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=3.5,
 darkcurrent=0,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,
 rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,
 pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=6,npixpersub=0,
 pixsize=0.0954654,npixels=10,spotpitch=10,extfield=0.954654,pupoffset=[0,0],
 shthmethod=1,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,
 fsname=0x0,fstop="square",fssize=0.954654,fsoffset=[0,0],kernel=0,nintegcycles=
 1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,
 LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fa51a8a11b8,
 lgs_prof_alt=0x7fa51a8a1180,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fa51a96a8c8,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fa51909da10,_origpixsize=0.1,_rebinfactor=3,_gsalt=0,_gsdepth=0,
 _nsub=32,_nsub4disp=36,_nmes=64,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,
 _tiltsh=0x7fa51a97d430,_masks=0x0,_fluxpersub=0x7fa51a969950,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fa51a969a58,_skyfluxpersub=0x7fa51a969f80,
 _nphotons=69930.1,_skynphotons=0,_tt=[-0.000744282,-0.000280935],_lastvalidtt=
 [-0.000744282,-0.000280935],_upttcommand=[0,0],_refmes=0x7fa518e07c90,_tiprefv=
 0x7fa518f3e2c0,_tiltrefv=0x7fa518f3e500,_tiprefvn=0x7fa518f3e7c0,_tiltrefvn=
 0x7fa518f3ec40,_reordervec=0x0,_npixels=10,_npb=0,_sdim=32,_nx=30,_nx4fft=30,
 _istart=0x7fa51909db18,_jstart=0x7fa51909dc20,_binindices=0x7fa51a974630,
 _binxy=10,_centroidw=0x7fa51a8d0328,_fimage=0x7fa5190e1030,_fimage2=0x0,
 _imistart=0x7fa51909dd28,_imjstart=0x7fa51a969638,_imistart2=0x7fa51a969740,
 _imjstart2=0x7fa51a969848,_unittip=0x7fa518d0a050,_unittilt=0x7fa518d0a220,
 _lgs_defocuses=0x7fa51a8a13b0,_unitdefocus=0x7fa51986cc30,_fimnx=60,_fimny=60,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fa519052430,_flat=0x7fa519055e30,_domask=1,
 _submask=0x7fa51a048630,_kernel=0x7fa51a972a30,_kernels=0x7fa51a04b830,
 _kerfftr=0x7fa51a08e430,_kerffti=0x7fa51a0bca30,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7fa51904be30,_x=0x7fa518d095a0,_y=0x7fa518d0a3f0,_centroidgain=1,
 _rayleigh=0x7fa51a8a15e0,_bckgrdcalib=0x7fa51905da30,_bckgrdinit=0,_bckgrdsub=
 1,_meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],
 _LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=
 0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test-if1.fits",pitch=10,alt=0,hyst=0,push4imat=50,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fa51a8a2068,_ctrlden=0x7fa51a8a20d8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=7,pitchMargin=0,coupling=0.2,
 ecmatfile="test-ecmat1.fits",noextrap=0,elt=1,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fa519810908,_xlast=0x7fa51a96a7c0,_ylast=[0x7fa518c1a860,0x7fa518c1a860,
 0x7fa518c1a860],_y0=0x7fa518c19000,_signus=0x7fa518c1a4c0,_puppixoffset=[0,0],
 _nact=45,_def=0x105d41030,_x=0x7fa51a96abe0,_y=0x7fa51a969b60,_i1=
 0x7fa51909de30,_j1=0x7fa51a969d70,_ei1=0x7fa51a8a1490,_ej1=0x7fa51a8a16c0,
 _indval=0x7fa518d0a550,_indext=0x7fa51a8d76c0,_eiffile="test-if1-ext.fits",
 _edef=0x7fa519866c30,_ex=0x7fa51a8a15a8,_ey=0x7fa51a8a14c8,_enact=4,_n1=26,_n2=
 103,_pupil=0x0,_command=0x7fa51901f5d0,_flat_command=0x0,_extrapcmat=
 0x7fa5190ac230,_eltdefsize=38,_regmatrix=0x0,_fMat=0x0),dm_struct(type=
 "tiptilt",subsystem=1,virtual=0,dmfit_which=0x0,iffile="test-if2.fits",pitch=0,
 alt=0,hyst=0,push4imat=50,thresholdresp=0.3,unitpervolt=0.0005,maxvolt=0,gain=
 1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7fa51a8a1260,_ctrlden=0x7fa51a8a1928,
 misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],disjointpup=0,pegged=0x0,epegged=
 0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,use_def_of=0,ifunrot=0,xscale=0,
 nelperring=0x0,angleoffset=0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=
 0,nxact=0,pitchMargin=0,coupling=0.2,ecmatfile="test-ecmat2.fits",noextrap=0,
 elt=0,irexp=0,irfact=0,filtertilt=0,nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,
 fradius=0,regparam=0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,
 0.63,0.89],_w=[0.2,0.35,0.45],_x0=0x7fa51a8a1768,_xlast=0x7fa51a8a1148,_ylast=
 [0x7fa51a8d77d0,0x7fa51a8d77d0,0x7fa51a8d77d0],_y0=0x7fa51a8d0190,_signus=
 0x7fa51a8a1998,_puppixoffset=[0,0],_nact=2,_def=0x7fa51a0fa630,_x=0x0,_y=0x0,
 _i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile=
 "test-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=26,_n2=103,_pupil=
 0x0,_command=0x7fa51a8a1340,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,
 _regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fa51a867788,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test-mat.fits",fit_simple=
 0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fa51a8a10a0,xposition=0x7fa51a8a10d8,yposition=
 0x7fa51a867440,dispzoom=0x7fa51a8a1068,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       45.2   0.472      192.6
Field Avg  1.65                     45.2   0.472      192.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in test-imav.fits
Some other graphics in test.ps

Original parameter file: test.par:
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
 if (yao_major_version&&(yao_major_version>=4)&&(yao_minor_version>=10)) {
   wfs(n).extfield = 2.;
 }
 
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
 atm_struct(dr0at05mic=42.44,screen=0x7fa51a85ff38,layerfrac=0x7fa51a85feb0,
 layerspeed=0x7fa51a85ffc0,layeralt=0x7fa51a860048,winddir=0x7fa51a8600d0,
 _layeralt=0x7fa51a85fc90)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=3.5,
 darkcurrent=0,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,
 rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,
 pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=6,npixpersub=0,
 pixsize=0.0954654,npixels=10,spotpitch=10,extfield=0.954654,pupoffset=[0,0],
 shthmethod=1,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,
 fsname=0x0,fstop="square",fssize=0.954654,fsoffset=[0,0],kernel=0,nintegcycles=
 1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,
 LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fa51a8a11b8,
 lgs_prof_alt=0x7fa51a8a1180,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fa51a96b000,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fa51909da10,_origpixsize=0.1,_rebinfactor=3,_gsalt=0,_gsdepth=0,
 _nsub=32,_nsub4disp=36,_nmes=64,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,
 _tiltsh=0x7fa51a97d430,_masks=0x0,_fluxpersub=0x7fa51a969950,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fa51a969a58,_skyfluxpersub=0x7fa51a969f80,
 _nphotons=69930.1,_skynphotons=0,_tt=[-0.000744282,-0.000280935],_lastvalidtt=
 [-0.000744282,-0.000280935],_upttcommand=[0,0],_refmes=0x7fa518e07c90,_tiprefv=
 0x7fa518f3e2c0,_tiltrefv=0x7fa518f3e500,_tiprefvn=0x7fa518f3e7c0,_tiltrefvn=
 0x7fa518f3ec40,_reordervec=0x0,_npixels=10,_npb=0,_sdim=32,_nx=30,_nx4fft=30,
 _istart=0x7fa51909db18,_jstart=0x7fa51909dc20,_binindices=0x7fa51a974630,
 _binxy=10,_centroidw=0x7fa51a8d0328,_fimage=0x7fa5190e1030,_fimage2=0x0,
 _imistart=0x7fa51909dd28,_imjstart=0x7fa51a969638,_imistart2=0x7fa51a969740,
 _imjstart2=0x7fa51a969848,_unittip=0x7fa518d0a050,_unittilt=0x7fa518d0a220,
 _lgs_defocuses=0x7fa51a8a13b0,_unitdefocus=0x7fa51986cc30,_fimnx=60,_fimny=60,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fa519052430,_flat=0x7fa519055e30,_domask=1,
 _submask=0x7fa51a048630,_kernel=0x7fa51a16c030,_kernels=0x7fa51a04b830,
 _kerfftr=0x7fa51a08e430,_kerffti=0x7fa51a0bca30,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7fa51910bc30,_x=0x7fa518d095a0,_y=0x7fa518d0a3f0,_centroidgain=1,
 _rayleigh=0x7fa51a8a15e0,_bckgrdcalib=0x7fa51905da30,_bckgrdinit=0,_bckgrdsub=
 1,_meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],
 _LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=
 0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test-if1.fits",pitch=10,alt=0,hyst=0,push4imat=50,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fa51a8676e0,_ctrlden=0x7fa51a8a2298,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=7,pitchMargin=0,coupling=0.2,
 ecmatfile="test-ecmat1.fits",noextrap=0,elt=1,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fa51a96a9d0,_xlast=0x7fa519810908,_ylast=[0x7fa518e10cf0,0x7fa518e10cf0,
 0x7fa518e10cf0],_y0=0x7fa518e10a90,_signus=0x7fa518e10f50,_puppixoffset=[0,0],
 _nact=45,_def=0x105d41030,_x=0x7fa51a96abe0,_y=0x7fa51a969b60,_i1=
 0x7fa51909de30,_j1=0x7fa51a969d70,_ei1=0x7fa51a8a1490,_ej1=0x7fa51a8a16c0,
 _indval=0x7fa518d0a550,_indext=0x7fa51a8d76c0,_eiffile="test-if1-ext.fits",
 _edef=0x7fa519866c30,_ex=0x7fa51a8a15a8,_ey=0x7fa51a8a14c8,_enact=4,_n1=26,_n2=
 103,_pupil=0x0,_command=0x7fa51a969c68,_flat_command=0x0,_extrapcmat=
 0x7fa5190ac230,_eltdefsize=38,_regmatrix=0x0,_fMat=0x0),dm_struct(type=
 "tiptilt",subsystem=1,virtual=0,dmfit_which=0x0,iffile="test-if2.fits",pitch=0,
 alt=0,hyst=0,push4imat=50,thresholdresp=0.3,unitpervolt=0.0005,maxvolt=0,gain=
 1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7fa51a8a1ce0,_ctrlden=0x7fa51a8a1b90,
 misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],disjointpup=0,pegged=0x0,epegged=
 0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,use_def_of=0,ifunrot=0,xscale=0,
 nelperring=0x0,angleoffset=0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=
 0,nxact=0,pitchMargin=0,coupling=0.2,ecmatfile="test-ecmat2.fits",noextrap=0,
 elt=0,irexp=0,irfact=0,filtertilt=0,nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,
 fradius=0,regparam=0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,
 0.63,0.89],_w=[0.2,0.35,0.45],_x0=0x7fa51a8a2068,_xlast=0x7fa51a8a1928,_ylast=
 [0x7fa51a8d7858,0x7fa51a8d7858,0x7fa51a8d7858],_y0=0x7fa51a8d79f0,_signus=
 0x7fa51a8a1768,_puppixoffset=[0,0],_nact=2,_def=0x7fa51a0fa630,_x=0x0,_y=0x0,
 _i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile=
 "test-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=26,_n2=103,_pupil=
 0x0,_command=0x7fa51a8a1998,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,
 _regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fa51a867788,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test-mat.fits",fit_simple=
 0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fa51a8a10a0,xposition=0x7fa51a8a10d8,yposition=
 0x7fa51a867440,dispzoom=0x7fa51a8a1068,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
Simple SH6x6 w/ TT mirror, full diffraction WFS
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.0955  0.0318  0.0955   1.02  0.95  0.95   10x10   10x10    69930.1
 
Summary:
Mirror #1, stackarray, 45 actuators, conjugated @ 0 m
Mirror #2, tiptilt, 2 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 32 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 42.4; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       45.2   0.472      192.6
Field Avg  1.65                     45.2   0.472      192.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in test-imav.fits
Some other graphics in test.ps

Original parameter file: test.par:
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
 if (yao_major_version&&(yao_major_version>=4)&&(yao_minor_version>=10)) {
   wfs(n).extfield = 2.;
 }
 
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
 atm_struct(dr0at05mic=42.44,screen=0x7faf8b0c6938,layerfrac=0x7faf8b0c68b0,
 layerspeed=0x7faf8b0c69c0,layeralt=0x7faf8b0c6a48,winddir=0x7faf8b0c6ad0,
 _layeralt=0x7faf8b0c6690)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=3.5,
 darkcurrent=0,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,
 rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,
 pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=6,npixpersub=0,
 pixsize=0.0954654,npixels=10,spotpitch=10,extfield=0.954654,pupoffset=[0,0],
 shthmethod=1,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,
 fsname=0x0,fstop="square",fssize=0.954654,fsoffset=[0,0],kernel=0,nintegcycles=
 1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,
 LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7faf8a0995b8,
 lgs_prof_alt=0x7faf8a099580,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7faf8b81b8c8,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7faf8b0a8610,_origpixsize=0.1,_rebinfactor=3,_gsalt=0,_gsdepth=0,
 _nsub=32,_nsub4disp=36,_nmes=64,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,
 _tiltsh=0x7faf8a0d4230,_masks=0x0,_fluxpersub=0x7faf8b81a950,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7faf8b81aa58,_skyfluxpersub=0x7faf8b81af80,
 _nphotons=69930.1,_skynphotons=0,_tt=[-0.000744282,-0.000280935],_lastvalidtt=
 [-0.000744282,-0.000280935],_upttcommand=[0,0],_refmes=0x7faf89c18390,_tiprefv=
 0x7faf89e31640,_tiltrefv=0x7faf89c1cf30,_tiprefvn=0x7faf89e31880,_tiltrefvn=
 0x7faf89c1d170,_reordervec=0x0,_npixels=10,_npb=0,_sdim=32,_nx=30,_nx4fft=30,
 _istart=0x7faf8b0a8718,_jstart=0x7faf8b0a8820,_binindices=0x7faf8b803630,
 _binxy=10,_centroidw=0x7faf8a0c4b28,_fimage=0x7faf8b172a30,_fimage2=0x0,
 _imistart=0x7faf8b0a8928,_imjstart=0x7faf8b81a638,_imistart2=0x7faf8b81a740,
 _imjstart2=0x7faf8b81a848,_unittip=0x7faf89e2dae0,_unittilt=0x7faf89e2dcb0,
 _lgs_defocuses=0x7faf8a0997b0,_unitdefocus=0x7faf8b83da30,_fimnx=60,_fimny=60,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7faf8b1a1430,_flat=0x7faf8b19a030,_domask=1,
 _submask=0x7faf8b10be30,_kernel=0x7faf8b819230,_kernels=0x7faf8b17a430,
 _kerfftr=0x7faf8b1c2430,_kerffti=0x7faf8a84b030,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7faf8b1fc830,_x=0x7faf89e2c860,_y=0x7faf89e2dfe0,_centroidgain=1,
 _rayleigh=0x7faf8a0999e0,_bckgrdcalib=0x7faf8b19da30,_bckgrdinit=0,_bckgrdsub=
 1,_meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],
 _LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=
 0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test-if1.fits",pitch=10,alt=0,hyst=0,push4imat=50,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7faf8a099e78,_ctrlden=0x7faf8a099f90,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=7,pitchMargin=0,coupling=0.2,
 ecmatfile="test-ecmat1.fits",noextrap=0,elt=1,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf8a810908,_xlast=0x7faf8b81b7c0,_ylast=[0x7faf89e2f340,0x7faf89e2f340,
 0x7faf89e2f340],_y0=0x7faf89e2f0e0,_signus=0x7faf89e2eef0,_puppixoffset=[0,0],
 _nact=45,_def=0x108aa9030,_x=0x7faf8b81bbe0,_y=0x7faf8b81ab60,_i1=
 0x7faf8b0a8a30,_j1=0x7faf8b81ad70,_ei1=0x7faf8a099890,_ej1=0x7faf8a099ac0,
 _indval=0x7faf89c1d580,_indext=0x7faf8a0c4ec0,_eiffile="test-if1-ext.fits",
 _edef=0x7faf8a0e4430,_ex=0x7faf8a0999a8,_ey=0x7faf8a0998c8,_enact=4,_n1=26,_n2=
 103,_pupil=0x0,_command=0x7faf8a026dd0,_flat_command=0x0,_extrapcmat=
 0x7faf8a12a030,_eltdefsize=38,_regmatrix=0x0,_fMat=0x0),dm_struct(type=
 "tiptilt",subsystem=1,virtual=0,dmfit_which=0x0,iffile="test-if2.fits",pitch=0,
 alt=0,hyst=0,push4imat=50,thresholdresp=0.3,unitpervolt=0.0005,maxvolt=0,gain=
 1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7faf8a09a548,_ctrlden=0x7faf8a09a4a0,
 misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],disjointpup=0,pegged=0x0,epegged=
 0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,use_def_of=0,ifunrot=0,xscale=0,
 nelperring=0x0,angleoffset=0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=
 0,nxact=0,pitchMargin=0,coupling=0.2,ecmatfile="test-ecmat2.fits",noextrap=0,
 elt=0,irexp=0,irfact=0,filtertilt=0,nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,
 fradius=0,regparam=0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,
 0.63,0.89],_w=[0.2,0.35,0.45],_x0=0x7faf8a099b68,_xlast=0x7faf8a099548,_ylast=
 [0x7faf8a0c4fd0,0x7faf8a0c4fd0,0x7faf8a0c4fd0],_y0=0x7faf8a0c4990,_signus=
 0x7faf8a099d98,_puppixoffset=[0,0],_nact=2,_def=0x7faf8a10e030,_x=0x0,_y=0x0,
 _i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile=
 "test-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=26,_n2=103,_pupil=
 0x0,_command=0x7faf8a099740,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,
 _regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7faf8a07c788,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test-mat.fits",fit_simple=
 0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7faf8a0994a0,xposition=0x7faf8a0994d8,yposition=
 0x7faf8a07c440,dispzoom=0x7faf8a099468,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       45.2   0.472      192.6
Field Avg  1.65                     45.2   0.472      192.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in test-imav.fits
Some other graphics in test.ps

Original parameter file: test.par:
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
 if (yao_major_version&&(yao_major_version>=4)&&(yao_minor_version>=10)) {
   wfs(n).extfield = 2.;
 }
 
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
 atm_struct(dr0at05mic=42.44,screen=0x7faf8b0c6938,layerfrac=0x7faf8b0c68b0,
 layerspeed=0x7faf8b0c69c0,layeralt=0x7faf8b0c6a48,winddir=0x7faf8b0c6ad0,
 _layeralt=0x7faf8b0c6690)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=3.5,
 darkcurrent=0,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=
 0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,
 rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,
 pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=6,npixpersub=0,
 pixsize=0.0954654,npixels=10,spotpitch=10,extfield=0.954654,pupoffset=[0,0],
 shthmethod=1,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,
 fsname=0x0,fstop="square",fssize=0.954654,fsoffset=[0,0],kernel=0,nintegcycles=
 1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,
 LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7faf8a0995b8,
 lgs_prof_alt=0x7faf8a099580,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7faf8b81c000,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7faf8b0a8610,_origpixsize=0.1,_rebinfactor=3,_gsalt=0,_gsdepth=0,
 _nsub=32,_nsub4disp=36,_nmes=64,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,
 _tiltsh=0x7faf8a0d4230,_masks=0x0,_fluxpersub=0x7faf8b81a950,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7faf8b81aa58,_skyfluxpersub=0x7faf8b81af80,
 _nphotons=69930.1,_skynphotons=0,_tt=[-0.000744282,-0.000280935],_lastvalidtt=
 [-0.000744282,-0.000280935],_upttcommand=[0,0],_refmes=0x7faf89c18390,_tiprefv=
 0x7faf89e31640,_tiltrefv=0x7faf89c1cf30,_tiprefvn=0x7faf89e31880,_tiltrefvn=
 0x7faf89c1d170,_reordervec=0x0,_npixels=10,_npb=0,_sdim=32,_nx=30,_nx4fft=30,
 _istart=0x7faf8b0a8718,_jstart=0x7faf8b0a8820,_binindices=0x7faf8b803630,
 _binxy=10,_centroidw=0x7faf8a0c4b28,_fimage=0x7faf8a120030,_fimage2=0x0,
 _imistart=0x7faf8b0a8928,_imjstart=0x7faf8b81a638,_imistart2=0x7faf8b81a740,
 _imjstart2=0x7faf8b81a848,_unittip=0x7faf89e2dae0,_unittilt=0x7faf89e2dcb0,
 _lgs_defocuses=0x7faf8a0997b0,_unitdefocus=0x7faf8b83da30,_fimnx=60,_fimny=60,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7faf8b1a1430,_flat=0x7faf8b19a030,_domask=1,
 _submask=0x7faf8b10be30,_kernel=0x7faf8b1bf630,_kernels=0x7faf8b17a430,
 _kerfftr=0x7faf8b1c2430,_kerffti=0x7faf8a84b030,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7faf8a123a30,_x=0x7faf89e2c860,_y=0x7faf89e2dfe0,_centroidgain=1,
 _rayleigh=0x7faf8a0999e0,_bckgrdcalib=0x7faf8b19da30,_bckgrdinit=0,_bckgrdsub=
 1,_meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],
 _LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=
 0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test-if1.fits",pitch=10,alt=0,hyst=0,push4imat=50,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7faf8a099510,_ctrlden=0x7faf8a09a698,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=7,pitchMargin=0,coupling=0.2,
 ecmatfile="test-ecmat1.fits",noextrap=0,elt=1,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf8b81b9d0,_xlast=0x7faf8a810908,_ylast=[0x7faf89e2f0b0,0x7faf89e2f0b0,
 0x7faf89e2f0b0],_y0=0x7faf89e31fd0,_signus=0x7faf89e2eb70,_puppixoffset=[0,0],
 _nact=45,_def=0x108aa9030,_x=0x7faf8b81bbe0,_y=0x7faf8b81ab60,_i1=
 0x7faf8b0a8a30,_j1=0x7faf8b81ad70,_ei1=0x7faf8a099890,_ej1=0x7faf8a099ac0,
 _indval=0x7faf89c1d580,_indext=0x7faf8a0c4ec0,_eiffile="test-if1-ext.fits",
 _edef=0x7faf8a0e4430,_ex=0x7faf8a0999a8,_ey=0x7faf8a0998c8,_enact=4,_n1=26,_n2=
 103,_pupil=0x0,_command=0x7faf8b81ac68,_flat_command=0x0,_extrapcmat=
 0x7faf8a12a030,_eltdefsize=38,_regmatrix=0x0,_fMat=0x0),dm_struct(type=
 "tiptilt",subsystem=1,virtual=0,dmfit_which=0x0,iffile="test-if2.fits",pitch=0,
 alt=0,hyst=0,push4imat=50,thresholdresp=0.3,unitpervolt=0.0005,maxvolt=0,gain=
 1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7faf8a09a740,_ctrlden=0x7faf8a09a000,
 misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],disjointpup=0,pegged=0x0,epegged=
 0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,use_def_of=0,ifunrot=0,xscale=0,
 nelperring=0x0,angleoffset=0x0,rint=0x0,rout=0x0,supportRadius=0,supportOffset=
 0,nxact=0,pitchMargin=0,coupling=0.2,ecmatfile="test-ecmat2.fits",noextrap=0,
 elt=0,irexp=0,irfact=0,filtertilt=0,nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,
 fradius=0,regparam=0,regtype=0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,
 0.63,0.89],_w=[0.2,0.35,0.45],_x0=0x7faf8a099e78,_xlast=0x7faf8a09a4a0,_ylast=
 [0x7faf8a0c5058,0x7faf8a0c5058,0x7faf8a0c5058],_y0=0x7faf8a0c51f0,_signus=
 0x7faf8a099b68,_puppixoffset=[0,0],_nact=2,_def=0x7faf8a10e030,_x=0x0,_y=0x0,
 _i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,_indval=0x0,_indext=0x0,_eiffile=
 "test-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=0x0,_enact=0,_n1=26,_n2=103,_pupil=
 0x0,_command=0x7faf8a099d98,_flat_command=0x0,_extrapcmat=0x0,_eltdefsize=0,
 _regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7faf8a07c788,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test-mat.fits",fit_simple=
 0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7faf8a0994a0,xposition=0x7faf8a0994d8,yposition=
 0x7faf8a07c440,dispzoom=0x7faf8a099468,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
