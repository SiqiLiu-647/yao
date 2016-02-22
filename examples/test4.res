=============================
Simple Curvature 36 actuators with noise
 
Summary:
Mirror #1, bimorph, 36 actuators, conjugated @ 0 m
WFS # 1, curvature (meth. 0), 36 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 42.4; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       44.5   0.382      273.7
Field Avg  1.65                     44.5   0.382      273.7
Field rms  1.65                      0.0   0.000        0.0
Star# 1     2.20    0.0   0.0       59.3   0.571      168.9
Field Avg  2.20                     59.3   0.571      168.9
Field rms  2.20                      0.0   0.000        0.0

Average images written in test4-imav.fits
Some other graphics in test4.ps

Original parameter file: test4.par:
 // YAO parameter file
 //-------------------------------
 sim.name             = "Simple Curvature 36 actuators with noise";
 sim.pupildiam        = 60;
 sim.debug            = 0;
 sim.verbose          = 0;
 
 //-------------------------------
 atm.dr0at05mic       = 42.44;  // this is r0=0.166 at 550 nm
 atm.screen           = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac        = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed       = &([11.,20,29,35]);
 atm.layeralt         = &([0.,400,6000,9000]);
 atm.winddir          = &([0,0,0,0]);
 
 
 //-------------------------------
 nwfs                 = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type          = "curvature";
 wfs(n).nsubperring   = &([6,12,18]);
 wfs(n).l             = 0.2;
 wfs(n).lambda        = 0.65;
 wfs(n).gspos         = [0.,0.];
 wfs(n).gsalt         = 0.;
 wfs(n).gsmag         = 5.;
 wfs(n).skymag        = 18.;
 wfs(n).noise         = 1;
 wfs(n).ron           = 0.;
 wfs(n).darkcurrent   = 400;
 wfs(n).nintegcycles  = 1;
 wfs(n).fieldstopdiam = 4.;
 
 //-------------------------------
 ndm = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type           = "bimorph";
 dm(n).iffile         = "";
 dm(n).alt            = 0.;
 dm(n).nelperring     = &([6,12,18]);
 dm(n).unitpervolt    = 0.01;
 dm(n).push4imat      = 10;
 
 //-------------------------------
 mat.condition        = &([15.]);
 
 //-------------------------------
 tel.diam             = 7.9;
 tel.cobs             = 0.1125;
 
 //-------------------------------
 target.lambda        = &([1.65,2.2]);
 target.xposition     = &([0.]);
 target.yposition     = &([0.]);
 target.dispzoom      = &([1.]);
 
 //-------------------------------
 gs.zeropoint         = 1e11;
 
 //-------------------------------
 loop.gain            = 0.6;
 loop.framedelay      = 1;
 loop.niter           = 1000;
 loop.ittime          = 2e-3;
 loop.startskip       = 10;
 loop.skipevery       = 1000;
 loop.skipby          = 10000;
 
==== dump of structures ====
 sim_struct(name="Simple Curvature 36 actuators with noise",pupildiam=60,
 pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,
 shmkey=0,semkey=0,_size=128,_cent=65)
 atm_struct(dr0at05mic=42.44,screen=0x7fab3291afc0,layerfrac=0x7fab3291af38,
 layerspeed=0x7fab3291aeb0,layeralt=0x7fab3291ada0,winddir=0x7fab3301bbc8,
 _layeralt=0x7fab3291ac90)
 [wfs_struct(type="curvature",subsystem=1,lambda=0.65,noise=1,ron=0,darkcurrent=
 400,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=18,filtertilt=0,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x7fab3301c008,angleoffset=0x0,l=0.2,rint=0x0,
 rout=0x0,fieldstopdiam=4,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,
 pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=0,shnxsub=0,npixpersub=0,
 pixsize=0,npixels=0,spotpitch=0,extfield=0,pupoffset=[0,0],shthmethod=0,
 shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,
 fstop=0x0,fssize=0,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fab3380bf70,lgs_prof_alt=
 0x7fab3380cd40,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x0,_origpixsize=0,
 _rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=36,_nsub4disp=0,_nmes=36,_sind=
 0x7fab34095630,_nsind=0x7fab328fd030,_cxdef=0x7fab340e2e30,_sxdef=
 0x7fab340bb030,_tiltsh=0x7fab340f3030,_masks=0x0,_fluxpersub=0x0,_rayleighflux=
 0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,_skyfluxpersub=0x0,_nphotons=2e+06,
 _skynphotons=158.577,_tt=[0.00130567,0.00438665],_lastvalidtt=[0.00130567,
 0.00438665],_upttcommand=[0,0],_refmes=0x7fab340a7b50,_tiprefv=0x7fab32701af0,
 _tiltrefv=0x7fab3270c270,_tiprefvn=0x7fab3270ece0,_tiltrefvn=0x7fab32706840,
 _reordervec=0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=
 0x0,_binindices=0x0,_binxy=0,_centroidw=0x0,_fimage=0x7fab34103230,_fimage2=
 0x7fab34113430,_imistart=0x0,_imjstart=0x0,_imistart2=0x0,_imjstart2=0x0,
 _unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,_fimnx=0,_fimny=
 0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,_submask=0x0,_kernel=
 0x0,_kernels=0x0,_kerfftr=0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7fab34103230,_x=0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,
 _bckgrdcalib=0x0,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=1e+11,
 _pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,
 _LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,
 _nkernels=1)]
 [dm_struct(type="bimorph",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test4-if1.fits",pitch=0,alt=0,hyst=0,push4imat=10,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fab3380d0c0,_ctrlden=0x7fab3380ba68,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x7fab3301bcd8,angleoffset=0x0,
 rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="test4-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fab338ddd50,_xlast=0x7fab338df0e8,_ylast=[0x7fab32630060,0x7fab32630060,
 0x7fab32630060],_y0=0x7fab3262fe70,_signus=0x7fab32630250,_puppixoffset=[0,0],
 _nact=36,_def=0x102acf030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test4-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=27,_n2=103,_pupil=0x0,_command=0x7fab338df718,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fab3380c7c0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test4-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fab3380c398,xposition=0x7fab3380c830,yposition=
 0x7fab3380bf38,dispzoom=0x7fab3380ca68,ncpdm=0x0,_ntarget=1,_nlambda=2)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       44.5   0.382      273.7
Field Avg  1.65                     44.5   0.382      273.7
Field rms  1.65                      0.0   0.000        0.0
Star# 1     2.20    0.0   0.0       59.3   0.571      168.9
Field Avg  2.20                     59.3   0.571      168.9
Field rms  2.20                      0.0   0.000        0.0

Average images written in test4-imav.fits
Some other graphics in test4.ps

Original parameter file: test4.par:
 // YAO parameter file
 //-------------------------------
 sim.name             = "Simple Curvature 36 actuators with noise";
 sim.pupildiam        = 60;
 sim.debug            = 0;
 sim.verbose          = 0;
 
 //-------------------------------
 atm.dr0at05mic       = 42.44;  // this is r0=0.166 at 550 nm
 atm.screen           = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac        = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed       = &([11.,20,29,35]);
 atm.layeralt         = &([0.,400,6000,9000]);
 atm.winddir          = &([0,0,0,0]);
 
 
 //-------------------------------
 nwfs                 = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type          = "curvature";
 wfs(n).nsubperring   = &([6,12,18]);
 wfs(n).l             = 0.2;
 wfs(n).lambda        = 0.65;
 wfs(n).gspos         = [0.,0.];
 wfs(n).gsalt         = 0.;
 wfs(n).gsmag         = 5.;
 wfs(n).skymag        = 18.;
 wfs(n).noise         = 1;
 wfs(n).ron           = 0.;
 wfs(n).darkcurrent   = 400;
 wfs(n).nintegcycles  = 1;
 wfs(n).fieldstopdiam = 4.;
 
 //-------------------------------
 ndm = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type           = "bimorph";
 dm(n).iffile         = "";
 dm(n).alt            = 0.;
 dm(n).nelperring     = &([6,12,18]);
 dm(n).unitpervolt    = 0.01;
 dm(n).push4imat      = 10;
 
 //-------------------------------
 mat.condition        = &([15.]);
 
 //-------------------------------
 tel.diam             = 7.9;
 tel.cobs             = 0.1125;
 
 //-------------------------------
 target.lambda        = &([1.65,2.2]);
 target.xposition     = &([0.]);
 target.yposition     = &([0.]);
 target.dispzoom      = &([1.]);
 
 //-------------------------------
 gs.zeropoint         = 1e11;
 
 //-------------------------------
 loop.gain            = 0.6;
 loop.framedelay      = 1;
 loop.niter           = 1000;
 loop.ittime          = 2e-3;
 loop.startskip       = 10;
 loop.skipevery       = 1000;
 loop.skipby          = 10000;
 
==== dump of structures ====
 sim_struct(name="Simple Curvature 36 actuators with noise",pupildiam=60,
 pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,
 shmkey=0,semkey=0,_size=128,_cent=65)
 atm_struct(dr0at05mic=42.44,screen=0x7fab3291afc0,layerfrac=0x7fab3291af38,
 layerspeed=0x7fab3291aeb0,layeralt=0x7fab3291ada0,winddir=0x7fab3301bbc8,
 _layeralt=0x7fab3291ac90)
 [wfs_struct(type="curvature",subsystem=1,lambda=0.65,noise=1,ron=0,darkcurrent=
 400,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=18,filtertilt=0,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x7fab3301c008,angleoffset=0x0,l=0.2,rint=0x0,
 rout=0x0,fieldstopdiam=4,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,
 pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=0,shnxsub=0,npixpersub=0,
 pixsize=0,npixels=0,spotpitch=0,extfield=0,pupoffset=[0,0],shthmethod=0,
 shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,
 fstop=0x0,fssize=0,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fab3380bf70,lgs_prof_alt=
 0x7fab3380cd40,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x0,_origpixsize=0,
 _rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=36,_nsub4disp=0,_nmes=36,_sind=
 0x7fab34095630,_nsind=0x7fab328fd030,_cxdef=0x7fab340e2e30,_sxdef=
 0x7fab340bb030,_tiltsh=0x7fab340f3030,_masks=0x0,_fluxpersub=0x0,_rayleighflux=
 0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,_skyfluxpersub=0x0,_nphotons=2e+06,
 _skynphotons=158.577,_tt=[0.00130567,0.00438665],_lastvalidtt=[0.00130567,
 0.00438665],_upttcommand=[0,0],_refmes=0x7fab340a7b50,_tiprefv=0x7fab32701af0,
 _tiltrefv=0x7fab3270c270,_tiprefvn=0x7fab3270ece0,_tiltrefvn=0x7fab32706840,
 _reordervec=0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=
 0x0,_binindices=0x0,_binxy=0,_centroidw=0x0,_fimage=0x7fab34103230,_fimage2=
 0x7fab34113430,_imistart=0x0,_imjstart=0x0,_imistart2=0x0,_imjstart2=0x0,
 _unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,_fimnx=0,_fimny=
 0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,_submask=0x0,_kernel=
 0x0,_kernels=0x0,_kerfftr=0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7fab34103230,_x=0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,
 _bckgrdcalib=0x0,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=1e+11,
 _pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,
 _LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,
 _nkernels=1)]
 [dm_struct(type="bimorph",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test4-if1.fits",pitch=0,alt=0,hyst=0,push4imat=10,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fab3380b750,_ctrlden=0x7fab3380c670,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x7fab3301bcd8,angleoffset=0x0,
 rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="test4-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fab338df610,_xlast=0x7fab338ddd50,_ylast=[0x7fab3242f110,0x7fab3242f110,
 0x7fab3242f110],_y0=0x7fab3242ec20,_signus=0x7fab32427770,_puppixoffset=[0,0],
 _nact=36,_def=0x102acf030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test4-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=27,_n2=103,_pupil=0x0,_command=0x7fab338188b8,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fab3380c7c0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test4-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fab3380c398,xposition=0x7fab3380c830,yposition=
 0x7fab3380bf38,dispzoom=0x7fab3380ca68,ncpdm=0x0,_ntarget=1,_nlambda=2)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")
=============================
Simple Curvature 36 actuators with noise
 
Summary:
Mirror #1, bimorph, 36 actuators, conjugated @ 0 m
WFS # 1, curvature (meth. 0), 36 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 42.4; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       44.5   0.382      273.7
Field Avg  1.65                     44.5   0.382      273.7
Field rms  1.65                      0.0   0.000        0.0
Star# 1     2.20    0.0   0.0       59.3   0.571      168.9
Field Avg  2.20                     59.3   0.571      168.9
Field rms  2.20                      0.0   0.000        0.0

Average images written in test4-imav.fits
Some other graphics in test4.ps

Original parameter file: test4.par:
 // YAO parameter file
 //-------------------------------
 sim.name             = "Simple Curvature 36 actuators with noise";
 sim.pupildiam        = 60;
 sim.debug            = 0;
 sim.verbose          = 0;
 
 //-------------------------------
 atm.dr0at05mic       = 42.44;  // this is r0=0.166 at 550 nm
 atm.screen           = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac        = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed       = &([11.,20,29,35]);
 atm.layeralt         = &([0.,400,6000,9000]);
 atm.winddir          = &([0,0,0,0]);
 
 
 //-------------------------------
 nwfs                 = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type          = "curvature";
 wfs(n).nsubperring   = &([6,12,18]);
 wfs(n).l             = 0.2;
 wfs(n).lambda        = 0.65;
 wfs(n).gspos         = [0.,0.];
 wfs(n).gsalt         = 0.;
 wfs(n).gsmag         = 5.;
 wfs(n).skymag        = 18.;
 wfs(n).noise         = 1;
 wfs(n).ron           = 0.;
 wfs(n).darkcurrent   = 400;
 wfs(n).nintegcycles  = 1;
 wfs(n).fieldstopdiam = 4.;
 
 //-------------------------------
 ndm = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type           = "bimorph";
 dm(n).iffile         = "";
 dm(n).alt            = 0.;
 dm(n).nelperring     = &([6,12,18]);
 dm(n).unitpervolt    = 0.01;
 dm(n).push4imat      = 10;
 
 //-------------------------------
 mat.condition        = &([15.]);
 
 //-------------------------------
 tel.diam             = 7.9;
 tel.cobs             = 0.1125;
 
 //-------------------------------
 target.lambda        = &([1.65,2.2]);
 target.xposition     = &([0.]);
 target.yposition     = &([0.]);
 target.dispzoom      = &([1.]);
 
 //-------------------------------
 gs.zeropoint         = 1e11;
 
 //-------------------------------
 loop.gain            = 0.6;
 loop.framedelay      = 1;
 loop.niter           = 1000;
 loop.ittime          = 2e-3;
 loop.startskip       = 10;
 loop.skipevery       = 1000;
 loop.skipby          = 10000;
 
==== dump of structures ====
 sim_struct(name="Simple Curvature 36 actuators with noise",pupildiam=60,
 pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,
 shmkey=0,semkey=0,_size=128,_cent=65)
 atm_struct(dr0at05mic=42.44,screen=0x7fa51a85ffc0,layerfrac=0x7fa51a85ff38,
 layerspeed=0x7fa51a85feb0,layeralt=0x7fa51a85fda0,winddir=0x7fa51a8d7fc8,
 _layeralt=0x7fa51a85fc90)
 [wfs_struct(type="curvature",subsystem=1,lambda=0.65,noise=1,ron=0,darkcurrent=
 400,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=18,filtertilt=0,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x7fa51a8d8408,angleoffset=0x0,l=0.2,rint=0x0,
 rout=0x0,fieldstopdiam=4,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,
 pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=0,shnxsub=0,npixpersub=0,
 pixsize=0,npixels=0,spotpitch=0,extfield=0,pupoffset=[0,0],shthmethod=0,
 shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,
 fstop=0x0,fssize=0,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fa51a8a1570,lgs_prof_alt=
 0x7fa51a8a1ce0,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x0,_origpixsize=0,
 _rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=36,_nsub4disp=0,_nmes=36,_sind=
 0x7fa5190e1030,_nsind=0x7fa51909de30,_cxdef=0x7fa51a063e30,_sxdef=
 0x7fa51a074030,_tiltsh=0x7fa51a084230,_masks=0x0,_fluxpersub=0x0,_rayleighflux=
 0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,_skyfluxpersub=0x0,_nphotons=2e+06,
 _skynphotons=158.577,_tt=[0.00130567,0.00438665],_lastvalidtt=[0.00130567,
 0.00438665],_upttcommand=[0,0],_refmes=0x7fa519049f50,_tiprefv=0x7fa518f3dd00,
 _tiltrefv=0x7fa518f3daf0,_tiprefvn=0x7fa518f3de60,_tiltrefvn=0x7fa518f3e420,
 _reordervec=0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=
 0x0,_binindices=0x0,_binxy=0,_centroidw=0x0,_fimage=0x7fa51a094430,_fimage2=
 0x7fa51a0a4630,_imistart=0x0,_imjstart=0x0,_imistart2=0x0,_imjstart2=0x0,
 _unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,_fimnx=0,_fimny=
 0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,_submask=0x0,_kernel=
 0x0,_kernels=0x0,_kerfftr=0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7fa51a094430,_x=0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,
 _bckgrdcalib=0x0,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=1e+11,
 _pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,
 _LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,
 _nkernels=1)]
 [dm_struct(type="bimorph",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test4-if1.fits",pitch=0,alt=0,hyst=0,push4imat=10,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fa51a8a26c0,_ctrlden=0x7fa51a867440,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x7fa51a8d80d8,angleoffset=0x0,
 rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="test4-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fa51a969950,_xlast=0x7fa51a96ace8,_ylast=[0x7fa518c1a8b0,0x7fa518c1a8b0,
 0x7fa518c1a8b0],_y0=0x7fa518c19f60,_signus=0x7fa518c131c0,_puppixoffset=[0,0],
 _nact=36,_def=0x106760030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test4-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=27,_n2=103,_pupil=0x0,_command=0x7fa51a96b318,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fa51a8a1dc0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test4-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fa51a8a1998,xposition=0x7fa51a8a2688,yposition=
 0x7fa51a8a1538,dispzoom=0x7fa51a8a1420,ncpdm=0x0,_ntarget=1,_nlambda=2)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       44.5   0.382      273.7
Field Avg  1.65                     44.5   0.382      273.7
Field rms  1.65                      0.0   0.000        0.0
Star# 1     2.20    0.0   0.0       59.3   0.571      168.9
Field Avg  2.20                     59.3   0.571      168.9
Field rms  2.20                      0.0   0.000        0.0

Average images written in test4-imav.fits
Some other graphics in test4.ps

Original parameter file: test4.par:
 // YAO parameter file
 //-------------------------------
 sim.name             = "Simple Curvature 36 actuators with noise";
 sim.pupildiam        = 60;
 sim.debug            = 0;
 sim.verbose          = 0;
 
 //-------------------------------
 atm.dr0at05mic       = 42.44;  // this is r0=0.166 at 550 nm
 atm.screen           = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac        = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed       = &([11.,20,29,35]);
 atm.layeralt         = &([0.,400,6000,9000]);
 atm.winddir          = &([0,0,0,0]);
 
 
 //-------------------------------
 nwfs                 = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type          = "curvature";
 wfs(n).nsubperring   = &([6,12,18]);
 wfs(n).l             = 0.2;
 wfs(n).lambda        = 0.65;
 wfs(n).gspos         = [0.,0.];
 wfs(n).gsalt         = 0.;
 wfs(n).gsmag         = 5.;
 wfs(n).skymag        = 18.;
 wfs(n).noise         = 1;
 wfs(n).ron           = 0.;
 wfs(n).darkcurrent   = 400;
 wfs(n).nintegcycles  = 1;
 wfs(n).fieldstopdiam = 4.;
 
 //-------------------------------
 ndm = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type           = "bimorph";
 dm(n).iffile         = "";
 dm(n).alt            = 0.;
 dm(n).nelperring     = &([6,12,18]);
 dm(n).unitpervolt    = 0.01;
 dm(n).push4imat      = 10;
 
 //-------------------------------
 mat.condition        = &([15.]);
 
 //-------------------------------
 tel.diam             = 7.9;
 tel.cobs             = 0.1125;
 
 //-------------------------------
 target.lambda        = &([1.65,2.2]);
 target.xposition     = &([0.]);
 target.yposition     = &([0.]);
 target.dispzoom      = &([1.]);
 
 //-------------------------------
 gs.zeropoint         = 1e11;
 
 //-------------------------------
 loop.gain            = 0.6;
 loop.framedelay      = 1;
 loop.niter           = 1000;
 loop.ittime          = 2e-3;
 loop.startskip       = 10;
 loop.skipevery       = 1000;
 loop.skipby          = 10000;
 
==== dump of structures ====
 sim_struct(name="Simple Curvature 36 actuators with noise",pupildiam=60,
 pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,
 shmkey=0,semkey=0,_size=128,_cent=65)
 atm_struct(dr0at05mic=42.44,screen=0x7fa51a85ffc0,layerfrac=0x7fa51a85ff38,
 layerspeed=0x7fa51a85feb0,layeralt=0x7fa51a85fda0,winddir=0x7fa51a8d7fc8,
 _layeralt=0x7fa51a85fc90)
 [wfs_struct(type="curvature",subsystem=1,lambda=0.65,noise=1,ron=0,darkcurrent=
 400,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=18,filtertilt=0,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x7fa51a8d8408,angleoffset=0x0,l=0.2,rint=0x0,
 rout=0x0,fieldstopdiam=4,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,
 pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=0,shnxsub=0,npixpersub=0,
 pixsize=0,npixels=0,spotpitch=0,extfield=0,pupoffset=[0,0],shthmethod=0,
 shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,
 fstop=0x0,fssize=0,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fa51a8a1570,lgs_prof_alt=
 0x7fa51a8a1ce0,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x0,_origpixsize=0,
 _rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=36,_nsub4disp=0,_nmes=36,_sind=
 0x7fa5190e1030,_nsind=0x7fa51909de30,_cxdef=0x7fa51a063e30,_sxdef=
 0x7fa51a074030,_tiltsh=0x7fa51a084230,_masks=0x0,_fluxpersub=0x0,_rayleighflux=
 0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,_skyfluxpersub=0x0,_nphotons=2e+06,
 _skynphotons=158.577,_tt=[0.00130567,0.00438665],_lastvalidtt=[0.00130567,
 0.00438665],_upttcommand=[0,0],_refmes=0x7fa519049f50,_tiprefv=0x7fa518f3dd00,
 _tiltrefv=0x7fa518f3daf0,_tiprefvn=0x7fa518f3de60,_tiltrefvn=0x7fa518f3e420,
 _reordervec=0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=
 0x0,_binindices=0x0,_binxy=0,_centroidw=0x0,_fimage=0x7fa51a094430,_fimage2=
 0x7fa51a0a4630,_imistart=0x0,_imjstart=0x0,_imistart2=0x0,_imjstart2=0x0,
 _unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,_fimnx=0,_fimny=
 0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,_submask=0x0,_kernel=
 0x0,_kernels=0x0,_kerfftr=0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7fa51a094430,_x=0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,
 _bckgrdcalib=0x0,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=1e+11,
 _pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,
 _LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,
 _nkernels=1)]
 [dm_struct(type="bimorph",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test4-if1.fits",pitch=0,alt=0,hyst=0,push4imat=10,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fa51a8a1a08,_ctrlden=0x7fa51a8a16c0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x7fa51a8d80d8,angleoffset=0x0,
 rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="test4-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7fa51a96b210,_xlast=0x7fa51a969950,_ylast=[0x7fa518c19f60,0x7fa518c19f60,
 0x7fa518c19f60],_y0=0x7fa518c1af50,_signus=0x7fa518c13350,_puppixoffset=[0,0],
 _nact=36,_def=0x106760030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test4-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=27,_n2=103,_pupil=0x0,_command=0x7fa51901f2b8,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7fa51a8a1dc0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test4-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fa51a8a1998,xposition=0x7fa51a8a2688,yposition=
 0x7fa51a8a1538,dispzoom=0x7fa51a8a1420,ncpdm=0x0,_ntarget=1,_nlambda=2)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")
=============================
Simple Curvature 36 actuators with noise
 
Summary:
Mirror #1, bimorph, 36 actuators, conjugated @ 0 m
WFS # 1, curvature (meth. 0), 36 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 42.4; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       44.5   0.382      273.7
Field Avg  1.65                     44.5   0.382      273.7
Field rms  1.65                      0.0   0.000        0.0
Star# 1     2.20    0.0   0.0       59.3   0.571      168.9
Field Avg  2.20                     59.3   0.571      168.9
Field rms  2.20                      0.0   0.000        0.0

Average images written in test4-imav.fits
Some other graphics in test4.ps

Original parameter file: test4.par:
 // YAO parameter file
 //-------------------------------
 sim.name             = "Simple Curvature 36 actuators with noise";
 sim.pupildiam        = 60;
 sim.debug            = 0;
 sim.verbose          = 0;
 
 //-------------------------------
 atm.dr0at05mic       = 42.44;  // this is r0=0.166 at 550 nm
 atm.screen           = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac        = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed       = &([11.,20,29,35]);
 atm.layeralt         = &([0.,400,6000,9000]);
 atm.winddir          = &([0,0,0,0]);
 
 
 //-------------------------------
 nwfs                 = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type          = "curvature";
 wfs(n).nsubperring   = &([6,12,18]);
 wfs(n).l             = 0.2;
 wfs(n).lambda        = 0.65;
 wfs(n).gspos         = [0.,0.];
 wfs(n).gsalt         = 0.;
 wfs(n).gsmag         = 5.;
 wfs(n).skymag        = 18.;
 wfs(n).noise         = 1;
 wfs(n).ron           = 0.;
 wfs(n).darkcurrent   = 400;
 wfs(n).nintegcycles  = 1;
 wfs(n).fieldstopdiam = 4.;
 
 //-------------------------------
 ndm = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type           = "bimorph";
 dm(n).iffile         = "";
 dm(n).alt            = 0.;
 dm(n).nelperring     = &([6,12,18]);
 dm(n).unitpervolt    = 0.01;
 dm(n).push4imat      = 10;
 
 //-------------------------------
 mat.condition        = &([15.]);
 
 //-------------------------------
 tel.diam             = 7.9;
 tel.cobs             = 0.1125;
 
 //-------------------------------
 target.lambda        = &([1.65,2.2]);
 target.xposition     = &([0.]);
 target.yposition     = &([0.]);
 target.dispzoom      = &([1.]);
 
 //-------------------------------
 gs.zeropoint         = 1e11;
 
 //-------------------------------
 loop.gain            = 0.6;
 loop.framedelay      = 1;
 loop.niter           = 1000;
 loop.ittime          = 2e-3;
 loop.startskip       = 10;
 loop.skipevery       = 1000;
 loop.skipby          = 10000;
 
==== dump of structures ====
 sim_struct(name="Simple Curvature 36 actuators with noise",pupildiam=60,
 pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,
 shmkey=0,semkey=0,_size=128,_cent=65)
 atm_struct(dr0at05mic=42.44,screen=0x7faf8b0c69c0,layerfrac=0x7faf8b0c6938,
 layerspeed=0x7faf8b0c68b0,layeralt=0x7faf8b0c67a0,winddir=0x7faf8a0c57c8,
 _layeralt=0x7faf8b0c6690)
 [wfs_struct(type="curvature",subsystem=1,lambda=0.65,noise=1,ron=0,darkcurrent=
 400,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=18,filtertilt=0,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x7faf8a0c5c08,angleoffset=0x0,l=0.2,rint=0x0,
 rout=0x0,fieldstopdiam=4,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,
 pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=0,shnxsub=0,npixpersub=0,
 pixsize=0,npixels=0,spotpitch=0,extfield=0,pupoffset=[0,0],shthmethod=0,
 shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,
 fstop=0x0,fssize=0,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7faf8a09a4a0,lgs_prof_alt=
 0x7faf8a09a740,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x0,_origpixsize=0,
 _rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=36,_nsub4disp=0,_nmes=36,_sind=
 0x7faf8a0dc430,_nsind=0x7faf8b0a8a30,_cxdef=0x7faf8b18c030,_sxdef=
 0x7faf8b19e230,_tiltsh=0x7faf8b1eb030,_masks=0x0,_fluxpersub=0x0,_rayleighflux=
 0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,_skyfluxpersub=0x0,_nphotons=2e+06,
 _skynphotons=158.577,_tt=[0.00130567,0.00438665],_lastvalidtt=[0.00130567,
 0.00438665],_upttcommand=[0,0],_refmes=0x7faf8b12e950,_tiprefv=0x7faf89e2e810,
 _tiltrefv=0x7faf89e2e6b0,_tiprefvn=0x7faf89e2e970,_tiltrefvn=0x7faf89e2ec30,
 _reordervec=0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=
 0x0,_binindices=0x0,_binxy=0,_centroidw=0x0,_fimage=0x7faf8b20b030,_fimage2=
 0x7faf8b21b230,_imistart=0x0,_imjstart=0x0,_imistart2=0x0,_imjstart2=0x0,
 _unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,_fimnx=0,_fimny=
 0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,_submask=0x0,_kernel=
 0x0,_kernels=0x0,_kerfftr=0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7faf8b20b030,_x=0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,
 _bckgrdcalib=0x0,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=1e+11,
 _pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,
 _LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,
 _nkernels=1)]
 [dm_struct(type="bimorph",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test4-if1.fits",pitch=0,alt=0,hyst=0,push4imat=10,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7faf8a09a118,_ctrlden=0x7faf8a099ac0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x7faf8a0c58d8,angleoffset=0x0,
 rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="test4-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7faf8b81a950,_xlast=0x7faf8b81bce8,_ylast=[0x7faf89f1bb20,0x7faf89f1bb20,
 0x7faf89f1bb20],_y0=0x7faf89f1cf40,_signus=0x7faf89f1bd10,_puppixoffset=[0,0],
 _nact=36,_def=0x1094c8030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test4-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=27,_n2=103,_pupil=0x0,_command=0x7faf8b81c318,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7faf8a09a1c0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test4-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7faf8a099d98,xposition=0x7faf8a099dd0,yposition=
 0x7faf8a099938,dispzoom=0x7faf8a09a230,ncpdm=0x0,_ntarget=1,_nlambda=2)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       44.5   0.382      273.7
Field Avg  1.65                     44.5   0.382      273.7
Field rms  1.65                      0.0   0.000        0.0
Star# 1     2.20    0.0   0.0       59.3   0.571      168.9
Field Avg  2.20                     59.3   0.571      168.9
Field rms  2.20                      0.0   0.000        0.0

Average images written in test4-imav.fits
Some other graphics in test4.ps

Original parameter file: test4.par:
 // YAO parameter file
 //-------------------------------
 sim.name             = "Simple Curvature 36 actuators with noise";
 sim.pupildiam        = 60;
 sim.debug            = 0;
 sim.verbose          = 0;
 
 //-------------------------------
 atm.dr0at05mic       = 42.44;  // this is r0=0.166 at 550 nm
 atm.screen           = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac        = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed       = &([11.,20,29,35]);
 atm.layeralt         = &([0.,400,6000,9000]);
 atm.winddir          = &([0,0,0,0]);
 
 
 //-------------------------------
 nwfs                 = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n   = 1;
 wfs(n).type          = "curvature";
 wfs(n).nsubperring   = &([6,12,18]);
 wfs(n).l             = 0.2;
 wfs(n).lambda        = 0.65;
 wfs(n).gspos         = [0.,0.];
 wfs(n).gsalt         = 0.;
 wfs(n).gsmag         = 5.;
 wfs(n).skymag        = 18.;
 wfs(n).noise         = 1;
 wfs(n).ron           = 0.;
 wfs(n).darkcurrent   = 400;
 wfs(n).nintegcycles  = 1;
 wfs(n).fieldstopdiam = 4.;
 
 //-------------------------------
 ndm = 1;
 dm = array(dms,ndm);
 
 n  =1;
 dm(n).type           = "bimorph";
 dm(n).iffile         = "";
 dm(n).alt            = 0.;
 dm(n).nelperring     = &([6,12,18]);
 dm(n).unitpervolt    = 0.01;
 dm(n).push4imat      = 10;
 
 //-------------------------------
 mat.condition        = &([15.]);
 
 //-------------------------------
 tel.diam             = 7.9;
 tel.cobs             = 0.1125;
 
 //-------------------------------
 target.lambda        = &([1.65,2.2]);
 target.xposition     = &([0.]);
 target.yposition     = &([0.]);
 target.dispzoom      = &([1.]);
 
 //-------------------------------
 gs.zeropoint         = 1e11;
 
 //-------------------------------
 loop.gain            = 0.6;
 loop.framedelay      = 1;
 loop.niter           = 1000;
 loop.ittime          = 2e-3;
 loop.startskip       = 10;
 loop.skipevery       = 1000;
 loop.skipby          = 10000;
 
==== dump of structures ====
 sim_struct(name="Simple Curvature 36 actuators with noise",pupildiam=60,
 pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,
 shmkey=0,semkey=0,_size=128,_cent=65)
 atm_struct(dr0at05mic=42.44,screen=0x7faf8b0c69c0,layerfrac=0x7faf8b0c6938,
 layerspeed=0x7faf8b0c68b0,layeralt=0x7faf8b0c67a0,winddir=0x7faf8a0c57c8,
 _layeralt=0x7faf8b0c6690)
 [wfs_struct(type="curvature",subsystem=1,lambda=0.65,noise=1,ron=0,darkcurrent=
 400,gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=5,skymag=18,filtertilt=0,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x7faf8a0c5c08,angleoffset=0x0,l=0.2,rint=0x0,
 rout=0x0,fieldstopdiam=4,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,
 pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=0,shnxsub=0,npixpersub=0,
 pixsize=0,npixels=0,spotpitch=0,extfield=0,pupoffset=[0,0],shthmethod=0,
 shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,
 fstop=0x0,fssize=0,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7faf8a09a4a0,lgs_prof_alt=
 0x7faf8a09a740,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x0,_origpixsize=0,
 _rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=36,_nsub4disp=0,_nmes=36,_sind=
 0x7faf8a0dc430,_nsind=0x7faf8b0a8a30,_cxdef=0x7faf8b18c030,_sxdef=
 0x7faf8b19e230,_tiltsh=0x7faf8b1eb030,_masks=0x0,_fluxpersub=0x0,_rayleighflux=
 0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,_skyfluxpersub=0x0,_nphotons=2e+06,
 _skynphotons=158.577,_tt=[0.00130567,0.00438665],_lastvalidtt=[0.00130567,
 0.00438665],_upttcommand=[0,0],_refmes=0x7faf8b12e950,_tiprefv=0x7faf89e2e810,
 _tiltrefv=0x7faf89e2e6b0,_tiprefvn=0x7faf89e2e970,_tiltrefvn=0x7faf89e2ec30,
 _reordervec=0x0,_npixels=0,_npb=0,_sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=
 0x0,_binindices=0x0,_binxy=0,_centroidw=0x0,_fimage=0x7faf8b20b030,_fimage2=
 0x7faf8b21b230,_imistart=0x0,_imjstart=0x0,_imistart2=0x0,_imjstart2=0x0,
 _unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,_unitdefocus=0x0,_fimnx=0,_fimny=
 0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=0x0,_domask=0,_submask=0x0,_kernel=
 0x0,_kernels=0x0,_kerfftr=0x0,_kerffti=0x0,_kernelconv=0,_cyclecounter=1,
 _dispimage=0x7faf8b20b030,_x=0x0,_y=0x0,_centroidgain=1,_rayleigh=0x0,
 _bckgrdcalib=0x0,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,_zeropoint=1e+11,
 _pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,_LLT_pscreen_name=0x0,
 _LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,
 _nkernels=1)]
 [dm_struct(type="bimorph",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test4-if1.fits",pitch=0,alt=0,hyst=0,push4imat=10,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7faf8a099af8,_ctrlden=0x7faf8a099660,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x7faf8a0c58d8,angleoffset=0x0,
 rint=0x0,rout=0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,
 coupling=0.2,ecmatfile="test4-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,
 filtertilt=0,nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=
 0x0,regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],
 _x0=0x7faf8b81c210,_xlast=0x7faf8b81a950,_ylast=[0x7faf89e31760,0x7faf89e31760,
 0x7faf89e31760],_y0=0x7faf89e31570,_signus=0x7faf89e2c860,_puppixoffset=[0,0],
 _nact=36,_def=0x1094c8030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test4-if1-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=27,_n2=103,_pupil=0x0,_command=0x7faf8a026ab8,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x0,_fMat=0x0)]
 mat_struct(method="svd",condition=0x7faf8a09a1c0,sparse_MR=10000,sparse_MN=
 200000,sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test4-mat.fits",
 fit_simple=0,fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=7.9,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7faf8a099d98,xposition=0x7faf8a099dd0,yposition=
 0x7faf8a099938,dispzoom=0x7faf8a09a230,ncpdm=0x0,_ntarget=1,_nlambda=2)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=1000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")
