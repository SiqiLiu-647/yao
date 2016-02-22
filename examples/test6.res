=============================
DH WFS & DM
 
Summary:
Mirror #1, dh, 45 actuators, conjugated @ 0 m
WFS # 1, dh (meth. 0),  0 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 39.1; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       98.0   0.480      379.6
Field Avg  1.65                     98.0   0.480      379.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in test6-imav.fits
Some other graphics in test6.ps

Original parameter file: test6.par:
 // YAO parameter file
 //-------------------------------
 sim.name            = "DH WFS & DM";
 sim.pupildiam       = 64;
 sim.debug           = 1;
 sim.verbose         = 1;
 
 //-------------------------------
 tel.diam           = 3.6;
 
 //-------------------------------
 seeing             = 1.00; // in arcsec at 550nm (V band)
 r0at500            = (0.500e-6/seeing/4.848e-6)*(500./550.)^1.2;
 //atm.dr0at05mic   = 42.44;  // this is r0=0.166 at 550 nm
 atm.dr0at05mic     = tel.diam/r0at500;
 atm.screen         = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.6,0.1,0.1,0.1]);
 atm.layerspeed     = &([11.,20,35,30]);
 atm.layeralt       = &([0.,400,6000,13000]);
 atm.winddir        = &([0,0,0,0]);
 
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type        = "dh";
 wfs(n).ndh         = 45;
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [00.,0.];
 wfs(n).gsalt       = 0.;
 
 //-------------------------------
 ndm = 1;
 dm = array(dms,ndm);
 
 n = 1;
 dm(n).type         = "dh";
 dm(n).ndh          = 45;
 dm(n).iffile       = "";
 dm(n).alt          = 0.;
 dm(n).push4imat    = 0.01;
 
 //-------------------------------
 mat.condition      = &([50.]);
 
 //-------------------------------
 target.lambda      = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0.]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint       = 3e11;
 
 //-------------------------------
 loop.gain          = 0.4;
 loop.framedelay    = 2;
 loop.niter         = 500;
 loop.ittime        = 2.5e-3;
 loop.startskip     = 10;
 loop.skipevery     = 1000;
 loop.skipby        = 10000;
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="DH WFS & DM",pupildiam=64,pupilapod=0,debug=0,verbose=1,svipc=
 0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=128,_cent=
 64.5)
 atm_struct(dr0at05mic=39.1351,screen=0x7fab3301c668,layerfrac=0x7fab3301bf80,
 layerspeed=0x7fab3301bbc8,layeralt=0x7fab3291ada0,winddir=0x7fab3291ac90,
 _layeralt=0x7fab3301bcd8)
 [wfs_struct(type="dh",subsystem=1,lambda=0.65,noise=0,ron=0,darkcurrent=0,
 gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=0,skymag=0,filtertilt=0,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,
 fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,
 pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=0,shnxsub=0,npixpersub=0,pixsize=0,
 npixels=0,spotpitch=0,extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop=0x0,fssize=
 0,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,
 0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fab3380bf70,lgs_prof_alt=0x7fab3380bf38,nzer=0,
 ndh=45,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,_svipc_subok=0x0,
 _fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x0,_origpixsize=0,_rebinfactor=0,
 _gsalt=0,_gsdepth=0,_nsub=0,_nsub4disp=0,_nmes=45,_sind=0x0,_nsind=0x0,_cxdef=
 0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,_fluxpersub=0x0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x0,_skyfluxpersub=0x0,_nphotons=0,
 _skynphotons=0,_tt=[0.0106776,0.00948162],_lastvalidtt=[0.0106776,0.00948162],
 _upttcommand=[0,0],_refmes=0x7fab3262df30,_tiprefv=0x7fab32712770,_tiltrefv=
 0x7fab327125c0,_tiprefvn=0x7fab32712920,_tiltrefvn=0x7fab32712e60,_reordervec=
 0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,
 _binindices=0x0,_binxy=0,_centroidw=0x0,_fimage=0x7fab329e9430,_fimage2=0x0,
 _imistart=0x0,_imjstart=0x0,_imistart2=0x0,_imjstart2=0x0,_unittip=0x0,
 _unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=
 0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,_submask=0x0,_kernel=0x0,
 _kernels=0x0,_kerfftr=0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7fab329e9430,_x=0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,
 _bckgrdcalib=0x0,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=3e+11,
 _pha2dhc=0x1013cd030,_wpha2dhc=0x7fab339ab030,_n12=[33,96],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="dh",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test6-if1.fits",pitch=0,alt=0,hyst=0,push4imat=0.01,thresholdresp=0.3,
 unitpervolt=1,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7fab3380c7c0,
 _ctrlden=0x7fab3380bfe0,misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],
 disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,
 use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,
 ecmatfile="test6-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=45,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fab338df820,_xlast=0x7fab338de698,_ylast=[0x7fab3262f910,0x7fab3262f910,
 0x7fab3262f910],_y0=0x7fab3262f6b0,_signus=0x7fab32632bc0,_puppixoffset=[0,0],
 _nact=45,_def=0x1011c4030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test6-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=24,_n2=105,_pupil=0x0,_command=0x7fab340a8390,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fab3284f9a8,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test6-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=3.6,cobs=0,tipvib_white_rms=0,tipvib_1overf_rms=0,tipvib_peaks=
 0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=0,
 tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fab3380cc98,xposition=0x7fab3380bb80,yposition=
 0x7fab3380cc60,dispzoom=0x7fab3380c328,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.4,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.0025,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       98.0   0.480      379.6
Field Avg  1.65                     98.0   0.480      379.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in test6-imav.fits
Some other graphics in test6.ps

Original parameter file: test6.par:
 // YAO parameter file
 //-------------------------------
 sim.name            = "DH WFS & DM";
 sim.pupildiam       = 64;
 sim.debug           = 1;
 sim.verbose         = 1;
 
 //-------------------------------
 tel.diam           = 3.6;
 
 //-------------------------------
 seeing             = 1.00; // in arcsec at 550nm (V band)
 r0at500            = (0.500e-6/seeing/4.848e-6)*(500./550.)^1.2;
 //atm.dr0at05mic   = 42.44;  // this is r0=0.166 at 550 nm
 atm.dr0at05mic     = tel.diam/r0at500;
 atm.screen         = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.6,0.1,0.1,0.1]);
 atm.layerspeed     = &([11.,20,35,30]);
 atm.layeralt       = &([0.,400,6000,13000]);
 atm.winddir        = &([0,0,0,0]);
 
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type        = "dh";
 wfs(n).ndh         = 45;
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [00.,0.];
 wfs(n).gsalt       = 0.;
 
 //-------------------------------
 ndm = 1;
 dm = array(dms,ndm);
 
 n = 1;
 dm(n).type         = "dh";
 dm(n).ndh          = 45;
 dm(n).iffile       = "";
 dm(n).alt          = 0.;
 dm(n).push4imat    = 0.01;
 
 //-------------------------------
 mat.condition      = &([50.]);
 
 //-------------------------------
 target.lambda      = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0.]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint       = 3e11;
 
 //-------------------------------
 loop.gain          = 0.4;
 loop.framedelay    = 2;
 loop.niter         = 500;
 loop.ittime        = 2.5e-3;
 loop.startskip     = 10;
 loop.skipevery     = 1000;
 loop.skipby        = 10000;
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="DH WFS & DM",pupildiam=64,pupilapod=0,debug=0,verbose=1,svipc=
 0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=128,_cent=
 64.5)
 atm_struct(dr0at05mic=39.1351,screen=0x7fab3301c668,layerfrac=0x7fab3301bf80,
 layerspeed=0x7fab3301bbc8,layeralt=0x7fab3291ada0,winddir=0x7fab3291ac90,
 _layeralt=0x7fab3301bcd8)
 [wfs_struct(type="dh",subsystem=1,lambda=0.65,noise=0,ron=0,darkcurrent=0,
 gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=0,skymag=0,filtertilt=0,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,
 fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,
 pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=0,shnxsub=0,npixpersub=0,pixsize=0,
 npixels=0,spotpitch=0,extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop=0x0,fssize=
 0,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,
 0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fab3380bf70,lgs_prof_alt=0x7fab3380bf38,nzer=0,
 ndh=45,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,_svipc_subok=0x0,
 _fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x0,_origpixsize=0,_rebinfactor=0,
 _gsalt=0,_gsdepth=0,_nsub=0,_nsub4disp=0,_nmes=45,_sind=0x0,_nsind=0x0,_cxdef=
 0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,_fluxpersub=0x0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x0,_skyfluxpersub=0x0,_nphotons=0,
 _skynphotons=0,_tt=[0.0106776,0.00948162],_lastvalidtt=[0.0106776,0.00948162],
 _upttcommand=[0,0],_refmes=0x7fab3262df30,_tiprefv=0x7fab32712770,_tiltrefv=
 0x7fab327125c0,_tiprefvn=0x7fab32712920,_tiltrefvn=0x7fab32712e60,_reordervec=
 0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,
 _binindices=0x0,_binxy=0,_centroidw=0x0,_fimage=0x7fab329e9430,_fimage2=0x0,
 _imistart=0x0,_imjstart=0x0,_imistart2=0x0,_imjstart2=0x0,_unittip=0x0,
 _unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=
 0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,_submask=0x0,_kernel=0x0,
 _kernels=0x0,_kerfftr=0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7fab329e9430,_x=0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,
 _bckgrdcalib=0x0,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=3e+11,
 _pha2dhc=0x1013cd030,_wpha2dhc=0x7fab339ab030,_n12=[33,96],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="dh",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test6-if1.fits",pitch=0,alt=0,hyst=0,push4imat=0.01,thresholdresp=0.3,
 unitpervolt=1,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7fab3284f660,
 _ctrlden=0x7fab3380cbb8,misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],
 disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,
 use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,
 ecmatfile="test6-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=45,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fab338187b0,_xlast=0x7fab338df820,_ylast=[0x7fab324134f0,0x7fab324134f0,
 0x7fab324134f0],_y0=0x7fab3242e310,_signus=0x7fab32413750,_puppixoffset=[0,0],
 _nact=45,_def=0x1011c4030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test6-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=24,_n2=105,_pupil=0x0,_command=0x7fab338df508,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fab3284f9a8,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test6-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=3.6,cobs=0,tipvib_white_rms=0,tipvib_1overf_rms=0,tipvib_peaks=
 0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=0,
 tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fab3380cc98,xposition=0x7fab3380bb80,yposition=
 0x7fab3380cc60,dispzoom=0x7fab3380c328,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.4,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.0025,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")
=============================
DH WFS & DM
 
Summary:
Mirror #1, dh, 45 actuators, conjugated @ 0 m
WFS # 1, dh (meth. 0),  0 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 39.1; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       98.0   0.480      379.6
Field Avg  1.65                     98.0   0.480      379.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in test6-imav.fits
Some other graphics in test6.ps

Original parameter file: test6.par:
 // YAO parameter file
 //-------------------------------
 sim.name            = "DH WFS & DM";
 sim.pupildiam       = 64;
 sim.debug           = 1;
 sim.verbose         = 1;
 
 //-------------------------------
 tel.diam           = 3.6;
 
 //-------------------------------
 seeing             = 1.00; // in arcsec at 550nm (V band)
 r0at500            = (0.500e-6/seeing/4.848e-6)*(500./550.)^1.2;
 //atm.dr0at05mic   = 42.44;  // this is r0=0.166 at 550 nm
 atm.dr0at05mic     = tel.diam/r0at500;
 atm.screen         = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.6,0.1,0.1,0.1]);
 atm.layerspeed     = &([11.,20,35,30]);
 atm.layeralt       = &([0.,400,6000,13000]);
 atm.winddir        = &([0,0,0,0]);
 
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type        = "dh";
 wfs(n).ndh         = 45;
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [00.,0.];
 wfs(n).gsalt       = 0.;
 
 //-------------------------------
 ndm = 1;
 dm = array(dms,ndm);
 
 n = 1;
 dm(n).type         = "dh";
 dm(n).ndh          = 45;
 dm(n).iffile       = "";
 dm(n).alt          = 0.;
 dm(n).push4imat    = 0.01;
 
 //-------------------------------
 mat.condition      = &([50.]);
 
 //-------------------------------
 target.lambda      = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0.]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint       = 3e11;
 
 //-------------------------------
 loop.gain          = 0.4;
 loop.framedelay    = 2;
 loop.niter         = 500;
 loop.ittime        = 2.5e-3;
 loop.startskip     = 10;
 loop.skipevery     = 1000;
 loop.skipby        = 10000;
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="DH WFS & DM",pupildiam=64,pupilapod=0,debug=0,verbose=1,svipc=
 0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=128,_cent=
 64.5)
 atm_struct(dr0at05mic=39.1351,screen=0x7fa51a8d8a68,layerfrac=0x7fa51a8d8380,
 layerspeed=0x7fa51a8d7fc8,layeralt=0x7fa51a85fda0,winddir=0x7fa51a85fc90,
 _layeralt=0x7fa51a8d80d8)
 [wfs_struct(type="dh",subsystem=1,lambda=0.65,noise=0,ron=0,darkcurrent=0,
 gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=0,skymag=0,filtertilt=0,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,
 fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,
 pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=0,shnxsub=0,npixpersub=0,pixsize=0,
 npixels=0,spotpitch=0,extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop=0x0,fssize=
 0,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,
 0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fa51a8a1570,lgs_prof_alt=0x7fa51a8a1538,nzer=0,
 ndh=45,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,_svipc_subok=0x0,
 _fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x0,_origpixsize=0,_rebinfactor=0,
 _gsalt=0,_gsdepth=0,_nsub=0,_nsub4disp=0,_nmes=45,_sind=0x0,_nsind=0x0,_cxdef=
 0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,_fluxpersub=0x0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x0,_skyfluxpersub=0x0,_nphotons=0,
 _skynphotons=0,_tt=[0.0106776,0.00948162],_lastvalidtt=[0.0106776,0.00948162],
 _upttcommand=[0,0],_refmes=0x7fa518c0a6a0,_tiprefv=0x7fa518c19af0,_tiltrefv=
 0x7fa518c19ca0,_tiprefvn=0x7fa518c19e50,_tiltrefvn=0x7fa518c1a000,_reordervec=
 0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,
 _binindices=0x0,_binxy=0,_centroidw=0x0,_fimage=0x7fa5190ec030,_fimage2=0x0,
 _imistart=0x0,_imjstart=0x0,_imistart2=0x0,_imjstart2=0x0,_unittip=0x0,
 _unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=
 0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,_submask=0x0,_kernel=0x0,
 _kernels=0x0,_kerfftr=0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7fa5190ec030,_x=0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,
 _bckgrdcalib=0x0,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=3e+11,
 _pha2dhc=0x1052dd030,_wpha2dhc=0x7fa51a9d4a30,_n12=[33,96],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="dh",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test6-if1.fits",pitch=0,alt=0,hyst=0,push4imat=0.01,thresholdresp=0.3,
 unitpervolt=1,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7fa519042508,
 _ctrlden=0x7fa51a8a1650,misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],
 disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,
 use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,
 ecmatfile="test6-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=45,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fa51a96b000,_xlast=0x7fa51a96a298,_ylast=[0x7fa518f46b40,0x7fa518f46b40,
 0x7fa518f46b40],_y0=0x7fa518f3ee60,_signus=0x7fa518f41b50,_puppixoffset=[0,0],
 _nact=45,_def=0x1059f0030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test6-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=24,_n2=105,_pupil=0x0,_command=0x7fa51904a790,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fa5190427a8,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test6-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=3.6,cobs=0,tipvib_white_rms=0,tipvib_1overf_rms=0,tipvib_peaks=
 0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=0,
 tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fa51a8a13b0,xposition=0x7fa51a8a2378,yposition=
 0x7fa51a8a11b8,dispzoom=0x7fa51a8a1378,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.4,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.0025,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       98.0   0.480      379.6
Field Avg  1.65                     98.0   0.480      379.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in test6-imav.fits
Some other graphics in test6.ps

Original parameter file: test6.par:
 // YAO parameter file
 //-------------------------------
 sim.name            = "DH WFS & DM";
 sim.pupildiam       = 64;
 sim.debug           = 1;
 sim.verbose         = 1;
 
 //-------------------------------
 tel.diam           = 3.6;
 
 //-------------------------------
 seeing             = 1.00; // in arcsec at 550nm (V band)
 r0at500            = (0.500e-6/seeing/4.848e-6)*(500./550.)^1.2;
 //atm.dr0at05mic   = 42.44;  // this is r0=0.166 at 550 nm
 atm.dr0at05mic     = tel.diam/r0at500;
 atm.screen         = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.6,0.1,0.1,0.1]);
 atm.layerspeed     = &([11.,20,35,30]);
 atm.layeralt       = &([0.,400,6000,13000]);
 atm.winddir        = &([0,0,0,0]);
 
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type        = "dh";
 wfs(n).ndh         = 45;
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [00.,0.];
 wfs(n).gsalt       = 0.;
 
 //-------------------------------
 ndm = 1;
 dm = array(dms,ndm);
 
 n = 1;
 dm(n).type         = "dh";
 dm(n).ndh          = 45;
 dm(n).iffile       = "";
 dm(n).alt          = 0.;
 dm(n).push4imat    = 0.01;
 
 //-------------------------------
 mat.condition      = &([50.]);
 
 //-------------------------------
 target.lambda      = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0.]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint       = 3e11;
 
 //-------------------------------
 loop.gain          = 0.4;
 loop.framedelay    = 2;
 loop.niter         = 500;
 loop.ittime        = 2.5e-3;
 loop.startskip     = 10;
 loop.skipevery     = 1000;
 loop.skipby        = 10000;
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="DH WFS & DM",pupildiam=64,pupilapod=0,debug=0,verbose=1,svipc=
 0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=128,_cent=
 64.5)
 atm_struct(dr0at05mic=39.1351,screen=0x7fa51a8d8a68,layerfrac=0x7fa51a8d8380,
 layerspeed=0x7fa51a8d7fc8,layeralt=0x7fa51a85fda0,winddir=0x7fa51a85fc90,
 _layeralt=0x7fa51a8d80d8)
 [wfs_struct(type="dh",subsystem=1,lambda=0.65,noise=0,ron=0,darkcurrent=0,
 gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=0,skymag=0,filtertilt=0,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,
 fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,
 pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=0,shnxsub=0,npixpersub=0,pixsize=0,
 npixels=0,spotpitch=0,extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop=0x0,fssize=
 0,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,
 0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fa51a8a1570,lgs_prof_alt=0x7fa51a8a1538,nzer=0,
 ndh=45,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,_svipc_subok=0x0,
 _fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x0,_origpixsize=0,_rebinfactor=0,
 _gsalt=0,_gsdepth=0,_nsub=0,_nsub4disp=0,_nmes=45,_sind=0x0,_nsind=0x0,_cxdef=
 0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,_fluxpersub=0x0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x0,_skyfluxpersub=0x0,_nphotons=0,
 _skynphotons=0,_tt=[0.0106776,0.00948162],_lastvalidtt=[0.0106776,0.00948162],
 _upttcommand=[0,0],_refmes=0x7fa518c0a6a0,_tiprefv=0x7fa518c19af0,_tiltrefv=
 0x7fa518c19ca0,_tiprefvn=0x7fa518c19e50,_tiltrefvn=0x7fa518c1a000,_reordervec=
 0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,
 _binindices=0x0,_binxy=0,_centroidw=0x0,_fimage=0x7fa51aad4830,_fimage2=0x0,
 _imistart=0x0,_imjstart=0x0,_imistart2=0x0,_imjstart2=0x0,_unittip=0x0,
 _unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=
 0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,_submask=0x0,_kernel=0x0,
 _kernels=0x0,_kerfftr=0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7fa51aad4830,_x=0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,
 _bckgrdcalib=0x0,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=3e+11,
 _pha2dhc=0x1052dd030,_wpha2dhc=0x7fa51a9d4a30,_n12=[33,96],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="dh",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test6-if1.fits",pitch=0,alt=0,hyst=0,push4imat=0.01,thresholdresp=0.3,
 unitpervolt=1,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7fa51a8a1298,
 _ctrlden=0x7fa51a8a1110,misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],
 disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,
 use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,
 ecmatfile="test6-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=45,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fa51901ee98,_xlast=0x7fa51a96b000,_ylast=[0x7fa518f3ee60,0x7fa518f3ee60,
 0x7fa518f3ee60],_y0=0x7fa518f42a20,_signus=0x7fa518f41d00,_puppixoffset=[0,0],
 _nact=45,_def=0x1059f0030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test6-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=24,_n2=105,_pupil=0x0,_command=0x7fa51a96b108,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fa5190427a8,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test6-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=3.6,cobs=0,tipvib_white_rms=0,tipvib_1overf_rms=0,tipvib_peaks=
 0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=0,
 tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fa51a8a13b0,xposition=0x7fa51a8a2378,yposition=
 0x7fa51a8a11b8,dispzoom=0x7fa51a8a1378,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.4,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.0025,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")
=============================
DH WFS & DM
 
Summary:
Mirror #1, dh, 45 actuators, conjugated @ 0 m
WFS # 1, dh (meth. 0),  0 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 39.1; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       98.0   0.480      379.6
Field Avg  1.65                     98.0   0.480      379.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in test6-imav.fits
Some other graphics in test6.ps

Original parameter file: test6.par:
 // YAO parameter file
 //-------------------------------
 sim.name            = "DH WFS & DM";
 sim.pupildiam       = 64;
 sim.debug           = 1;
 sim.verbose         = 1;
 
 //-------------------------------
 tel.diam           = 3.6;
 
 //-------------------------------
 seeing             = 1.00; // in arcsec at 550nm (V band)
 r0at500            = (0.500e-6/seeing/4.848e-6)*(500./550.)^1.2;
 //atm.dr0at05mic   = 42.44;  // this is r0=0.166 at 550 nm
 atm.dr0at05mic     = tel.diam/r0at500;
 atm.screen         = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.6,0.1,0.1,0.1]);
 atm.layerspeed     = &([11.,20,35,30]);
 atm.layeralt       = &([0.,400,6000,13000]);
 atm.winddir        = &([0,0,0,0]);
 
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type        = "dh";
 wfs(n).ndh         = 45;
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [00.,0.];
 wfs(n).gsalt       = 0.;
 
 //-------------------------------
 ndm = 1;
 dm = array(dms,ndm);
 
 n = 1;
 dm(n).type         = "dh";
 dm(n).ndh          = 45;
 dm(n).iffile       = "";
 dm(n).alt          = 0.;
 dm(n).push4imat    = 0.01;
 
 //-------------------------------
 mat.condition      = &([50.]);
 
 //-------------------------------
 target.lambda      = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0.]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint       = 3e11;
 
 //-------------------------------
 loop.gain          = 0.4;
 loop.framedelay    = 2;
 loop.niter         = 500;
 loop.ittime        = 2.5e-3;
 loop.startskip     = 10;
 loop.skipevery     = 1000;
 loop.skipby        = 10000;
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="DH WFS & DM",pupildiam=64,pupilapod=0,debug=0,verbose=1,svipc=
 0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=128,_cent=
 64.5)
 atm_struct(dr0at05mic=39.1351,screen=0x7faf8a0c6268,layerfrac=0x7faf8a0c5b80,
 layerspeed=0x7faf8a0c57c8,layeralt=0x7faf8b0c67a0,winddir=0x7faf8b0c6690,
 _layeralt=0x7faf8a0c58d8)
 [wfs_struct(type="dh",subsystem=1,lambda=0.65,noise=0,ron=0,darkcurrent=0,
 gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=0,skymag=0,filtertilt=0,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,
 fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,
 pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=0,shnxsub=0,npixpersub=0,pixsize=0,
 npixels=0,spotpitch=0,extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop=0x0,fssize=
 0,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,
 0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7faf8a09a4a0,lgs_prof_alt=0x7faf8a099938,nzer=0,
 ndh=45,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,_svipc_subok=0x0,
 _fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x0,_origpixsize=0,_rebinfactor=0,
 _gsalt=0,_gsdepth=0,_nsub=0,_nsub4disp=0,_nmes=45,_sind=0x0,_nsind=0x0,_cxdef=
 0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,_fluxpersub=0x0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x0,_skyfluxpersub=0x0,_nphotons=0,
 _skynphotons=0,_tt=[0.0106776,0.00948162],_lastvalidtt=[0.0106776,0.00948162],
 _upttcommand=[0,0],_refmes=0x7faf89e33c00,_tiprefv=0x7faf89e05f40,_tiltrefv=
 0x7faf89e337d0,_tiprefvn=0x7faf89e2e780,_tiltrefvn=0x7faf89e35040,_reordervec=
 0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,
 _binindices=0x0,_binxy=0,_centroidw=0x0,_fimage=0x7faf8b1e7a30,_fimage2=0x0,
 _imistart=0x0,_imjstart=0x0,_imistart2=0x0,_imjstart2=0x0,_unittip=0x0,
 _unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=
 0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,_submask=0x0,_kernel=0x0,
 _kernels=0x0,_kerfftr=0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7faf8b1e7a30,_x=0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,
 _bckgrdcalib=0x0,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=3e+11,
 _pha2dhc=0x108045030,_wpha2dhc=0x7faf8b1be430,_n12=[33,96],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="dh",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test6-if1.fits",pitch=0,alt=0,hyst=0,push4imat=0.01,thresholdresp=0.3,
 unitpervolt=1,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7faf8b01dd08,
 _ctrlden=0x7faf8b01df00,misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],
 disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,
 use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,
 ecmatfile="test6-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=45,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf8b81c420,_xlast=0x7faf8b81b298,_ylast=[0x7faf89f1dc10,0x7faf89f1dc10,
 0x7faf89f1dc10],_y0=0x7faf89f1d9b0,_signus=0x7faf89f1de70,_puppixoffset=[0,0],
 _nact=45,_def=0x108758030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test6-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=24,_n2=105,_pupil=0x0,_command=0x7faf8b12f190,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7faf8a099f20,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test6-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=3.6,cobs=0,tipvib_white_rms=0,tipvib_1overf_rms=0,tipvib_peaks=
 0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=0,
 tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7faf8a09a150,xposition=0x7faf8a07c7f8,yposition=
 0x7faf8a09a548,dispzoom=0x7faf8a099e40,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.4,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.0025,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       98.0   0.480      379.6
Field Avg  1.65                     98.0   0.480      379.6
Field rms  1.65                      0.0   0.000        0.0

Average images written in test6-imav.fits
Some other graphics in test6.ps

Original parameter file: test6.par:
 // YAO parameter file
 //-------------------------------
 sim.name            = "DH WFS & DM";
 sim.pupildiam       = 64;
 sim.debug           = 1;
 sim.verbose         = 1;
 
 //-------------------------------
 tel.diam           = 3.6;
 
 //-------------------------------
 seeing             = 1.00; // in arcsec at 550nm (V band)
 r0at500            = (0.500e-6/seeing/4.848e-6)*(500./550.)^1.2;
 //atm.dr0at05mic   = 42.44;  // this is r0=0.166 at 550 nm
 atm.dr0at05mic     = tel.diam/r0at500;
 atm.screen         = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.6,0.1,0.1,0.1]);
 atm.layerspeed     = &([11.,20,35,30]);
 atm.layeralt       = &([0.,400,6000,13000]);
 atm.winddir        = &([0,0,0,0]);
 
 
 //-------------------------------
 nwfs               = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type        = "dh";
 wfs(n).ndh         = 45;
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [00.,0.];
 wfs(n).gsalt       = 0.;
 
 //-------------------------------
 ndm = 1;
 dm = array(dms,ndm);
 
 n = 1;
 dm(n).type         = "dh";
 dm(n).ndh          = 45;
 dm(n).iffile       = "";
 dm(n).alt          = 0.;
 dm(n).push4imat    = 0.01;
 
 //-------------------------------
 mat.condition      = &([50.]);
 
 //-------------------------------
 target.lambda      = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0.]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint       = 3e11;
 
 //-------------------------------
 loop.gain          = 0.4;
 loop.framedelay    = 2;
 loop.niter         = 500;
 loop.ittime        = 2.5e-3;
 loop.startskip     = 10;
 loop.skipevery     = 1000;
 loop.skipby        = 10000;
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="DH WFS & DM",pupildiam=64,pupilapod=0,debug=0,verbose=1,svipc=
 0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=128,_cent=
 64.5)
 atm_struct(dr0at05mic=39.1351,screen=0x7faf8a0c6268,layerfrac=0x7faf8a0c5b80,
 layerspeed=0x7faf8a0c57c8,layeralt=0x7faf8b0c67a0,winddir=0x7faf8b0c6690,
 _layeralt=0x7faf8a0c58d8)
 [wfs_struct(type="dh",subsystem=1,lambda=0.65,noise=0,ron=0,darkcurrent=0,
 gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=0,skymag=0,filtertilt=0,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,
 fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,
 pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=0,shnxsub=0,npixpersub=0,pixsize=0,
 npixels=0,spotpitch=0,extfield=0,pupoffset=[0,0],shthmethod=0,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop=0x0,fssize=
 0,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,
 0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7faf8a09a4a0,lgs_prof_alt=0x7faf8a099938,nzer=0,
 ndh=45,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,_svipc_subok=0x0,
 _fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x0,_origpixsize=0,_rebinfactor=0,
 _gsalt=0,_gsdepth=0,_nsub=0,_nsub4disp=0,_nmes=45,_sind=0x0,_nsind=0x0,_cxdef=
 0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,_fluxpersub=0x0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x0,_skyfluxpersub=0x0,_nphotons=0,
 _skynphotons=0,_tt=[0.0106776,0.00948162],_lastvalidtt=[0.0106776,0.00948162],
 _upttcommand=[0,0],_refmes=0x7faf89e33c00,_tiprefv=0x7faf89e05f40,_tiltrefv=
 0x7faf89e337d0,_tiprefvn=0x7faf89e2e780,_tiltrefvn=0x7faf89e35040,_reordervec=
 0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,
 _binindices=0x0,_binxy=0,_centroidw=0x0,_fimage=0x7faf8a0ec230,_fimage2=0x0,
 _imistart=0x0,_imjstart=0x0,_imistart2=0x0,_imjstart2=0x0,_unittip=0x0,
 _unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=
 0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,_submask=0x0,_kernel=0x0,
 _kernels=0x0,_kerfftr=0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7faf8a0ec230,_x=0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,
 _bckgrdcalib=0x0,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=3e+11,
 _pha2dhc=0x108045030,_wpha2dhc=0x7faf8b1be430,_n12=[33,96],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="dh",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test6-if1.fits",pitch=0,alt=0,hyst=0,push4imat=0.01,thresholdresp=0.3,
 unitpervolt=1,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7faf8a0997b0,
 _ctrlden=0x7faf8b01e130,misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],
 disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,
 use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,
 ecmatfile="test6-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=45,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf8a026698,_xlast=0x7faf8b81c420,_ylast=[0x7faf89c1c8d0,0x7faf89c1c8d0,
 0x7faf89c1c8d0],_y0=0x7faf89c1c670,_signus=0x7faf89c1cb30,_puppixoffset=[0,0],
 _nact=45,_def=0x108758030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test6-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=24,_n2=105,_pupil=0x0,_command=0x7faf8b81c000,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7faf8a099f20,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test6-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=3.6,cobs=0,tipvib_white_rms=0,tipvib_1overf_rms=0,tipvib_peaks=
 0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=0,
 tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7faf8a09a150,xposition=0x7faf8a07c7f8,yposition=
 0x7faf8a09a548,dispzoom=0x7faf8a099e40,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=3e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.4,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.0025,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")
