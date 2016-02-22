=============================
Simili Altair LGS, full diffraction WFS, spot elongation
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.5091  0.0636  0.5091   2.04  2.04  2.04    4x 4    4x 4    4767.4
 2      0.5012  0.0080  0.5012   2.04  2.00  2.00    4x 4    4x 4    254.6
 
Summary:
Mirror #1, stackarray, 137 actuators, conjugated @ 0 m
Mirror #2, tiptilt, 2 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 112 subap., offaxis (+0.0",+0.0"), noise enabled
WFS # 2, hartmann (meth. 2),  1 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 40.0; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       47.3   0.583       75.9
Star# 2     1.65   10.0   0.0       48.3   0.413      141.6
Star# 3     1.65   10.0  10.0       49.3   0.318      192.2
Field Avg  1.65                     48.3   0.438      136.6
Field rms  1.65                      0.8   0.110       47.6

Average images written in test1-imav.fits
Some other graphics in test1.ps

Original parameter file: test1.par:
 // YAO parameter file
 //-------------------------------
 sim.name            = "Simili Altair LGS, full diffraction WFS, spot elongation";
 sim.pupildiam       = 120;
 sim.debug           = 0;
 sim.verbose         = 0;
 
 //-------------------------------
 atm.dr0at05mic      = 40.;
 atm.screen          = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac       = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed      = &([11.,20,29,35]);
 atm.layeralt        = &([0.,400,6000,9000]);
 atm.winddir         = &([0,0,0,0]);
 
 //-------------------------------
 nwfs = 2; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type         = "hartmann";
 wfs(n).subsystem    = 1;
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 95000.;
 wfs(n).gsdepth      = 10000.;
 wfs(n).laserpower   = 25.;
 wfs(n).skymag       = 20.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 12;
 wfs(n).pixsize      = 0.5;
 wfs(n).npixels      = 4;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 wfs(n).filtertilt   = 1;
 wfs(n).correctUpTT  = 1;
 wfs(n).uplinkgain   = 0.1;
 wfs(n).kernel       = 1.0
 wfs(n).dispzoom     = 2.;
 wfs(n).noise        = 1;
 wfs(n).ron          = 5;
 
 n   = 2;
 wfs(n).type         = "hartmann";
 wfs(n).subsystem    = 2;
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 15.;
 wfs(n).skymag       = 18.5;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 1;
 wfs(n).pixsize      = 0.5;
 wfs(n).npixels      = 4;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 wfs(n).dispzoom     = 0.15;
 wfs(n).noise        = 1;
 wfs(n).ron          = 5;
 wfs(n).darkcurrent  = 200;
 
 
 //-------------------------------
 ndm = 2;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type          = "stackarray";
 dm(n).subsystem     = 1;
 dm(n).iffile        = "";
 dm(n).nxact         = 13;
 dm(n).pitch         = 10;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01;
 dm(n).push4imat     = 50;
 dm(n).elt           = 1;
 dm(n).coupling      = 0.15;
 
 n  =2;
 dm(n).type          = "tiptilt";
 dm(n).subsystem     = 2;
 dm(n).iffile        = "";
 dm(n).alt           = 0.;
 dm(n).unitpervolt   =  0.0005;
 dm(n).push4imat     = 10;
 dm(n).gain          = 0.3;
 
 //-------------------------------
 mat.condition       = &([15.,15.]);
 mat.file            = "";
 
 //-------------------------------
 tel.diam            = 7.9;
 tel.cobs            = 0.1125;
 
 //-------------------------------
 target.lambda       = &([1.65]);
 target.xposition    = &([0.,10,10]);
 target.yposition    = &([0,0,10]);
 target.dispzoom     = &([1.,1.,1.]);
 
 //-------------------------------
 gs.zeropoint        = 1e11;
 
 //-------------------------------
 loop.gain           = 0.6;
 loop.framedelay     = 1;
 loop.niter          = 1000;
 loop.ittime         = 2e-3;
 loop.startskip      = 10;
 loop.skipevery      = 1000;
 loop.skipby         = 10000;
 loop.modalgainfile  = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="Simili Altair LGS, full diffraction WFS, spot elongation",
 pupildiam=120,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=40,screen=0x7fab3291afc0,layerfrac=0x7fab3291af38,
 layerspeed=0x7fab3291aeb0,layeralt=0x7fab3291ada0,winddir=0x7fab3301b238,
 _layeralt=0x7fab3291ac90)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=5,darkcurrent=
 0,gspos=[0,0],gsalt=95000,gsdepth=10000,laserpower=25,gsmag=0,skymag=20,
 filtertilt=1,correctUpTT=1,uplinkgain=0.1,dispzoom=2,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,
 rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=
 0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=12,
 npixpersub=0,pixsize=0.509149,npixels=4,spotpitch=4,extfield=2.0366,pupoffset=
 [0,0],shthmethod=1,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,
 flatrmserror=0,fsname=0x0,fstop="square",fssize=2.0366,fsoffset=[0,0],kernel=1,
 nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=
 0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=
 0x7fab3380c750,lgs_prof_alt=0x7fab3380b830,nzer=0,ndh=0,ndhfiltered=0,
 _initkernels=0,_svipc_init_done=0,_svipc_subok=0x7fab32432130,_fork_subs=0x0,
 _fork_subs2=0x0,_validsubs=0x7fab3262e7c0,_origpixsize=0.5,_rebinfactor=8,
 _gsalt=95000,_gsdepth=10000,_nsub=112,_nsub4disp=132,_nmes=224,_sind=0x0,
 _nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x101847030,_masks=0x0,_fluxpersub=
 0x7fab3242fb30,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=
 0x7fab3242fd80,_skyfluxpersub=0x7fab3242ffd0,_nphotons=4767.43,_skynphotons=
 0.00458332,_tt=[-0.0066128,-0.0132231],_lastvalidtt=[-0.0066128,-0.0132231],
 _upttcommand=[0.000911246,0.00177957],_refmes=0x7fab32431730,_tiprefv=
 0x7fab329cfc30,_tiltrefv=0x7fab329ea230,_tiprefvn=0x7fab329d1c30,_tiltrefvn=
 0x7fab32869e30,_reordervec=0x0,_npixels=4,_npb=0,_sdim=32,_nx=32,_nx4fft=32,
 _istart=0x7fab3262baf0,_jstart=0x7fab326303a0,_binindices=0x7fab329e0c30,
 _binxy=4,_centroidw=0x7fab3380c168,_fimage=0x7fab34093a30,_fimage2=0x0,
 _imistart=0x7fab3242f1f0,_imjstart=0x7fab3242f440,_imistart2=0x7fab3242f690,
 _imjstart2=0x7fab3242f8e0,_unittip=0x7fab3262e460,_unittilt=0x7fab3262cc80,
 _lgs_defocuses=0x7fab3380c398,_unitdefocus=0x10188d030,_fimnx=48,_fimny=48,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fab329eaa30,_flat=0x7fab32855630,_domask=1,
 _submask=0x7fab329d0a30,_kernel=0x7fab34088030,_kernels=0x1011bf030,_kerfftr=
 0x1012f6030,_kerffti=0x10137b030,_kernelconv=1,_cyclecounter=1,_dispimage=
 0x7fab34085a30,_x=0x7fab33949c30,_y=0x7fab3383aa30,_centroidgain=1,_rayleigh=
 0x7fab3380bd08,_bckgrdcalib=0x7fab329e7c30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=2,lambda=0.65,noise=1,ron=5,darkcurrent=200,gspos=[0,0],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=15,skymag=18.5,filtertilt=0,correctUpTT=0,
 uplinkgain=0,dispzoom=0.15,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,
 ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=1,npixpersub=0,pixsize=0.501194,npixels=4,
 spotpitch=4,extfield=2.00477,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.00477,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fab3380b7f8,lgs_prof_alt=
 0x7fab3380c718,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fab3380cf38,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fab3380c600,_origpixsize=0.5,_rebinfactor=63,_gsalt=0,_gsdepth=0,_nsub=1,
 _nsub4disp=1,_nmes=2,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x100e3b030,_masks=0x0,_fluxpersub=0x7fab3380cc98,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fab3380c7c0,_skyfluxpersub=0x7fab3380c590,
 _nphotons=254.597,_skynphotons=2.54603,_tt=[0.0664746,-0.0797795],_lastvalidtt=
 [0.0664746,-0.0797795],_upttcommand=[0,0],_refmes=0x7fab3380c280,_tiprefv=
 0x7fab3380c2b8,_tiltrefv=0x7fab3380c248,_tiprefvn=0x7fab3380c1d8,_tiltrefvn=
 0x7fab3380c0f8,_reordervec=0x0,_npixels=4,_npb=0,_sdim=256,_nx=252,_nx4fft=252,
 _istart=0x7fab3380ca68,_jstart=0x7fab3380cb80,_binindices=0x101ab1030,_binxy=4,
 _centroidw=0x7fab3380b6a8,_fimage=0x7fab3301b9a8,_fimage2=0x0,_imistart=
 0x7fab3380be20,_imjstart=0x7fab3380cc28,_imistart2=0x7fab3380cde8,_imjstart2=
 0x7fab3380c5c8,_unittip=0x7fab32858e30,_unittilt=0x7fab32979630,_lgs_defocuses=
 0x7fab3380c4b0,_unitdefocus=0x100dba030,_fimnx=4,_fimny=4,_fimny2=0x0,_yoffset=
 0x0,_bias=0x7fab3301aa60,_flat=0x7fab3301b568,_domask=1,_submask=0x1016ed030,
 _kernel=0x101918030,_kernels=0x101244030,_kerfftr=0x10166f030,_kerffti=
 0x1016ae030,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fab3301ae18,_x=
 0x7fab3380cd08,_y=0x7fab3380c088,_centroidgain=1,_rayleigh=0x7fab3380ccd0,
 _bckgrdcalib=0x7fab3301b458,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test1-if1.fits",pitch=10,alt=0,hyst=0,push4imat=50,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fab3380c830,_ctrlden=0x7fab3380c478,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=13,pitchMargin=0,coupling=0.15,
 ecmatfile="test1-ecmat1.fits",noextrap=0,elt=1,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fab32631850,_xlast=0x7fab32630f00,_ylast=[0x7fab3390a030,0x7fab3390a030,
 0x7fab3390a030],_y0=0x7fab338dcc30,_signus=0x7fab3383d030,_puppixoffset=[0,0],
 _nact=137,_def=0x101400030,_x=0x7fab32634ac0,_y=0x7fab326305f0,_i1=
 0x7fab32630860,_j1=0x7fab32630ad0,_ei1=0x7fab32811820,_ej1=0x7fab340a7f70,
 _indval=0x7fab3383d630,_indext=0x7fab32811508,_eiffile="test1-if1-ext.fits",
 _edef=0x7fab338dfc30,_ex=0x7fab338de590,_ey=0x7fab338decc8,_enact=20,_n1=60,
 _n2=197,_pupil=0x0,_command=0x7fab32632950,_flat_command=0x0,_extrapcmat=
 0x7fab33904a30,_eltdefsize=38,_regmatrix=0x0,_fMat=0x0),dm_struct(type=
 "tiptilt",subsystem=2,virtual=0,dmfit_which=0x0,iffile="test1-if2.fits",pitch=
 0,alt=0,hyst=0,push4imat=10,thresholdresp=0.3,unitpervolt=0.0005,maxvolt=0,
 gain=0.3,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7fab3380c3d0,_ctrlden=
 0x7fab3380cf00,misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],disjointpup=0,
 pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,use_def_of=0,
 ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=0x0,
 supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,ecmatfile=
 "test1-ecmat2.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,nzer=0,
 minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,regmatrix=0x0,
 _alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fab3380c018,_xlast=0x7fab3380bf70,_ylast=[0x7fab3301bde8,0x7fab3301bde8,
 0x7fab3301bde8],_y0=0x7fab3301bbc8,_signus=0x7fab3380c6a8,_puppixoffset=[0,0],
 _nact=2,_def=0x101a5a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test1-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=60,_n2=197,_pupil=0x0,_command=0x7fab3380b6e0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fab3380c2f0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test1-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fab3380c520,xposition=0x7fab3380cb48,yposition=
 0x7fab3380bb80,dispzoom=0x7fab3291b048,ncpdm=0x0,_ntarget=3,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=22)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       47.3   0.583       75.9
Star# 2     1.65   10.0   0.0       48.3   0.413      141.6
Star# 3     1.65   10.0  10.0       49.3   0.318      192.2
Field Avg  1.65                     48.3   0.438      136.6
Field rms  1.65                      0.8   0.110       47.6

Average images written in test1-imav.fits
Some other graphics in test1.ps

Original parameter file: test1.par:
 // YAO parameter file
 //-------------------------------
 sim.name            = "Simili Altair LGS, full diffraction WFS, spot elongation";
 sim.pupildiam       = 120;
 sim.debug           = 0;
 sim.verbose         = 0;
 
 //-------------------------------
 atm.dr0at05mic      = 40.;
 atm.screen          = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac       = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed      = &([11.,20,29,35]);
 atm.layeralt        = &([0.,400,6000,9000]);
 atm.winddir         = &([0,0,0,0]);
 
 //-------------------------------
 nwfs = 2; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type         = "hartmann";
 wfs(n).subsystem    = 1;
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 95000.;
 wfs(n).gsdepth      = 10000.;
 wfs(n).laserpower   = 25.;
 wfs(n).skymag       = 20.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 12;
 wfs(n).pixsize      = 0.5;
 wfs(n).npixels      = 4;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 wfs(n).filtertilt   = 1;
 wfs(n).correctUpTT  = 1;
 wfs(n).uplinkgain   = 0.1;
 wfs(n).kernel       = 1.0
 wfs(n).dispzoom     = 2.;
 wfs(n).noise        = 1;
 wfs(n).ron          = 5;
 
 n   = 2;
 wfs(n).type         = "hartmann";
 wfs(n).subsystem    = 2;
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 15.;
 wfs(n).skymag       = 18.5;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 1;
 wfs(n).pixsize      = 0.5;
 wfs(n).npixels      = 4;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 wfs(n).dispzoom     = 0.15;
 wfs(n).noise        = 1;
 wfs(n).ron          = 5;
 wfs(n).darkcurrent  = 200;
 
 
 //-------------------------------
 ndm = 2;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type          = "stackarray";
 dm(n).subsystem     = 1;
 dm(n).iffile        = "";
 dm(n).nxact         = 13;
 dm(n).pitch         = 10;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01;
 dm(n).push4imat     = 50;
 dm(n).elt           = 1;
 dm(n).coupling      = 0.15;
 
 n  =2;
 dm(n).type          = "tiptilt";
 dm(n).subsystem     = 2;
 dm(n).iffile        = "";
 dm(n).alt           = 0.;
 dm(n).unitpervolt   =  0.0005;
 dm(n).push4imat     = 10;
 dm(n).gain          = 0.3;
 
 //-------------------------------
 mat.condition       = &([15.,15.]);
 mat.file            = "";
 
 //-------------------------------
 tel.diam            = 7.9;
 tel.cobs            = 0.1125;
 
 //-------------------------------
 target.lambda       = &([1.65]);
 target.xposition    = &([0.,10,10]);
 target.yposition    = &([0,0,10]);
 target.dispzoom     = &([1.,1.,1.]);
 
 //-------------------------------
 gs.zeropoint        = 1e11;
 
 //-------------------------------
 loop.gain           = 0.6;
 loop.framedelay     = 1;
 loop.niter          = 1000;
 loop.ittime         = 2e-3;
 loop.startskip      = 10;
 loop.skipevery      = 1000;
 loop.skipby         = 10000;
 loop.modalgainfile  = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="Simili Altair LGS, full diffraction WFS, spot elongation",
 pupildiam=120,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=40,screen=0x7fab3291afc0,layerfrac=0x7fab3291af38,
 layerspeed=0x7fab3291aeb0,layeralt=0x7fab3291ada0,winddir=0x7fab3301b238,
 _layeralt=0x7fab3291ac90)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=5,darkcurrent=
 0,gspos=[0,0],gsalt=95000,gsdepth=10000,laserpower=25,gsmag=0,skymag=20,
 filtertilt=1,correctUpTT=1,uplinkgain=0.1,dispzoom=2,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,
 rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=
 0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=12,
 npixpersub=0,pixsize=0.509149,npixels=4,spotpitch=4,extfield=2.0366,pupoffset=
 [0,0],shthmethod=1,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,
 flatrmserror=0,fsname=0x0,fstop="square",fssize=2.0366,fsoffset=[0,0],kernel=1,
 nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=
 0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=
 0x7fab3380c750,lgs_prof_alt=0x7fab3380b830,nzer=0,ndh=0,ndhfiltered=0,
 _initkernels=0,_svipc_init_done=0,_svipc_subok=0x7fab326332b0,_fork_subs=0x0,
 _fork_subs2=0x0,_validsubs=0x7fab3262e7c0,_origpixsize=0.5,_rebinfactor=8,
 _gsalt=95000,_gsdepth=10000,_nsub=112,_nsub4disp=132,_nmes=224,_sind=0x0,
 _nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x101847030,_masks=0x0,_fluxpersub=
 0x7fab3242fb30,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=
 0x7fab3242fd80,_skyfluxpersub=0x7fab3242ffd0,_nphotons=4767.43,_skynphotons=
 0.00458332,_tt=[-0.0066128,-0.0132231],_lastvalidtt=[-0.0066128,-0.0132231],
 _upttcommand=[0.000911246,0.00177957],_refmes=0x7fab32431730,_tiprefv=
 0x7fab329cfc30,_tiltrefv=0x7fab329ea230,_tiprefvn=0x7fab329d1c30,_tiltrefvn=
 0x7fab32869e30,_reordervec=0x0,_npixels=4,_npb=0,_sdim=32,_nx=32,_nx4fft=32,
 _istart=0x7fab3262baf0,_jstart=0x7fab326303a0,_binindices=0x7fab329e0c30,
 _binxy=4,_centroidw=0x7fab3380c168,_fimage=0x7fab338b2230,_fimage2=0x0,
 _imistart=0x7fab3242f1f0,_imjstart=0x7fab3242f440,_imistart2=0x7fab3242f690,
 _imjstart2=0x7fab3242f8e0,_unittip=0x7fab3262e460,_unittilt=0x7fab3262cc80,
 _lgs_defocuses=0x7fab3380c398,_unitdefocus=0x10188d030,_fimnx=48,_fimny=48,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fab329eaa30,_flat=0x7fab32855630,_domask=1,
 _submask=0x7fab329d0a30,_kernel=0x7fab33917030,_kernels=0x1011bf030,_kerfftr=
 0x1012f6030,_kerffti=0x10137b030,_kernelconv=1,_cyclecounter=1,_dispimage=
 0x7fab339ace30,_x=0x7fab33949c30,_y=0x7fab3383aa30,_centroidgain=1,_rayleigh=
 0x7fab3380bd08,_bckgrdcalib=0x7fab329e7c30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=2,lambda=0.65,noise=1,ron=5,darkcurrent=200,gspos=[0,0],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=15,skymag=18.5,filtertilt=0,correctUpTT=0,
 uplinkgain=0,dispzoom=0.15,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,
 ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=1,npixpersub=0,pixsize=0.501194,npixels=4,
 spotpitch=4,extfield=2.00477,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.00477,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fab3380b7f8,lgs_prof_alt=
 0x7fab3380c718,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fab3380c788,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fab3380c600,_origpixsize=0.5,_rebinfactor=63,_gsalt=0,_gsdepth=0,_nsub=1,
 _nsub4disp=1,_nmes=2,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x100e3b030,_masks=0x0,_fluxpersub=0x7fab3380cc98,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fab3380c7c0,_skyfluxpersub=0x7fab3380c590,
 _nphotons=254.597,_skynphotons=2.54603,_tt=[0.0664746,-0.0797795],_lastvalidtt=
 [0.0664746,-0.0797795],_upttcommand=[0,0],_refmes=0x7fab3380c280,_tiprefv=
 0x7fab3380c2b8,_tiltrefv=0x7fab3380c248,_tiprefvn=0x7fab3380c1d8,_tiltrefvn=
 0x7fab3380c0f8,_reordervec=0x0,_npixels=4,_npb=0,_sdim=256,_nx=252,_nx4fft=252,
 _istart=0x7fab3380ca68,_jstart=0x7fab3380cb80,_binindices=0x101ab1030,_binxy=4,
 _centroidw=0x7fab3380b6a8,_fimage=0x7fab3301cd50,_fimage2=0x0,_imistart=
 0x7fab3380be20,_imjstart=0x7fab3380cc28,_imistart2=0x7fab3380cde8,_imjstart2=
 0x7fab3380c5c8,_unittip=0x7fab32858e30,_unittilt=0x7fab32979630,_lgs_defocuses=
 0x7fab3380c4b0,_unitdefocus=0x100dba030,_fimnx=4,_fimny=4,_fimny2=0x0,_yoffset=
 0x0,_bias=0x7fab3301aa60,_flat=0x7fab3301b568,_domask=1,_submask=0x1016ed030,
 _kernel=0x101dec030,_kernels=0x101244030,_kerfftr=0x10166f030,_kerffti=
 0x1016ae030,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fab3301cff8,_x=
 0x7fab3380cd08,_y=0x7fab3380c088,_centroidgain=1,_rayleigh=0x7fab3380ccd0,
 _bckgrdcalib=0x7fab3301b458,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test1-if1.fits",pitch=10,alt=0,hyst=0,push4imat=50,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fab3380c328,_ctrlden=0x7fab3380d130,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=13,pitchMargin=0,coupling=0.15,
 ecmatfile="test1-ecmat1.fits",noextrap=0,elt=1,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fab3262fdb0,_xlast=0x7fab32631850,_ylast=[0x7fab338dcc30,0x7fab338dcc30,
 0x7fab338dcc30],_y0=0x7fab33919a30,_signus=0x7fab33913c30,_puppixoffset=[0,0],
 _nact=137,_def=0x101400030,_x=0x7fab32634ac0,_y=0x7fab326305f0,_i1=
 0x7fab32630860,_j1=0x7fab32630ad0,_ei1=0x7fab32811820,_ej1=0x7fab340a7f70,
 _indval=0x7fab3383d630,_indext=0x7fab32811508,_eiffile="test1-if1-ext.fits",
 _edef=0x7fab338dfc30,_ex=0x7fab338de590,_ey=0x7fab338decc8,_enact=20,_n1=60,
 _n2=197,_pupil=0x0,_command=0x7fab32504490,_flat_command=0x0,_extrapcmat=
 0x7fab33904a30,_eltdefsize=38,_regmatrix=0x0,_fMat=0x0),dm_struct(type=
 "tiptilt",subsystem=2,virtual=0,dmfit_which=0x0,iffile="test1-if2.fits",pitch=
 0,alt=0,hyst=0,push4imat=10,thresholdresp=0.3,unitpervolt=0.0005,maxvolt=0,
 gain=0.3,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7fab3380bdb0,_ctrlden=
 0x7fab3380c670,misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],disjointpup=0,
 pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,use_def_of=0,
 ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=0x0,
 supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,ecmatfile=
 "test1-ecmat2.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,nzer=0,
 minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,regmatrix=0x0,
 _alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fab3380c830,_xlast=0x7fab3380cf00,_ylast=[0x7fab3301b678,0x7fab3301b678,
 0x7fab3301b678],_y0=0x7fab3301bcd8,_signus=0x7fab3380c018,_puppixoffset=[0,0],
 _nact=2,_def=0x101a5a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test1-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=60,_n2=197,_pupil=0x0,_command=0x7fab3380c3d0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fab3380c2f0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test1-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fab3380c520,xposition=0x7fab3380cb48,yposition=
 0x7fab3380bb80,dispzoom=0x7fab3291b048,ncpdm=0x0,_ntarget=3,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=22)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
Simili Altair LGS, full diffraction WFS, spot elongation
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.5091  0.0636  0.5091   2.04  2.04  2.04    4x 4    4x 4    4767.4
 2      0.5012  0.0080  0.5012   2.04  2.00  2.00    4x 4    4x 4    254.6
 
Summary:
Mirror #1, stackarray, 137 actuators, conjugated @ 0 m
Mirror #2, tiptilt, 2 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 112 subap., offaxis (+0.0",+0.0"), noise enabled
WFS # 2, hartmann (meth. 2),  1 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 40.0; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       47.3   0.583       75.9
Star# 2     1.65   10.0   0.0       48.3   0.413      141.6
Star# 3     1.65   10.0  10.0       49.3   0.318      192.2
Field Avg  1.65                     48.3   0.438      136.6
Field rms  1.65                      0.8   0.110       47.6

Average images written in test1-imav.fits
Some other graphics in test1.ps

Original parameter file: test1.par:
 // YAO parameter file
 //-------------------------------
 sim.name            = "Simili Altair LGS, full diffraction WFS, spot elongation";
 sim.pupildiam       = 120;
 sim.debug           = 0;
 sim.verbose         = 0;
 
 //-------------------------------
 atm.dr0at05mic      = 40.;
 atm.screen          = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac       = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed      = &([11.,20,29,35]);
 atm.layeralt        = &([0.,400,6000,9000]);
 atm.winddir         = &([0,0,0,0]);
 
 //-------------------------------
 nwfs = 2; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type         = "hartmann";
 wfs(n).subsystem    = 1;
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 95000.;
 wfs(n).gsdepth      = 10000.;
 wfs(n).laserpower   = 25.;
 wfs(n).skymag       = 20.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 12;
 wfs(n).pixsize      = 0.5;
 wfs(n).npixels      = 4;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 wfs(n).filtertilt   = 1;
 wfs(n).correctUpTT  = 1;
 wfs(n).uplinkgain   = 0.1;
 wfs(n).kernel       = 1.0
 wfs(n).dispzoom     = 2.;
 wfs(n).noise        = 1;
 wfs(n).ron          = 5;
 
 n   = 2;
 wfs(n).type         = "hartmann";
 wfs(n).subsystem    = 2;
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 15.;
 wfs(n).skymag       = 18.5;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 1;
 wfs(n).pixsize      = 0.5;
 wfs(n).npixels      = 4;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 wfs(n).dispzoom     = 0.15;
 wfs(n).noise        = 1;
 wfs(n).ron          = 5;
 wfs(n).darkcurrent  = 200;
 
 
 //-------------------------------
 ndm = 2;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type          = "stackarray";
 dm(n).subsystem     = 1;
 dm(n).iffile        = "";
 dm(n).nxact         = 13;
 dm(n).pitch         = 10;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01;
 dm(n).push4imat     = 50;
 dm(n).elt           = 1;
 dm(n).coupling      = 0.15;
 
 n  =2;
 dm(n).type          = "tiptilt";
 dm(n).subsystem     = 2;
 dm(n).iffile        = "";
 dm(n).alt           = 0.;
 dm(n).unitpervolt   =  0.0005;
 dm(n).push4imat     = 10;
 dm(n).gain          = 0.3;
 
 //-------------------------------
 mat.condition       = &([15.,15.]);
 mat.file            = "";
 
 //-------------------------------
 tel.diam            = 7.9;
 tel.cobs            = 0.1125;
 
 //-------------------------------
 target.lambda       = &([1.65]);
 target.xposition    = &([0.,10,10]);
 target.yposition    = &([0,0,10]);
 target.dispzoom     = &([1.,1.,1.]);
 
 //-------------------------------
 gs.zeropoint        = 1e11;
 
 //-------------------------------
 loop.gain           = 0.6;
 loop.framedelay     = 1;
 loop.niter          = 1000;
 loop.ittime         = 2e-3;
 loop.startskip      = 10;
 loop.skipevery      = 1000;
 loop.skipby         = 10000;
 loop.modalgainfile  = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="Simili Altair LGS, full diffraction WFS, spot elongation",
 pupildiam=120,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=40,screen=0x7fa51a85ffc0,layerfrac=0x7fa51a85ff38,
 layerspeed=0x7fa51a85feb0,layeralt=0x7fa51a85fda0,winddir=0x7fa51a8d7638,
 _layeralt=0x7fa51a85fc90)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=5,darkcurrent=
 0,gspos=[0,0],gsalt=95000,gsdepth=10000,laserpower=25,gsmag=0,skymag=20,
 filtertilt=1,correctUpTT=1,uplinkgain=0.1,dispzoom=2,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,
 rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=
 0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=12,
 npixpersub=0,pixsize=0.509149,npixels=4,spotpitch=4,extfield=2.0366,pupoffset=
 [0,0],shthmethod=1,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,
 flatrmserror=0,fsname=0x0,fstop="square",fssize=2.0366,fsoffset=[0,0],kernel=1,
 nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=
 0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=
 0x7fa51a8a1b90,lgs_prof_alt=0x7fa51a867830,nzer=0,ndh=0,ndhfiltered=0,
 _initkernels=0,_svipc_init_done=0,_svipc_subok=0x7fa518c1e920,_fork_subs=0x0,
 _fork_subs2=0x0,_validsubs=0x7fa518c1a840,_origpixsize=0.5,_rebinfactor=8,
 _gsalt=95000,_gsdepth=10000,_nsub=112,_nsub4disp=132,_nmes=224,_sind=0x0,
 _nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x105cb5030,_masks=0x0,_fluxpersub=
 0x7fa518f3dd90,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=
 0x7fa518f3e2c0,_skyfluxpersub=0x7fa518c19d00,_nphotons=4767.43,_skynphotons=
 0.00458332,_tt=[-0.0066128,-0.0132231],_lastvalidtt=[-0.0066128,-0.0132231],
 _upttcommand=[0.000911246,0.00177957],_refmes=0x7fa518c19940,_tiprefv=
 0x7fa51a046230,_tiltrefv=0x7fa5190ff030,_tiprefvn=0x7fa51a01b430,_tiltrefvn=
 0x7fa51904cc30,_reordervec=0x0,_npixels=4,_npb=0,_sdim=32,_nx=32,_nx4fft=32,
 _istart=0x7fa518c1abe0,_jstart=0x7fa518c1ae30,_binindices=0x7fa519118c30,
 _binxy=4,_centroidw=0x7fa51a8a1768,_fimage=0x7fa51a9c7e30,_fimage2=0x0,
 _imistart=0x7fa518c1b520,_imjstart=0x7fa518c1b770,_imistart2=0x7fa518c1b9c0,
 _imjstart2=0x7fa518c1bc10,_unittip=0x7fa518c19000,_unittilt=0x7fa518c191d0,
 _lgs_defocuses=0x7fa51a8a1998,_unitdefocus=0x105cfb030,_fimnx=48,_fimny=48,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fa519110830,_flat=0x7fa5190dca30,_domask=1,
 _submask=0x7fa51a92f430,_kernel=0x7fa51a966830,_kernels=0x10562d030,_kerfftr=
 0x105764030,_kerffti=0x1057e9030,_kernelconv=1,_cyclecounter=1,_dispimage=
 0x7fa51a9cc830,_x=0x7fa5190b4630,_y=0x7fa51904e830,_centroidgain=1,_rayleigh=
 0x7fa51a8a1308,_bckgrdcalib=0x7fa5190e1430,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=2,lambda=0.65,noise=1,ron=5,darkcurrent=200,gspos=[0,0],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=15,skymag=18.5,filtertilt=0,correctUpTT=0,
 uplinkgain=0,dispzoom=0.15,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,
 ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=1,npixpersub=0,pixsize=0.501194,npixels=4,
 spotpitch=4,extfield=2.00477,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.00477,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fa51a8677f8,lgs_prof_alt=
 0x7fa51a8a1148,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fa51a8a25a8,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fa51a8a2378,_origpixsize=0.5,_rebinfactor=63,_gsalt=0,_gsdepth=0,_nsub=1,
 _nsub4disp=1,_nmes=2,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x1052a9030,_masks=0x0,_fluxpersub=0x7fa51a8a13b0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fa51a8a1dc0,_skyfluxpersub=0x7fa51a8a1c00,
 _nphotons=254.597,_skynphotons=2.54603,_tt=[0.0664746,-0.0797795],_lastvalidtt=
 [0.0664746,-0.0797795],_upttcommand=[0,0],_refmes=0x7fa51a8a1880,_tiprefv=
 0x7fa51a8a18b8,_tiltrefv=0x7fa51a8a1848,_tiprefvn=0x7fa51a8a17d8,_tiltrefvn=
 0x7fa51a8a16f8,_reordervec=0x0,_npixels=4,_npb=0,_sdim=256,_nx=252,_nx4fft=252,
 _istart=0x7fa51a8a1420,_jstart=0x7fa51a8a2228,_binindices=0x105efe030,_binxy=4,
 _centroidw=0x7fa51a8a20d8,_fimage=0x7fa51a8d7da8,_fimage2=0x0,_imistart=
 0x7fa51a8a1a78,_imjstart=0x7fa51a8a2180,_imistart2=0x7fa51a8a23e8,_imjstart2=
 0x7fa51a8a1bc8,_unittip=0x7fa51a9a6e30,_unittilt=0x7fa51a9b5030,_lgs_defocuses=
 0x7fa51a8a1ab0,_unitdefocus=0x105228030,_fimnx=4,_fimny=4,_fimny2=0x0,_yoffset=
 0x0,_bias=0x7fa51a8cfe60,_flat=0x7fa51a8d7968,_domask=1,_submask=0x105b5b030,
 _kernel=0x105d86030,_kernels=0x1056b2030,_kerfftr=0x105add030,_kerffti=
 0x105b1c030,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fa51a8d0218,_x=
 0x7fa51a8a14c8,_y=0x7fa51a8a2340,_centroidgain=1,_rayleigh=0x7fa51a8a1688,
 _bckgrdcalib=0x7fa51a8d7858,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test1-if1.fits",pitch=10,alt=0,hyst=0,push4imat=50,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fa51a8a2688,_ctrlden=0x7fa51a8a1c70,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=13,pitchMargin=0,coupling=0.15,
 ecmatfile="test1-ecmat1.fits",noextrap=0,elt=1,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fa518d0a640,_xlast=0x7fa518d0a8b0,_ylast=[0x7fa519867630,0x7fa519867630,
 0x7fa519867630],_y0=0x7fa519867e30,_signus=0x7fa519868630,_puppixoffset=[0,0],
 _nact=137,_def=0x10586e030,_x=0x7fa518c1dc80,_y=0x7fa518c1ee10,_i1=
 0x7fa518c1f080,_j1=0x7fa518c1f2f0,_ei1=0x7fa519810c20,_ej1=0x7fa51904a370,
 _indval=0x7fa519140c30,_indext=0x7fa519810908,_eiffile="test1-if1-ext.fits",
 _edef=0x7fa5191a6630,_ex=0x7fa51a96a190,_ey=0x7fa51a96a8c8,_enact=20,_n1=60,
 _n2=197,_pupil=0x0,_command=0x7fa518f3ed50,_flat_command=0x0,_extrapcmat=
 0x7fa51a08b830,_eltdefsize=38,_regmatrix=0x0,_fMat=0x0),dm_struct(type=
 "tiptilt",subsystem=2,virtual=0,dmfit_which=0x0,iffile="test1-if2.fits",pitch=
 0,alt=0,hyst=0,push4imat=10,thresholdresp=0.3,unitpervolt=0.0005,maxvolt=0,
 gain=0.3,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7fa51a8a13e8,_ctrlden=
 0x7fa51a8a2618,misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],disjointpup=0,
 pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,use_def_of=0,
 ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=0x0,
 supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,ecmatfile=
 "test1-ecmat2.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,nzer=0,
 minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,regmatrix=0x0,
 _alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fa51a8a1618,_xlast=0x7fa51a8a1570,_ylast=[0x7fa51a8d81e8,0x7fa51a8d81e8,
 0x7fa51a8d81e8],_y0=0x7fa51a8d7fc8,_signus=0x7fa51a8a1ca8,_puppixoffset=[0,0],
 _nact=2,_def=0x105f3d030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test1-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=60,_n2=197,_pupil=0x0,_command=0x7fa51a8a23b0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fa51a8a18f0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test1-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fa51a8a1b20,xposition=0x7fa51a8a2110,yposition=
 0x7fa51a8a1180,dispzoom=0x7fa51a860048,ncpdm=0x0,_ntarget=3,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=22)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       47.3   0.583       75.9
Star# 2     1.65   10.0   0.0       48.3   0.413      141.6
Star# 3     1.65   10.0  10.0       49.3   0.318      192.2
Field Avg  1.65                     48.3   0.438      136.6
Field rms  1.65                      0.8   0.110       47.6

Average images written in test1-imav.fits
Some other graphics in test1.ps

Original parameter file: test1.par:
 // YAO parameter file
 //-------------------------------
 sim.name            = "Simili Altair LGS, full diffraction WFS, spot elongation";
 sim.pupildiam       = 120;
 sim.debug           = 0;
 sim.verbose         = 0;
 
 //-------------------------------
 atm.dr0at05mic      = 40.;
 atm.screen          = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac       = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed      = &([11.,20,29,35]);
 atm.layeralt        = &([0.,400,6000,9000]);
 atm.winddir         = &([0,0,0,0]);
 
 //-------------------------------
 nwfs = 2; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type         = "hartmann";
 wfs(n).subsystem    = 1;
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 95000.;
 wfs(n).gsdepth      = 10000.;
 wfs(n).laserpower   = 25.;
 wfs(n).skymag       = 20.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 12;
 wfs(n).pixsize      = 0.5;
 wfs(n).npixels      = 4;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 wfs(n).filtertilt   = 1;
 wfs(n).correctUpTT  = 1;
 wfs(n).uplinkgain   = 0.1;
 wfs(n).kernel       = 1.0
 wfs(n).dispzoom     = 2.;
 wfs(n).noise        = 1;
 wfs(n).ron          = 5;
 
 n   = 2;
 wfs(n).type         = "hartmann";
 wfs(n).subsystem    = 2;
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 15.;
 wfs(n).skymag       = 18.5;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 1;
 wfs(n).pixsize      = 0.5;
 wfs(n).npixels      = 4;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 wfs(n).dispzoom     = 0.15;
 wfs(n).noise        = 1;
 wfs(n).ron          = 5;
 wfs(n).darkcurrent  = 200;
 
 
 //-------------------------------
 ndm = 2;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type          = "stackarray";
 dm(n).subsystem     = 1;
 dm(n).iffile        = "";
 dm(n).nxact         = 13;
 dm(n).pitch         = 10;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01;
 dm(n).push4imat     = 50;
 dm(n).elt           = 1;
 dm(n).coupling      = 0.15;
 
 n  =2;
 dm(n).type          = "tiptilt";
 dm(n).subsystem     = 2;
 dm(n).iffile        = "";
 dm(n).alt           = 0.;
 dm(n).unitpervolt   =  0.0005;
 dm(n).push4imat     = 10;
 dm(n).gain          = 0.3;
 
 //-------------------------------
 mat.condition       = &([15.,15.]);
 mat.file            = "";
 
 //-------------------------------
 tel.diam            = 7.9;
 tel.cobs            = 0.1125;
 
 //-------------------------------
 target.lambda       = &([1.65]);
 target.xposition    = &([0.,10,10]);
 target.yposition    = &([0,0,10]);
 target.dispzoom     = &([1.,1.,1.]);
 
 //-------------------------------
 gs.zeropoint        = 1e11;
 
 //-------------------------------
 loop.gain           = 0.6;
 loop.framedelay     = 1;
 loop.niter          = 1000;
 loop.ittime         = 2e-3;
 loop.startskip      = 10;
 loop.skipevery      = 1000;
 loop.skipby         = 10000;
 loop.modalgainfile  = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="Simili Altair LGS, full diffraction WFS, spot elongation",
 pupildiam=120,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=40,screen=0x7fa51a85ffc0,layerfrac=0x7fa51a85ff38,
 layerspeed=0x7fa51a85feb0,layeralt=0x7fa51a85fda0,winddir=0x7fa51a8d7638,
 _layeralt=0x7fa51a85fc90)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=5,darkcurrent=
 0,gspos=[0,0],gsalt=95000,gsdepth=10000,laserpower=25,gsmag=0,skymag=20,
 filtertilt=1,correctUpTT=1,uplinkgain=0.1,dispzoom=2,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,
 rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=
 0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=12,
 npixpersub=0,pixsize=0.509149,npixels=4,spotpitch=4,extfield=2.0366,pupoffset=
 [0,0],shthmethod=1,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,
 flatrmserror=0,fsname=0x0,fstop="square",fssize=2.0366,fsoffset=[0,0],kernel=1,
 nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=
 0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=
 0x7fa51a8a1b90,lgs_prof_alt=0x7fa51a867830,nzer=0,ndh=0,ndhfiltered=0,
 _initkernels=0,_svipc_init_done=0,_svipc_subok=0x7fa518c1d1a0,_fork_subs=0x0,
 _fork_subs2=0x0,_validsubs=0x7fa518c1a840,_origpixsize=0.5,_rebinfactor=8,
 _gsalt=95000,_gsdepth=10000,_nsub=112,_nsub4disp=132,_nmes=224,_sind=0x0,
 _nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x105cb5030,_masks=0x0,_fluxpersub=
 0x7fa518f3dd90,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=
 0x7fa518f3e2c0,_skyfluxpersub=0x7fa518c19d00,_nphotons=4767.43,_skynphotons=
 0.00458332,_tt=[-0.0066128,-0.0132231],_lastvalidtt=[-0.0066128,-0.0132231],
 _upttcommand=[0.000911246,0.00177957],_refmes=0x7fa518c19940,_tiprefv=
 0x7fa51a046230,_tiltrefv=0x7fa5190ff030,_tiprefvn=0x7fa51a01b430,_tiltrefvn=
 0x7fa51904cc30,_reordervec=0x0,_npixels=4,_npb=0,_sdim=32,_nx=32,_nx4fft=32,
 _istart=0x7fa518c1abe0,_jstart=0x7fa518c1ae30,_binindices=0x7fa519118c30,
 _binxy=4,_centroidw=0x7fa51a8a1768,_fimage=0x7fa519138c30,_fimage2=0x0,
 _imistart=0x7fa518c1b520,_imjstart=0x7fa518c1b770,_imistart2=0x7fa518c1b9c0,
 _imjstart2=0x7fa518c1bc10,_unittip=0x7fa518c19000,_unittilt=0x7fa518c191d0,
 _lgs_defocuses=0x7fa51a8a1998,_unitdefocus=0x105cfb030,_fimnx=48,_fimny=48,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fa519110830,_flat=0x7fa5190dca30,_domask=1,
 _submask=0x7fa51a92f430,_kernel=0x7fa519100430,_kernels=0x10562d030,_kerfftr=
 0x105764030,_kerffti=0x1057e9030,_kernelconv=1,_cyclecounter=1,_dispimage=
 0x7fa519866e30,_x=0x7fa5190b4630,_y=0x7fa51904e830,_centroidgain=1,_rayleigh=
 0x7fa51a8a1308,_bckgrdcalib=0x7fa5190e1430,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=2,lambda=0.65,noise=1,ron=5,darkcurrent=200,gspos=[0,0],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=15,skymag=18.5,filtertilt=0,correctUpTT=0,
 uplinkgain=0,dispzoom=0.15,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,
 ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=1,npixpersub=0,pixsize=0.501194,npixels=4,
 spotpitch=4,extfield=2.00477,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.00477,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fa51a8677f8,lgs_prof_alt=
 0x7fa51a8a1148,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fa51a8a2730,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fa51a8a2378,_origpixsize=0.5,_rebinfactor=63,_gsalt=0,_gsdepth=0,_nsub=1,
 _nsub4disp=1,_nmes=2,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x1052a9030,_masks=0x0,_fluxpersub=0x7fa51a8a13b0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fa51a8a1dc0,_skyfluxpersub=0x7fa51a8a1c00,
 _nphotons=254.597,_skynphotons=2.54603,_tt=[0.0664746,-0.0797795],_lastvalidtt=
 [0.0664746,-0.0797795],_upttcommand=[0,0],_refmes=0x7fa51a8a1880,_tiprefv=
 0x7fa51a8a18b8,_tiltrefv=0x7fa51a8a1848,_tiprefvn=0x7fa51a8a17d8,_tiltrefvn=
 0x7fa51a8a16f8,_reordervec=0x0,_npixels=4,_npb=0,_sdim=256,_nx=252,_nx4fft=252,
 _istart=0x7fa51a8a1420,_jstart=0x7fa51a8a2228,_binindices=0x105efe030,_binxy=4,
 _centroidw=0x7fa51a8a20d8,_fimage=0x7fa51a8d9150,_fimage2=0x0,_imistart=
 0x7fa51a8a1a78,_imjstart=0x7fa51a8a2180,_imistart2=0x7fa51a8a23e8,_imjstart2=
 0x7fa51a8a1bc8,_unittip=0x7fa51a9a6e30,_unittilt=0x7fa51a9b5030,_lgs_defocuses=
 0x7fa51a8a1ab0,_unitdefocus=0x105228030,_fimnx=4,_fimny=4,_fimny2=0x0,_yoffset=
 0x0,_bias=0x7fa51a8cfe60,_flat=0x7fa51a8d7968,_domask=1,_submask=0x105b5b030,
 _kernel=0x106278030,_kernels=0x1056b2030,_kerfftr=0x105add030,_kerffti=
 0x105b1c030,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fa51a8d93f8,_x=
 0x7fa51a8a14c8,_y=0x7fa51a8a2340,_centroidgain=1,_rayleigh=0x7fa51a8a1688,
 _bckgrdcalib=0x7fa51a8d7858,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test1-if1.fits",pitch=10,alt=0,hyst=0,push4imat=50,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fa51a8a27a0,_ctrlden=0x7fa51a867750,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=13,pitchMargin=0,coupling=0.15,
 ecmatfile="test1-ecmat1.fits",noextrap=0,elt=1,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fa518e0fd40,_xlast=0x7fa518e0ffb0,_ylast=[0x7fa51a049c30,0x7fa51a049c30,
 0x7fa51a049c30],_y0=0x7fa51a049430,_signus=0x7fa51a048e30,_puppixoffset=[0,0],
 _nact=137,_def=0x10586e030,_x=0x7fa518c1dc80,_y=0x7fa518c1ee10,_i1=
 0x7fa518c1f080,_j1=0x7fa518c1f2f0,_ei1=0x7fa519810c20,_ej1=0x7fa51904a370,
 _indval=0x7fa519140c30,_indext=0x7fa519810908,_eiffile="test1-if1-ext.fits",
 _edef=0x7fa5191a6630,_ex=0x7fa51a96a190,_ey=0x7fa51a96a8c8,_enact=20,_n1=60,
 _n2=197,_pupil=0x0,_command=0x7fa518e10490,_flat_command=0x0,_extrapcmat=
 0x7fa51a08b830,_eltdefsize=38,_regmatrix=0x0,_fMat=0x0),dm_struct(type=
 "tiptilt",subsystem=2,virtual=0,dmfit_which=0x0,iffile="test1-if2.fits",pitch=
 0,alt=0,hyst=0,push4imat=10,thresholdresp=0.3,unitpervolt=0.0005,maxvolt=0,
 gain=0.3,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7fa51a8a23b0,_ctrlden=
 0x7fa51a8a16c0,misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],disjointpup=0,
 pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,use_def_of=0,
 ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=0x0,
 supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,ecmatfile=
 "test1-ecmat2.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,nzer=0,
 minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,regmatrix=0x0,
 _alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fa51a8a2688,_xlast=0x7fa51a8a2618,_ylast=[0x7fa51a8d7a78,0x7fa51a8d7a78,
 0x7fa51a8d7a78],_y0=0x7fa51a8d80d8,_signus=0x7fa51a8a1618,_puppixoffset=[0,0],
 _nact=2,_def=0x105f3d030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test1-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=60,_n2=197,_pupil=0x0,_command=0x7fa51a8a13e8,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fa51a8a18f0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test1-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fa51a8a1b20,xposition=0x7fa51a8a2110,yposition=
 0x7fa51a8a1180,dispzoom=0x7fa51a860048,ncpdm=0x0,_ntarget=3,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=22)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
=============================
Simili Altair LGS, full diffraction WFS, spot elongation
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.5091  0.0636  0.5091   2.04  2.04  2.04    4x 4    4x 4    4767.4
 2      0.5012  0.0080  0.5012   2.04  2.00  2.00    4x 4    4x 4    254.6
 
Summary:
Mirror #1, stackarray, 137 actuators, conjugated @ 0 m
Mirror #2, tiptilt, 2 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 112 subap., offaxis (+0.0",+0.0"), noise enabled
WFS # 2, hartmann (meth. 2),  1 subap., offaxis (+0.0",+0.0"), noise enabled
D/r0 (500nm) = 40.0; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       47.3   0.583       75.9
Star# 2     1.65   10.0   0.0       48.3   0.413      141.6
Star# 3     1.65   10.0  10.0       49.3   0.318      192.2
Field Avg  1.65                     48.3   0.438      136.6
Field rms  1.65                      0.8   0.110       47.6

Average images written in test1-imav.fits
Some other graphics in test1.ps

Original parameter file: test1.par:
 // YAO parameter file
 //-------------------------------
 sim.name            = "Simili Altair LGS, full diffraction WFS, spot elongation";
 sim.pupildiam       = 120;
 sim.debug           = 0;
 sim.verbose         = 0;
 
 //-------------------------------
 atm.dr0at05mic      = 40.;
 atm.screen          = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac       = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed      = &([11.,20,29,35]);
 atm.layeralt        = &([0.,400,6000,9000]);
 atm.winddir         = &([0,0,0,0]);
 
 //-------------------------------
 nwfs = 2; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type         = "hartmann";
 wfs(n).subsystem    = 1;
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 95000.;
 wfs(n).gsdepth      = 10000.;
 wfs(n).laserpower   = 25.;
 wfs(n).skymag       = 20.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 12;
 wfs(n).pixsize      = 0.5;
 wfs(n).npixels      = 4;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 wfs(n).filtertilt   = 1;
 wfs(n).correctUpTT  = 1;
 wfs(n).uplinkgain   = 0.1;
 wfs(n).kernel       = 1.0
 wfs(n).dispzoom     = 2.;
 wfs(n).noise        = 1;
 wfs(n).ron          = 5;
 
 n   = 2;
 wfs(n).type         = "hartmann";
 wfs(n).subsystem    = 2;
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 15.;
 wfs(n).skymag       = 18.5;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 1;
 wfs(n).pixsize      = 0.5;
 wfs(n).npixels      = 4;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 wfs(n).dispzoom     = 0.15;
 wfs(n).noise        = 1;
 wfs(n).ron          = 5;
 wfs(n).darkcurrent  = 200;
 
 
 //-------------------------------
 ndm = 2;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type          = "stackarray";
 dm(n).subsystem     = 1;
 dm(n).iffile        = "";
 dm(n).nxact         = 13;
 dm(n).pitch         = 10;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01;
 dm(n).push4imat     = 50;
 dm(n).elt           = 1;
 dm(n).coupling      = 0.15;
 
 n  =2;
 dm(n).type          = "tiptilt";
 dm(n).subsystem     = 2;
 dm(n).iffile        = "";
 dm(n).alt           = 0.;
 dm(n).unitpervolt   =  0.0005;
 dm(n).push4imat     = 10;
 dm(n).gain          = 0.3;
 
 //-------------------------------
 mat.condition       = &([15.,15.]);
 mat.file            = "";
 
 //-------------------------------
 tel.diam            = 7.9;
 tel.cobs            = 0.1125;
 
 //-------------------------------
 target.lambda       = &([1.65]);
 target.xposition    = &([0.,10,10]);
 target.yposition    = &([0,0,10]);
 target.dispzoom     = &([1.,1.,1.]);
 
 //-------------------------------
 gs.zeropoint        = 1e11;
 
 //-------------------------------
 loop.gain           = 0.6;
 loop.framedelay     = 1;
 loop.niter          = 1000;
 loop.ittime         = 2e-3;
 loop.startskip      = 10;
 loop.skipevery      = 1000;
 loop.skipby         = 10000;
 loop.modalgainfile  = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="Simili Altair LGS, full diffraction WFS, spot elongation",
 pupildiam=120,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=40,screen=0x7faf8b0c69c0,layerfrac=0x7faf8b0c6938,
 layerspeed=0x7faf8b0c68b0,layeralt=0x7faf8b0c67a0,winddir=0x7faf8a0c4e38,
 _layeralt=0x7faf8b0c6690)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=5,darkcurrent=
 0,gspos=[0,0],gsalt=95000,gsdepth=10000,laserpower=25,gsmag=0,skymag=20,
 filtertilt=1,correctUpTT=1,uplinkgain=0.1,dispzoom=2,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,
 rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=
 0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=12,
 npixpersub=0,pixsize=0.509149,npixels=4,spotpitch=4,extfield=2.0366,pupoffset=
 [0,0],shthmethod=1,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,
 flatrmserror=0,fsname=0x0,fstop="square",fssize=2.0366,fsoffset=[0,0],kernel=1,
 nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=
 0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=
 0x7faf8a09a000,lgs_prof_alt=0x7faf8a07c830,nzer=0,ndh=0,ndhfiltered=0,
 _initkernels=0,_svipc_init_done=0,_svipc_subok=0x7faf89f1f080,_fork_subs=0x0,
 _fork_subs2=0x0,_validsubs=0x7faf89f1aff0,_origpixsize=0.5,_rebinfactor=8,
 _gsalt=95000,_gsdepth=10000,_nsub=112,_nsub4disp=132,_nmes=224,_sind=0x0,
 _nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x108a1d030,_masks=0x0,_fluxpersub=
 0x7faf89d0a7f0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=
 0x7faf89d0ab80,_skyfluxpersub=0x7faf89f1bd70,_nphotons=4767.43,_skynphotons=
 0.00458332,_tt=[-0.0066128,-0.0132231],_lastvalidtt=[-0.0066128,-0.0132231],
 _upttcommand=[0.000911246,0.00177957],_refmes=0x7faf89e2fe50,_tiprefv=
 0x7faf8a08ea30,_tiltrefv=0x7faf8a167230,_tiprefvn=0x7faf8a087830,_tiltrefvn=
 0x7faf8a0fa830,_reordervec=0x0,_npixels=4,_npb=0,_sdim=32,_nx=32,_nx4fft=32,
 _istart=0x7faf89f1b520,_jstart=0x7faf89f1bb20,_binindices=0x7faf8b2a5030,
 _binxy=4,_centroidw=0x7faf8a099b68,_fimage=0x7faf8a840630,_fimage2=0x0,
 _imistart=0x7faf89e2e5e0,_imjstart=0x7faf89e2e830,_imistart2=0x7faf89e2ea80,
 _imjstart2=0x7faf89e2ecd0,_unittip=0x7faf89f1d000,_unittilt=0x7faf89f1b350,
 _lgs_defocuses=0x7faf8a099d98,_unitdefocus=0x108a63030,_fimnx=48,_fimny=48,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7faf8b82cc30,_flat=0x7faf8b82f230,_domask=1,
 _submask=0x7faf8a851030,_kernel=0x7faf8a162030,_kernels=0x108395030,_kerfftr=
 0x1084cc030,_kerffti=0x108551030,_kernelconv=1,_cyclecounter=1,_dispimage=
 0x7faf8b84ca30,_x=0x7faf8b808e30,_y=0x7faf8b807a30,_centroidgain=1,_rayleigh=
 0x7faf8a099708,_bckgrdcalib=0x7faf8b820830,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=2,lambda=0.65,noise=1,ron=5,darkcurrent=200,gspos=[0,0],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=15,skymag=18.5,filtertilt=0,correctUpTT=0,
 uplinkgain=0,dispzoom=0.15,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,
 ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=1,npixpersub=0,pixsize=0.501194,npixels=4,
 spotpitch=4,extfield=2.00477,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.00477,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7faf8a07c7f8,lgs_prof_alt=
 0x7faf8a09a628,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7faf8a099a88,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7faf8a0997e8,_origpixsize=0.5,_rebinfactor=63,_gsalt=0,_gsdepth=0,_nsub=1,
 _nsub4disp=1,_nmes=2,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x108011030,_masks=0x0,_fluxpersub=0x7faf8a09a150,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7faf8a09a1c0,_skyfluxpersub=0x7faf8a09a778,
 _nphotons=254.597,_skynphotons=2.54603,_tt=[0.0664746,-0.0797795],_lastvalidtt=
 [0.0664746,-0.0797795],_upttcommand=[0,0],_refmes=0x7faf8a099c80,_tiprefv=
 0x7faf8a099cb8,_tiltrefv=0x7faf8a099c48,_tiprefvn=0x7faf8a099bd8,_tiltrefvn=
 0x7faf8a099af8,_reordervec=0x0,_npixels=4,_npb=0,_sdim=256,_nx=252,_nx4fft=252,
 _istart=0x7faf8a09a230,_jstart=0x7faf8a099820,_binindices=0x108c66030,_binxy=4,
 _centroidw=0x7faf8a099f90,_fimage=0x7faf8a0c55a8,_fimage2=0x0,_imistart=
 0x7faf8a09a188,_imjstart=0x7faf8a099d28,_imistart2=0x7faf8a09a7e8,_imjstart2=
 0x7faf8a09a0e0,_unittip=0x7faf8a177c30,_unittilt=0x7faf8a1c6a30,_lgs_defocuses=
 0x7faf8a099eb0,_unitdefocus=0x107f90030,_fimnx=4,_fimny=4,_fimny2=0x0,_yoffset=
 0x0,_bias=0x7faf8a0c4660,_flat=0x7faf8a0c5168,_domask=1,_submask=0x1088c3030,
 _kernel=0x108aee030,_kernels=0x10841a030,_kerfftr=0x108845030,_kerffti=
 0x108884030,_kernelconv=0,_cyclecounter=1,_dispimage=0x7faf8a0c4a18,_x=
 0x7faf8a09a118,_y=0x7faf8a099548,_centroidgain=1,_rayleigh=0x7faf8a09a6d0,
 _bckgrdcalib=0x7faf8a0c5058,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test1-if1.fits",pitch=10,alt=0,hyst=0,push4imat=50,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7faf8a099dd0,_ctrlden=0x7faf8a0998c8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=13,pitchMargin=0,coupling=0.15,
 ecmatfile="test1-ecmat1.fits",noextrap=0,elt=1,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf89d0aea0,_xlast=0x7faf89d0b230,_ylast=[0x7faf8a83fe30,0x7faf8a83fe30,
 0x7faf8a83fe30],_y0=0x7faf8a843a30,_signus=0x7faf8a838830,_puppixoffset=[0,0],
 _nact=137,_def=0x1085d6030,_x=0x7faf89e30c00,_y=0x7faf89e31e20,_i1=
 0x7faf89e32090,_j1=0x7faf89e2dfe0,_ei1=0x7faf8a810c20,_ej1=0x7faf8b12ed70,
 _indval=0x7faf8b130830,_indext=0x7faf8a810908,_eiffile="test1-if1-ext.fits",
 _edef=0x7faf8b1dfa30,_ex=0x7faf8b81b190,_ey=0x7faf8b81b8c8,_enact=20,_n1=60,
 _n2=197,_pupil=0x0,_command=0x7faf89f1e0c0,_flat_command=0x0,_extrapcmat=
 0x7faf8b15c830,_eltdefsize=38,_regmatrix=0x0,_fMat=0x0),dm_struct(type=
 "tiptilt",subsystem=2,virtual=0,dmfit_which=0x0,iffile="test1-if2.fits",pitch=
 0,alt=0,hyst=0,push4imat=10,thresholdresp=0.3,unitpervolt=0.0005,maxvolt=0,
 gain=0.3,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7faf8a09a070,_ctrlden=
 0x7faf8a09aa50,misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],disjointpup=0,
 pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,use_def_of=0,
 ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=0x0,
 supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,ecmatfile=
 "test1-ecmat2.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,nzer=0,
 minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,regmatrix=0x0,
 _alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf8a099a18,_xlast=0x7faf8a099970,_ylast=[0x7faf8a0c59e8,0x7faf8a0c59e8,
 0x7faf8a0c59e8],_y0=0x7faf8a0c57c8,_signus=0x7faf8a09a0a8,_puppixoffset=[0,0],
 _nact=2,_def=0x108ca5030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test1-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=60,_n2=197,_pupil=0x0,_command=0x7faf8a099ee8,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7faf8a099cf0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test1-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7faf8a099f20,xposition=0x7faf8a099660,yposition=
 0x7faf8a099580,dispzoom=0x7faf8b0c6a48,ncpdm=0x0,_ntarget=3,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=22)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       47.3   0.583       75.9
Star# 2     1.65   10.0   0.0       48.3   0.413      141.6
Star# 3     1.65   10.0  10.0       49.3   0.318      192.2
Field Avg  1.65                     48.3   0.438      136.6
Field rms  1.65                      0.8   0.110       47.6

Average images written in test1-imav.fits
Some other graphics in test1.ps

Original parameter file: test1.par:
 // YAO parameter file
 //-------------------------------
 sim.name            = "Simili Altair LGS, full diffraction WFS, spot elongation";
 sim.pupildiam       = 120;
 sim.debug           = 0;
 sim.verbose         = 0;
 
 //-------------------------------
 atm.dr0at05mic      = 40.;
 atm.screen          = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac       = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed      = &([11.,20,29,35]);
 atm.layeralt        = &([0.,400,6000,9000]);
 atm.winddir         = &([0,0,0,0]);
 
 //-------------------------------
 nwfs = 2; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type         = "hartmann";
 wfs(n).subsystem    = 1;
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 95000.;
 wfs(n).gsdepth      = 10000.;
 wfs(n).laserpower   = 25.;
 wfs(n).skymag       = 20.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 12;
 wfs(n).pixsize      = 0.5;
 wfs(n).npixels      = 4;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 wfs(n).filtertilt   = 1;
 wfs(n).correctUpTT  = 1;
 wfs(n).uplinkgain   = 0.1;
 wfs(n).kernel       = 1.0
 wfs(n).dispzoom     = 2.;
 wfs(n).noise        = 1;
 wfs(n).ron          = 5;
 
 n   = 2;
 wfs(n).type         = "hartmann";
 wfs(n).subsystem    = 2;
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 15.;
 wfs(n).skymag       = 18.5;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 1;
 wfs(n).pixsize      = 0.5;
 wfs(n).npixels      = 4;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 wfs(n).dispzoom     = 0.15;
 wfs(n).noise        = 1;
 wfs(n).ron          = 5;
 wfs(n).darkcurrent  = 200;
 
 
 //-------------------------------
 ndm = 2;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type          = "stackarray";
 dm(n).subsystem     = 1;
 dm(n).iffile        = "";
 dm(n).nxact         = 13;
 dm(n).pitch         = 10;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01;
 dm(n).push4imat     = 50;
 dm(n).elt           = 1;
 dm(n).coupling      = 0.15;
 
 n  =2;
 dm(n).type          = "tiptilt";
 dm(n).subsystem     = 2;
 dm(n).iffile        = "";
 dm(n).alt           = 0.;
 dm(n).unitpervolt   =  0.0005;
 dm(n).push4imat     = 10;
 dm(n).gain          = 0.3;
 
 //-------------------------------
 mat.condition       = &([15.,15.]);
 mat.file            = "";
 
 //-------------------------------
 tel.diam            = 7.9;
 tel.cobs            = 0.1125;
 
 //-------------------------------
 target.lambda       = &([1.65]);
 target.xposition    = &([0.,10,10]);
 target.yposition    = &([0,0,10]);
 target.dispzoom     = &([1.,1.,1.]);
 
 //-------------------------------
 gs.zeropoint        = 1e11;
 
 //-------------------------------
 loop.gain           = 0.6;
 loop.framedelay     = 1;
 loop.niter          = 1000;
 loop.ittime         = 2e-3;
 loop.startskip      = 10;
 loop.skipevery      = 1000;
 loop.skipby         = 10000;
 loop.modalgainfile  = "simulModeGains.fits";
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="Simili Altair LGS, full diffraction WFS, spot elongation",
 pupildiam=120,pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,
 svipc_wfs_forknb=0x0,shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=40,screen=0x7faf8b0c69c0,layerfrac=0x7faf8b0c6938,
 layerspeed=0x7faf8b0c68b0,layeralt=0x7faf8b0c67a0,winddir=0x7faf8a0c4e38,
 _layeralt=0x7faf8b0c6690)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=5,darkcurrent=
 0,gspos=[0,0],gsalt=95000,gsdepth=10000,laserpower=25,gsmag=0,skymag=20,
 filtertilt=1,correctUpTT=1,uplinkgain=0.1,dispzoom=2,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,
 rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=
 0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=12,
 npixpersub=0,pixsize=0.509149,npixels=4,spotpitch=4,extfield=2.0366,pupoffset=
 [0,0],shthmethod=1,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,
 flatrmserror=0,fsname=0x0,fstop="square",fssize=2.0366,fsoffset=[0,0],kernel=1,
 nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=
 0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=
 0x7faf8a09a000,lgs_prof_alt=0x7faf8a07c830,nzer=0,ndh=0,ndhfiltered=0,
 _initkernels=0,_svipc_init_done=0,_svipc_subok=0x7faf89e2ef20,_fork_subs=0x0,
 _fork_subs2=0x0,_validsubs=0x7faf89f1aff0,_origpixsize=0.5,_rebinfactor=8,
 _gsalt=95000,_gsdepth=10000,_nsub=112,_nsub4disp=132,_nmes=224,_sind=0x0,
 _nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x108a1d030,_masks=0x0,_fluxpersub=
 0x7faf89d0a7f0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=
 0x7faf89d0ab80,_skyfluxpersub=0x7faf89f1bd70,_nphotons=4767.43,_skynphotons=
 0.00458332,_tt=[-0.0066128,-0.0132231],_lastvalidtt=[-0.0066128,-0.0132231],
 _upttcommand=[0.000911246,0.00177957],_refmes=0x7faf89e2fe50,_tiprefv=
 0x7faf8a08ea30,_tiltrefv=0x7faf8a167230,_tiprefvn=0x7faf8a087830,_tiltrefvn=
 0x7faf8a0fa830,_reordervec=0x0,_npixels=4,_npb=0,_sdim=32,_nx=32,_nx4fft=32,
 _istart=0x7faf89f1b520,_jstart=0x7faf89f1bb20,_binindices=0x7faf8b2a5030,
 _binxy=4,_centroidw=0x7faf8a099b68,_fimage=0x7faf8b83da30,_fimage2=0x0,
 _imistart=0x7faf89e2e5e0,_imjstart=0x7faf89e2e830,_imistart2=0x7faf89e2ea80,
 _imjstart2=0x7faf89e2ecd0,_unittip=0x7faf89f1d000,_unittilt=0x7faf89f1b350,
 _lgs_defocuses=0x7faf8a099d98,_unitdefocus=0x108a63030,_fimnx=48,_fimny=48,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7faf8b82cc30,_flat=0x7faf8b82f230,_domask=1,
 _submask=0x7faf8a851030,_kernel=0x7faf8a165830,_kernels=0x108395030,_kerfftr=
 0x1084cc030,_kerffti=0x108551030,_kernelconv=1,_cyclecounter=1,_dispimage=
 0x7faf8b842430,_x=0x7faf8b808e30,_y=0x7faf8b807a30,_centroidgain=1,_rayleigh=
 0x7faf8a099708,_bckgrdcalib=0x7faf8b820830,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=2,lambda=0.65,noise=1,ron=5,darkcurrent=200,gspos=[0,0],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=15,skymag=18.5,filtertilt=0,correctUpTT=0,
 uplinkgain=0,dispzoom=0.15,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,
 ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=1,npixpersub=0,pixsize=0.501194,npixels=4,
 spotpitch=4,extfield=2.00477,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.00477,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7faf8a07c7f8,lgs_prof_alt=
 0x7faf8a09a628,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7faf8a0994d8,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7faf8a0997e8,_origpixsize=0.5,_rebinfactor=63,_gsalt=0,_gsdepth=0,_nsub=1,
 _nsub4disp=1,_nmes=2,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x108011030,_masks=0x0,_fluxpersub=0x7faf8a09a150,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7faf8a09a1c0,_skyfluxpersub=0x7faf8a09a778,
 _nphotons=254.597,_skynphotons=2.54603,_tt=[0.0664746,-0.0797795],_lastvalidtt=
 [0.0664746,-0.0797795],_upttcommand=[0,0],_refmes=0x7faf8a099c80,_tiprefv=
 0x7faf8a099cb8,_tiltrefv=0x7faf8a099c48,_tiprefvn=0x7faf8a099bd8,_tiltrefvn=
 0x7faf8a099af8,_reordervec=0x0,_npixels=4,_npb=0,_sdim=256,_nx=252,_nx4fft=252,
 _istart=0x7faf8a09a230,_jstart=0x7faf8a099820,_binindices=0x108c66030,_binxy=4,
 _centroidw=0x7faf8a099f90,_fimage=0x7faf8a0c6950,_fimage2=0x0,_imistart=
 0x7faf8a09a188,_imjstart=0x7faf8a099d28,_imistart2=0x7faf8a09a7e8,_imjstart2=
 0x7faf8a09a0e0,_unittip=0x7faf8a177c30,_unittilt=0x7faf8a1c6a30,_lgs_defocuses=
 0x7faf8a099eb0,_unitdefocus=0x107f90030,_fimnx=4,_fimny=4,_fimny2=0x0,_yoffset=
 0x0,_bias=0x7faf8a0c4660,_flat=0x7faf8a0c5168,_domask=1,_submask=0x1088c3030,
 _kernel=0x108fe0030,_kernels=0x10841a030,_kerfftr=0x108845030,_kerffti=
 0x108884030,_kernelconv=0,_cyclecounter=1,_dispimage=0x7faf8a0c6bf8,_x=
 0x7faf8a09a118,_y=0x7faf8a099548,_centroidgain=1,_rayleigh=0x7faf8a09a6d0,
 _bckgrdcalib=0x7faf8a0c5058,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test1-if1.fits",pitch=10,alt=0,hyst=0,push4imat=50,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7faf8a09a900,_ctrlden=0x7faf8a09a698,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=13,pitchMargin=0,coupling=0.15,
 ecmatfile="test1-ecmat1.fits",noextrap=0,elt=1,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf89e33510,_xlast=0x7faf89e31720,_ylast=[0x7faf8b112830,0x7faf8b112830,
 0x7faf8b112830],_y0=0x7faf8b170030,_signus=0x7faf8b15c230,_puppixoffset=[0,0],
 _nact=137,_def=0x1085d6030,_x=0x7faf89e30c00,_y=0x7faf89e31e20,_i1=
 0x7faf89e32090,_j1=0x7faf89e2dfe0,_ei1=0x7faf8a810c20,_ej1=0x7faf8b12ed70,
 _indval=0x7faf8b130830,_indext=0x7faf8a810908,_eiffile="test1-if1-ext.fits",
 _edef=0x7faf8b1dfa30,_ex=0x7faf8b81b190,_ey=0x7faf8b81b8c8,_enact=20,_n1=60,
 _n2=197,_pupil=0x0,_command=0x7faf89c1b7c0,_flat_command=0x0,_extrapcmat=
 0x7faf8b15c830,_eltdefsize=38,_regmatrix=0x0,_fMat=0x0),dm_struct(type=
 "tiptilt",subsystem=2,virtual=0,dmfit_which=0x0,iffile="test1-if2.fits",pitch=
 0,alt=0,hyst=0,push4imat=10,thresholdresp=0.3,unitpervolt=0.0005,maxvolt=0,
 gain=0.3,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7faf8a07c750,_ctrlden=
 0x7faf8a09a9e0,misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],disjointpup=0,
 pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,use_def_of=0,
 ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=0x0,
 supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,ecmatfile=
 "test1-ecmat2.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,nzer=0,
 minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,regmatrix=0x0,
 _alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf8a099dd0,_xlast=0x7faf8a09aa50,_ylast=[0x7faf8a0c5278,0x7faf8a0c5278,
 0x7faf8a0c5278],_y0=0x7faf8a0c58d8,_signus=0x7faf8a099a18,_puppixoffset=[0,0],
 _nact=2,_def=0x108ca5030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test1-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=60,_n2=197,_pupil=0x0,_command=0x7faf8a09a070,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7faf8a099cf0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test1-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7faf8a099f20,xposition=0x7faf8a099660,yposition=
 0x7faf8a099580,dispzoom=0x7faf8b0c6a48,ncpdm=0x0,_ntarget=3,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=22)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="simulModeGains.fits",method="closed-loop")
