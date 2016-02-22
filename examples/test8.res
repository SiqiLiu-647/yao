=============================
Simple SH6x6 (geometrical)
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.1273  0.0636  0.1273   1.02  1.02  1.02    8x 8    8x 8    69930.1
 
Summary:
Mirror #1, stackarray, 45 actuators, conjugated @ 0 m
Mirror #2, tiptilt, 2 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 1), 32 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 42.4; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       43.0   0.432      233.1
Field Avg  1.65                     43.0   0.432      233.1
Field rms  1.65                      0.0   0.000        0.0

Average images written in test8-imav.fits
Some other graphics in test8.ps

Original parameter file: test8.par:
 // Aosimul par file, V2.4.0
 //-------------------------------
 sim.name            = "Simple SH6x6 (geometrical)";
 sim.pupildiam       = 60;
 sim.debug           = 0;
 sim.verbose         = 0;
 
 //-------------------------------
 atm.dr0at05mic      = 42.44;  // this is r0=0.166 at 550 nm
 atm.screen          = &(Y_USER+"data/screen"+["1"]+".fits");
 atm.layerfrac       = &([1.0]);
 atm.layerspeed      = &([11.]);
 atm.layeralt        = &([0.]);
 atm.winddir         = &([0]);
 
 //-------------------------------
 nwfs                = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 5.;
 wfs(n).shmethod     = 1;
 wfs(n).shnxsub      = 6;
 wfs(n).pixsize      = 0.1;
 wfs(n).npixels      = 10;
 wfs(n).noise        = 1;
 wfs(n).ron          = 0.05;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 wfs(n).optthroughput= 0.5;
 
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
 dm(n).push4imat     = 2;
 
 n  =2;
 dm(n).type          = "tiptilt";
 dm(n).iffile        = "";
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.0005;
 dm(n).push4imat     = 2;
 
 //-------------------------------
 mat.condition       = &([15.]);
 
 //-------------------------------
 tel.diam            = 7.9;
 tel.cobs            = 0.1125;
 
 //-------------------------------
 target.lambda       = &([1.65]);
 target.xposition    = &([0.]);
 target.yposition    = &([0]);
 target.dispzoom     = &([1.]);
 
 //-------------------------------
 gs.zeropoint        = 2e11;
 gs.zenithangle      = 0.;
 
 //-------------------------------
 loop.gain    = 0.15;
 loop.framedelay     = 1;
 loop.niter          = 2000;
 loop.ittime         = 2e-3;
 loop.startskip      = 10;
 loop.skipevery      = 1000;
 loop.skipby         = 10000;
 loop.stats_every    = 200;
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="Simple SH6x6 (geometrical)",pupildiam=60,pupilapod=0,debug=0,
 verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,shmkey=0,semkey=0,
 _size=128,_cent=64.5)
 atm_struct(dr0at05mic=42.44,screen=0x7fab3380cde8,layerfrac=0x7fab34027d08,
 layerspeed=0x7fab3380d0c0,layeralt=0x7fab3380c670,winddir=0x7fab3380c130,
 _layeralt=0x7fab3380ce90)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=0.05,
 darkcurrent=0,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=0.5,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,
 rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=
 0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=1,shnxsub=6,
 npixpersub=0,pixsize=0.127287,npixels=8,spotpitch=8,extfield=1.0183,pupoffset=
 [0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,
 flatrmserror=0,fsname=0x0,fstop=0x0,fssize=0,fsoffset=[0,0],kernel=0,
 nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=
 0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=
 0x7fab3284fa50,lgs_prof_alt=0x7fab3380d280,nzer=0,ndh=0,ndhfiltered=0,
 _initkernels=1,_svipc_init_done=0,_svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=
 0x0,_validsubs=0x7fab340a8390,_origpixsize=0.1,_rebinfactor=2,_gsalt=0,
 _gsdepth=0,_nsub=32,_nsub4disp=32,_nmes=64,_sind=0x0,_nsind=0x0,_cxdef=0x0,
 _sxdef=0x0,_tiltsh=0x7fab33a3d030,_masks=0x0,_fluxpersub=0x7fab340a7d60,
 _rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x7fab328fca00,
 _skyfluxpersub=0x7fab340a7a48,_nphotons=69930.1,_skynphotons=0,_tt=[-0.0167409,
 0.014623],_lastvalidtt=[-0.0167409,0.014623],_upttcommand=[0,0],_refmes=
 0x7fab3262da90,_tiprefv=0x7fab32414280,_tiltrefv=0x7fab32416d20,_tiprefvn=
 0x7fab324144c0,_tiltrefvn=0x7fab3242ecb0,_reordervec=0x0,_npixels=8,_npb=0,
 _sdim=16,_nx=16,_nx4fft=16,_istart=0x7fab338debc0,_jstart=0x7fab338de698,
 _binindices=0x7fab3286c430,_binxy=8,_centroidw=0x7fab3301dda8,_fimage=
 0x7fab3303ce30,_fimage2=0x0,_imistart=0x7fab338dda38,_imjstart=0x7fab33818498,
 _imistart2=0x7fab338dde58,_imjstart2=0x7fab340a7940,_unittip=0x7fab324159a0,
 _unittilt=0x7fab3242fdb0,_lgs_defocuses=0x7fab3380ba68,_unitdefocus=
 0x7fab32943030,_fimnx=48,_fimny=48,_fimny2=0x0,_yoffset=0x0,_bias=
 0x7fab339a4430,_flat=0x7fab33971a30,_domask=0,_submask=0x0,_kernel=
 0x7fab3300e630,_kernels=0x7fab340b1830,_kerfftr=0x7fab34091630,_kerffti=
 0x7fab34099830,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fab330c1430,_x=
 0x7fab3240eac0,_y=0x7fab3240f480,_centroidgain=1,_rayleigh=0x7fab3380d408,
 _bckgrdcalib=0x7fab3390ea30,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=2e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test8-if1.fits",pitch=10,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fab3380bd40,_ctrlden=0x7fab3380bfa8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=7,pitchMargin=0,coupling=0.2,
 ecmatfile="test8-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fab32811820,_xlast=0x7fab338decc8,_ylast=[0x7fab32504490,0x7fab32504490,
 0x7fab32504490],_y0=0x7fab32504e30,_signus=0x7fab325046f0,_puppixoffset=[0,0],
 _nact=45,_def=0x103cbc030,_x=0x7fab340a8078,_y=0x7fab340a85a0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x7fab326360e0,_indext=0x7fab3301b568,_eiffile=
 "test8-if1-ext.fits",_edef=0x7fab339b1830,_ex=0x7fab3380bec8,_ey=
 0x7fab3380c520,_enact=4,_n1=26,_n2=103,_pupil=0x0,_command=0x7fab340a86a8,
 _flat_command=0x0,_extrapcmat=0x7fab340b9a30,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0),dm_struct(type="tiptilt",subsystem=1,virtual=0,dmfit_which=0x0,
 iffile="test8-if2.fits",pitch=0,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fab3380ce58,_ctrlden=0x7fab3380bfe0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,
 ecmatfile="test8-ecmat2.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,regmatrix=
 0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fab3380be20,_xlast=0x7fab3380c0f8,_ylast=[0x7fab3301c338,0x7fab3301c338,
 0x7fab3301c338],_y0=0x7fab3301d190,_signus=0x7fab3380c830,_puppixoffset=[0,0],
 _nact=2,_def=0x7fab329a9630,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test8-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=26,_n2=103,_pupil=0x0,_command=0x7fab3380d2f0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fab3380b7f8,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test8-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fab3284f9a8,xposition=0x7fab3380caa0,yposition=
 0x7fab3380cb80,dispzoom=0x7fab3380cdb0,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=2e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.15,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=200,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       43.0   0.432      233.1
Field Avg  1.65                     43.0   0.432      233.1
Field rms  1.65                      0.0   0.000        0.0

Average images written in test8-imav.fits
Some other graphics in test8.ps

Original parameter file: test8.par:
 // Aosimul par file, V2.4.0
 //-------------------------------
 sim.name            = "Simple SH6x6 (geometrical)";
 sim.pupildiam       = 60;
 sim.debug           = 0;
 sim.verbose         = 0;
 
 //-------------------------------
 atm.dr0at05mic      = 42.44;  // this is r0=0.166 at 550 nm
 atm.screen          = &(Y_USER+"data/screen"+["1"]+".fits");
 atm.layerfrac       = &([1.0]);
 atm.layerspeed      = &([11.]);
 atm.layeralt        = &([0.]);
 atm.winddir         = &([0]);
 
 //-------------------------------
 nwfs                = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 5.;
 wfs(n).shmethod     = 1;
 wfs(n).shnxsub      = 6;
 wfs(n).pixsize      = 0.1;
 wfs(n).npixels      = 10;
 wfs(n).noise        = 1;
 wfs(n).ron          = 0.05;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 wfs(n).optthroughput= 0.5;
 
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
 dm(n).push4imat     = 2;
 
 n  =2;
 dm(n).type          = "tiptilt";
 dm(n).iffile        = "";
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.0005;
 dm(n).push4imat     = 2;
 
 //-------------------------------
 mat.condition       = &([15.]);
 
 //-------------------------------
 tel.diam            = 7.9;
 tel.cobs            = 0.1125;
 
 //-------------------------------
 target.lambda       = &([1.65]);
 target.xposition    = &([0.]);
 target.yposition    = &([0]);
 target.dispzoom     = &([1.]);
 
 //-------------------------------
 gs.zeropoint        = 2e11;
 gs.zenithangle      = 0.;
 
 //-------------------------------
 loop.gain    = 0.15;
 loop.framedelay     = 1;
 loop.niter          = 2000;
 loop.ittime         = 2e-3;
 loop.startskip      = 10;
 loop.skipevery      = 1000;
 loop.skipby         = 10000;
 loop.stats_every    = 200;
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="Simple SH6x6 (geometrical)",pupildiam=60,pupilapod=0,debug=0,
 verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,shmkey=0,semkey=0,
 _size=128,_cent=64.5)
 atm_struct(dr0at05mic=42.44,screen=0x7fab3380cde8,layerfrac=0x7fab34027d08,
 layerspeed=0x7fab3380d0c0,layeralt=0x7fab3380c670,winddir=0x7fab3380c130,
 _layeralt=0x7fab3380ce90)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=0.05,
 darkcurrent=0,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=0.5,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,
 rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=
 0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=1,shnxsub=6,
 npixpersub=0,pixsize=0.127287,npixels=8,spotpitch=8,extfield=1.0183,pupoffset=
 [0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,
 flatrmserror=0,fsname=0x0,fstop=0x0,fssize=0,fsoffset=[0,0],kernel=0,
 nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=
 0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=
 0x7fab3284fa50,lgs_prof_alt=0x7fab3380d280,nzer=0,ndh=0,ndhfiltered=0,
 _initkernels=1,_svipc_init_done=0,_svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=
 0x0,_validsubs=0x7fab340a8390,_origpixsize=0.1,_rebinfactor=2,_gsalt=0,
 _gsdepth=0,_nsub=32,_nsub4disp=32,_nmes=64,_sind=0x0,_nsind=0x0,_cxdef=0x0,
 _sxdef=0x0,_tiltsh=0x7fab33a3d030,_masks=0x0,_fluxpersub=0x7fab340a7d60,
 _rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x7fab328fca00,
 _skyfluxpersub=0x7fab340a7a48,_nphotons=69930.1,_skynphotons=0,_tt=[-0.0167409,
 0.014623],_lastvalidtt=[-0.0167409,0.014623],_upttcommand=[0,0],_refmes=
 0x7fab3262da90,_tiprefv=0x7fab32414280,_tiltrefv=0x7fab32416d20,_tiprefvn=
 0x7fab324144c0,_tiltrefvn=0x7fab3242ecb0,_reordervec=0x0,_npixels=8,_npb=0,
 _sdim=16,_nx=16,_nx4fft=16,_istart=0x7fab338debc0,_jstart=0x7fab338de698,
 _binindices=0x7fab3286c430,_binxy=8,_centroidw=0x7fab3301dda8,_fimage=
 0x7fab3303ce30,_fimage2=0x0,_imistart=0x7fab338dda38,_imjstart=0x7fab33818498,
 _imistart2=0x7fab338dde58,_imjstart2=0x7fab340a7940,_unittip=0x7fab324159a0,
 _unittilt=0x7fab3242fdb0,_lgs_defocuses=0x7fab3380ba68,_unitdefocus=
 0x7fab32943030,_fimnx=48,_fimny=48,_fimny2=0x0,_yoffset=0x0,_bias=
 0x7fab339a4430,_flat=0x7fab33971a30,_domask=0,_submask=0x0,_kernel=
 0x7fab34038030,_kernels=0x7fab340b1830,_kerfftr=0x7fab34091630,_kerffti=
 0x7fab34099830,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fab340a9a30,_x=
 0x7fab3240eac0,_y=0x7fab3240f480,_centroidgain=1,_rayleigh=0x7fab3380d408,
 _bckgrdcalib=0x7fab3390ea30,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=2e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test8-if1.fits",pitch=10,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fab3380d398,_ctrlden=0x7fab3380cd40,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=7,pitchMargin=0,coupling=0.2,
 ecmatfile="test8-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fab340a7838,_xlast=0x7fab32811820,_ylast=[0x7fab327135b0,0x7fab327135b0,
 0x7fab327135b0],_y0=0x7fab32713350,_signus=0x7fab32713810,_puppixoffset=[0,0],
 _nact=45,_def=0x103cbc030,_x=0x7fab340a8078,_y=0x7fab340a85a0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x7fab326360e0,_indext=0x7fab3301b568,_eiffile=
 "test8-if1-ext.fits",_edef=0x7fab339b1830,_ex=0x7fab3380bec8,_ey=
 0x7fab3380c520,_enact=4,_n1=26,_n2=103,_pupil=0x0,_command=0x7fab338df508,
 _flat_command=0x0,_extrapcmat=0x7fab340b9a30,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0),dm_struct(type="tiptilt",subsystem=1,virtual=0,dmfit_which=0x0,
 iffile="test8-if2.fits",pitch=0,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fab3380bf38,_ctrlden=0x7fab3380b788,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,
 ecmatfile="test8-ecmat2.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,regmatrix=
 0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fab3380bd40,_xlast=0x7fab3380bfe0,_ylast=[0x7fab3301b920,0x7fab3301b920,
 0x7fab3301b920],_y0=0x7fab3301af28,_signus=0x7fab3380be20,_puppixoffset=[0,0],
 _nact=2,_def=0x7fab329a9630,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test8-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=26,_n2=103,_pupil=0x0,_command=0x7fab3380c398,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fab3380b7f8,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test8-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fab3284f9a8,xposition=0x7fab3380caa0,yposition=
 0x7fab3380cb80,dispzoom=0x7fab3380cdb0,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=2e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.15,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=200,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")
=============================
Simple SH6x6 (geometrical)
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.1273  0.0636  0.1273   1.02  1.02  1.02    8x 8    8x 8    69930.1
 
Summary:
Mirror #1, stackarray, 45 actuators, conjugated @ 0 m
Mirror #2, tiptilt, 2 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 1), 32 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 42.4; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       43.0   0.432      233.1
Field Avg  1.65                     43.0   0.432      233.1
Field rms  1.65                      0.0   0.000        0.0

Average images written in test8-imav.fits
Some other graphics in test8.ps

Original parameter file: test8.par:
 // Aosimul par file, V2.4.0
 //-------------------------------
 sim.name            = "Simple SH6x6 (geometrical)";
 sim.pupildiam       = 60;
 sim.debug           = 0;
 sim.verbose         = 0;
 
 //-------------------------------
 atm.dr0at05mic      = 42.44;  // this is r0=0.166 at 550 nm
 atm.screen          = &(Y_USER+"data/screen"+["1"]+".fits");
 atm.layerfrac       = &([1.0]);
 atm.layerspeed      = &([11.]);
 atm.layeralt        = &([0.]);
 atm.winddir         = &([0]);
 
 //-------------------------------
 nwfs                = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 5.;
 wfs(n).shmethod     = 1;
 wfs(n).shnxsub      = 6;
 wfs(n).pixsize      = 0.1;
 wfs(n).npixels      = 10;
 wfs(n).noise        = 1;
 wfs(n).ron          = 0.05;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 wfs(n).optthroughput= 0.5;
 
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
 dm(n).push4imat     = 2;
 
 n  =2;
 dm(n).type          = "tiptilt";
 dm(n).iffile        = "";
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.0005;
 dm(n).push4imat     = 2;
 
 //-------------------------------
 mat.condition       = &([15.]);
 
 //-------------------------------
 tel.diam            = 7.9;
 tel.cobs            = 0.1125;
 
 //-------------------------------
 target.lambda       = &([1.65]);
 target.xposition    = &([0.]);
 target.yposition    = &([0]);
 target.dispzoom     = &([1.]);
 
 //-------------------------------
 gs.zeropoint        = 2e11;
 gs.zenithangle      = 0.;
 
 //-------------------------------
 loop.gain    = 0.15;
 loop.framedelay     = 1;
 loop.niter          = 2000;
 loop.ittime         = 2e-3;
 loop.startskip      = 10;
 loop.skipevery      = 1000;
 loop.skipby         = 10000;
 loop.stats_every    = 200;
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="Simple SH6x6 (geometrical)",pupildiam=60,pupilapod=0,debug=0,
 verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,shmkey=0,semkey=0,
 _size=128,_cent=64.5)
 atm_struct(dr0at05mic=42.44,screen=0x7fa51a8a23e8,layerfrac=0x7fa519042ab8,
 layerspeed=0x7fa519042930,layeralt=0x7fa51a8a2650,winddir=0x7fa51a8a1308,
 _layeralt=0x7fa51a8a1a40)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=0.05,
 darkcurrent=0,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=0.5,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,
 rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=
 0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=1,shnxsub=6,
 npixpersub=0,pixsize=0.127287,npixels=8,spotpitch=8,extfield=1.0183,pupoffset=
 [0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,
 flatrmserror=0,fsname=0x0,fstop=0x0,fssize=0,fsoffset=[0,0],kernel=0,
 nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=
 0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=
 0x7fa519042850,lgs_prof_alt=0x7fa51a8676a8,nzer=0,ndh=0,ndhfiltered=0,
 _initkernels=1,_svipc_init_done=0,_svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=
 0x0,_validsubs=0x7fa51904a790,_origpixsize=0.1,_rebinfactor=2,_gsalt=0,
 _gsdepth=0,_nsub=32,_nsub4disp=32,_nmes=64,_sind=0x0,_nsind=0x0,_cxdef=0x0,
 _sxdef=0x0,_tiltsh=0x7fa519882a30,_masks=0x0,_fluxpersub=0x7fa51904a160,
 _rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x7fa51909d800,
 _skyfluxpersub=0x7fa519049e48,_nphotons=69930.1,_skynphotons=0,_tt=[-0.0167409,
 0.014623],_lastvalidtt=[-0.0167409,0.014623],_upttcommand=[0,0],_refmes=
 0x7fa518f481a0,_tiprefv=0x7fa518f45990,_tiltrefv=0x7fa518f43280,_tiprefvn=
 0x7fa518f46bc0,_tiltrefvn=0x7fa518f3e2c0,_reordervec=0x0,_npixels=8,_npb=0,
 _sdim=16,_nx=16,_nx4fft=16,_istart=0x7fa51a96a7c0,_jstart=0x7fa51a96a298,
 _binindices=0x7fa51982fe30,_binxy=8,_centroidw=0x7fa51a8da1a8,_fimage=
 0x7fa51986b830,_fimage2=0x0,_imistart=0x7fa51a969638,_imjstart=0x7fa51901f5d0,
 _imistart2=0x7fa51a969a58,_imjstart2=0x7fa519049d40,_unittip=0x7fa518d09ce0,
 _unittilt=0x7fa518d09eb0,_lgs_defocuses=0x7fa5190427e0,_unitdefocus=
 0x7fa519872830,_fimnx=48,_fimny=48,_fimny2=0x0,_yoffset=0x0,_bias=
 0x7fa5190dd630,_flat=0x7fa51916f830,_domask=0,_submask=0x0,_kernel=
 0x7fa51986b230,_kernels=0x7fa51a085a30,_kerfftr=0x7fa51a07c830,_kerffti=
 0x7fa51a08dc30,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fa51985da30,_x=
 0x7fa518d04db0,_y=0x7fa518d095a0,_centroidgain=1,_rayleigh=0x7fa51a8a26c0,
 _bckgrdcalib=0x7fa51900e030,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=2e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test8-if1.fits",pitch=10,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fa51a8676e0,_ctrlden=0x7fa51a8a1998,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=7,pitchMargin=0,coupling=0.2,
 ecmatfile="test8-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fa519810c20,_xlast=0x7fa51a96a8c8,_ylast=[0x7fa518f475a0,0x7fa518f475a0,
 0x7fa518f475a0],_y0=0x7fa518f47b00,_signus=0x7fa518f44a80,_puppixoffset=[0,0],
 _nact=45,_def=0x107f5a030,_x=0x7fa51904a478,_y=0x7fa51904a9a0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x7fa518f47950,_indext=0x7fa51a8d7968,_eiffile=
 "test8-if1-ext.fits",_edef=0x7fa51aa2b230,_ex=0x7fa51a8a1768,_ey=
 0x7fa51a8a1b90,_enact=4,_n1=26,_n2=103,_pupil=0x0,_command=0x7fa51904aaa8,
 _flat_command=0x0,_extrapcmat=0x7fa5190b4e30,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0),dm_struct(type="tiptilt",subsystem=1,virtual=0,dmfit_which=0x0,
 iffile="test8-if2.fits",pitch=0,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fa51a8a2b20,_ctrlden=0x7fa51a8a11b8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,
 ecmatfile="test8-ecmat2.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,regmatrix=
 0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fa51a8a1a78,_xlast=0x7fa51a8a2570,_ylast=[0x7fa51a8d8738,0x7fa51a8d8738,
 0x7fa51a8d8738],_y0=0x7fa51a8d9590,_signus=0x7fa51a8a2420,_puppixoffset=[0,0],
 _nact=2,_def=0x7fa519163830,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test8-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=26,_n2=103,_pupil=0x0,_command=0x7fa51a8a26f8,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fa51a8a1ce0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test8-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fa5190427a8,xposition=0x7fa51a867788,yposition=
 0x7fa51a8a2260,dispzoom=0x7fa51a8a2308,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=2e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.15,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=200,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       43.0   0.432      233.1
Field Avg  1.65                     43.0   0.432      233.1
Field rms  1.65                      0.0   0.000        0.0

Average images written in test8-imav.fits
Some other graphics in test8.ps

Original parameter file: test8.par:
 // Aosimul par file, V2.4.0
 //-------------------------------
 sim.name            = "Simple SH6x6 (geometrical)";
 sim.pupildiam       = 60;
 sim.debug           = 0;
 sim.verbose         = 0;
 
 //-------------------------------
 atm.dr0at05mic      = 42.44;  // this is r0=0.166 at 550 nm
 atm.screen          = &(Y_USER+"data/screen"+["1"]+".fits");
 atm.layerfrac       = &([1.0]);
 atm.layerspeed      = &([11.]);
 atm.layeralt        = &([0.]);
 atm.winddir         = &([0]);
 
 //-------------------------------
 nwfs                = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 5.;
 wfs(n).shmethod     = 1;
 wfs(n).shnxsub      = 6;
 wfs(n).pixsize      = 0.1;
 wfs(n).npixels      = 10;
 wfs(n).noise        = 1;
 wfs(n).ron          = 0.05;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 wfs(n).optthroughput= 0.5;
 
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
 dm(n).push4imat     = 2;
 
 n  =2;
 dm(n).type          = "tiptilt";
 dm(n).iffile        = "";
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.0005;
 dm(n).push4imat     = 2;
 
 //-------------------------------
 mat.condition       = &([15.]);
 
 //-------------------------------
 tel.diam            = 7.9;
 tel.cobs            = 0.1125;
 
 //-------------------------------
 target.lambda       = &([1.65]);
 target.xposition    = &([0.]);
 target.yposition    = &([0]);
 target.dispzoom     = &([1.]);
 
 //-------------------------------
 gs.zeropoint        = 2e11;
 gs.zenithangle      = 0.;
 
 //-------------------------------
 loop.gain    = 0.15;
 loop.framedelay     = 1;
 loop.niter          = 2000;
 loop.ittime         = 2e-3;
 loop.startskip      = 10;
 loop.skipevery      = 1000;
 loop.skipby         = 10000;
 loop.stats_every    = 200;
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="Simple SH6x6 (geometrical)",pupildiam=60,pupilapod=0,debug=0,
 verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,shmkey=0,semkey=0,
 _size=128,_cent=64.5)
 atm_struct(dr0at05mic=42.44,screen=0x7fa51a8a23e8,layerfrac=0x7fa519042ab8,
 layerspeed=0x7fa519042930,layeralt=0x7fa51a8a2650,winddir=0x7fa51a8a1308,
 _layeralt=0x7fa51a8a1a40)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=0.05,
 darkcurrent=0,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=0.5,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,
 rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=
 0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=1,shnxsub=6,
 npixpersub=0,pixsize=0.127287,npixels=8,spotpitch=8,extfield=1.0183,pupoffset=
 [0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,
 flatrmserror=0,fsname=0x0,fstop=0x0,fssize=0,fsoffset=[0,0],kernel=0,
 nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=
 0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=
 0x7fa519042850,lgs_prof_alt=0x7fa51a8676a8,nzer=0,ndh=0,ndhfiltered=0,
 _initkernels=1,_svipc_init_done=0,_svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=
 0x0,_validsubs=0x7fa51904a790,_origpixsize=0.1,_rebinfactor=2,_gsalt=0,
 _gsdepth=0,_nsub=32,_nsub4disp=32,_nmes=64,_sind=0x0,_nsind=0x0,_cxdef=0x0,
 _sxdef=0x0,_tiltsh=0x7fa519882a30,_masks=0x0,_fluxpersub=0x7fa51904a160,
 _rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x7fa51909d800,
 _skyfluxpersub=0x7fa519049e48,_nphotons=69930.1,_skynphotons=0,_tt=[-0.0167409,
 0.014623],_lastvalidtt=[-0.0167409,0.014623],_upttcommand=[0,0],_refmes=
 0x7fa518f481a0,_tiprefv=0x7fa518f45990,_tiltrefv=0x7fa518f43280,_tiprefvn=
 0x7fa518f46bc0,_tiltrefvn=0x7fa518f3e2c0,_reordervec=0x0,_npixels=8,_npb=0,
 _sdim=16,_nx=16,_nx4fft=16,_istart=0x7fa51a96a7c0,_jstart=0x7fa51a96a298,
 _binindices=0x7fa51982fe30,_binxy=8,_centroidw=0x7fa51a8da1a8,_fimage=
 0x7fa51986b830,_fimage2=0x0,_imistart=0x7fa51a969638,_imjstart=0x7fa51901f5d0,
 _imistart2=0x7fa51a969a58,_imjstart2=0x7fa519049d40,_unittip=0x7fa518d09ce0,
 _unittilt=0x7fa518d09eb0,_lgs_defocuses=0x7fa5190427e0,_unitdefocus=
 0x7fa519872830,_fimnx=48,_fimny=48,_fimny2=0x0,_yoffset=0x0,_bias=
 0x7fa5190dd630,_flat=0x7fa51916f830,_domask=0,_submask=0x0,_kernel=
 0x7fa519049630,_kernels=0x7fa51a085a30,_kerfftr=0x7fa51a07c830,_kerffti=
 0x7fa51a08dc30,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fa5190f0030,_x=
 0x7fa518d04db0,_y=0x7fa518d095a0,_centroidgain=1,_rayleigh=0x7fa51a8a26c0,
 _bckgrdcalib=0x7fa51900e030,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=2e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test8-if1.fits",pitch=10,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fa51a8a2960,_ctrlden=0x7fa51a8a2688,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=7,pitchMargin=0,coupling=0.2,
 ecmatfile="test8-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fa519049c38,_xlast=0x7fa519810c20,_ylast=[0x7fa518c0b1d0,0x7fa518c0b1d0,
 0x7fa518c0b1d0],_y0=0x7fa518c0aa00,_signus=0x7fa518c0b940,_puppixoffset=[0,0],
 _nact=45,_def=0x107f5a030,_x=0x7fa51904a478,_y=0x7fa51904a9a0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x7fa518f47950,_indext=0x7fa51a8d7968,_eiffile=
 "test8-if1-ext.fits",_edef=0x7fa51aa2b230,_ex=0x7fa51a8a1768,_ey=
 0x7fa51a8a1b90,_enact=4,_n1=26,_n2=103,_pupil=0x0,_command=0x7fa51a96b108,
 _flat_command=0x0,_extrapcmat=0x7fa5190b4e30,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0),dm_struct(type="tiptilt",subsystem=1,virtual=0,dmfit_which=0x0,
 iffile="test8-if2.fits",pitch=0,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fa51a8a1538,_ctrlden=0x7fa51a8a2538,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,
 ecmatfile="test8-ecmat2.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,regmatrix=
 0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fa51a8676e0,_xlast=0x7fa51a8a11b8,_ylast=[0x7fa51a8d7d20,0x7fa51a8d7d20,
 0x7fa51a8d7d20],_y0=0x7fa51a8d0328,_signus=0x7fa51a8a1a78,_puppixoffset=[0,0],
 _nact=2,_def=0x7fa519163830,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test8-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=26,_n2=103,_pupil=0x0,_command=0x7fa51a8a17d8,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fa51a8a1ce0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test8-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fa5190427a8,xposition=0x7fa51a867788,yposition=
 0x7fa51a8a2260,dispzoom=0x7fa51a8a2308,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=2e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.15,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=200,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")
=============================
Simple SH6x6 (geometrical)
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.1273  0.0636  0.1273   1.02  1.02  1.02    8x 8    8x 8    69930.1
 
Summary:
Mirror #1, stackarray, 45 actuators, conjugated @ 0 m
Mirror #2, tiptilt, 2 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 1), 32 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 42.4; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       43.0   0.432      233.1
Field Avg  1.65                     43.0   0.432      233.1
Field rms  1.65                      0.0   0.000        0.0

Average images written in test8-imav.fits
Some other graphics in test8.ps

Original parameter file: test8.par:
 // Aosimul par file, V2.4.0
 //-------------------------------
 sim.name            = "Simple SH6x6 (geometrical)";
 sim.pupildiam       = 60;
 sim.debug           = 0;
 sim.verbose         = 0;
 
 //-------------------------------
 atm.dr0at05mic      = 42.44;  // this is r0=0.166 at 550 nm
 atm.screen          = &(Y_USER+"data/screen"+["1"]+".fits");
 atm.layerfrac       = &([1.0]);
 atm.layerspeed      = &([11.]);
 atm.layeralt        = &([0.]);
 atm.winddir         = &([0]);
 
 //-------------------------------
 nwfs                = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 5.;
 wfs(n).shmethod     = 1;
 wfs(n).shnxsub      = 6;
 wfs(n).pixsize      = 0.1;
 wfs(n).npixels      = 10;
 wfs(n).noise        = 1;
 wfs(n).ron          = 0.05;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 wfs(n).optthroughput= 0.5;
 
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
 dm(n).push4imat     = 2;
 
 n  =2;
 dm(n).type          = "tiptilt";
 dm(n).iffile        = "";
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.0005;
 dm(n).push4imat     = 2;
 
 //-------------------------------
 mat.condition       = &([15.]);
 
 //-------------------------------
 tel.diam            = 7.9;
 tel.cobs            = 0.1125;
 
 //-------------------------------
 target.lambda       = &([1.65]);
 target.xposition    = &([0.]);
 target.yposition    = &([0]);
 target.dispzoom     = &([1.]);
 
 //-------------------------------
 gs.zeropoint        = 2e11;
 gs.zenithangle      = 0.;
 
 //-------------------------------
 loop.gain    = 0.15;
 loop.framedelay     = 1;
 loop.niter          = 2000;
 loop.ittime         = 2e-3;
 loop.startskip      = 10;
 loop.skipevery      = 1000;
 loop.skipby         = 10000;
 loop.stats_every    = 200;
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="Simple SH6x6 (geometrical)",pupildiam=60,pupilapod=0,debug=0,
 verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,shmkey=0,semkey=0,
 _size=128,_cent=64.5)
 atm_struct(dr0at05mic=42.44,screen=0x7faf8a09a970,layerfrac=0x7faf8a099e08,
 layerspeed=0x7faf8b01e088,layeralt=0x7faf8a09a8c8,winddir=0x7faf8b01dde8,
 _layeralt=0x7faf8a07c6e0)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=0.05,
 darkcurrent=0,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=0.5,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,
 rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=
 0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=1,shnxsub=6,
 npixpersub=0,pixsize=0.127287,npixels=8,spotpitch=8,extfield=1.0183,pupoffset=
 [0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,
 flatrmserror=0,fsname=0x0,fstop=0x0,fssize=0,fsoffset=[0,0],kernel=0,
 nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=
 0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=
 0x7faf8b01e050,lgs_prof_alt=0x7faf8a09ac10,nzer=0,ndh=0,ndhfiltered=0,
 _initkernels=1,_svipc_init_done=0,_svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=
 0x0,_validsubs=0x7faf8b12f190,_origpixsize=0.1,_rebinfactor=2,_gsalt=0,
 _gsdepth=0,_nsub=32,_nsub4disp=32,_nmes=64,_sind=0x0,_nsind=0x0,_cxdef=0x0,
 _sxdef=0x0,_tiltsh=0x7faf8a0d4230,_masks=0x0,_fluxpersub=0x7faf8b12eb60,
 _rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x7faf8b0a8400,
 _skyfluxpersub=0x7faf8a810d28,_nphotons=69930.1,_skynphotons=0,_tt=[-0.0167409,
 0.014623],_lastvalidtt=[-0.0167409,0.014623],_upttcommand=[0,0],_refmes=
 0x7faf89c08e20,_tiprefv=0x7faf89c0ad10,_tiltrefv=0x7faf89c1b4a0,_tiprefvn=
 0x7faf89c1bae0,_tiltrefvn=0x7faf89c1cf60,_reordervec=0x0,_npixels=8,_npb=0,
 _sdim=16,_nx=16,_nx4fft=16,_istart=0x7faf8b81b7c0,_jstart=0x7faf8b81b298,
 _binindices=0x7faf8b020030,_binxy=8,_centroidw=0x7faf8a0cdfa8,_fimage=
 0x7faf8a0f7030,_fimage2=0x0,_imistart=0x7faf8b81a638,_imjstart=0x7faf8a0269b0,
 _imistart2=0x7faf8b81aa58,_imjstart2=0x7faf8b12e740,_unittip=0x7faf89e2f740,
 _unittilt=0x7faf89e06fe0,_lgs_defocuses=0x7faf8a099cf0,_unitdefocus=
 0x7faf8b17a430,_fimnx=48,_fimny=48,_fimny2=0x0,_yoffset=0x0,_bias=
 0x7faf8a1ac030,_flat=0x7faf8a2b9e30,_domask=0,_submask=0x0,_kernel=
 0x7faf8b806c30,_kernels=0x7faf8a2a9a30,_kerfftr=0x7faf8a1a3e30,_kerffti=
 0x7faf8a2b1c30,_kernelconv=0,_cyclecounter=1,_dispimage=0x7faf8a1fb230,_x=
 0x7faf89e2a5f0,_y=0x7faf89e31a80,_centroidgain=1,_rayleigh=0x7faf8b01dfa8,
 _bckgrdcalib=0x7faf8a1b5e30,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=2e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test8-if1.fits",pitch=10,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7faf8a09ab30,_ctrlden=0x7faf8a09a890,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=7,pitchMargin=0,coupling=0.2,
 ecmatfile="test8-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf8a810c20,_xlast=0x7faf8b81b8c8,_ylast=[0x7faf89c1d5b0,0x7faf89c1d5b0,
 0x7faf89c1d5b0],_y0=0x7faf89c1d350,_signus=0x7faf89c1cd20,_puppixoffset=[0,0],
 _nact=45,_def=0x10acc2030,_x=0x7faf8b12ee78,_y=0x7faf8b12f3a0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x7faf89c1d1a0,_indext=0x7faf8a0c5168,_eiffile=
 "test8-if1-ext.fits",_edef=0x7faf8a226030,_ex=0x7faf8a09a660,_ey=
 0x7faf8b01daa0,_enact=4,_n1=26,_n2=103,_pupil=0x0,_command=0x7faf8b12f4a8,
 _flat_command=0x0,_extrapcmat=0x7faf8a0e4c30,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0),dm_struct(type="tiptilt",subsystem=1,virtual=0,dmfit_which=0x0,
 iffile="test8-if2.fits",pitch=0,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7faf8a09a4d8,_ctrlden=0x7faf8a09a5f0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,
 ecmatfile="test8-ecmat2.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,regmatrix=
 0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf8a09a188,_xlast=0x7faf8a09a778,_ylast=[0x7faf8a0c5f38,0x7faf8a0c5f38,
 0x7faf8a0c5f38],_y0=0x7faf8a0c6d90,_signus=0x7faf8b01de20,_puppixoffset=[0,0],
 _nact=2,_def=0x7faf8a21a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test8-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=26,_n2=103,_pupil=0x0,_command=0x7faf8b0b8b08,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7faf8a09a740,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test8-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7faf8a099f20,xposition=0x7faf8a09a7e8,yposition=
 0x7faf8a099dd0,dispzoom=0x7faf8a09a1f8,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=2e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.15,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=200,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       43.0   0.432      233.1
Field Avg  1.65                     43.0   0.432      233.1
Field rms  1.65                      0.0   0.000        0.0

Average images written in test8-imav.fits
Some other graphics in test8.ps

Original parameter file: test8.par:
 // Aosimul par file, V2.4.0
 //-------------------------------
 sim.name            = "Simple SH6x6 (geometrical)";
 sim.pupildiam       = 60;
 sim.debug           = 0;
 sim.verbose         = 0;
 
 //-------------------------------
 atm.dr0at05mic      = 42.44;  // this is r0=0.166 at 550 nm
 atm.screen          = &(Y_USER+"data/screen"+["1"]+".fits");
 atm.layerfrac       = &([1.0]);
 atm.layerspeed      = &([11.]);
 atm.layeralt        = &([0.]);
 atm.winddir         = &([0]);
 
 //-------------------------------
 nwfs                = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 5.;
 wfs(n).shmethod     = 1;
 wfs(n).shnxsub      = 6;
 wfs(n).pixsize      = 0.1;
 wfs(n).npixels      = 10;
 wfs(n).noise        = 1;
 wfs(n).ron          = 0.05;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 wfs(n).optthroughput= 0.5;
 
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
 dm(n).push4imat     = 2;
 
 n  =2;
 dm(n).type          = "tiptilt";
 dm(n).iffile        = "";
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.0005;
 dm(n).push4imat     = 2;
 
 //-------------------------------
 mat.condition       = &([15.]);
 
 //-------------------------------
 tel.diam            = 7.9;
 tel.cobs            = 0.1125;
 
 //-------------------------------
 target.lambda       = &([1.65]);
 target.xposition    = &([0.]);
 target.yposition    = &([0]);
 target.dispzoom     = &([1.]);
 
 //-------------------------------
 gs.zeropoint        = 2e11;
 gs.zenithangle      = 0.;
 
 //-------------------------------
 loop.gain    = 0.15;
 loop.framedelay     = 1;
 loop.niter          = 2000;
 loop.ittime         = 2e-3;
 loop.startskip      = 10;
 loop.skipevery      = 1000;
 loop.skipby         = 10000;
 loop.stats_every    = 200;
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="Simple SH6x6 (geometrical)",pupildiam=60,pupilapod=0,debug=0,
 verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,shmkey=0,semkey=0,
 _size=128,_cent=64.5)
 atm_struct(dr0at05mic=42.44,screen=0x7faf8a09a970,layerfrac=0x7faf8a099e08,
 layerspeed=0x7faf8b01e088,layeralt=0x7faf8a09a8c8,winddir=0x7faf8b01dde8,
 _layeralt=0x7faf8a07c6e0)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=0.05,
 darkcurrent=0,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=0.5,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,
 rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=
 0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=1,shnxsub=6,
 npixpersub=0,pixsize=0.127287,npixels=8,spotpitch=8,extfield=1.0183,pupoffset=
 [0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,
 flatrmserror=0,fsname=0x0,fstop=0x0,fssize=0,fsoffset=[0,0],kernel=0,
 nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=
 0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=
 0x7faf8b01e050,lgs_prof_alt=0x7faf8a09ac10,nzer=0,ndh=0,ndhfiltered=0,
 _initkernels=1,_svipc_init_done=0,_svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=
 0x0,_validsubs=0x7faf8b12f190,_origpixsize=0.1,_rebinfactor=2,_gsalt=0,
 _gsdepth=0,_nsub=32,_nsub4disp=32,_nmes=64,_sind=0x0,_nsind=0x0,_cxdef=0x0,
 _sxdef=0x0,_tiltsh=0x7faf8a0d4230,_masks=0x0,_fluxpersub=0x7faf8b12eb60,
 _rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x7faf8b0a8400,
 _skyfluxpersub=0x7faf8a810d28,_nphotons=69930.1,_skynphotons=0,_tt=[-0.0167409,
 0.014623],_lastvalidtt=[-0.0167409,0.014623],_upttcommand=[0,0],_refmes=
 0x7faf89c08e20,_tiprefv=0x7faf89c0ad10,_tiltrefv=0x7faf89c1b4a0,_tiprefvn=
 0x7faf89c1bae0,_tiltrefvn=0x7faf89c1cf60,_reordervec=0x0,_npixels=8,_npb=0,
 _sdim=16,_nx=16,_nx4fft=16,_istart=0x7faf8b81b7c0,_jstart=0x7faf8b81b298,
 _binindices=0x7faf8b020030,_binxy=8,_centroidw=0x7faf8a0cdfa8,_fimage=
 0x7faf8a0f7030,_fimage2=0x0,_imistart=0x7faf8b81a638,_imjstart=0x7faf8a0269b0,
 _imistart2=0x7faf8b81aa58,_imjstart2=0x7faf8b12e740,_unittip=0x7faf89e2f740,
 _unittilt=0x7faf89e06fe0,_lgs_defocuses=0x7faf8a099cf0,_unitdefocus=
 0x7faf8b17a430,_fimnx=48,_fimny=48,_fimny2=0x0,_yoffset=0x0,_bias=
 0x7faf8a1ac030,_flat=0x7faf8a2b9e30,_domask=0,_submask=0x0,_kernel=
 0x7faf8a1eaa30,_kernels=0x7faf8a2a9a30,_kerfftr=0x7faf8a1a3e30,_kerffti=
 0x7faf8a2b1c30,_kernelconv=0,_cyclecounter=1,_dispimage=0x7faf8a0f9630,_x=
 0x7faf89e2a5f0,_y=0x7faf89e31a80,_centroidgain=1,_rayleigh=0x7faf8b01dfa8,
 _bckgrdcalib=0x7faf8a1b5e30,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=2e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test8-if1.fits",pitch=10,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7faf8a09ad60,_ctrlden=0x7faf8a099a18,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=7,pitchMargin=0,coupling=0.2,
 ecmatfile="test8-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf8b12e638,_xlast=0x7faf8a810c20,_ylast=[0x7faf89c1d350,0x7faf89c1d350,
 0x7faf89c1d350],_y0=0x7faf89c1c3d0,_signus=0x7faf89c1d5b0,_puppixoffset=[0,0],
 _nact=45,_def=0x10acc2030,_x=0x7faf8b12ee78,_y=0x7faf8b12f3a0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x7faf89c1d1a0,_indext=0x7faf8a0c5168,_eiffile=
 "test8-if1-ext.fits",_edef=0x7faf8a226030,_ex=0x7faf8a09a660,_ey=
 0x7faf8b01daa0,_enact=4,_n1=26,_n2=103,_pupil=0x0,_command=0x7faf8b81c000,
 _flat_command=0x0,_extrapcmat=0x7faf8a0e4c30,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0),dm_struct(type="tiptilt",subsystem=1,virtual=0,dmfit_which=0x0,
 iffile="test8-if2.fits",pitch=0,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7faf8a0994d8,_ctrlden=0x7faf8b01dd40,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,
 ecmatfile="test8-ecmat2.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,regmatrix=
 0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf8a09ab30,_xlast=0x7faf8a09a5f0,_ylast=[0x7faf8a0c5520,0x7faf8a0c5520,
 0x7faf8a0c5520],_y0=0x7faf8a0c4b28,_signus=0x7faf8a09a188,_puppixoffset=[0,0],
 _nact=2,_def=0x7faf8a21a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test8-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=26,_n2=103,_pupil=0x0,_command=0x7faf8b01dfe0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7faf8a09a740,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test8-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7faf8a099f20,xposition=0x7faf8a09a7e8,yposition=
 0x7faf8a099dd0,dispzoom=0x7faf8a09a1f8,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=2e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.15,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=200,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       43.8   0.426      243.3
Field Avg  1.65                     43.8   0.426      243.3
Field rms  1.65                      0.0   0.000        0.0

Average images written in test8-imav.fits
Some other graphics in test8.ps

Original parameter file: test8.par:
 // Aosimul par file, V2.4.0
 //-------------------------------
 sim.name            = "Simple SH6x6 (geometrical)";
 sim.pupildiam       = 60;
 sim.debug           = 0;
 sim.verbose         = 0;
 
 //-------------------------------
 atm.dr0at05mic      = 42.44;  // this is r0=0.166 at 550 nm
 atm.screen          = &(Y_USER+"data/screen"+["1"]+".fits");
 atm.layerfrac       = &([1.0]);
 atm.layerspeed      = &([11.]);
 atm.layeralt        = &([0.]);
 atm.winddir         = &([0]);
 
 //-------------------------------
 nwfs                = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 5.;
 wfs(n).shmethod     = 1;
 wfs(n).shnxsub      = 6;
 wfs(n).pixsize      = 0.1;
 wfs(n).npixels      = 10;
 wfs(n).noise        = 1;
 wfs(n).ron          = 0.05;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 wfs(n).optthroughput= 0.5;
 
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
 dm(n).push4imat     = 2;
 
 n  =2;
 dm(n).type          = "tiptilt";
 dm(n).iffile        = "";
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.0005;
 dm(n).push4imat     = 2;
 
 //-------------------------------
 mat.condition       = &([15.]);
 
 //-------------------------------
 tel.diam            = 7.9;
 tel.cobs            = 0.1125;
 
 //-------------------------------
 target.lambda       = &([1.65]);
 target.xposition    = &([0.]);
 target.yposition    = &([0]);
 target.dispzoom     = &([1.]);
 
 //-------------------------------
 gs.zeropoint        = 2e11;
 gs.zenithangle      = 0.;
 
 //-------------------------------
 loop.gain    = 0.15;
 loop.framedelay     = 1;
 loop.niter          = 2000;
 loop.ittime         = 2e-3;
 loop.startskip      = 10;
 loop.skipevery      = 1000;
 loop.skipby         = 10000;
 loop.stats_every    = 200;
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="Simple SH6x6 (geometrical)",pupildiam=60,pupilapod=0,debug=0,
 verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,shmkey=0,semkey=0,
 _size=128,_cent=64.5)
 atm_struct(dr0at05mic=42.44,screen=0x7faf8a09a970,layerfrac=0x7faf8a099e08,
 layerspeed=0x7faf8b01e088,layeralt=0x7faf8a09a8c8,winddir=0x7faf8b01dde8,
 _layeralt=0x7faf8a07c6e0)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=0.05,
 darkcurrent=0,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=0.5,
 disjointpup=0,svipc=1,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,
 rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=
 0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=1,shnxsub=6,
 npixpersub=0,pixsize=0.127287,npixels=8,spotpitch=8,extfield=1.0183,pupoffset=
 [0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,
 flatrmserror=0,fsname=0x0,fstop=0x0,fssize=0,fsoffset=[0,0],kernel=0,
 nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=
 0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=
 0x7faf8b01e050,lgs_prof_alt=0x7faf8a09ac10,nzer=0,ndh=0,ndhfiltered=0,
 _initkernels=1,_svipc_init_done=0,_svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=
 0x0,_validsubs=0x7faf8b81b8c8,_origpixsize=0.1,_rebinfactor=2,_gsalt=0,
 _gsdepth=0,_nsub=32,_nsub4disp=32,_nmes=64,_sind=0x0,_nsind=0x0,_cxdef=0x0,
 _sxdef=0x0,_tiltsh=0x7faf8a87ec30,_masks=0x0,_fluxpersub=0x7faf8b12e740,
 _rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x7faf8b12eb60,
 _skyfluxpersub=0x7faf8b0a8400,_nphotons=69930.1,_skynphotons=0,_tt=[-0.0100824,
 -7.11232e-05],_lastvalidtt=[-0.0100824,-7.11232e-05],_upttcommand=[0,0],
 _refmes=0x7faf89c08e20,_tiprefv=0x7faf89c0ad10,_tiltrefv=0x7faf89c1b4a0,
 _tiprefvn=0x7faf89c1bae0,_tiltrefvn=0x7faf89c1cf60,_reordervec=0x0,_npixels=8,
 _npb=0,_sdim=16,_nx=16,_nx4fft=16,_istart=0x7faf8b12f190,_jstart=
 0x7faf8b81b7c0,_binindices=0x7faf8b804030,_binxy=8,_centroidw=0x7faf8a0c5fc0,
 _fimage=0x7faf8b82ee30,_fimage2=0x0,_imistart=0x7faf8a0268a8,_imjstart=
 0x7faf8b81a638,_imistart2=0x7faf8a0269b0,_imjstart2=0x7faf8b81aa58,_unittip=
 0x7faf89f1b730,_unittilt=0x7faf89f1bb20,_lgs_defocuses=0x7faf8a0994d8,
 _unitdefocus=0x7faf8b87e230,_fimnx=48,_fimny=48,_fimny2=0x0,_yoffset=0x0,_bias=
 0x7faf8a0f7030,_flat=0x7faf8a2bc430,_domask=0,_submask=0x0,_kernel=
 0x7faf8a83ac30,_kernels=0x7faf8a0dc030,_kerfftr=0x7faf8a2a9a30,_kerffti=
 0x7faf8a1a3e30,_kernelconv=0,_cyclecounter=1,_dispimage=0x7faf8b81f430,_x=
 0x7faf89f1be30,_y=0x7faf89f1c0f0,_centroidgain=1,_rayleigh=0x7faf8a09a580,
 _bckgrdcalib=0x7faf8a0f9630,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=2e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test8-if1.fits",pitch=10,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7faf8a813bc0,_ctrlden=0x7faf8a07c4e8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=7,pitchMargin=0,coupling=0.2,
 ecmatfile="test8-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf8b0a81f0,_xlast=0x7faf8b12e638,_ylast=[0x7faf89e33520,0x7faf89e33520,
 0x7faf89e33520],_y0=0x7faf89e332c0,_signus=0x7faf89e2c7e0,_puppixoffset=[0,0],
 _nact=45,_def=0x10acc2030,_x=0x7faf8b12ee78,_y=0x7faf8b12f3a0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x7faf89c1d1a0,_indext=0x7faf8a0c5168,_eiffile=
 "test8-if1-ext.fits",_edef=0x7faf8a226030,_ex=0x7faf8a09a660,_ey=
 0x7faf8b01daa0,_enact=4,_n1=26,_n2=103,_pupil=0x0,_command=0x7faf8b81b298,
 _flat_command=0x0,_extrapcmat=0x7faf8a0e4c30,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0),dm_struct(type="tiptilt",subsystem=1,virtual=0,dmfit_which=0x0,
 iffile="test8-if2.fits",pitch=0,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7faf8a09a5f0,_ctrlden=0x7faf8a09a890,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,
 ecmatfile="test8-ecmat2.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,regmatrix=
 0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf8a09ad60,_xlast=0x7faf8b01dd40,_ylast=[0x7faf8a0c32b8,0x7faf8a0c32b8,
 0x7faf8a0c32b8],_y0=0x7faf8a0cd8c0,_signus=0x7faf8a09ab30,_puppixoffset=[0,0],
 _nact=2,_def=0x7faf8a21a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test8-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=26,_n2=103,_pupil=0x0,_command=0x7faf8b01de20,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7faf8a09a740,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test8-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7faf8a099f20,xposition=0x7faf8a09a7e8,yposition=
 0x7faf8a099dd0,dispzoom=0x7faf8a09a1f8,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=2e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.15,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=200,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       43.4   0.426      238.2
Field Avg  1.65                     43.4   0.426      238.2
Field rms  1.65                      0.0   0.000        0.0

Average images written in test8-imav.fits
Some other graphics in test8.ps

Original parameter file: test8.par:
 // Aosimul par file, V2.4.0
 //-------------------------------
 sim.name            = "Simple SH6x6 (geometrical)";
 sim.pupildiam       = 60;
 sim.debug           = 0;
 sim.verbose         = 0;
 
 //-------------------------------
 atm.dr0at05mic      = 42.44;  // this is r0=0.166 at 550 nm
 atm.screen          = &(Y_USER+"data/screen"+["1"]+".fits");
 atm.layerfrac       = &([1.0]);
 atm.layerspeed      = &([11.]);
 atm.layeralt        = &([0.]);
 atm.winddir         = &([0]);
 
 //-------------------------------
 nwfs                = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 5.;
 wfs(n).shmethod     = 1;
 wfs(n).shnxsub      = 6;
 wfs(n).pixsize      = 0.1;
 wfs(n).npixels      = 10;
 wfs(n).noise        = 1;
 wfs(n).ron          = 0.05;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 wfs(n).optthroughput= 0.5;
 
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
 dm(n).push4imat     = 2;
 
 n  =2;
 dm(n).type          = "tiptilt";
 dm(n).iffile        = "";
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.0005;
 dm(n).push4imat     = 2;
 
 //-------------------------------
 mat.condition       = &([15.]);
 
 //-------------------------------
 tel.diam            = 7.9;
 tel.cobs            = 0.1125;
 
 //-------------------------------
 target.lambda       = &([1.65]);
 target.xposition    = &([0.]);
 target.yposition    = &([0]);
 target.dispzoom     = &([1.]);
 
 //-------------------------------
 gs.zeropoint        = 2e11;
 gs.zenithangle      = 0.;
 
 //-------------------------------
 loop.gain    = 0.15;
 loop.framedelay     = 1;
 loop.niter          = 2000;
 loop.ittime         = 2e-3;
 loop.startskip      = 10;
 loop.skipevery      = 1000;
 loop.skipby         = 10000;
 loop.stats_every    = 200;
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="Simple SH6x6 (geometrical)",pupildiam=60,pupilapod=0,debug=0,
 verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,shmkey=0,semkey=0,
 _size=128,_cent=64.5)
 atm_struct(dr0at05mic=42.44,screen=0x7faf8a09a970,layerfrac=0x7faf8a099e08,
 layerspeed=0x7faf8b01e088,layeralt=0x7faf8a09a8c8,winddir=0x7faf8b01dde8,
 _layeralt=0x7faf8a07c6e0)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=0.05,
 darkcurrent=0,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=0,
 filtertilt=0,correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=0.5,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,
 rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=
 0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=1,shnxsub=6,
 npixpersub=0,pixsize=0.127287,npixels=8,spotpitch=8,extfield=1.0183,pupoffset=
 [0,0],shthmethod=0,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,
 flatrmserror=0,fsname=0x0,fstop=0x0,fssize=0,fsoffset=[0,0],kernel=0,
 nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=
 0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=
 0x7faf8b01e050,lgs_prof_alt=0x7faf8a09ac10,nzer=0,ndh=0,ndhfiltered=0,
 _initkernels=1,_svipc_init_done=0,_svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=
 0x0,_validsubs=0x7faf8b81bce8,_origpixsize=0.1,_rebinfactor=2,_gsalt=0,
 _gsdepth=0,_nsub=32,_nsub4disp=32,_nmes=64,_sind=0x0,_nsind=0x0,_cxdef=0x0,
 _sxdef=0x0,_tiltsh=0x7faf8b83da30,_masks=0x0,_fluxpersub=0x7faf8b81aa58,
 _rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x7faf8b12e740,
 _skyfluxpersub=0x7faf8b12eb60,_nphotons=69930.1,_skynphotons=0,_tt=
 [-0.00462298,-0.00996298],_lastvalidtt=[-0.00462298,-0.00996298],_upttcommand=
 [0,0],_refmes=0x7faf89c08e20,_tiprefv=0x7faf89c0ad10,_tiltrefv=0x7faf89c1b4a0,
 _tiprefvn=0x7faf89c1bae0,_tiltrefvn=0x7faf89c1cf60,_reordervec=0x0,_npixels=8,
 _npb=0,_sdim=16,_nx=16,_nx4fft=16,_istart=0x7faf8b81b8c8,_jstart=
 0x7faf8b12f190,_binindices=0x7faf8a854430,_binxy=8,_centroidw=0x7faf8a0c4a18,
 _fimage=0x7faf8a858e30,_fimage2=0x0,_imistart=0x7faf8a810908,_imjstart=
 0x7faf8a0268a8,_imistart2=0x7faf8b81a638,_imjstart2=0x7faf8a0269b0,_unittip=
 0x7faf89c1aef0,_unittilt=0x7faf89c1b0c0,_lgs_defocuses=0x7faf8a09a5f0,
 _unitdefocus=0x7faf8a254030,_fimnx=48,_fimny=48,_fimny2=0x0,_yoffset=0x0,_bias=
 0x7faf8a1e5030,_flat=0x7faf8a0f7030,_domask=0,_submask=0x0,_kernel=
 0x7faf8b804030,_kernels=0x7faf8a264230,_kerfftr=0x7faf8a0dc030,_kerffti=
 0x7faf8a2a9a30,_kernelconv=0,_cyclecounter=1,_dispimage=0x7faf8a83be30,_x=
 0x7faf89f1cbd0,_y=0x7faf89f1cd10,_centroidgain=1,_rayleigh=0x7faf8a07c638,
 _bckgrdcalib=0x7faf8a2bc430,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=2e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test8-if1.fits",pitch=10,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7faf8a09a778,_ctrlden=0x7faf8b01dfe0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=7,pitchMargin=0,coupling=0.2,
 ecmatfile="test8-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf8b81c000,_xlast=0x7faf8b0a81f0,_ylast=[0x7faf89f1c4e0,0x7faf89f1c4e0,
 0x7faf89f1c4e0],_y0=0x7faf89f1c280,_signus=0x7faf89f1c740,_puppixoffset=[0,0],
 _nact=45,_def=0x10acc2030,_x=0x7faf8b12ee78,_y=0x7faf8b12f3a0,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x7faf89c1d1a0,_indext=0x7faf8a0c5168,_eiffile=
 "test8-if1-ext.fits",_edef=0x7faf8a226030,_ex=0x7faf8a09a660,_ey=
 0x7faf8b01daa0,_enact=4,_n1=26,_n2=103,_pupil=0x0,_command=0x7faf8b81b7c0,
 _flat_command=0x0,_extrapcmat=0x7faf8a0e4c30,_eltdefsize=0,_regmatrix=0x0,
 _fMat=0x0),dm_struct(type="tiptilt",subsystem=1,virtual=0,dmfit_which=0x0,
 iffile="test8-if2.fits",pitch=0,alt=0,hyst=0,push4imat=2,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7faf8b01dd40,_ctrlden=0x7faf8a09ae08,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,
 ecmatfile="test8-ecmat2.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,regmatrix=
 0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf8a813bc0,_xlast=0x7faf8a09a890,_ylast=[0x7faf8a0c4b28,0x7faf8a0c4b28,
 0x7faf8a0c4b28],_y0=0x7faf8a0cdae0,_signus=0x7faf8a09ad60,_puppixoffset=[0,0],
 _nact=2,_def=0x7faf8a21a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test8-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=26,_n2=103,_pupil=0x0,_command=0x7faf8a07c5c8,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7faf8a09a740,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test8-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7faf8a099f20,xposition=0x7faf8a09a7e8,yposition=
 0x7faf8a099dd0,dispzoom=0x7faf8a09a1f8,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=2e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.15,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=200,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")
