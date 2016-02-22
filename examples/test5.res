=============================
2.5 metre telescope w/ Pyramid WFS
 
Summary:
Mirror #1, stackarray, 69 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 52 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 25.0; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     2.20    0.0   0.0      188.1   0.840      227.8
Field Avg  2.20                    188.1   0.840      227.8
Field rms  2.20                      0.0   0.000        0.0

Average images written in test5-imav.fits
Some other graphics in test5.ps

Original parameter file: test5.par:
 // YAO parameter file
 //-------------------------------
 tel.diam            = 2.5;
 tel.cobs            = 0.;
 
 sim.name            = "2.5 metre telescope w/ Pyramid WFS"
 sim.pupildiam       = 64;
 sim.debug           = 0;
 sim.verbose         = 1;
 
 //-------------------------------
 nwfs                = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n = 1;
 wfs(n).type         = "pyramid";
 wfs(n).fstop        = "round";
 wfs(n).fssize       = 2.0;
 wfs(n).lambda       = 0.65;
 wfs(n).shnxsub      = 8;
 wfs(n).npixpersub   = sim.pupildiam/wfs(n).shnxsub;
 
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 8;
 wfs(n).skymag       = 15.;
 wfs(n).noise        = 1;
 wfs(n).ron          = 3.;
 wfs(n).darkcurrent  = 0.;
 
 wfs(n).pyr_mod_npts = 16;
 wfs(n).pyr_mod_ampl = 0.25;
 wfs(n).pyr_padding  = 1;
 wfs(n).pyr_mod_loc  = "after";
 
 //-------------------------------
 ndm = 1;
 dm = array(dms,ndm);
 
 n = 1;
 
 dm(n).type          = "stackarray";
 dm(n).iffile        = "";
 dm(n).nxact         = wfs(n).shnxsub+1;
 dm(n).pitch         = wfs(n).npixpersub;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 1.;
 dm(n).push4imat     = 0.05;
 dm(n).elt           = 1;
 dm(n).gain          = 1.;
 dm(n).regtype       = "laplacian";
 
 if (wfs(1).type == "hartmann"){
    dm(1).regparam     = 1e-2;
 } else {dm(1).regparam     = 1e-2;}
 //-------------------------------
 mat.method          = "mmse";
 
 //-------------------------------
 target.lambda       = &([2.2]);
 target.xposition    = &([0.]);
 target.yposition    = &([0]);
 target.dispzoom     = &([1.]);
 
 //-------------------------------
 r0 = 0.10;
 atm.dr0at05mic     = tel.diam/r0;  // this is r0=0.2 at 500 nm
 atm.screen         = &(Y_USER+"data/screen1.fits");
 atm.layerfrac      = &([1.0]);
 atm.layerspeed     = &([12.]);
 atm.layeralt       = &([0.]);
 atm.winddir        = &([0.]);
 
 //-------------------------------
 gs.zeropoint       = 1.2e11;
 
 //-------------------------------
 loop.gain          = 0.3;
 loop.framedelay    = 2;
 loop.niter         = 100000;
 loop.startskip     = 30;
 loop.ittime        = 0.001;
 
==== dump of structures ====
 sim_struct(name="2.5 metre telescope w/ Pyramid WFS",pupildiam=64,pupilapod=0,
 debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,shmkey=0,
 semkey=0,_size=128,_cent=64.5)
 atm_struct(dr0at05mic=25,screen=0x7fab3380ca68,layerfrac=0x7fab3380bf38,
 layerspeed=0x7fab3380cc98,layeralt=0x7fab3380c830,winddir=0x7fab3380c398,
 _layeralt=0x7fab3380d088)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3,darkcurrent=0,
 gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=8,skymag=15,filtertilt=0,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,
 fieldstopdiam=0,pyr_mod_ampl=0.25,pyr_mod_npts=16,pyr_mod_pos=0x0,pyr_padding=
 1,pyr_mod_loc="after",pyr_denom="subap",shmethod=0,shnxsub=8,npixpersub=8,
 pixsize=0,npixels=0,spotpitch=0,extfield=0,pupoffset=[0,0],shthmethod=0,
 shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,
 fstop="round",fssize=2,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fab3380c0f8,lgs_prof_alt=
 0x7fab3380c328,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fab32506da0,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=52,_nsub4disp=0,_nmes=
 104,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=75714,_skynphotons=376.983,_tt=[-0.00493684,
 -0.00146536],_lastvalidtt=[-0.00493684,-0.00146536],_upttcommand=[0,0],_refmes=
 0x7fab32635230,_tiprefv=0x7fab32415680,_tiltrefv=0x7fab324152f0,_tiprefvn=
 0x7fab324302e0,_tiltrefvn=0x7fab324134f0,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fab33047030,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fab32a73230,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fab33047030,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fab32634880,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=1.2e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=
 [0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test5-if1.fits",pitch=8,alt=0,hyst=0,push4imat=0.05,thresholdresp=0.3,
 unitpervolt=1,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7fab3380ba68,
 _ctrlden=0x7fab3380c600,misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],
 disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,
 use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=9,pitchMargin=0,coupling=0.2,
 ecmatfile="test5-ecmat1.fits",noextrap=0,elt=1,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0.01,regtype=
 "laplacian",regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fab324115a0,_xlast=0x7fab32413fd0,_ylast=[0x7fab324314a0,
 0x7fab324314a0,0x7fab324314a0],_y0=0x7fab32414860,_signus=0x7fab324322f0,
 _puppixoffset=[0,0],_nact=69,_def=0x100e80030,_x=0x7fab326325a0,_y=
 0x7fab32632700,_i1=0x7fab32632860,_j1=0x7fab32633420,_ei1=0x7fab3301c668,_ej1=
 0x7fab3301bf80,_indval=0x7fab32632330,_indext=0x7fab3301aa60,_eiffile=
 "test5-if1-ext.fits",_edef=0x7fab3394e830,_ex=0x7fab3301b458,_ey=
 0x7fab3301bcd8,_enact=8,_n1=24,_n2=105,_pupil=0x0,_command=0x7fab3270ece0,
 _flat_command=0x0,_extrapcmat=0x7fab33957230,_eltdefsize=33,_regmatrix=
 0x7fab32947c30,_fMat=0x0)]
 mat_struct(method="mmse",condition=0x0,sparse_MR=10000,sparse_MN=200000,
 sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test5-mat.fits",fit_simple=0,
 fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=2.5,cobs=0,tipvib_white_rms=0,tipvib_1overf_rms=0,tipvib_peaks=
 0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=0,
 tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fab3380c670,xposition=0x7fab3380b7f8,yposition=
 0x7fab3380cd08,dispzoom=0x7fab3380bf70,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1.2e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.3,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=30,skipevery=100000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     2.20    0.0   0.0      188.1   0.840      227.8
Field Avg  2.20                    188.1   0.840      227.8
Field rms  2.20                      0.0   0.000        0.0

Average images written in test5-imav.fits
Some other graphics in test5.ps

Original parameter file: test5.par:
 // YAO parameter file
 //-------------------------------
 tel.diam            = 2.5;
 tel.cobs            = 0.;
 
 sim.name            = "2.5 metre telescope w/ Pyramid WFS"
 sim.pupildiam       = 64;
 sim.debug           = 0;
 sim.verbose         = 1;
 
 //-------------------------------
 nwfs                = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n = 1;
 wfs(n).type         = "pyramid";
 wfs(n).fstop        = "round";
 wfs(n).fssize       = 2.0;
 wfs(n).lambda       = 0.65;
 wfs(n).shnxsub      = 8;
 wfs(n).npixpersub   = sim.pupildiam/wfs(n).shnxsub;
 
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 8;
 wfs(n).skymag       = 15.;
 wfs(n).noise        = 1;
 wfs(n).ron          = 3.;
 wfs(n).darkcurrent  = 0.;
 
 wfs(n).pyr_mod_npts = 16;
 wfs(n).pyr_mod_ampl = 0.25;
 wfs(n).pyr_padding  = 1;
 wfs(n).pyr_mod_loc  = "after";
 
 //-------------------------------
 ndm = 1;
 dm = array(dms,ndm);
 
 n = 1;
 
 dm(n).type          = "stackarray";
 dm(n).iffile        = "";
 dm(n).nxact         = wfs(n).shnxsub+1;
 dm(n).pitch         = wfs(n).npixpersub;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 1.;
 dm(n).push4imat     = 0.05;
 dm(n).elt           = 1;
 dm(n).gain          = 1.;
 dm(n).regtype       = "laplacian";
 
 if (wfs(1).type == "hartmann"){
    dm(1).regparam     = 1e-2;
 } else {dm(1).regparam     = 1e-2;}
 //-------------------------------
 mat.method          = "mmse";
 
 //-------------------------------
 target.lambda       = &([2.2]);
 target.xposition    = &([0.]);
 target.yposition    = &([0]);
 target.dispzoom     = &([1.]);
 
 //-------------------------------
 r0 = 0.10;
 atm.dr0at05mic     = tel.diam/r0;  // this is r0=0.2 at 500 nm
 atm.screen         = &(Y_USER+"data/screen1.fits");
 atm.layerfrac      = &([1.0]);
 atm.layerspeed     = &([12.]);
 atm.layeralt       = &([0.]);
 atm.winddir        = &([0.]);
 
 //-------------------------------
 gs.zeropoint       = 1.2e11;
 
 //-------------------------------
 loop.gain          = 0.3;
 loop.framedelay    = 2;
 loop.niter         = 100000;
 loop.startskip     = 30;
 loop.ittime        = 0.001;
 
==== dump of structures ====
 sim_struct(name="2.5 metre telescope w/ Pyramid WFS",pupildiam=64,pupilapod=0,
 debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,shmkey=0,
 semkey=0,_size=128,_cent=64.5)
 atm_struct(dr0at05mic=25,screen=0x7fab3380ca68,layerfrac=0x7fab3380bf38,
 layerspeed=0x7fab3380cc98,layeralt=0x7fab3380c830,winddir=0x7fab3380c398,
 _layeralt=0x7fab3380d088)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3,darkcurrent=0,
 gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=8,skymag=15,filtertilt=0,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,
 fieldstopdiam=0,pyr_mod_ampl=0.25,pyr_mod_npts=16,pyr_mod_pos=0x0,pyr_padding=
 1,pyr_mod_loc="after",pyr_denom="subap",shmethod=0,shnxsub=8,npixpersub=8,
 pixsize=0,npixels=0,spotpitch=0,extfield=0,pupoffset=[0,0],shthmethod=0,
 shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,
 fstop="round",fssize=2,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fab3380c0f8,lgs_prof_alt=
 0x7fab3380c328,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fab32506da0,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=52,_nsub4disp=0,_nmes=
 104,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=75714,_skynphotons=376.983,_tt=[-0.00493684,
 -0.00146536],_lastvalidtt=[-0.00493684,-0.00146536],_upttcommand=[0,0],_refmes=
 0x7fab32635230,_tiprefv=0x7fab32415680,_tiltrefv=0x7fab324152f0,_tiprefvn=
 0x7fab324302e0,_tiltrefvn=0x7fab324134f0,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fab33908c30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fab32a73230,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fab33908c30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fab32634880,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=1.2e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=
 [0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test5-if1.fits",pitch=8,alt=0,hyst=0,push4imat=0.05,thresholdresp=0.3,
 unitpervolt=1,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7fab3284f9a8,
 _ctrlden=0x7fab3380c2f0,misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],
 disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,
 use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=9,pitchMargin=0,coupling=0.2,
 ecmatfile="test5-ecmat1.fits",noextrap=0,elt=1,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0.01,regtype=
 "laplacian",regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fab32502f40,_xlast=0x7fab32504fb0,_ylast=[0x7fab32506220,
 0x7fab32506220,0x7fab32506220],_y0=0x7fab32504c30,_signus=0x7fab32505de0,
 _puppixoffset=[0,0],_nact=69,_def=0x100e80030,_x=0x7fab326325a0,_y=
 0x7fab32632700,_i1=0x7fab32632860,_j1=0x7fab32633420,_ei1=0x7fab3301c668,_ej1=
 0x7fab3301bf80,_indval=0x7fab32632330,_indext=0x7fab3301aa60,_eiffile=
 "test5-if1-ext.fits",_edef=0x7fab3394e830,_ex=0x7fab3301b458,_ey=
 0x7fab3301bcd8,_enact=8,_n1=24,_n2=105,_pupil=0x0,_command=0x7fab32505190,
 _flat_command=0x0,_extrapcmat=0x7fab33957230,_eltdefsize=33,_regmatrix=
 0x7fab32947c30,_fMat=0x0)]
 mat_struct(method="mmse",condition=0x0,sparse_MR=10000,sparse_MN=200000,
 sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test5-mat.fits",fit_simple=0,
 fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=2.5,cobs=0,tipvib_white_rms=0,tipvib_1overf_rms=0,tipvib_peaks=
 0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=0,
 tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fab3380c670,xposition=0x7fab3380b7f8,yposition=
 0x7fab3380cd08,dispzoom=0x7fab3380bf70,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1.2e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.3,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=30,skipevery=100000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")
=============================
2.5 metre telescope w/ Pyramid WFS
 
Summary:
Mirror #1, stackarray, 69 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 52 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 25.0; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     2.20    0.0   0.0      188.1   0.840      227.8
Field Avg  2.20                    188.1   0.840      227.8
Field rms  2.20                      0.0   0.000        0.0

Average images written in test5-imav.fits
Some other graphics in test5.ps

Original parameter file: test5.par:
 // YAO parameter file
 //-------------------------------
 tel.diam            = 2.5;
 tel.cobs            = 0.;
 
 sim.name            = "2.5 metre telescope w/ Pyramid WFS"
 sim.pupildiam       = 64;
 sim.debug           = 0;
 sim.verbose         = 1;
 
 //-------------------------------
 nwfs                = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n = 1;
 wfs(n).type         = "pyramid";
 wfs(n).fstop        = "round";
 wfs(n).fssize       = 2.0;
 wfs(n).lambda       = 0.65;
 wfs(n).shnxsub      = 8;
 wfs(n).npixpersub   = sim.pupildiam/wfs(n).shnxsub;
 
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 8;
 wfs(n).skymag       = 15.;
 wfs(n).noise        = 1;
 wfs(n).ron          = 3.;
 wfs(n).darkcurrent  = 0.;
 
 wfs(n).pyr_mod_npts = 16;
 wfs(n).pyr_mod_ampl = 0.25;
 wfs(n).pyr_padding  = 1;
 wfs(n).pyr_mod_loc  = "after";
 
 //-------------------------------
 ndm = 1;
 dm = array(dms,ndm);
 
 n = 1;
 
 dm(n).type          = "stackarray";
 dm(n).iffile        = "";
 dm(n).nxact         = wfs(n).shnxsub+1;
 dm(n).pitch         = wfs(n).npixpersub;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 1.;
 dm(n).push4imat     = 0.05;
 dm(n).elt           = 1;
 dm(n).gain          = 1.;
 dm(n).regtype       = "laplacian";
 
 if (wfs(1).type == "hartmann"){
    dm(1).regparam     = 1e-2;
 } else {dm(1).regparam     = 1e-2;}
 //-------------------------------
 mat.method          = "mmse";
 
 //-------------------------------
 target.lambda       = &([2.2]);
 target.xposition    = &([0.]);
 target.yposition    = &([0]);
 target.dispzoom     = &([1.]);
 
 //-------------------------------
 r0 = 0.10;
 atm.dr0at05mic     = tel.diam/r0;  // this is r0=0.2 at 500 nm
 atm.screen         = &(Y_USER+"data/screen1.fits");
 atm.layerfrac      = &([1.0]);
 atm.layerspeed     = &([12.]);
 atm.layeralt       = &([0.]);
 atm.winddir        = &([0.]);
 
 //-------------------------------
 gs.zeropoint       = 1.2e11;
 
 //-------------------------------
 loop.gain          = 0.3;
 loop.framedelay    = 2;
 loop.niter         = 100000;
 loop.startskip     = 30;
 loop.ittime        = 0.001;
 
==== dump of structures ====
 sim_struct(name="2.5 metre telescope w/ Pyramid WFS",pupildiam=64,pupilapod=0,
 debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,shmkey=0,
 semkey=0,_size=128,_cent=64.5)
 atm_struct(dr0at05mic=25,screen=0x7fa51a8a1420,layerfrac=0x7fa51a8a1538,
 layerspeed=0x7fa51a8a13b0,layeralt=0x7fa51a8a2688,winddir=0x7fa51a8a1998,
 _layeralt=0x7fa51a8a1928)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3,darkcurrent=0,
 gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=8,skymag=15,filtertilt=0,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,
 fieldstopdiam=0,pyr_mod_ampl=0.25,pyr_mod_npts=16,pyr_mod_pos=0x0,pyr_padding=
 1,pyr_mod_loc="after",pyr_denom="subap",shmethod=0,shnxsub=8,npixpersub=8,
 pixsize=0,npixels=0,spotpitch=0,extfield=0,pupoffset=[0,0],shthmethod=0,
 shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,
 fstop="round",fssize=2,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fa51a8a2570,lgs_prof_alt=
 0x7fa51a8a1378,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fa518f3d850,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=52,_nsub4disp=0,_nmes=
 104,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=75714,_skynphotons=376.983,_tt=[-0.00493684,
 -0.00146536],_lastvalidtt=[-0.00493684,-0.00146536],_upttcommand=[0,0],_refmes=
 0x7fa518c0b3a0,_tiprefv=0x7fa518e103d0,_tiltrefv=0x7fa518f441e0,_tiprefvn=
 0x7fa518e10ad0,_tiltrefvn=0x7fa518f44560,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fa5191d9230,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fa51aa04230,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fa5191d9230,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fa518e10750,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=1.2e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=
 [0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test5-if1.fits",pitch=8,alt=0,hyst=0,push4imat=0.05,thresholdresp=0.3,
 unitpervolt=1,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7fa51a8a1b20,
 _ctrlden=0x7fa51a8a2298,misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],
 disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,
 use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=9,pitchMargin=0,coupling=0.2,
 ecmatfile="test5-ecmat1.fits",noextrap=0,elt=1,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0.01,regtype=
 "laplacian",regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fa518d0a380,_xlast=0x7fa518d0a860,_ylast=[0x7fa518d0a9c0,
 0x7fa518d0a9c0,0x7fa518d0a9c0],_y0=0x7fa518d0a4e0,_signus=0x7fa518d0ad40,
 _puppixoffset=[0,0],_nact=69,_def=0x1055ad030,_x=0x7fa518c0a290,_y=
 0x7fa518c0c4d0,_i1=0x7fa518c11f00,_j1=0x7fa518c0c630,_ei1=0x7fa51a8d8a68,_ej1=
 0x7fa51a8d8380,_indval=0x7fa518c1be90,_indext=0x7fa51a8cfe60,_eiffile=
 "test5-if1-ext.fits",_edef=0x7fa5190e1030,_ex=0x7fa51a8d7858,_ey=
 0x7fa51a8d80d8,_enact=8,_n1=24,_n2=105,_pupil=0x0,_command=0x7fa518f1f0e0,
 _flat_command=0x0,_extrapcmat=0x7fa51a04b830,_eltdefsize=33,_regmatrix=
 0x7fa51a05f830,_fMat=0x0)]
 mat_struct(method="mmse",condition=0x0,sparse_MR=10000,sparse_MN=200000,
 sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test5-mat.fits",fit_simple=0,
 fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=2.5,cobs=0,tipvib_white_rms=0,tipvib_1overf_rms=0,tipvib_peaks=
 0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=0,
 tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fa51a8a16c0,xposition=0x7fa51a8a1110,yposition=
 0x7fa51a8a2110,dispzoom=0x7fa51a8a1570,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1.2e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.3,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=30,skipevery=100000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     2.20    0.0   0.0      188.1   0.840      227.8
Field Avg  2.20                    188.1   0.840      227.8
Field rms  2.20                      0.0   0.000        0.0

Average images written in test5-imav.fits
Some other graphics in test5.ps

Original parameter file: test5.par:
 // YAO parameter file
 //-------------------------------
 tel.diam            = 2.5;
 tel.cobs            = 0.;
 
 sim.name            = "2.5 metre telescope w/ Pyramid WFS"
 sim.pupildiam       = 64;
 sim.debug           = 0;
 sim.verbose         = 1;
 
 //-------------------------------
 nwfs                = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n = 1;
 wfs(n).type         = "pyramid";
 wfs(n).fstop        = "round";
 wfs(n).fssize       = 2.0;
 wfs(n).lambda       = 0.65;
 wfs(n).shnxsub      = 8;
 wfs(n).npixpersub   = sim.pupildiam/wfs(n).shnxsub;
 
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 8;
 wfs(n).skymag       = 15.;
 wfs(n).noise        = 1;
 wfs(n).ron          = 3.;
 wfs(n).darkcurrent  = 0.;
 
 wfs(n).pyr_mod_npts = 16;
 wfs(n).pyr_mod_ampl = 0.25;
 wfs(n).pyr_padding  = 1;
 wfs(n).pyr_mod_loc  = "after";
 
 //-------------------------------
 ndm = 1;
 dm = array(dms,ndm);
 
 n = 1;
 
 dm(n).type          = "stackarray";
 dm(n).iffile        = "";
 dm(n).nxact         = wfs(n).shnxsub+1;
 dm(n).pitch         = wfs(n).npixpersub;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 1.;
 dm(n).push4imat     = 0.05;
 dm(n).elt           = 1;
 dm(n).gain          = 1.;
 dm(n).regtype       = "laplacian";
 
 if (wfs(1).type == "hartmann"){
    dm(1).regparam     = 1e-2;
 } else {dm(1).regparam     = 1e-2;}
 //-------------------------------
 mat.method          = "mmse";
 
 //-------------------------------
 target.lambda       = &([2.2]);
 target.xposition    = &([0.]);
 target.yposition    = &([0]);
 target.dispzoom     = &([1.]);
 
 //-------------------------------
 r0 = 0.10;
 atm.dr0at05mic     = tel.diam/r0;  // this is r0=0.2 at 500 nm
 atm.screen         = &(Y_USER+"data/screen1.fits");
 atm.layerfrac      = &([1.0]);
 atm.layerspeed     = &([12.]);
 atm.layeralt       = &([0.]);
 atm.winddir        = &([0.]);
 
 //-------------------------------
 gs.zeropoint       = 1.2e11;
 
 //-------------------------------
 loop.gain          = 0.3;
 loop.framedelay    = 2;
 loop.niter         = 100000;
 loop.startskip     = 30;
 loop.ittime        = 0.001;
 
==== dump of structures ====
 sim_struct(name="2.5 metre telescope w/ Pyramid WFS",pupildiam=64,pupilapod=0,
 debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,shmkey=0,
 semkey=0,_size=128,_cent=64.5)
 atm_struct(dr0at05mic=25,screen=0x7fa51a8a1420,layerfrac=0x7fa51a8a1538,
 layerspeed=0x7fa51a8a13b0,layeralt=0x7fa51a8a2688,winddir=0x7fa51a8a1998,
 _layeralt=0x7fa51a8a1928)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3,darkcurrent=0,
 gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=8,skymag=15,filtertilt=0,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,
 fieldstopdiam=0,pyr_mod_ampl=0.25,pyr_mod_npts=16,pyr_mod_pos=0x0,pyr_padding=
 1,pyr_mod_loc="after",pyr_denom="subap",shmethod=0,shnxsub=8,npixpersub=8,
 pixsize=0,npixels=0,spotpitch=0,extfield=0,pupoffset=[0,0],shthmethod=0,
 shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,
 fstop="round",fssize=2,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7fa51a8a2570,lgs_prof_alt=
 0x7fa51a8a1378,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fa518f3d850,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=52,_nsub4disp=0,_nmes=
 104,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=75714,_skynphotons=376.983,_tt=[-0.00493684,
 -0.00146536],_lastvalidtt=[-0.00493684,-0.00146536],_upttcommand=[0,0],_refmes=
 0x7fa518c0b3a0,_tiprefv=0x7fa518e103d0,_tiltrefv=0x7fa518f441e0,_tiprefvn=
 0x7fa518e10ad0,_tiltrefvn=0x7fa518f44560,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7fa51a95fc30,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7fa51aa04230,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fa51a95fc30,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7fa518e10750,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=1.2e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=
 [0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test5-if1.fits",pitch=8,alt=0,hyst=0,push4imat=0.05,thresholdresp=0.3,
 unitpervolt=1,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7fa5190427a8,
 _ctrlden=0x7fa51a8a1b90,misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],
 disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,
 use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=9,pitchMargin=0,coupling=0.2,
 ecmatfile="test5-ecmat1.fits",noextrap=0,elt=1,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0.01,regtype=
 "laplacian",regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7fa518f46970,_xlast=0x7fa518f41e40,_ylast=[0x7fa518d09750,
 0x7fa518d09750,0x7fa518d09750],_y0=0x7fa518f3fa70,_signus=0x7fa518d09ad0,
 _puppixoffset=[0,0],_nact=69,_def=0x1055ad030,_x=0x7fa518c0a290,_y=
 0x7fa518c0c4d0,_i1=0x7fa518c11f00,_j1=0x7fa518c0c630,_ei1=0x7fa51a8d8a68,_ej1=
 0x7fa51a8d8380,_indval=0x7fa518c1be90,_indext=0x7fa51a8cfe60,_eiffile=
 "test5-if1-ext.fits",_edef=0x7fa5190e1030,_ex=0x7fa51a8d7858,_ey=
 0x7fa51a8d80d8,_enact=8,_n1=24,_n2=105,_pupil=0x0,_command=0x7fa518f41b50,
 _flat_command=0x0,_extrapcmat=0x7fa51a04b830,_eltdefsize=33,_regmatrix=
 0x7fa51a05f830,_fMat=0x0)]
 mat_struct(method="mmse",condition=0x0,sparse_MR=10000,sparse_MN=200000,
 sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test5-mat.fits",fit_simple=0,
 fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=2.5,cobs=0,tipvib_white_rms=0,tipvib_1overf_rms=0,tipvib_peaks=
 0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=0,
 tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fa51a8a16c0,xposition=0x7fa51a8a1110,yposition=
 0x7fa51a8a2110,dispzoom=0x7fa51a8a1570,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1.2e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.3,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=30,skipevery=100000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")
=============================
2.5 metre telescope w/ Pyramid WFS
 
Summary:
Mirror #1, stackarray, 69 actuators, conjugated @ 0 m
WFS # 1, pyramid (meth. 0), 52 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 25.0; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     2.20    0.0   0.0      188.1   0.840      227.8
Field Avg  2.20                    188.1   0.840      227.8
Field rms  2.20                      0.0   0.000        0.0

Average images written in test5-imav.fits
Some other graphics in test5.ps

Original parameter file: test5.par:
 // YAO parameter file
 //-------------------------------
 tel.diam            = 2.5;
 tel.cobs            = 0.;
 
 sim.name            = "2.5 metre telescope w/ Pyramid WFS"
 sim.pupildiam       = 64;
 sim.debug           = 0;
 sim.verbose         = 1;
 
 //-------------------------------
 nwfs                = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n = 1;
 wfs(n).type         = "pyramid";
 wfs(n).fstop        = "round";
 wfs(n).fssize       = 2.0;
 wfs(n).lambda       = 0.65;
 wfs(n).shnxsub      = 8;
 wfs(n).npixpersub   = sim.pupildiam/wfs(n).shnxsub;
 
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 8;
 wfs(n).skymag       = 15.;
 wfs(n).noise        = 1;
 wfs(n).ron          = 3.;
 wfs(n).darkcurrent  = 0.;
 
 wfs(n).pyr_mod_npts = 16;
 wfs(n).pyr_mod_ampl = 0.25;
 wfs(n).pyr_padding  = 1;
 wfs(n).pyr_mod_loc  = "after";
 
 //-------------------------------
 ndm = 1;
 dm = array(dms,ndm);
 
 n = 1;
 
 dm(n).type          = "stackarray";
 dm(n).iffile        = "";
 dm(n).nxact         = wfs(n).shnxsub+1;
 dm(n).pitch         = wfs(n).npixpersub;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 1.;
 dm(n).push4imat     = 0.05;
 dm(n).elt           = 1;
 dm(n).gain          = 1.;
 dm(n).regtype       = "laplacian";
 
 if (wfs(1).type == "hartmann"){
    dm(1).regparam     = 1e-2;
 } else {dm(1).regparam     = 1e-2;}
 //-------------------------------
 mat.method          = "mmse";
 
 //-------------------------------
 target.lambda       = &([2.2]);
 target.xposition    = &([0.]);
 target.yposition    = &([0]);
 target.dispzoom     = &([1.]);
 
 //-------------------------------
 r0 = 0.10;
 atm.dr0at05mic     = tel.diam/r0;  // this is r0=0.2 at 500 nm
 atm.screen         = &(Y_USER+"data/screen1.fits");
 atm.layerfrac      = &([1.0]);
 atm.layerspeed     = &([12.]);
 atm.layeralt       = &([0.]);
 atm.winddir        = &([0.]);
 
 //-------------------------------
 gs.zeropoint       = 1.2e11;
 
 //-------------------------------
 loop.gain          = 0.3;
 loop.framedelay    = 2;
 loop.niter         = 100000;
 loop.startskip     = 30;
 loop.ittime        = 0.001;
 
==== dump of structures ====
 sim_struct(name="2.5 metre telescope w/ Pyramid WFS",pupildiam=64,pupilapod=0,
 debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,shmkey=0,
 semkey=0,_size=128,_cent=64.5)
 atm_struct(dr0at05mic=25,screen=0x7faf8a09a230,layerfrac=0x7faf8a099938,
 layerspeed=0x7faf8a09a150,layeralt=0x7faf8a099dd0,winddir=0x7faf8a099d98,
 _layeralt=0x7faf8a099ee8)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3,darkcurrent=0,
 gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=8,skymag=15,filtertilt=0,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,
 fieldstopdiam=0,pyr_mod_ampl=0.25,pyr_mod_npts=16,pyr_mod_pos=0x0,pyr_padding=
 1,pyr_mod_loc="after",pyr_denom="subap",shmethod=0,shnxsub=8,npixpersub=8,
 pixsize=0,npixels=0,spotpitch=0,extfield=0,pupoffset=[0,0],shthmethod=0,
 shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,
 fstop="round",fssize=2,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7faf8a09a778,lgs_prof_alt=
 0x7faf8a099e40,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7faf89c1e220,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=52,_nsub4disp=0,_nmes=
 104,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=75714,_skynphotons=376.983,_tt=[-0.00493684,
 -0.00146536],_lastvalidtt=[-0.00493684,-0.00146536],_upttcommand=[0,0],_refmes=
 0x7faf89e2d9a0,_tiprefv=0x7faf89e04a40,_tiltrefv=0x7faf89d0ca40,_tiprefvn=
 0x7faf89e06fe0,_tiltrefvn=0x7faf89d0d140,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7faf8b175030,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7faf8a197430,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7faf8b175030,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7faf89c1bcb0,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=1.2e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=
 [0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test5-if1.fits",pitch=8,alt=0,hyst=0,push4imat=0.05,thresholdresp=0.3,
 unitpervolt=1,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7faf8a09a118,
 _ctrlden=0x7faf8a0994d8,misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],
 disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,
 use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=9,pitchMargin=0,coupling=0.2,
 ecmatfile="test5-ecmat1.fits",noextrap=0,elt=1,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0.01,regtype=
 "laplacian",regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7faf89c0bd40,_xlast=0x7faf89c17470,_ylast=[0x7faf89c1e400,
 0x7faf89c1e400,0x7faf89c1e400],_y0=0x7faf89c1acf0,_signus=0x7faf89c205d0,
 _puppixoffset=[0,0],_nact=69,_def=0x108315030,_x=0x7faf89e338c0,_y=
 0x7faf89e04580,_i1=0x7faf89e04dc0,_j1=0x7faf89e05f40,_ei1=0x7faf8a0c6268,_ej1=
 0x7faf8a0c5b80,_indval=0x7faf89e33650,_indext=0x7faf8a0c4660,_eiffile=
 "test5-if1-ext.fits",_edef=0x7faf8b287e30,_ex=0x7faf8a0c5058,_ey=
 0x7faf8a0c58d8,_enact=8,_n1=24,_n2=105,_pupil=0x0,_command=0x7faf89c07ad0,
 _flat_command=0x0,_extrapcmat=0x7faf8a0fd030,_eltdefsize=33,_regmatrix=
 0x7faf8a1a8a30,_fMat=0x0)]
 mat_struct(method="mmse",condition=0x0,sparse_MR=10000,sparse_MN=200000,
 sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test5-mat.fits",fit_simple=0,
 fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=2.5,cobs=0,tipvib_white_rms=0,tipvib_1overf_rms=0,tipvib_peaks=
 0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=0,
 tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7faf8a099660,xposition=0x7faf8a0995b8,yposition=
 0x7faf8a07c440,dispzoom=0x7faf8a09a4a0,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1.2e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.3,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=30,skipevery=100000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     2.20    0.0   0.0      188.1   0.840      227.8
Field Avg  2.20                    188.1   0.840      227.8
Field rms  2.20                      0.0   0.000        0.0

Average images written in test5-imav.fits
Some other graphics in test5.ps

Original parameter file: test5.par:
 // YAO parameter file
 //-------------------------------
 tel.diam            = 2.5;
 tel.cobs            = 0.;
 
 sim.name            = "2.5 metre telescope w/ Pyramid WFS"
 sim.pupildiam       = 64;
 sim.debug           = 0;
 sim.verbose         = 1;
 
 //-------------------------------
 nwfs                = 1; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 n = 1;
 wfs(n).type         = "pyramid";
 wfs(n).fstop        = "round";
 wfs(n).fssize       = 2.0;
 wfs(n).lambda       = 0.65;
 wfs(n).shnxsub      = 8;
 wfs(n).npixpersub   = sim.pupildiam/wfs(n).shnxsub;
 
 wfs(n).gspos        = [0.,0.];
 wfs(n).gsalt        = 0.;
 wfs(n).gsmag        = 8;
 wfs(n).skymag       = 15.;
 wfs(n).noise        = 1;
 wfs(n).ron          = 3.;
 wfs(n).darkcurrent  = 0.;
 
 wfs(n).pyr_mod_npts = 16;
 wfs(n).pyr_mod_ampl = 0.25;
 wfs(n).pyr_padding  = 1;
 wfs(n).pyr_mod_loc  = "after";
 
 //-------------------------------
 ndm = 1;
 dm = array(dms,ndm);
 
 n = 1;
 
 dm(n).type          = "stackarray";
 dm(n).iffile        = "";
 dm(n).nxact         = wfs(n).shnxsub+1;
 dm(n).pitch         = wfs(n).npixpersub;
 dm(n).alt           = 0.;
 dm(n).unitpervolt   = 1.;
 dm(n).push4imat     = 0.05;
 dm(n).elt           = 1;
 dm(n).gain          = 1.;
 dm(n).regtype       = "laplacian";
 
 if (wfs(1).type == "hartmann"){
    dm(1).regparam     = 1e-2;
 } else {dm(1).regparam     = 1e-2;}
 //-------------------------------
 mat.method          = "mmse";
 
 //-------------------------------
 target.lambda       = &([2.2]);
 target.xposition    = &([0.]);
 target.yposition    = &([0]);
 target.dispzoom     = &([1.]);
 
 //-------------------------------
 r0 = 0.10;
 atm.dr0at05mic     = tel.diam/r0;  // this is r0=0.2 at 500 nm
 atm.screen         = &(Y_USER+"data/screen1.fits");
 atm.layerfrac      = &([1.0]);
 atm.layerspeed     = &([12.]);
 atm.layeralt       = &([0.]);
 atm.winddir        = &([0.]);
 
 //-------------------------------
 gs.zeropoint       = 1.2e11;
 
 //-------------------------------
 loop.gain          = 0.3;
 loop.framedelay    = 2;
 loop.niter         = 100000;
 loop.startskip     = 30;
 loop.ittime        = 0.001;
 
==== dump of structures ====
 sim_struct(name="2.5 metre telescope w/ Pyramid WFS",pupildiam=64,pupilapod=0,
 debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,shmkey=0,
 semkey=0,_size=128,_cent=64.5)
 atm_struct(dr0at05mic=25,screen=0x7faf8a09a230,layerfrac=0x7faf8a099938,
 layerspeed=0x7faf8a09a150,layeralt=0x7faf8a099dd0,winddir=0x7faf8a099d98,
 _layeralt=0x7faf8a099ee8)
 [wfs_struct(type="pyramid",subsystem=1,lambda=0.65,noise=1,ron=3,darkcurrent=0,
 gspos=[0,0],gsalt=0,gsdepth=0,laserpower=0,gsmag=8,skymag=15,filtertilt=0,
 correctUpTT=0,uplinkgain=0,dispzoom=1,optthroughput=1,disjointpup=0,svipc=0,
 zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,
 fieldstopdiam=0,pyr_mod_ampl=0.25,pyr_mod_npts=16,pyr_mod_pos=0x0,pyr_padding=
 1,pyr_mod_loc="after",pyr_denom="subap",shmethod=0,shnxsub=8,npixpersub=8,
 pixsize=0,npixels=0,spotpitch=0,extfield=0,pupoffset=[0,0],shthmethod=0,
 shthreshold=0,shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,
 fstop="round",fssize=2,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,
 centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,
 rayleighflag=0,lgs_focus_alt=0,lgs_prof_amp=0x7faf8a09a778,lgs_prof_alt=
 0x7faf8a099e40,nzer=0,ndh=0,ndhfiltered=0,_initkernels=0,_svipc_init_done=0,
 _svipc_subok=0x0,_fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7faf89c1e220,
 _origpixsize=0,_rebinfactor=0,_gsalt=0,_gsdepth=0,_nsub=52,_nsub4disp=0,_nmes=
 104,_sind=0x0,_nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x0,_masks=0x0,
 _fluxpersub=0x0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=0x0,
 _skyfluxpersub=0x0,_nphotons=75714,_skynphotons=376.983,_tt=[-0.00493684,
 -0.00146536],_lastvalidtt=[-0.00493684,-0.00146536],_upttcommand=[0,0],_refmes=
 0x7faf89e2d9a0,_tiprefv=0x7faf89e04a40,_tiltrefv=0x7faf89d0ca40,_tiprefvn=
 0x7faf89e06fe0,_tiltrefvn=0x7faf89d0d140,_reordervec=0x0,_npixels=0,_npb=0,
 _sdim=0,_nx=0,_nx4fft=0,_istart=0x0,_jstart=0x0,_binindices=0x0,_binxy=0,
 _centroidw=0x0,_fimage=0x7faf8b2b4630,_fimage2=0x0,_imistart=0x0,_imjstart=0x0,
 _imistart2=0x0,_imjstart2=0x0,_unittip=0x0,_unittilt=0x0,_lgs_defocuses=0x0,
 _unitdefocus=0x0,_fimnx=0,_fimny=0,_fimny2=0x0,_yoffset=0x0,_bias=0x0,_flat=
 0x0,_domask=0,_submask=0x7faf8a197430,_kernel=0x0,_kernels=0x0,_kerfftr=0x0,
 _kerffti=0x0,_kernelconv=0,_cyclecounter=1,_dispimage=0x7faf8b2b4630,_x=0x0,_y=
 0x0,_centroidgain=1,_rayleigh=0x0,_bckgrdcalib=0x7faf89c1bcb0,_bckgrdinit=0,
 _bckgrdsub=1,_meashist=0x0,_zeropoint=1.2e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=
 [0,0],_LLT_use=0,_LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],
 _LLT_pupil=0x0,_LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test5-if1.fits",pitch=8,alt=0,hyst=0,push4imat=0.05,thresholdresp=0.3,
 unitpervolt=1,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=0x7faf8a099f20,
 _ctrlden=0x7faf8b01dfa8,misreg=[0,0],xflip=0,yflip=0,pupoffset=[0,0],
 disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=0,
 use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=9,pitchMargin=0,coupling=0.2,
 ecmatfile="test5-ecmat1.fits",noextrap=0,elt=1,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0.01,regtype=
 "laplacian",regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,
 0.35,0.45],_x0=0x7faf89e344e0,_xlast=0x7faf89e32230,_ylast=[0x7faf89f1c820,
 0x7faf89f1c820,0x7faf89f1c820],_y0=0x7faf89e31eb0,_signus=0x7faf89f1cba0,
 _puppixoffset=[0,0],_nact=69,_def=0x108315030,_x=0x7faf89e338c0,_y=
 0x7faf89e04580,_i1=0x7faf89e04dc0,_j1=0x7faf89e05f40,_ei1=0x7faf8a0c6268,_ej1=
 0x7faf8a0c5b80,_indval=0x7faf89e33650,_indext=0x7faf8a0c4660,_eiffile=
 "test5-if1-ext.fits",_edef=0x7faf8b287e30,_ex=0x7faf8a0c5058,_ey=
 0x7faf8a0c58d8,_enact=8,_n1=24,_n2=105,_pupil=0x0,_command=0x7faf89e32390,
 _flat_command=0x0,_extrapcmat=0x7faf8a0fd030,_eltdefsize=33,_regmatrix=
 0x7faf8a1a8a30,_fMat=0x0)]
 mat_struct(method="mmse",condition=0x0,sparse_MR=10000,sparse_MN=200000,
 sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test5-mat.fits",fit_simple=0,
 fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=2.5,cobs=0,tipvib_white_rms=0,tipvib_1overf_rms=0,tipvib_peaks=
 0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=0,
 tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7faf8a099660,xposition=0x7faf8a0995b8,yposition=
 0x7faf8a07c440,dispzoom=0x7faf8a09a4a0,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1.2e+11,zenithangle=0,lgsreturnperwatt=0)
 loop_struct(gain=0.3,leak=0,gainho=0x0,leakho=0x0,framedelay=2,niter=500,
 ittime=0.001,startskip=30,skipevery=100000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")
