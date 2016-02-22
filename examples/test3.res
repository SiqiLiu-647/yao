=============================
GLAO example, 3 8x8 SHWFS, w/ disk harmonics
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.2682  0.0670  0.2682   2.15  2.15  2.15    8x 8    8x 8    598.8
 2      0.2682  0.0670  0.2682   2.15  2.15  2.15    8x 8    8x 8    598.8
 3      0.2682  0.0670  0.2682   2.15  2.15  2.15    8x 8    8x 8    598.8
 
Summary:
Mirror #1, dh, 45 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 52 subap., offaxis (+50.0",+0.0"), noise enabled
WFS # 2, hartmann (meth. 2), 52 subap., offaxis (-40.0",-52.0"), noise enabled
WFS # 3, hartmann (meth. 2), 52 subap., offaxis (-40.0",+52.0"), noise enabled
D/r0 (500nm) = 87.0; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     2.23  -60.0 -60.0      109.4   0.051      568.9
Star# 2     2.23    0.0 -60.0      145.1   0.042      568.9
Star# 3     2.23   60.0 -60.0      126.7   0.039      583.3
Star# 4     2.23  -60.0   0.0      102.3   0.064      554.5
Star# 5     2.23    0.0   0.0       67.9   0.104      554.5
Star# 6     2.23   60.0   0.0      108.8   0.049      568.9
Star# 7     2.23  -60.0  60.0      113.0   0.054      561.7
Star# 8     2.23    0.0  60.0       90.7   0.049      576.1
Star# 9     2.23   60.0  60.0      170.1   0.032      590.5
Field Avg  2.23                    114.9   0.054      569.7
Field rms  2.23                     28.1   0.020       11.5

Average images written in test3-imav.fits
Some other graphics in test3.ps

Original parameter file: test3.par:
 // YAO parameter file
 //-------------------------------
 sim.name            = "GLAO example, 3 8x8 SHWFS, w/ disk harmonics";
 sim.pupildiam       = 128;
 sim.debug           = 1;
 sim.verbose         = 1;
 sim.svipc_wfs_nfork = 3;
 
 
 //-------------------------------
 tel.diam            = 8.0;  //VLT
 tel.cobs            = 0.14;  //VLT
 
 //-------------------------------
 seeing              = 1.00; // in arcsec at 550nm (V band)
 r0at500             = (0.500e-6/seeing/4.848e-6)*(500./550.)^1.2;
 //atm.dr0at05mic    = 42.44;  // this is r0=0.166 at 550 nm
 atm.dr0at05mic      = tel.diam/r0at500;
 atm.screen          = &(Y_USER+"data/screen"+["1","2","3","4","5","6"]+".fits");
 atm.layerfrac       = &([0.64,0.2,0.05,0.05,0.05,0.01]);
 atm.layerspeed      = &([11.,20,29,35,30,40]);
 atm.layeralt        = &([0.,400,2000,6000,8500,13000]);
 atm.winddir         = &([0,0,0,0,0,0]);
 
 
 //-------------------------------
 nwfs = 3; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [50.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 11.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 8;
 wfs(n).pixsize      = 0.3;
 wfs(n).npixels      = 8;
 wfs(n).noise        = 1;
 wfs(n).ron          = 6.0;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 
 n   = 2;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [-40.,-52.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 11.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 8;
 wfs(n).pixsize      = 0.3;
 wfs(n).npixels      = 8;
 wfs(n).noise        = 1;
 wfs(n).ron          = 6.0;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 
 n   = 3;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [-40.,52.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 11.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 8;
 wfs(n).pixsize      = 0.3;
 wfs(n).npixels      = 8;
 wfs(n).noise        = 1;
 wfs(n).ron          = 6.0;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 
 //-------------------------------
 ndm = 1;
 dm = array(dms,ndm);
 
 n = 1;
 dm(n).type          = "dh";
 dm(n).ndh           = 45;
 dm(n).iffile        = "";
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01;
 dm(n).push4imat     = 1;
 
 //-------------------------------
 mat.condition       = &([50.]);
 mat.file            = "";
 
 //-------------------------------
 target.lambda       = &([2.23]);
 xy                  = (indices(3)-2.)*60.;
 target.xposition    = &(xy(,,1)(*));
 target.yposition    = &(xy(,,2)(*));
 target.dispzoom     = &(array(1.,numberof(xy(,,1))));
 
 //-------------------------------
 gs.zeropoint        = 3e11;
 
 //-------------------------------
 loop.gain           = 0.6;
 loop.framedelay     = 2;
 loop.niter          = 500;
 loop.ittime         = 2.5e-3;
 loop.startskip      = 10;
 loop.skipevery      = 1000;
 loop.skipby         = 10000;
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="GLAO example, 3 8x8 SHWFS, w/ disk harmonics",pupildiam=128,
 pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=3,svipc_wfs_forknb=0x0,
 shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=86.9669,screen=0x7fab3291aeb0,layerfrac=0x7fab3291afc0,
 layerspeed=0x7fab3291af38,layeralt=0x7fab3301b458,winddir=0x7fab3301c668,
 _layeralt=0x7fab3291ac90)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=6,darkcurrent=
 0,gspos=[50,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=11,skymag=0,filtertilt=0,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,
 fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,
 pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=8,npixpersub=0,pixsize=
 0.268152,npixels=8,spotpitch=8,extfield=2.14521,pupoffset=[0,0],shthmethod=1,
 shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,
 fstop="square",fssize=2.14521,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=
 0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,
 LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fab3380c520,
 lgs_prof_alt=0x7fab3380cb48,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fab32630eb0,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fab32502780,_origpixsize=0.3,_rebinfactor=4,_gsalt=0,_gsdepth=0,
 _nsub=52,_nsub4disp=60,_nmes=104,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,
 _tiltsh=0x101cf2030,_masks=0x0,_fluxpersub=0x7fab3262da90,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fab3262dbc0,_skyfluxpersub=0x7fab3262bcf0,
 _nphotons=598.845,_skynphotons=0,_tt=[-0.0113169,0.0329731],_lastvalidtt=
 [-0.0113169,0.0329731],_upttcommand=[0,0],_refmes=0x7fab324315a0,_tiprefv=
 0x7fab3242edd0,_tiltrefv=0x7fab32712e60,_tiprefvn=0x7fab32432240,_tiltrefvn=
 0x7fab327138e0,_reordervec=0x0,_npixels=8,_npb=0,_sdim=32,_nx=32,_nx4fft=32,
 _istart=0x7fab32504d50,_jstart=0x7fab325014a0,_binindices=0x7fab3407b230,
 _binxy=8,_centroidw=0x7fab3301c008,_fimage=0x7fab33986c30,_fimage2=0x0,
 _imistart=0x7fab3270f600,_imjstart=0x7fab32703d10,_imistart2=0x7fab32704880,
 _imjstart2=0x7fab327050f0,_unittip=0x7fab33010430,_unittilt=0x7fab33010a30,
 _lgs_defocuses=0x7fab3380bf70,_unitdefocus=0x100fb8030,_fimnx=64,_fimny=64,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fab33907030,_flat=0x7fab33953030,_domask=1,
 _submask=0x7fab338dbc30,_kernel=0x7fab33961830,_kernels=0x10109c030,_kerfftr=
 0x100d81030,_kerffti=0x1010d9030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fab33011030,_x=0x7fab325046b0,_y=0x7fab32504b30,_centroidgain=1,_rayleigh=
 0x7fab3380c168,_bckgrdcalib=0x7fab33902e30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=1,lambda=0.65,noise=1,ron=6,darkcurrent=0,gspos=[-40,-52],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=11,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=
 0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=8,npixpersub=0,pixsize=0.268152,npixels=8,
 spotpitch=8,extfield=2.14521,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.14521,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fab3380c398,lgs_prof_alt=
 0x7fab3380d168,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fab325055b0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fab3262cda0,_origpixsize=0.3,_rebinfactor=4,_gsalt=0,_gsdepth=0,_nsub=52,
 _nsub4disp=60,_nmes=104,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x100dbe030,_masks=0x0,_fluxpersub=0x7fab32500ff0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fab32502f40,_skyfluxpersub=0x7fab32631850,
 _nphotons=598.845,_skynphotons=0,_tt=[0.0102643,0.00179287],_lastvalidtt=
 [0.0102643,0.00179287],_upttcommand=[0,0],_refmes=0x7fab32431780,_tiprefv=
 0x7fab32431b40,_tiltrefv=0x7fab327131e0,_tiprefvn=0x7fab324325c0,_tiltrefvn=
 0x7fab32713c60,_reordervec=0x0,_npixels=8,_npb=0,_sdim=32,_nx=32,_nx4fft=32,
 _istart=0x7fab32631a70,_jstart=0x7fab32631ba0,_binindices=0x7fab33979230,
 _binxy=8,_centroidw=0x7fab3301bbc8,_fimage=0x7fab330b1e30,_fimage2=0x0,
 _imistart=0x7fab3262e9e0,_imjstart=0x7fab3262eb10,_imistart2=0x7fab32631e00,
 _imjstart2=0x7fab32631f30,_unittip=0x7fab3382e030,_unittilt=0x7fab33806030,
 _lgs_defocuses=0x7fab3380c7c0,_unitdefocus=0x101116030,_fimnx=64,_fimny=64,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fab3395b430,_flat=0x7fab338c7030,_domask=1,
 _submask=0x7fab33040e30,_kernel=0x7fab3394ce30,_kernels=0x101197030,_kerfftr=
 0x101157030,_kerffti=0x1011d4030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fab330b6030,_x=0x7fab3262e7c0,_y=0x7fab3262cb60,_centroidgain=1,_rayleigh=
 0x7fab3380ca68,_bckgrdcalib=0x7fab33957230,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=1,lambda=0.65,noise=1,ron=6,darkcurrent=0,gspos=[-40,52],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=11,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=
 0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=8,npixpersub=0,pixsize=0.268152,npixels=8,
 spotpitch=8,extfield=2.14521,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.14521,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fab3380cc98,lgs_prof_alt=
 0x7fab3380cd08,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fab32504e80,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fab32505480,_origpixsize=0.3,_rebinfactor=4,_gsalt=0,_gsdepth=0,_nsub=52,
 _nsub4disp=60,_nmes=104,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x101405030,_masks=0x0,_fluxpersub=0x7fab32507060,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fab32507190,_skyfluxpersub=0x7fab3262dcf0,
 _nphotons=598.845,_skynphotons=0,_tt=[-0.0040259,0.00194616],_lastvalidtt=
 [-0.0040259,0.00194616],_upttcommand=[0,0],_refmes=0x7fab32431960,_tiprefv=
 0x7fab32431ec0,_tiltrefv=0x7fab32713560,_tiprefvn=0x7fab32432940,_tiltrefvn=
 0x7fab32713fe0,_reordervec=0x0,_npixels=8,_npb=0,_sdim=32,_nx=32,_nx4fft=32,
 _istart=0x7fab32506850,_jstart=0x7fab32506980,_binindices=0x7fab32858e30,
 _binxy=8,_centroidw=0x7fab3291ada0,_fimage=0x7fab32a05a30,_fimage2=0x0,
 _imistart=0x7fab32506390,_imjstart=0x7fab32506ab0,_imistart2=0x7fab32506be0,
 _imjstart2=0x7fab32506d10,_unittip=0x7fab33042030,_unittilt=0x7fab33042630,
 _lgs_defocuses=0x7fab3380c750,_unitdefocus=0x101211030,_fimnx=64,_fimny=64,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fab338cf430,_flat=0x7fab338d3630,_domask=1,
 _submask=0x7fab3305a430,_kernel=0x7fab3394ac30,_kernels=0x101587030,_kerfftr=
 0x1013c5030,_kerffti=0x1015c4030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fab3285e030,_x=0x7fab32505ad0,_y=0x7fab32505f50,_centroidgain=1,_rayleigh=
 0x7fab3380c280,_bckgrdcalib=0x7fab338cb230,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="dh",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test3-if1.fits",pitch=0,alt=0,hyst=0,push4imat=1,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fab3380c4e8,_ctrlden=0x7fab3380cc60,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,
 ecmatfile="test3-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=45,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fab340a7f70,_xlast=0x7fab338df718,_ylast=[0x7fab32432f20,0x7fab32432f20,
 0x7fab32432f20],_y0=0x7fab32432cc0,_signus=0x7fab32433180,_puppixoffset=[0,0],
 _nact=45,_def=0x10532c030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test3-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=56,_n2=201,_pupil=0x0,_command=0x7fab328fc6e8,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fab3380c2f0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test3-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=8,cobs=0.14,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fab3380cf00,xposition=0x7fab3291b048,yposition=
 0x7fab3301bf80,dispzoom=0x7fab3301bab8,ncpdm=0x0,_ntarget=9,_nlambda=1)
 gs_struct(zeropoint=3e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.0025,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     2.23  -60.0 -60.0      109.4   0.051      568.9
Star# 2     2.23    0.0 -60.0      145.1   0.042      568.9
Star# 3     2.23   60.0 -60.0      126.7   0.039      583.3
Star# 4     2.23  -60.0   0.0      102.3   0.064      554.5
Star# 5     2.23    0.0   0.0       67.9   0.104      554.5
Star# 6     2.23   60.0   0.0      108.8   0.049      568.9
Star# 7     2.23  -60.0  60.0      113.0   0.054      561.7
Star# 8     2.23    0.0  60.0       90.7   0.049      576.1
Star# 9     2.23   60.0  60.0      170.1   0.032      590.5
Field Avg  2.23                    114.9   0.054      569.7
Field rms  2.23                     28.1   0.020       11.5

Average images written in test3-imav.fits
Some other graphics in test3.ps

Original parameter file: test3.par:
 // YAO parameter file
 //-------------------------------
 sim.name            = "GLAO example, 3 8x8 SHWFS, w/ disk harmonics";
 sim.pupildiam       = 128;
 sim.debug           = 1;
 sim.verbose         = 1;
 sim.svipc_wfs_nfork = 3;
 
 
 //-------------------------------
 tel.diam            = 8.0;  //VLT
 tel.cobs            = 0.14;  //VLT
 
 //-------------------------------
 seeing              = 1.00; // in arcsec at 550nm (V band)
 r0at500             = (0.500e-6/seeing/4.848e-6)*(500./550.)^1.2;
 //atm.dr0at05mic    = 42.44;  // this is r0=0.166 at 550 nm
 atm.dr0at05mic      = tel.diam/r0at500;
 atm.screen          = &(Y_USER+"data/screen"+["1","2","3","4","5","6"]+".fits");
 atm.layerfrac       = &([0.64,0.2,0.05,0.05,0.05,0.01]);
 atm.layerspeed      = &([11.,20,29,35,30,40]);
 atm.layeralt        = &([0.,400,2000,6000,8500,13000]);
 atm.winddir         = &([0,0,0,0,0,0]);
 
 
 //-------------------------------
 nwfs = 3; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [50.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 11.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 8;
 wfs(n).pixsize      = 0.3;
 wfs(n).npixels      = 8;
 wfs(n).noise        = 1;
 wfs(n).ron          = 6.0;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 
 n   = 2;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [-40.,-52.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 11.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 8;
 wfs(n).pixsize      = 0.3;
 wfs(n).npixels      = 8;
 wfs(n).noise        = 1;
 wfs(n).ron          = 6.0;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 
 n   = 3;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [-40.,52.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 11.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 8;
 wfs(n).pixsize      = 0.3;
 wfs(n).npixels      = 8;
 wfs(n).noise        = 1;
 wfs(n).ron          = 6.0;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 
 //-------------------------------
 ndm = 1;
 dm = array(dms,ndm);
 
 n = 1;
 dm(n).type          = "dh";
 dm(n).ndh           = 45;
 dm(n).iffile        = "";
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01;
 dm(n).push4imat     = 1;
 
 //-------------------------------
 mat.condition       = &([50.]);
 mat.file            = "";
 
 //-------------------------------
 target.lambda       = &([2.23]);
 xy                  = (indices(3)-2.)*60.;
 target.xposition    = &(xy(,,1)(*));
 target.yposition    = &(xy(,,2)(*));
 target.dispzoom     = &(array(1.,numberof(xy(,,1))));
 
 //-------------------------------
 gs.zeropoint        = 3e11;
 
 //-------------------------------
 loop.gain           = 0.6;
 loop.framedelay     = 2;
 loop.niter          = 500;
 loop.ittime         = 2.5e-3;
 loop.startskip      = 10;
 loop.skipevery      = 1000;
 loop.skipby         = 10000;
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="GLAO example, 3 8x8 SHWFS, w/ disk harmonics",pupildiam=128,
 pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=3,svipc_wfs_forknb=0x0,
 shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=86.9669,screen=0x7fab3291aeb0,layerfrac=0x7fab3291afc0,
 layerspeed=0x7fab3291af38,layeralt=0x7fab3301b458,winddir=0x7fab3301c668,
 _layeralt=0x7fab3291ac90)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=6,darkcurrent=
 0,gspos=[50,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=11,skymag=0,filtertilt=0,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,
 fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,
 pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=8,npixpersub=0,pixsize=
 0.268152,npixels=8,spotpitch=8,extfield=2.14521,pupoffset=[0,0],shthmethod=1,
 shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,
 fstop="square",fssize=2.14521,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=
 0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,
 LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fab3380c520,
 lgs_prof_alt=0x7fab3380cb48,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fab32630c40,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fab32502780,_origpixsize=0.3,_rebinfactor=4,_gsalt=0,_gsdepth=0,
 _nsub=52,_nsub4disp=60,_nmes=104,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,
 _tiltsh=0x101cf2030,_masks=0x0,_fluxpersub=0x7fab3262da90,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fab3262dbc0,_skyfluxpersub=0x7fab3262bcf0,
 _nphotons=598.845,_skynphotons=0,_tt=[-0.0113169,0.0329731],_lastvalidtt=
 [-0.0113169,0.0329731],_upttcommand=[0,0],_refmes=0x7fab324315a0,_tiprefv=
 0x7fab3242edd0,_tiltrefv=0x7fab32712e60,_tiprefvn=0x7fab32432240,_tiltrefvn=
 0x7fab327138e0,_reordervec=0x0,_npixels=8,_npb=0,_sdim=32,_nx=32,_nx4fft=32,
 _istart=0x7fab32504d50,_jstart=0x7fab325014a0,_binindices=0x7fab3407b230,
 _binxy=8,_centroidw=0x7fab3301c008,_fimage=0x7fab3298c630,_fimage2=0x0,
 _imistart=0x7fab3270f600,_imjstart=0x7fab32703d10,_imistart2=0x7fab32704880,
 _imjstart2=0x7fab327050f0,_unittip=0x7fab33010430,_unittilt=0x7fab33010a30,
 _lgs_defocuses=0x7fab3380bf70,_unitdefocus=0x100fb8030,_fimnx=64,_fimny=64,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fab33907030,_flat=0x7fab33953030,_domask=1,
 _submask=0x7fab338dbc30,_kernel=0x7fab3286b030,_kernels=0x10109c030,_kerfftr=
 0x100d81030,_kerffti=0x1010d9030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fab32954230,_x=0x7fab325046b0,_y=0x7fab32504b30,_centroidgain=1,_rayleigh=
 0x7fab3380c168,_bckgrdcalib=0x7fab33902e30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=1,lambda=0.65,noise=1,ron=6,darkcurrent=0,gspos=[-40,-52],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=11,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=
 0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=8,npixpersub=0,pixsize=0.268152,npixels=8,
 spotpitch=8,extfield=2.14521,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.14521,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fab3380c398,lgs_prof_alt=
 0x7fab3380d168,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fab3242dc30,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fab3262cda0,_origpixsize=0.3,_rebinfactor=4,_gsalt=0,_gsdepth=0,_nsub=52,
 _nsub4disp=60,_nmes=104,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x100dbe030,_masks=0x0,_fluxpersub=0x7fab32500ff0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fab32502f40,_skyfluxpersub=0x7fab32631850,
 _nphotons=598.845,_skynphotons=0,_tt=[0.0102643,0.00179287],_lastvalidtt=
 [0.0102643,0.00179287],_upttcommand=[0,0],_refmes=0x7fab32431780,_tiprefv=
 0x7fab32431b40,_tiltrefv=0x7fab327131e0,_tiprefvn=0x7fab324325c0,_tiltrefvn=
 0x7fab32713c60,_reordervec=0x0,_npixels=8,_npb=0,_sdim=32,_nx=32,_nx4fft=32,
 _istart=0x7fab32631a70,_jstart=0x7fab32631ba0,_binindices=0x7fab33979230,
 _binxy=8,_centroidw=0x7fab3301bbc8,_fimage=0x7fab32a05a30,_fimage2=0x0,
 _imistart=0x7fab3262e9e0,_imjstart=0x7fab3262eb10,_imistart2=0x7fab32631e00,
 _imjstart2=0x7fab32631f30,_unittip=0x7fab3382e030,_unittilt=0x7fab33806030,
 _lgs_defocuses=0x7fab3380c7c0,_unitdefocus=0x101116030,_fimnx=64,_fimny=64,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fab3395b430,_flat=0x7fab338c7030,_domask=1,
 _submask=0x7fab33040e30,_kernel=0x7fab33057030,_kernels=0x101197030,_kerfftr=
 0x101157030,_kerffti=0x1011d4030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fab3285e030,_x=0x7fab3262e7c0,_y=0x7fab3262cb60,_centroidgain=1,_rayleigh=
 0x7fab3380ca68,_bckgrdcalib=0x7fab33957230,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=1,lambda=0.65,noise=1,ron=6,darkcurrent=0,gspos=[-40,52],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=11,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=
 0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=8,npixpersub=0,pixsize=0.268152,npixels=8,
 spotpitch=8,extfield=2.14521,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.14521,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fab3380cc98,lgs_prof_alt=
 0x7fab3380cd08,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fab32410500,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fab32505480,_origpixsize=0.3,_rebinfactor=4,_gsalt=0,_gsdepth=0,_nsub=52,
 _nsub4disp=60,_nmes=104,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x101405030,_masks=0x0,_fluxpersub=0x7fab32507060,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fab32507190,_skyfluxpersub=0x7fab3262dcf0,
 _nphotons=598.845,_skynphotons=0,_tt=[-0.0040259,0.00194616],_lastvalidtt=
 [-0.0040259,0.00194616],_upttcommand=[0,0],_refmes=0x7fab32431960,_tiprefv=
 0x7fab32431ec0,_tiltrefv=0x7fab32713560,_tiprefvn=0x7fab32432940,_tiltrefvn=
 0x7fab32713fe0,_reordervec=0x0,_npixels=8,_npb=0,_sdim=32,_nx=32,_nx4fft=32,
 _istart=0x7fab32506850,_jstart=0x7fab32506980,_binindices=0x7fab32858e30,
 _binxy=8,_centroidw=0x7fab3291ada0,_fimage=0x7fab34085a30,_fimage2=0x0,
 _imistart=0x7fab32506390,_imjstart=0x7fab32506ab0,_imistart2=0x7fab32506be0,
 _imjstart2=0x7fab32506d10,_unittip=0x7fab33042030,_unittilt=0x7fab33042630,
 _lgs_defocuses=0x7fab3380c750,_unitdefocus=0x101211030,_fimnx=64,_fimny=64,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fab338cf430,_flat=0x7fab338d3630,_domask=1,
 _submask=0x7fab3305a430,_kernel=0x7fab33015230,_kernels=0x101587030,_kerfftr=
 0x1013c5030,_kerffti=0x1015c4030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fab340ae030,_x=0x7fab32505ad0,_y=0x7fab32505f50,_centroidgain=1,_rayleigh=
 0x7fab3380c280,_bckgrdcalib=0x7fab338cb230,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="dh",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test3-if1.fits",pitch=0,alt=0,hyst=0,push4imat=1,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fab3380d0f8,_ctrlden=0x7fab3380cc60,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,
 ecmatfile="test3-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=45,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fab338deab8,_xlast=0x7fab340a7f70,_ylast=[0x7fab32714940,0x7fab32714940,
 0x7fab32714940],_y0=0x7fab327146e0,_signus=0x7fab32714ba0,_puppixoffset=[0,0],
 _nact=45,_def=0x10532c030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test3-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=56,_n2=201,_pupil=0x0,_command=0x7fab340a86a8,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fab3380c2f0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test3-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=8,cobs=0.14,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fab3380cf00,xposition=0x7fab3291b048,yposition=
 0x7fab3301bf80,dispzoom=0x7fab3301bab8,ncpdm=0x0,_ntarget=9,_nlambda=1)
 gs_struct(zeropoint=3e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.0025,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")
=============================
GLAO example, 3 8x8 SHWFS, w/ disk harmonics
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.2682  0.0670  0.2682   2.15  2.15  2.15    8x 8    8x 8    598.8
 2      0.2682  0.0670  0.2682   2.15  2.15  2.15    8x 8    8x 8    598.8
 3      0.2682  0.0670  0.2682   2.15  2.15  2.15    8x 8    8x 8    598.8
 
Summary:
Mirror #1, dh, 45 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 52 subap., offaxis (+50.0",+0.0"), noise enabled
WFS # 2, hartmann (meth. 2), 52 subap., offaxis (-40.0",-52.0"), noise enabled
WFS # 3, hartmann (meth. 2), 52 subap., offaxis (-40.0",+52.0"), noise enabled
D/r0 (500nm) = 87.0; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     2.23  -60.0 -60.0      109.4   0.051      568.9
Star# 2     2.23    0.0 -60.0      145.1   0.042      568.9
Star# 3     2.23   60.0 -60.0      126.7   0.039      583.3
Star# 4     2.23  -60.0   0.0      102.3   0.064      554.5
Star# 5     2.23    0.0   0.0       67.9   0.104      554.5
Star# 6     2.23   60.0   0.0      108.8   0.049      568.9
Star# 7     2.23  -60.0  60.0      113.0   0.054      561.7
Star# 8     2.23    0.0  60.0       90.7   0.049      576.1
Star# 9     2.23   60.0  60.0      170.1   0.032      590.5
Field Avg  2.23                    114.9   0.054      569.7
Field rms  2.23                     28.1   0.020       11.5

Average images written in test3-imav.fits
Some other graphics in test3.ps

Original parameter file: test3.par:
 // YAO parameter file
 //-------------------------------
 sim.name            = "GLAO example, 3 8x8 SHWFS, w/ disk harmonics";
 sim.pupildiam       = 128;
 sim.debug           = 1;
 sim.verbose         = 1;
 sim.svipc_wfs_nfork = 3;
 
 
 //-------------------------------
 tel.diam            = 8.0;  //VLT
 tel.cobs            = 0.14;  //VLT
 
 //-------------------------------
 seeing              = 1.00; // in arcsec at 550nm (V band)
 r0at500             = (0.500e-6/seeing/4.848e-6)*(500./550.)^1.2;
 //atm.dr0at05mic    = 42.44;  // this is r0=0.166 at 550 nm
 atm.dr0at05mic      = tel.diam/r0at500;
 atm.screen          = &(Y_USER+"data/screen"+["1","2","3","4","5","6"]+".fits");
 atm.layerfrac       = &([0.64,0.2,0.05,0.05,0.05,0.01]);
 atm.layerspeed      = &([11.,20,29,35,30,40]);
 atm.layeralt        = &([0.,400,2000,6000,8500,13000]);
 atm.winddir         = &([0,0,0,0,0,0]);
 
 
 //-------------------------------
 nwfs = 3; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [50.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 11.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 8;
 wfs(n).pixsize      = 0.3;
 wfs(n).npixels      = 8;
 wfs(n).noise        = 1;
 wfs(n).ron          = 6.0;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 
 n   = 2;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [-40.,-52.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 11.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 8;
 wfs(n).pixsize      = 0.3;
 wfs(n).npixels      = 8;
 wfs(n).noise        = 1;
 wfs(n).ron          = 6.0;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 
 n   = 3;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [-40.,52.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 11.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 8;
 wfs(n).pixsize      = 0.3;
 wfs(n).npixels      = 8;
 wfs(n).noise        = 1;
 wfs(n).ron          = 6.0;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 
 //-------------------------------
 ndm = 1;
 dm = array(dms,ndm);
 
 n = 1;
 dm(n).type          = "dh";
 dm(n).ndh           = 45;
 dm(n).iffile        = "";
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01;
 dm(n).push4imat     = 1;
 
 //-------------------------------
 mat.condition       = &([50.]);
 mat.file            = "";
 
 //-------------------------------
 target.lambda       = &([2.23]);
 xy                  = (indices(3)-2.)*60.;
 target.xposition    = &(xy(,,1)(*));
 target.yposition    = &(xy(,,2)(*));
 target.dispzoom     = &(array(1.,numberof(xy(,,1))));
 
 //-------------------------------
 gs.zeropoint        = 3e11;
 
 //-------------------------------
 loop.gain           = 0.6;
 loop.framedelay     = 2;
 loop.niter          = 500;
 loop.ittime         = 2.5e-3;
 loop.startskip      = 10;
 loop.skipevery      = 1000;
 loop.skipby         = 10000;
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="GLAO example, 3 8x8 SHWFS, w/ disk harmonics",pupildiam=128,
 pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=3,svipc_wfs_forknb=0x0,
 shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=86.9669,screen=0x7fa51a85feb0,layerfrac=0x7fa51a85ffc0,
 layerspeed=0x7fa51a85ff38,layeralt=0x7fa51a8d7858,winddir=0x7fa51a8d8a68,
 _layeralt=0x7fa51a85fc90)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=6,darkcurrent=
 0,gspos=[50,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=11,skymag=0,filtertilt=0,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,
 fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,
 pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=8,npixpersub=0,pixsize=
 0.268152,npixels=8,spotpitch=8,extfield=2.14521,pupoffset=[0,0],shthmethod=1,
 shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,
 fstop="square",fssize=2.14521,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=
 0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,
 LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fa51a8a1b20,
 lgs_prof_alt=0x7fa51a8a2110,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fa518f44250,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fa518c12d50,_origpixsize=0.3,_rebinfactor=4,_gsalt=0,_gsdepth=0,
 _nsub=52,_nsub4disp=60,_nmes=104,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,
 _tiltsh=0x10617e030,_masks=0x0,_fluxpersub=0x7fa518f3e2c0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fa518f3cd30,_skyfluxpersub=0x7fa518c10490,
 _nphotons=598.845,_skynphotons=0,_tt=[-0.0113169,0.0329731],_lastvalidtt=
 [-0.0113169,0.0329731],_upttcommand=[0,0],_refmes=0x7fa518c1aa60,_tiprefv=
 0x7fa518f3e780,_tiltrefv=0x7fa518f42220,_tiprefvn=0x7fa518f3f130,_tiltrefvn=
 0x7fa518f42ca0,_reordervec=0x0,_npixels=8,_npb=0,_sdim=32,_nx=32,_nx4fft=32,
 _istart=0x7fa518c13060,_jstart=0x7fa518c0b670,_binindices=0x7fa5190b3c30,
 _binxy=8,_centroidw=0x7fa51a8d8408,_fimage=0x7fa51aaa8030,_fimage2=0x0,
 _imistart=0x7fa518c0f8e0,_imjstart=0x7fa518c0bf80,_imistart2=0x7fa518c0c430,
 _imjstart2=0x7fa518c15570,_unittip=0x7fa5190b4e30,_unittilt=0x7fa51904be30,
 _lgs_defocuses=0x7fa51a8a1570,_unitdefocus=0x105426030,_fimnx=64,_fimny=64,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fa51912f630,_flat=0x7fa519133830,_domask=1,
 _submask=0x7fa51a9c4830,_kernel=0x7fa51a9c2a30,_kernels=0x1055e7030,_kerfftr=
 0x105323030,_kerffti=0x105360030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fa51aaac230,_x=0x7fa518c19000,_y=0x7fa518c19c70,_centroidgain=1,_rayleigh=
 0x7fa51a8a1e30,_bckgrdcalib=0x7fa5191b6e30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=1,lambda=0.65,noise=1,ron=6,darkcurrent=0,gspos=[-40,-52],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=11,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=
 0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=8,npixpersub=0,pixsize=0.268152,npixels=8,
 spotpitch=8,extfield=2.14521,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.14521,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fa51a8a1998,lgs_prof_alt=
 0x7fa51a8a2768,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fa518f44b50,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fa518c11040,_origpixsize=0.3,_rebinfactor=4,_gsalt=0,_gsdepth=0,_nsub=52,
 _nsub4disp=60,_nmes=104,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x105121030,_masks=0x0,_fluxpersub=0x7fa518f3d850,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fa518f3d980,_skyfluxpersub=0x7fa518c0a850,
 _nphotons=598.845,_skynphotons=0,_tt=[0.0102643,0.00179287],_lastvalidtt=
 [0.0102643,0.00179287],_upttcommand=[0,0],_refmes=0x7fa518c1ac40,_tiprefv=
 0x7fa518f3fd40,_tiltrefv=0x7fa518f425a0,_tiprefvn=0x7fa518f3f4b0,_tiltrefvn=
 0x7fa518f43020,_reordervec=0x0,_npixels=8,_npb=0,_sdim=32,_nx=32,_nx4fft=32,
 _istart=0x7fa518c16a90,_jstart=0x7fa518c16f50,_binindices=0x7fa51a960630,
 _binxy=8,_centroidw=0x7fa51a8d7fc8,_fimage=0x7fa51a9c7a30,_fimage2=0x0,
 _imistart=0x7fa518f40ac0,_imjstart=0x7fa518f40640,_imistart2=0x7fa518f3e3f0,
 _imjstart2=0x7fa518f3e520,_unittip=0x7fa519061230,_unittilt=0x7fa519049630,
 _lgs_defocuses=0x7fa51a8a1dc0,_unitdefocus=0x1053dd030,_fimnx=64,_fimny=64,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fa5190f2030,_flat=0x7fa519053830,_domask=1,
 _submask=0x7fa51aa83e30,_kernel=0x7fa51985ae30,_kernels=0x10539d030,_kerfftr=
 0x105624030,_kerffti=0x105661030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fa51a959e30,_x=0x7fa518c19e90,_y=0x7fa518c19570,_centroidgain=1,_rayleigh=
 0x7fa51a8a1420,_bckgrdcalib=0x7fa5190ede30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=1,lambda=0.65,noise=1,ron=6,darkcurrent=0,gspos=[-40,52],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=11,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=
 0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=8,npixpersub=0,pixsize=0.268152,npixels=8,
 spotpitch=8,extfield=2.14521,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.14521,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fa51a8a13b0,lgs_prof_alt=
 0x7fa51a8a14c8,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fa518f413b0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fa518f40990,_origpixsize=0.3,_rebinfactor=4,_gsalt=0,_gsdepth=0,_nsub=52,
 _nsub4disp=60,_nmes=104,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x105873030,_masks=0x0,_fluxpersub=0x7fa518c0bb60,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fa518c0f260,_skyfluxpersub=0x7fa518c131c0,
 _nphotons=598.845,_skynphotons=0,_tt=[-0.0040259,0.00194616],_lastvalidtt=
 [-0.0040259,0.00194616],_upttcommand=[0,0],_refmes=0x7fa518c1ae20,_tiprefv=
 0x7fa518f3edb0,_tiltrefv=0x7fa518f42920,_tiprefvn=0x7fa518f3f830,_tiltrefvn=
 0x7fa518f433a0,_reordervec=0x0,_npixels=8,_npb=0,_sdim=32,_nx=32,_nx4fft=32,
 _istart=0x7fa518f41280,_jstart=0x7fa518f3dab0,_binindices=0x7fa51a9dfc30,
 _binxy=8,_centroidw=0x7fa51a85fda0,_fimage=0x7fa51a9d5830,_fimage2=0x0,
 _imistart=0x7fa518f401a0,_imjstart=0x7fa518f402d0,_imistart2=0x7fa518f3eb50,
 _imjstart2=0x7fa518f3ec80,_unittip=0x7fa51a8ec830,_unittilt=0x7fa51a9c7430,
 _lgs_defocuses=0x7fa51a8a1b90,_unitdefocus=0x10569e030,_fimnx=64,_fimny=64,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fa51905bc30,_flat=0x7fa51920ac30,_domask=1,
 _submask=0x7fa5191d8a30,_kernel=0x7fa519860230,_kernels=0x105732030,_kerfftr=
 0x1058b4030,_kerffti=0x1058f1030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fa51aaa3e30,_x=0x7fa518f3de00,_y=0x7fa518f40e40,_centroidgain=1,_rayleigh=
 0x7fa51a8a1880,_bckgrdcalib=0x7fa519057a30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="dh",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test3-if1.fits",pitch=0,alt=0,hyst=0,push4imat=1,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fa51a8a2570,_ctrlden=0x7fa51a8a10a0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,
 ecmatfile="test3-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=45,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fa51904a370,_xlast=0x7fa51a96b318,_ylast=[0x7fa518c1b310,0x7fa518c1b310,
 0x7fa518c1b310],_y0=0x7fa518c1a720,_signus=0x7fa518c17880,_puppixoffset=[0,0],
 _nact=45,_def=0x106566030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test3-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=56,_n2=201,_pupil=0x0,_command=0x7fa51909d4e8,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fa51a8a18f0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test3-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=8,cobs=0.14,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fa51a8a2618,xposition=0x7fa51a860048,yposition=
 0x7fa51a8d8380,dispzoom=0x7fa51a8d7eb8,ncpdm=0x0,_ntarget=9,_nlambda=1)
 gs_struct(zeropoint=3e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.0025,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     2.23  -60.0 -60.0      109.4   0.051      568.9
Star# 2     2.23    0.0 -60.0      145.1   0.042      568.9
Star# 3     2.23   60.0 -60.0      126.7   0.039      583.3
Star# 4     2.23  -60.0   0.0      102.3   0.064      554.5
Star# 5     2.23    0.0   0.0       67.9   0.104      554.5
Star# 6     2.23   60.0   0.0      108.8   0.049      568.9
Star# 7     2.23  -60.0  60.0      113.0   0.054      561.7
Star# 8     2.23    0.0  60.0       90.7   0.049      576.1
Star# 9     2.23   60.0  60.0      170.1   0.032      590.5
Field Avg  2.23                    114.9   0.054      569.7
Field rms  2.23                     28.1   0.020       11.5

Average images written in test3-imav.fits
Some other graphics in test3.ps

Original parameter file: test3.par:
 // YAO parameter file
 //-------------------------------
 sim.name            = "GLAO example, 3 8x8 SHWFS, w/ disk harmonics";
 sim.pupildiam       = 128;
 sim.debug           = 1;
 sim.verbose         = 1;
 sim.svipc_wfs_nfork = 3;
 
 
 //-------------------------------
 tel.diam            = 8.0;  //VLT
 tel.cobs            = 0.14;  //VLT
 
 //-------------------------------
 seeing              = 1.00; // in arcsec at 550nm (V band)
 r0at500             = (0.500e-6/seeing/4.848e-6)*(500./550.)^1.2;
 //atm.dr0at05mic    = 42.44;  // this is r0=0.166 at 550 nm
 atm.dr0at05mic      = tel.diam/r0at500;
 atm.screen          = &(Y_USER+"data/screen"+["1","2","3","4","5","6"]+".fits");
 atm.layerfrac       = &([0.64,0.2,0.05,0.05,0.05,0.01]);
 atm.layerspeed      = &([11.,20,29,35,30,40]);
 atm.layeralt        = &([0.,400,2000,6000,8500,13000]);
 atm.winddir         = &([0,0,0,0,0,0]);
 
 
 //-------------------------------
 nwfs = 3; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [50.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 11.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 8;
 wfs(n).pixsize      = 0.3;
 wfs(n).npixels      = 8;
 wfs(n).noise        = 1;
 wfs(n).ron          = 6.0;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 
 n   = 2;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [-40.,-52.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 11.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 8;
 wfs(n).pixsize      = 0.3;
 wfs(n).npixels      = 8;
 wfs(n).noise        = 1;
 wfs(n).ron          = 6.0;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 
 n   = 3;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [-40.,52.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 11.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 8;
 wfs(n).pixsize      = 0.3;
 wfs(n).npixels      = 8;
 wfs(n).noise        = 1;
 wfs(n).ron          = 6.0;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 
 //-------------------------------
 ndm = 1;
 dm = array(dms,ndm);
 
 n = 1;
 dm(n).type          = "dh";
 dm(n).ndh           = 45;
 dm(n).iffile        = "";
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01;
 dm(n).push4imat     = 1;
 
 //-------------------------------
 mat.condition       = &([50.]);
 mat.file            = "";
 
 //-------------------------------
 target.lambda       = &([2.23]);
 xy                  = (indices(3)-2.)*60.;
 target.xposition    = &(xy(,,1)(*));
 target.yposition    = &(xy(,,2)(*));
 target.dispzoom     = &(array(1.,numberof(xy(,,1))));
 
 //-------------------------------
 gs.zeropoint        = 3e11;
 
 //-------------------------------
 loop.gain           = 0.6;
 loop.framedelay     = 2;
 loop.niter          = 500;
 loop.ittime         = 2.5e-3;
 loop.startskip      = 10;
 loop.skipevery      = 1000;
 loop.skipby         = 10000;
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="GLAO example, 3 8x8 SHWFS, w/ disk harmonics",pupildiam=128,
 pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=3,svipc_wfs_forknb=0x0,
 shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=86.9669,screen=0x7fa51a85feb0,layerfrac=0x7fa51a85ffc0,
 layerspeed=0x7fa51a85ff38,layeralt=0x7fa51a8d7858,winddir=0x7fa51a8d8a68,
 _layeralt=0x7fa51a85fc90)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=6,darkcurrent=
 0,gspos=[50,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=11,skymag=0,filtertilt=0,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,
 fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,
 pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=8,npixpersub=0,pixsize=
 0.268152,npixels=8,spotpitch=8,extfield=2.14521,pupoffset=[0,0],shthmethod=1,
 shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,
 fstop="square",fssize=2.14521,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=
 0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,
 LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fa51a8a1b20,
 lgs_prof_alt=0x7fa51a8a2110,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7fa518c1a4c0,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7fa518c12d50,_origpixsize=0.3,_rebinfactor=4,_gsalt=0,_gsdepth=0,
 _nsub=52,_nsub4disp=60,_nmes=104,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,
 _tiltsh=0x10617e030,_masks=0x0,_fluxpersub=0x7fa518f3e2c0,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fa518f3cd30,_skyfluxpersub=0x7fa518c10490,
 _nphotons=598.845,_skynphotons=0,_tt=[-0.0113169,0.0329731],_lastvalidtt=
 [-0.0113169,0.0329731],_upttcommand=[0,0],_refmes=0x7fa518c1aa60,_tiprefv=
 0x7fa518f3e780,_tiltrefv=0x7fa518f42220,_tiprefvn=0x7fa518f3f130,_tiltrefvn=
 0x7fa518f42ca0,_reordervec=0x0,_npixels=8,_npb=0,_sdim=32,_nx=32,_nx4fft=32,
 _istart=0x7fa518c13060,_jstart=0x7fa518c0b670,_binindices=0x7fa5190b3c30,
 _binxy=8,_centroidw=0x7fa51a8d8408,_fimage=0x7fa5191a8630,_fimage2=0x0,
 _imistart=0x7fa518c0f8e0,_imjstart=0x7fa518c0bf80,_imistart2=0x7fa518c0c430,
 _imjstart2=0x7fa518c15570,_unittip=0x7fa5190b4e30,_unittilt=0x7fa51904be30,
 _lgs_defocuses=0x7fa51a8a1570,_unitdefocus=0x105426030,_fimnx=64,_fimny=64,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fa51912f630,_flat=0x7fa519133830,_domask=1,
 _submask=0x7fa51a9c4830,_kernel=0x7fa5191d7430,_kernels=0x1055e7030,_kerfftr=
 0x105323030,_kerffti=0x105360030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fa5191ac830,_x=0x7fa518c19000,_y=0x7fa518c19c70,_centroidgain=1,_rayleigh=
 0x7fa51a8a1e30,_bckgrdcalib=0x7fa5191b6e30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=1,lambda=0.65,noise=1,ron=6,darkcurrent=0,gspos=[-40,-52],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=11,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=
 0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=8,npixpersub=0,pixsize=0.268152,npixels=8,
 spotpitch=8,extfield=2.14521,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.14521,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fa51a8a1998,lgs_prof_alt=
 0x7fa51a8a2768,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fa518c1b3c0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fa518c11040,_origpixsize=0.3,_rebinfactor=4,_gsalt=0,_gsdepth=0,_nsub=52,
 _nsub4disp=60,_nmes=104,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x105121030,_masks=0x0,_fluxpersub=0x7fa518f3d850,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fa518f3d980,_skyfluxpersub=0x7fa518c0a850,
 _nphotons=598.845,_skynphotons=0,_tt=[0.0102643,0.00179287],_lastvalidtt=
 [0.0102643,0.00179287],_upttcommand=[0,0],_refmes=0x7fa518c1ac40,_tiprefv=
 0x7fa518f3fd40,_tiltrefv=0x7fa518f425a0,_tiprefvn=0x7fa518f3f4b0,_tiltrefvn=
 0x7fa518f43020,_reordervec=0x0,_npixels=8,_npb=0,_sdim=32,_nx=32,_nx4fft=32,
 _istart=0x7fa518c16a90,_jstart=0x7fa518c16f50,_binindices=0x7fa51a960630,
 _binxy=8,_centroidw=0x7fa51a8d7fc8,_fimage=0x7fa5191b0a30,_fimage2=0x0,
 _imistart=0x7fa518f40ac0,_imjstart=0x7fa518f40640,_imistart2=0x7fa518f3e3f0,
 _imjstart2=0x7fa518f3e520,_unittip=0x7fa519061230,_unittilt=0x7fa519049630,
 _lgs_defocuses=0x7fa51a8a1dc0,_unitdefocus=0x1053dd030,_fimnx=64,_fimny=64,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fa5190f2030,_flat=0x7fa519053830,_domask=1,
 _submask=0x7fa51aa83e30,_kernel=0x7fa51a05b630,_kernels=0x10539d030,_kerfftr=
 0x105624030,_kerffti=0x105661030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fa51929b430,_x=0x7fa518c19e90,_y=0x7fa518c19570,_centroidgain=1,_rayleigh=
 0x7fa51a8a1420,_bckgrdcalib=0x7fa5190ede30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=1,lambda=0.65,noise=1,ron=6,darkcurrent=0,gspos=[-40,52],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=11,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=
 0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=8,npixpersub=0,pixsize=0.268152,npixels=8,
 spotpitch=8,extfield=2.14521,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.14521,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fa51a8a13b0,lgs_prof_alt=
 0x7fa51a8a14c8,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7fa518c17880,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7fa518f40990,_origpixsize=0.3,_rebinfactor=4,_gsalt=0,_gsdepth=0,_nsub=52,
 _nsub4disp=60,_nmes=104,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x105873030,_masks=0x0,_fluxpersub=0x7fa518c0bb60,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7fa518c0f260,_skyfluxpersub=0x7fa518c131c0,
 _nphotons=598.845,_skynphotons=0,_tt=[-0.0040259,0.00194616],_lastvalidtt=
 [-0.0040259,0.00194616],_upttcommand=[0,0],_refmes=0x7fa518c1ae20,_tiprefv=
 0x7fa518f3edb0,_tiltrefv=0x7fa518f42920,_tiprefvn=0x7fa518f3f830,_tiltrefvn=
 0x7fa518f433a0,_reordervec=0x0,_npixels=8,_npb=0,_sdim=32,_nx=32,_nx4fft=32,
 _istart=0x7fa518f41280,_jstart=0x7fa518f3dab0,_binindices=0x7fa51a9dfc30,
 _binxy=8,_centroidw=0x7fa51a85fda0,_fimage=0x7fa5190f6230,_fimage2=0x0,
 _imistart=0x7fa518f401a0,_imjstart=0x7fa518f402d0,_imistart2=0x7fa518f3eb50,
 _imjstart2=0x7fa518f3ec80,_unittip=0x7fa51a8ec830,_unittilt=0x7fa51a9c7430,
 _lgs_defocuses=0x7fa51a8a1b90,_unitdefocus=0x10569e030,_fimnx=64,_fimny=64,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7fa51905bc30,_flat=0x7fa51920ac30,_domask=1,
 _submask=0x7fa5191d8a30,_kernel=0x7fa51a057230,_kernels=0x105732030,_kerfftr=
 0x1058b4030,_kerffti=0x1058f1030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7fa5190e1030,_x=0x7fa518f3de00,_y=0x7fa518f40e40,_centroidgain=1,_rayleigh=
 0x7fa51a8a1880,_bckgrdcalib=0x7fa519057a30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="dh",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test3-if1.fits",pitch=0,alt=0,hyst=0,push4imat=1,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fa51a8a1068,_ctrlden=0x7fa51a8a11b8,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,
 ecmatfile="test3-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=45,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fa51a96a6b8,_xlast=0x7fa51904a370,_ylast=[0x7fa518e10300,0x7fa518e10300,
 0x7fa518e10300],_y0=0x7fa518e0fef0,_signus=0x7fa518e10560,_puppixoffset=[0,0],
 _nact=45,_def=0x106566030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test3-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=56,_n2=201,_pupil=0x0,_command=0x7fa51904aaa8,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fa51a8a18f0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test3-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=8,cobs=0.14,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fa51a8a2618,xposition=0x7fa51a860048,yposition=
 0x7fa51a8d8380,dispzoom=0x7fa51a8d7eb8,ncpdm=0x0,_ntarget=9,_nlambda=1)
 gs_struct(zeropoint=3e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.0025,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")
=============================
GLAO example, 3 8x8 SHWFS, w/ disk harmonics
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.2682  0.0670  0.2682   2.15  2.15  2.15    8x 8    8x 8    598.8
 2      0.2682  0.0670  0.2682   2.15  2.15  2.15    8x 8    8x 8    598.8
 3      0.2682  0.0670  0.2682   2.15  2.15  2.15    8x 8    8x 8    598.8
 
Summary:
Mirror #1, dh, 45 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 52 subap., offaxis (+50.0",+0.0"), noise enabled
WFS # 2, hartmann (meth. 2), 52 subap., offaxis (-40.0",-52.0"), noise enabled
WFS # 3, hartmann (meth. 2), 52 subap., offaxis (-40.0",+52.0"), noise enabled
D/r0 (500nm) = 87.0; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     2.23  -60.0 -60.0      109.4   0.051      568.9
Star# 2     2.23    0.0 -60.0      145.1   0.042      568.9
Star# 3     2.23   60.0 -60.0      126.7   0.039      583.3
Star# 4     2.23  -60.0   0.0      102.3   0.064      554.5
Star# 5     2.23    0.0   0.0       67.9   0.104      554.5
Star# 6     2.23   60.0   0.0      108.8   0.049      568.9
Star# 7     2.23  -60.0  60.0      113.0   0.054      561.7
Star# 8     2.23    0.0  60.0       90.7   0.049      576.1
Star# 9     2.23   60.0  60.0      170.1   0.032      590.5
Field Avg  2.23                    114.9   0.054      569.7
Field rms  2.23                     28.1   0.020       11.5

Average images written in test3-imav.fits
Some other graphics in test3.ps

Original parameter file: test3.par:
 // YAO parameter file
 //-------------------------------
 sim.name            = "GLAO example, 3 8x8 SHWFS, w/ disk harmonics";
 sim.pupildiam       = 128;
 sim.debug           = 1;
 sim.verbose         = 1;
 sim.svipc_wfs_nfork = 3;
 
 
 //-------------------------------
 tel.diam            = 8.0;  //VLT
 tel.cobs            = 0.14;  //VLT
 
 //-------------------------------
 seeing              = 1.00; // in arcsec at 550nm (V band)
 r0at500             = (0.500e-6/seeing/4.848e-6)*(500./550.)^1.2;
 //atm.dr0at05mic    = 42.44;  // this is r0=0.166 at 550 nm
 atm.dr0at05mic      = tel.diam/r0at500;
 atm.screen          = &(Y_USER+"data/screen"+["1","2","3","4","5","6"]+".fits");
 atm.layerfrac       = &([0.64,0.2,0.05,0.05,0.05,0.01]);
 atm.layerspeed      = &([11.,20,29,35,30,40]);
 atm.layeralt        = &([0.,400,2000,6000,8500,13000]);
 atm.winddir         = &([0,0,0,0,0,0]);
 
 
 //-------------------------------
 nwfs = 3; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [50.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 11.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 8;
 wfs(n).pixsize      = 0.3;
 wfs(n).npixels      = 8;
 wfs(n).noise        = 1;
 wfs(n).ron          = 6.0;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 
 n   = 2;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [-40.,-52.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 11.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 8;
 wfs(n).pixsize      = 0.3;
 wfs(n).npixels      = 8;
 wfs(n).noise        = 1;
 wfs(n).ron          = 6.0;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 
 n   = 3;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [-40.,52.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 11.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 8;
 wfs(n).pixsize      = 0.3;
 wfs(n).npixels      = 8;
 wfs(n).noise        = 1;
 wfs(n).ron          = 6.0;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 
 //-------------------------------
 ndm = 1;
 dm = array(dms,ndm);
 
 n = 1;
 dm(n).type          = "dh";
 dm(n).ndh           = 45;
 dm(n).iffile        = "";
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01;
 dm(n).push4imat     = 1;
 
 //-------------------------------
 mat.condition       = &([50.]);
 mat.file            = "";
 
 //-------------------------------
 target.lambda       = &([2.23]);
 xy                  = (indices(3)-2.)*60.;
 target.xposition    = &(xy(,,1)(*));
 target.yposition    = &(xy(,,2)(*));
 target.dispzoom     = &(array(1.,numberof(xy(,,1))));
 
 //-------------------------------
 gs.zeropoint        = 3e11;
 
 //-------------------------------
 loop.gain           = 0.6;
 loop.framedelay     = 2;
 loop.niter          = 500;
 loop.ittime         = 2.5e-3;
 loop.startskip      = 10;
 loop.skipevery      = 1000;
 loop.skipby         = 10000;
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="GLAO example, 3 8x8 SHWFS, w/ disk harmonics",pupildiam=128,
 pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=3,svipc_wfs_forknb=0x0,
 shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=86.9669,screen=0x7faf8b0c68b0,layerfrac=0x7faf8b0c69c0,
 layerspeed=0x7faf8b0c6938,layeralt=0x7faf8a0c5058,winddir=0x7faf8a0c6268,
 _layeralt=0x7faf8b0c6690)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=6,darkcurrent=
 0,gspos=[50,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=11,skymag=0,filtertilt=0,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,
 fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,
 pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=8,npixpersub=0,pixsize=
 0.268152,npixels=8,spotpitch=8,extfield=2.14521,pupoffset=[0,0],shthmethod=1,
 shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,
 fstop="square",fssize=2.14521,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=
 0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,
 LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7faf8a099f20,
 lgs_prof_alt=0x7faf8a099660,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7faf89e36320,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7faf89d074b0,_origpixsize=0.3,_rebinfactor=4,_gsalt=0,_gsdepth=0,
 _nsub=52,_nsub4disp=60,_nmes=104,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,
 _tiltsh=0x108ee6030,_masks=0x0,_fluxpersub=0x7faf89c09230,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7faf89c104b0,_skyfluxpersub=0x7faf89e311a0,
 _nphotons=598.845,_skynphotons=0,_tt=[-0.0113169,0.0329731],_lastvalidtt=
 [-0.0113169,0.0329731],_upttcommand=[0,0],_refmes=0x7faf89e2f3b0,_tiprefv=
 0x7faf89e32140,_tiltrefv=0x7faf89e30590,_tiprefvn=0x7faf89e2efd0,_tiltrefvn=
 0x7faf89e30e20,_reordervec=0x0,_npixels=8,_npb=0,_sdim=32,_nx=32,_nx4fft=32,
 _istart=0x7faf89d06850,_jstart=0x7faf89d0a950,_binindices=0x7faf8a0fd830,
 _binxy=8,_centroidw=0x7faf8a0c5c08,_fimage=0x7faf8b162c30,_fimage2=0x0,
 _imistart=0x7faf89c08460,_imjstart=0x7faf89c12a10,_imistart2=0x7faf89c08e20,
 _imjstart2=0x7faf89c0ef90,_unittip=0x7faf8b131630,_unittilt=0x7faf8b130830,
 _lgs_defocuses=0x7faf8a09a4a0,_unitdefocus=0x10818e030,_fimnx=64,_fimny=64,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7faf8b152630,_flat=0x7faf8b156830,_domask=1,
 _submask=0x7faf8a0e7030,_kernel=0x7faf8a84e430,_kernels=0x10834f030,_kerfftr=
 0x10808b030,_kerffti=0x1080c8030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7faf8b1ae430,_x=0x7faf89d0ca00,_y=0x7faf89d0cc20,_centroidgain=1,_rayleigh=
 0x7faf8a09a510,_bckgrdcalib=0x7faf8b187e30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=1,lambda=0.65,noise=1,ron=6,darkcurrent=0,gspos=[-40,-52],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=11,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=
 0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=8,npixpersub=0,pixsize=0.268152,npixels=8,
 spotpitch=8,extfield=2.14521,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.14521,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7faf8a099d98,lgs_prof_alt=
 0x7faf8a09ab68,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7faf89e361f0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7faf89e27310,_origpixsize=0.3,_rebinfactor=4,_gsalt=0,_gsdepth=0,_nsub=52,
 _nsub4disp=60,_nmes=104,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x107e89030,_masks=0x0,_fluxpersub=0x7faf89f1b350,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7faf89e2e7d0,_skyfluxpersub=0x7faf89e30280,
 _nphotons=598.845,_skynphotons=0,_tt=[0.0102643,0.00179287],_lastvalidtt=
 [0.0102643,0.00179287],_upttcommand=[0,0],_refmes=0x7faf89e32890,_tiprefv=
 0x7faf89e31790,_tiltrefv=0x7faf89e2d9a0,_tiprefvn=0x7faf89e2fb80,_tiltrefvn=
 0x7faf89e32af0,_reordervec=0x0,_npixels=8,_npb=0,_sdim=32,_nx=32,_nx4fft=32,
 _istart=0x7faf89e2a5f0,_jstart=0x7faf89e32760,_binindices=0x7faf8b186c30,
 _binxy=8,_centroidw=0x7faf8a0c57c8,_fimage=0x7faf8b16d230,_fimage2=0x0,
 _imistart=0x7faf89e2dfe0,_imjstart=0x7faf89e2e440,_imistart2=0x7faf89e2e570,
 _imjstart2=0x7faf89e2e6a0,_unittip=0x7faf8b176430,_unittilt=0x7faf8b10f830,
 _lgs_defocuses=0x7faf8a09a1c0,_unitdefocus=0x108145030,_fimnx=64,_fimny=64,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7faf8b1bae30,_flat=0x7faf8b1bf030,_domask=1,
 _submask=0x7faf8b82b030,_kernel=0x7faf8a844430,_kernels=0x108105030,_kerfftr=
 0x10838c030,_kerffti=0x1083c9030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7faf8b200630,_x=0x7faf89e31f20,_y=0x7faf89e31570,_centroidgain=1,_rayleigh=
 0x7faf8a09a230,_bckgrdcalib=0x7faf8b15aa30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=1,lambda=0.65,noise=1,ron=6,darkcurrent=0,gspos=[-40,52],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=11,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=
 0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=8,npixpersub=0,pixsize=0.268152,npixels=8,
 spotpitch=8,extfield=2.14521,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.14521,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7faf8a09a150,lgs_prof_alt=
 0x7faf8a09a118,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7faf89e349c0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7faf89c18390,_origpixsize=0.3,_rebinfactor=4,_gsalt=0,_gsdepth=0,_nsub=52,
 _nsub4disp=60,_nmes=104,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x1085db030,_masks=0x0,_fluxpersub=0x7faf89d0ce40,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7faf89d0cf70,_skyfluxpersub=0x7faf89e2ea30,
 _nphotons=598.845,_skynphotons=0,_tt=[-0.0040259,0.00194616],_lastvalidtt=
 [-0.0040259,0.00194616],_upttcommand=[0,0],_refmes=0x7faf89e2c5a0,_tiprefv=
 0x7faf89e2ec50,_tiltrefv=0x7faf89e30aa0,_tiprefvn=0x7faf89e2ff00,_tiltrefvn=
 0x7faf89e32e70,_reordervec=0x0,_npixels=8,_npb=0,_sdim=32,_nx=32,_nx4fft=32,
 _istart=0x7faf89c10640,_jstart=0x7faf89c19200,_binindices=0x7faf8a84b030,
 _binxy=8,_centroidw=0x7faf8b0c67a0,_fimage=0x7faf8b204830,_fimage2=0x0,
 _imistart=0x7faf89d0c060,_imjstart=0x7faf89d0c3b0,_imistart2=0x7faf89d0c4e0,
 _imjstart2=0x7faf89d0c610,_unittip=0x7faf8a0fba30,_unittilt=0x7faf8a092c30,
 _lgs_defocuses=0x7faf8a09a000,_unitdefocus=0x108406030,_fimnx=64,_fimny=64,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7faf8b1c7430,_flat=0x7faf8b1cb630,_domask=1,
 _submask=0x7faf8a84f830,_kernel=0x7faf8a850a30,_kernels=0x10849a030,_kerfftr=
 0x10861c030,_kerffti=0x108659030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7faf8b21b630,_x=0x7faf89c1ad80,_y=0x7faf89c1b9a0,_centroidgain=1,_rayleigh=
 0x7faf8a099c80,_bckgrdcalib=0x7faf8b1c3230,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="dh",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test3-if1.fits",pitch=0,alt=0,hyst=0,push4imat=1,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7faf8a09a778,_ctrlden=0x7faf8a099e40,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,
 ecmatfile="test3-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=45,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf8b12ed70,_xlast=0x7faf8b81c318,_ylast=[0x7faf89c1be20,0x7faf89c1be20,
 0x7faf89c1be20],_y0=0x7faf89c1bbc0,_signus=0x7faf89c1c460,_puppixoffset=[0,0],
 _nact=45,_def=0x1092ce030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test3-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=56,_n2=201,_pupil=0x0,_command=0x7faf8b0a80e8,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7faf8a099cf0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test3-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=8,cobs=0.14,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7faf8a09aa50,xposition=0x7faf8b0c6a48,yposition=
 0x7faf8a0c5b80,dispzoom=0x7faf8a0c56b8,ncpdm=0x0,_ntarget=9,_nlambda=1)
 gs_struct(zeropoint=3e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.0025,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     2.23  -60.0 -60.0      109.4   0.051      568.9
Star# 2     2.23    0.0 -60.0      145.1   0.042      568.9
Star# 3     2.23   60.0 -60.0      126.7   0.039      583.3
Star# 4     2.23  -60.0   0.0      102.3   0.064      554.5
Star# 5     2.23    0.0   0.0       67.9   0.104      554.5
Star# 6     2.23   60.0   0.0      108.8   0.049      568.9
Star# 7     2.23  -60.0  60.0      113.0   0.054      561.7
Star# 8     2.23    0.0  60.0       90.7   0.049      576.1
Star# 9     2.23   60.0  60.0      170.1   0.032      590.5
Field Avg  2.23                    114.9   0.054      569.7
Field rms  2.23                     28.1   0.020       11.5

Average images written in test3-imav.fits
Some other graphics in test3.ps

Original parameter file: test3.par:
 // YAO parameter file
 //-------------------------------
 sim.name            = "GLAO example, 3 8x8 SHWFS, w/ disk harmonics";
 sim.pupildiam       = 128;
 sim.debug           = 1;
 sim.verbose         = 1;
 sim.svipc_wfs_nfork = 3;
 
 
 //-------------------------------
 tel.diam            = 8.0;  //VLT
 tel.cobs            = 0.14;  //VLT
 
 //-------------------------------
 seeing              = 1.00; // in arcsec at 550nm (V band)
 r0at500             = (0.500e-6/seeing/4.848e-6)*(500./550.)^1.2;
 //atm.dr0at05mic    = 42.44;  // this is r0=0.166 at 550 nm
 atm.dr0at05mic      = tel.diam/r0at500;
 atm.screen          = &(Y_USER+"data/screen"+["1","2","3","4","5","6"]+".fits");
 atm.layerfrac       = &([0.64,0.2,0.05,0.05,0.05,0.01]);
 atm.layerspeed      = &([11.,20,29,35,30,40]);
 atm.layeralt        = &([0.,400,2000,6000,8500,13000]);
 atm.winddir         = &([0,0,0,0,0,0]);
 
 
 //-------------------------------
 nwfs = 3; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [50.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 11.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 8;
 wfs(n).pixsize      = 0.3;
 wfs(n).npixels      = 8;
 wfs(n).noise        = 1;
 wfs(n).ron          = 6.0;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 
 n   = 2;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [-40.,-52.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 11.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 8;
 wfs(n).pixsize      = 0.3;
 wfs(n).npixels      = 8;
 wfs(n).noise        = 1;
 wfs(n).ron          = 6.0;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 
 n   = 3;
 wfs(n).type         = "hartmann";
 wfs(n).lambda       = 0.65;
 wfs(n).gspos        = [-40.,52.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 11.;
 wfs(n).shmethod     = 2;
 wfs(n).shnxsub      = 8;
 wfs(n).pixsize      = 0.3;
 wfs(n).npixels      = 8;
 wfs(n).noise        = 1;
 wfs(n).ron          = 6.0;
 wfs(n).shthreshold  = 0.;
 wfs(n).nintegcycles = 1;
 
 //-------------------------------
 ndm = 1;
 dm = array(dms,ndm);
 
 n = 1;
 dm(n).type          = "dh";
 dm(n).ndh           = 45;
 dm(n).iffile        = "";
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 0.01;
 dm(n).push4imat     = 1;
 
 //-------------------------------
 mat.condition       = &([50.]);
 mat.file            = "";
 
 //-------------------------------
 target.lambda       = &([2.23]);
 xy                  = (indices(3)-2.)*60.;
 target.xposition    = &(xy(,,1)(*));
 target.yposition    = &(xy(,,2)(*));
 target.dispzoom     = &(array(1.,numberof(xy(,,1))));
 
 //-------------------------------
 gs.zeropoint        = 3e11;
 
 //-------------------------------
 loop.gain           = 0.6;
 loop.framedelay     = 2;
 loop.niter          = 500;
 loop.ittime         = 2.5e-3;
 loop.startskip      = 10;
 loop.skipevery      = 1000;
 loop.skipby         = 10000;
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="GLAO example, 3 8x8 SHWFS, w/ disk harmonics",pupildiam=128,
 pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=3,svipc_wfs_forknb=0x0,
 shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=86.9669,screen=0x7faf8b0c68b0,layerfrac=0x7faf8b0c69c0,
 layerspeed=0x7faf8b0c6938,layeralt=0x7faf8a0c5058,winddir=0x7faf8a0c6268,
 _layeralt=0x7faf8b0c6690)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=6,darkcurrent=
 0,gspos=[50,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=11,skymag=0,filtertilt=0,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,
 fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,
 pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=8,npixpersub=0,pixsize=
 0.268152,npixels=8,spotpitch=8,extfield=2.14521,pupoffset=[0,0],shthmethod=1,
 shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,
 fstop="square",fssize=2.14521,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=
 0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,
 LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7faf8a099f20,
 lgs_prof_alt=0x7faf8a099660,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,
 _svipc_init_done=0,_svipc_subok=0x7faf89e349c0,_fork_subs=0x0,_fork_subs2=0x0,
 _validsubs=0x7faf89d074b0,_origpixsize=0.3,_rebinfactor=4,_gsalt=0,_gsdepth=0,
 _nsub=52,_nsub4disp=60,_nmes=104,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,
 _tiltsh=0x108ee6030,_masks=0x0,_fluxpersub=0x7faf89c09230,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7faf89c104b0,_skyfluxpersub=0x7faf89e311a0,
 _nphotons=598.845,_skynphotons=0,_tt=[-0.0113169,0.0329731],_lastvalidtt=
 [-0.0113169,0.0329731],_upttcommand=[0,0],_refmes=0x7faf89e2f3b0,_tiprefv=
 0x7faf89e32140,_tiltrefv=0x7faf89e30590,_tiprefvn=0x7faf89e2efd0,_tiltrefvn=
 0x7faf89e30e20,_reordervec=0x0,_npixels=8,_npb=0,_sdim=32,_nx=32,_nx4fft=32,
 _istart=0x7faf89d06850,_jstart=0x7faf89d0a950,_binindices=0x7faf8a0fd830,
 _binxy=8,_centroidw=0x7faf8a0c5c08,_fimage=0x7faf8a1b8c30,_fimage2=0x0,
 _imistart=0x7faf89c08460,_imjstart=0x7faf89c12a10,_imistart2=0x7faf89c08e20,
 _imjstart2=0x7faf89c0ef90,_unittip=0x7faf8b131630,_unittilt=0x7faf8b130830,
 _lgs_defocuses=0x7faf8a09a4a0,_unitdefocus=0x10818e030,_fimnx=64,_fimny=64,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7faf8b152630,_flat=0x7faf8b156830,_domask=1,
 _submask=0x7faf8a0e7030,_kernel=0x7faf8b185a30,_kernels=0x10834f030,_kerfftr=
 0x10808b030,_kerffti=0x1080c8030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7faf8a0e8230,_x=0x7faf89d0ca00,_y=0x7faf89d0cc20,_centroidgain=1,_rayleigh=
 0x7faf8a09a510,_bckgrdcalib=0x7faf8b187e30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=1,lambda=0.65,noise=1,ron=6,darkcurrent=0,gspos=[-40,-52],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=11,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=
 0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=8,npixpersub=0,pixsize=0.268152,npixels=8,
 spotpitch=8,extfield=2.14521,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.14521,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7faf8a099d98,lgs_prof_alt=
 0x7faf8a09ab68,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7faf89c10ad0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7faf89e27310,_origpixsize=0.3,_rebinfactor=4,_gsalt=0,_gsdepth=0,_nsub=52,
 _nsub4disp=60,_nmes=104,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x107e89030,_masks=0x0,_fluxpersub=0x7faf89f1b350,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7faf89e2e7d0,_skyfluxpersub=0x7faf89e30280,
 _nphotons=598.845,_skynphotons=0,_tt=[0.0102643,0.00179287],_lastvalidtt=
 [0.0102643,0.00179287],_upttcommand=[0,0],_refmes=0x7faf89e32890,_tiprefv=
 0x7faf89e31790,_tiltrefv=0x7faf89e2d9a0,_tiprefvn=0x7faf89e2fb80,_tiltrefvn=
 0x7faf89e32af0,_reordervec=0x0,_npixels=8,_npb=0,_sdim=32,_nx=32,_nx4fft=32,
 _istart=0x7faf89e2a5f0,_jstart=0x7faf89e32760,_binindices=0x7faf8b186c30,
 _binxy=8,_centroidw=0x7faf8a0c57c8,_fimage=0x7faf8b1ae430,_fimage2=0x0,
 _imistart=0x7faf89e2dfe0,_imjstart=0x7faf89e2e440,_imistart2=0x7faf89e2e570,
 _imjstart2=0x7faf89e2e6a0,_unittip=0x7faf8b176430,_unittilt=0x7faf8b10f830,
 _lgs_defocuses=0x7faf8a09a1c0,_unitdefocus=0x108145030,_fimnx=64,_fimny=64,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7faf8b1bae30,_flat=0x7faf8b1bf030,_domask=1,
 _submask=0x7faf8b82b030,_kernel=0x7faf8b208a30,_kernels=0x108105030,_kerfftr=
 0x10838c030,_kerffti=0x1083c9030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7faf8b162c30,_x=0x7faf89e31f20,_y=0x7faf89e31570,_centroidgain=1,_rayleigh=
 0x7faf8a09a230,_bckgrdcalib=0x7faf8b15aa30,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=1,lambda=0.65,noise=1,ron=6,darkcurrent=0,gspos=[-40,52],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=11,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=
 0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=2,shnxsub=8,npixpersub=0,pixsize=0.268152,npixels=8,
 spotpitch=8,extfield=2.14521,pupoffset=[0,0],shthmethod=1,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop="square",
 fssize=2.14521,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7faf8a09a150,lgs_prof_alt=
 0x7faf8a09a118,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x7faf89e36f00,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=
 0x7faf89c18390,_origpixsize=0.3,_rebinfactor=4,_gsalt=0,_gsdepth=0,_nsub=52,
 _nsub4disp=60,_nmes=104,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=
 0x1085db030,_masks=0x0,_fluxpersub=0x7faf89d0ce40,_rayleighflux=0x0,
 _sodiumflux=0x0,_raylfluxpersub=0x7faf89d0cf70,_skyfluxpersub=0x7faf89e2ea30,
 _nphotons=598.845,_skynphotons=0,_tt=[-0.0040259,0.00194616],_lastvalidtt=
 [-0.0040259,0.00194616],_upttcommand=[0,0],_refmes=0x7faf89e2c5a0,_tiprefv=
 0x7faf89e2ec50,_tiltrefv=0x7faf89e30aa0,_tiprefvn=0x7faf89e2ff00,_tiltrefvn=
 0x7faf89e32e70,_reordervec=0x0,_npixels=8,_npb=0,_sdim=32,_nx=32,_nx4fft=32,
 _istart=0x7faf89c10640,_jstart=0x7faf89c19200,_binindices=0x7faf8a84b030,
 _binxy=8,_centroidw=0x7faf8b0c67a0,_fimage=0x7faf8b16d230,_fimage2=0x0,
 _imistart=0x7faf89d0c060,_imjstart=0x7faf89d0c3b0,_imistart2=0x7faf89d0c4e0,
 _imjstart2=0x7faf89d0c610,_unittip=0x7faf8a0fba30,_unittilt=0x7faf8a092c30,
 _lgs_defocuses=0x7faf8a09a000,_unitdefocus=0x108406030,_fimnx=64,_fimny=64,
 _fimny2=0x0,_yoffset=0x0,_bias=0x7faf8b1c7430,_flat=0x7faf8b1cb630,_domask=1,
 _submask=0x7faf8a84f830,_kernel=0x7faf8b169030,_kernels=0x10849a030,_kerfftr=
 0x10861c030,_kerffti=0x108659030,_kernelconv=0,_cyclecounter=1,_dispimage=
 0x7faf8b200630,_x=0x7faf89c1ad80,_y=0x7faf89c1b9a0,_centroidgain=1,_rayleigh=
 0x7faf8a099c80,_bckgrdcalib=0x7faf8b1c3230,_bckgrdinit=0,_bckgrdsub=1,
 _meashist=0x0,_zeropoint=3e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=
 0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="dh",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test3-if1.fits",pitch=0,alt=0,hyst=0,push4imat=1,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7faf8a09a4d8,_ctrlden=0x7faf8a09a548,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,
 ecmatfile="test3-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=45,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf8b81b6b8,_xlast=0x7faf8b12ed70,_ylast=[0x7faf89d0d0a0,0x7faf89d0d0a0,
 0x7faf89d0d0a0],_y0=0x7faf89e36740,_signus=0x7faf89d0d300,_puppixoffset=[0,0],
 _nact=45,_def=0x1092ce030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test3-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=56,_n2=201,_pupil=0x0,_command=0x7faf8b12f4a8,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7faf8a099cf0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test3-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=8,cobs=0.14,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7faf8a09aa50,xposition=0x7faf8b0c6a48,yposition=
 0x7faf8a0c5b80,dispzoom=0x7faf8a0c56b8,ncpdm=0x0,_ntarget=9,_nlambda=1)
 gs_struct(zeropoint=3e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.0025,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")
