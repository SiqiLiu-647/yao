=============================
LGS SH12x12, Extended WFS (11 npt profile)
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.2514  0.0838  0.2514   1.34  1.01  5.03    4x 4    4x 4    13200.0
 2      0.1047  0.0105  0.1047   1.34  0.21  0.21    2x 2    2x 2    403508.8
 
Summary:
Mirror #1, stackarray, 137 actuators, conjugated @ 0 m
Mirror #2, tiptilt, 2 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 112 subap., offaxis (+0.0",+0.0"), noise enabled
WFS # 2, hartmann (meth. 1),  1 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 42.4; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       89.1   0.052      186.5
Field Avg  1.65                     89.1   0.052      186.5
Field rms  1.65                      0.0   0.000        0.0

Average images written in test7-imav.fits
Some other graphics in test7.ps

Original parameter file: test7.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "LGS SH12x12, Extended WFS (11 npt profile)";
 sim.pupildiam      = 120;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 42.44;  // this is r0=0.166 at 550 nm
 atm.screen         = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt       = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 tel.diam           = 12.;
 tel.cobs           = 0.1125;
 
 //-------------------------------
 nwfs               = 2; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 no_pad_simage = 1;
 n   = 1;
 wfs(n).subsystem   = 1;
 wfs(n).type        = "hartmann";
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 90000.;
 wfs(n).gsdepth     = 10000.;
 wfs(n).gsdepth     = 2000.;
 wfs(n).laserpower  = 30.;
 wfs(n).kernel      = 1.1;
 wfs(n).LLTxy       = [0.,0.];
 wfs(n).gsmag       = 7.;
 wfs(n).shmethod    = 2;
 wfs(n).shnxsub     = 12;
 wfs(n).pixsize     = 0.25;
 wfs(n).npixels     = 8;
 wfs(n).extfield    = 5.;
 wfs(n).noise       = 1;
 wfs(n).ron         = 3.5;
 wfs(n).shthreshold = 0.;
 wfs(n).nintegcycles= 1;
 wfs(n).lgs_prof_amp= &float([0.6,1.2,0.9,0.9,0.5,0.2]);
 wfs(n).lgs_prof_alt= &float([92 ,94 ,96 ,98 ,100,102]*1e3);
 wfs(n).fssize      = 4.;
 wfs(n).filtertilt  = 1;
 wfs(n).correctUpTT = 1;
 wfs(n).uplinkgain  = 0.2;
 
 wfs(1).lgs_prof_amp = &float([1.0,1.0]);
 wfs(1).lgs_prof_alt = &float([90000,100000]);
 wfs(1).lgs_prof_alt = &float([90000,95000]);
 wfs(1).lgs_focus_alt=0;
 shwfs_comp_lgs_defocuses,1;
 
 func one_layer(void)
 {
   extern wfs;
   wfs(1).lgs_prof_amp = &float([1.0]);
   wfs(1).lgs_prof_alt = &float([94000]);
   wfs(1).lgs_focus_alt=94000;
   shwfs_comp_lgs_defocuses,1;
 }
 
 func all_layers(void)
 {
   wfs(1).lgs_prof_amp= &float([0.6,1.2,0.9,0.9,0.5,0.2]);
   wfs(1).lgs_prof_alt= &float([92 ,94 ,96 ,98 ,100,102]*1e3);
   wfs(1).lgs_prof_amp= &float(makegaussian(21,10)(11,));
   (*wfs(1).lgs_prof_amp)(3) *=2 ;
   // this will put two points separated by 10km, for calibrations of the method:
   //~ *wfs(1).lgs_prof_amp *=0;
   //~ (*wfs(1).lgs_prof_amp)(3) = 2;
   //~ (*wfs(1).lgs_prof_amp)(8) = 3;
   wfs(1).lgs_prof_alt= &float((89+indgen(21)*1)*1e3); // that should be fwhm=10km
   wfs(1).lgs_focus_alt = 0.; // will be set by shwfs_comp_lgs_defocuses()
   shwfs_comp_lgs_defocuses,1;
 }
 
 func all_layers2(ns,npt,fwhm)
 {
   extern wfs;
   wfs(ns).lgs_prof_amp= &float(makegaussian(npt,npt/2*fwhm/10.)(npt/2+1,));
   (*wfs(ns).lgs_prof_amp)(3) *=2 ;
   wfs(ns).lgs_prof_alt= &float(span(90,110,npt)*1e3); // that should be fwhm=10km
   wfs(ns).lgs_focus_alt = 0.; // will be set by shwfs_comp_lgs_defocuses()
   shwfs_comp_lgs_defocuses,ns;
 }
 
 func ubc_profile(bin2)
 {
   extern wfs;
   amp = [0.00125154,0.00143618,0.00161906,0.0481773,0.043927,0.0533849,0.0932741,
       0.0816419,0.0849489,0.155098,0.146013,0.130336,0.096709,0.022861,0.0130669,
       0.00831713,0.00523775,0.0045743,0.0048842,0.00324208];
   alt = [90,91.3158,92.6316,93.9474,95.2632,96.5789,97.8947,99.2105,100.526,101.842,
         103.158,104.474,105.789,107.105,108.421,109.737,111.053,112.368,113.684,115]*1e3;
   if (bin2) {
     amp = (amp+roll(amp,1))(indgen(10)*2);
     alt = (alt+roll(alt,1))(indgen(10)*2)/2.;
   }
   for (i=1;i<=6;i++) {
     wfs(i).lgs_prof_amp= &float(amp);
     wfs(i).lgs_prof_alt= &float(alt);
     wfs(i).lgs_focus_alt = 0.; // will be set by shwfs_comp_lgs_defocuses()
     shwfs_comp_lgs_defocuses,i;
   }
 }
 
 
 
 
 all_layers2,1,11,10.;
 
 n   = 2;
 wfs(n).subsystem   = 2;
 wfs(n).type        = "hartmann";
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsmag       = 7.;
 wfs(n).shmethod    = 1;
 wfs(n).shnxsub     = 1;
 wfs(n).noise       = 0;
 wfs(n).ron         = 3.5;
 wfs(n).shthreshold = 0.;
 wfs(n).dispzoom    = 0.0;
 //-------------------------------
 ndm                = 2;
 dm = array(dms,ndm);
 mergedms4disp = 1;
 
 n  =1;
 dm(n).subsystem    = 1;
 dm(n).type         = "stackarray";
 dm(n).iffile       = "";
 dm(n).nxact        = wfs(n).shnxsub+1;
 dm(n).pitch        = sim.pupildiam/wfs(n).shnxsub;
 dm(n).ndh          = 40;
 dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.01;
 dm(n).push4imat    = 300.;
 dm(n).elt          = 0;
 
 n  =2;
 dm(n).subsystem    = 2;
 dm(n).type         = "tiptilt";
 dm(n).iffile       = "";
 dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.0005;
 dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.method         = "mmse";
 
 //-------------------------------
 target.lambda      = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint       = 1e11;
 
 //-------------------------------
 loop.gain          = 0.6;
 loop.framedelay    = 1;
 loop.niter         = 20000;
 loop.ittime        = 2e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="LGS SH12x12, Extended WFS (11 npt profile)",pupildiam=120,
 pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,
 shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=42.44,screen=0x7fab3301bf80,layerfrac=0x7fab3301bbc8,
 layerspeed=0x7fab3301c668,layeralt=0x7fab3301b458,winddir=0x7fab3301aa60,
 _layeralt=0x7fab3301bcd8)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=3.5,
 darkcurrent=0,gspos=[0,0],gsalt=90000,gsdepth=2000,laserpower=30,gsmag=7,
 skymag=0,filtertilt=1,correctUpTT=1,uplinkgain=0.2,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,
 rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=
 0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=12,
 npixpersub=0,pixsize=0.251392,npixels=4,spotpitch=20,extfield=5.02785,
 pupoffset=[0,0],shthmethod=1,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,
 flatrmserror=0,fsname=0x0,fstop="square",fssize=4,fsoffset=[0,0],kernel=1.1,
 nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=
 0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=99606.9,lgs_prof_amp=
 0x7fab3301c448,lgs_prof_alt=0x7fab3291aeb0,nzer=0,ndh=0,ndhfiltered=0,
 _initkernels=0,_svipc_init_done=0,_svipc_subok=0x7fab32632530,_fork_subs=0x0,
 _fork_subs2=0x0,_validsubs=0x7fab324137b0,_origpixsize=0.25,_rebinfactor=3,
 _gsalt=90000,_gsdepth=2000,_nsub=112,_nsub4disp=132,_nmes=224,_sind=0x0,_nsind=
 0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x100d7b030,_masks=0x0,_fluxpersub=
 0x7fab32416120,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=
 0x7fab324151f0,_skyfluxpersub=0x7fab32414890,_nphotons=13200,_skynphotons=0,
 _tt=[-0.000323941,-0.00285329],_lastvalidtt=[-0.000323941,-0.00285329],
 _upttcommand=[-0.00382579,0.00463137],_refmes=0x7fab32633660,_tiprefv=
 0x7fab32824a30,_tiltrefv=0x7fab3286b030,_tiprefvn=0x7fab32825230,_tiltrefvn=
 0x7fab329f4230,_reordervec=0x0,_npixels=20,_npb=16,_sdim=16,_nx=60,_nx4fft=60,
 _istart=0x7fab32414d50,_jstart=0x7fab32414fa0,_binindices=0x7fab33a53c30,
 _binxy=20,_centroidw=0x7fab340a8288,_fimage=0x101340030,_fimage2=0x0,_imistart=
 0x7fab32634c70,_imjstart=0x7fab32634ec0,_imistart2=0x7fab32635110,_imjstart2=
 0x7fab32635360,_unittip=0x7fab3242f850,_unittilt=0x7fab3242e4a0,_lgs_defocuses=
 0x7fab3301c3c0,_unitdefocus=0x100e7d030,_fimnx=240,_fimny=240,_fimny2=0x0,
 _yoffset=0x0,_bias=0x101cc3030,_flat=0x100e35030,_domask=1,_submask=
 0x7fab32a12430,_kernel=0x7fab33a8b630,_kernels=0x1014f0030,_kerfftr=
 0x101a80030,_kerffti=0x103cbc030,_kernelconv=1,_cyclecounter=1,_dispimage=
 0x101c51030,_x=0x7fab3286c430,_y=0x7fab32855630,_centroidgain=1,_rayleigh=
 0x7fab3380c7c0,_bckgrdcalib=0x100dfc030,_bckgrdinit=0,_bckgrdsub=1,_meashist=
 0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=2,lambda=0.65,noise=0,ron=3.5,darkcurrent=0,gspos=[0,0],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=7,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=
 0,dispzoom=0,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=1,shnxsub=1,npixpersub=0,pixsize=0.104747,npixels=2,
 spotpitch=2,extfield=0.209494,pupoffset=[0,0],shthmethod=0,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop=0x0,fssize=
 0,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,
 0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fab3380c830,lgs_prof_alt=0x7fab3284f900,nzer=0,
 ndh=0,ndhfiltered=0,_initkernels=1,_svipc_init_done=0,_svipc_subok=0x0,
 _fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fab3380bb10,_origpixsize=0.1,
 _rebinfactor=10,_gsalt=0,_gsdepth=0,_nsub=1,_nsub4disp=1,_nmes=2,_sind=0x0,
 _nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x1012cf030,_masks=0x0,_fluxpersub=
 0x7fab3380bec8,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=
 0x7fab3380d2b8,_skyfluxpersub=0x7fab3380d018,_nphotons=403509,_skynphotons=0,
 _tt=[-0.000635568,0.000322782],_lastvalidtt=[-0.000635568,0.000322782],
 _upttcommand=[0,0],_refmes=0x7fab3380bfa8,_tiprefv=0x7fab3380bd78,_tiltrefv=
 0x7fab3380c0f8,_tiprefvn=0x7fab3380d280,_tiltrefvn=0x7fab3284fa18,_reordervec=
 0x0,_npixels=2,_npb=0,_sdim=128,_nx=20,_nx4fft=20,_istart=0x7fab3284fa50,
 _jstart=0x7fab3380ce90,_binindices=0x7fab328ec230,_binxy=2,_centroidw=
 0x7fab3380c2b8,_fimage=0x7fab3380cdb0,_fimage2=0x0,_imistart=0x7fab3380b7f8,
 _imjstart=0x7fab3380d0f8,_imistart2=0x7fab3380cde8,_imjstart2=0x7fab3380caa0,
 _unittip=0x7fab3294f230,_unittilt=0x7fab329b8830,_lgs_defocuses=0x7fab34027d08,
 _unitdefocus=0x10128e030,_fimnx=2,_fimny=2,_fimny2=0x0,_yoffset=0x0,_bias=
 0x7fab3380c1a0,_flat=0x7fab3380cfa8,_domask=0,_submask=0x0,_kernel=
 0x7fab33a89030,_kernels=0x7fab33904e30,_kerfftr=0x7fab33a86230,_kerffti=
 0x7fab33a89830,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fab3380c520,_x=
 0x7fab3380c130,_y=0x7fab3380d0c0,_centroidgain=1,_rayleigh=0x7fab3380cf70,
 _bckgrdcalib=0x7fab3380bcd0,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test7-if1.fits",pitch=10,alt=0,hyst=0,push4imat=300,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fab3380cd40,_ctrlden=0x7fab3380bbf0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=13,pitchMargin=0,coupling=0.2,
 ecmatfile="test7-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=40,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fab32638bc0,_xlast=0x7fab3262e7c0,_ylast=[0x7fab33a87230,0x7fab33a87230,
 0x7fab33a87230],_y0=0x7fab33a86a30,_signus=0x7fab33908830,_puppixoffset=[0,0],
 _nact=137,_def=0x103e8d030,_x=0x7fab32415440,_y=0x7fab32416370,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x7fab33908e30,_indext=0x7fab340a7838,_eiffile=
 "test7-if1-ext.fits",_edef=0x1018c8030,_ex=0x7fab340a86a8,_ey=0x7fab32811928,
 _enact=20,_n1=60,_n2=197,_pupil=0x0,_command=0x7fab3262e4a0,_flat_command=0x0,
 _extrapcmat=0x7fab340ada30,_eltdefsize=0,_regmatrix=0x100f7c030,_fMat=0x0),
 dm_struct(type="tiptilt",subsystem=2,virtual=0,dmfit_which=0x0,iffile=
 "test7-if2.fits",pitch=0,alt=0,hyst=0,push4imat=400,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fab3380c670,_ctrlden=0x7fab3380d398,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,
 ecmatfile="test7-ecmat2.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,regmatrix=
 0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fab3380bd40,_xlast=0x7fab3284f740,_ylast=[0x7fab3301af28,0x7fab3301af28,
 0x7fab3301af28],_y0=0x7fab3291afc0,_signus=0x7fab3380ccd0,_puppixoffset=[0,0],
 _nact=2,_def=0x101c8a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test7-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=60,_n2=197,_pupil=0x0,_command=0x7fab3380b440,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x7fab3301c338,_fMat=0x0)]
 mat_struct(method="mmse",condition=0x0,sparse_MR=10000,sparse_MN=200000,
 sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test7-mat.fits",fit_simple=0,
 fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=12,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fab3380bf70,xposition=0x7fab3380bde8,yposition=
 0x7fab3284f698,dispzoom=0x7fab3380c6e0,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=22)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       89.1   0.052      186.5
Field Avg  1.65                     89.1   0.052      186.5
Field rms  1.65                      0.0   0.000        0.0

Average images written in test7-imav.fits
Some other graphics in test7.ps

Original parameter file: test7.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "LGS SH12x12, Extended WFS (11 npt profile)";
 sim.pupildiam      = 120;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 42.44;  // this is r0=0.166 at 550 nm
 atm.screen         = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt       = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 tel.diam           = 12.;
 tel.cobs           = 0.1125;
 
 //-------------------------------
 nwfs               = 2; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 no_pad_simage = 1;
 n   = 1;
 wfs(n).subsystem   = 1;
 wfs(n).type        = "hartmann";
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 90000.;
 wfs(n).gsdepth     = 10000.;
 wfs(n).gsdepth     = 2000.;
 wfs(n).laserpower  = 30.;
 wfs(n).kernel      = 1.1;
 wfs(n).LLTxy       = [0.,0.];
 wfs(n).gsmag       = 7.;
 wfs(n).shmethod    = 2;
 wfs(n).shnxsub     = 12;
 wfs(n).pixsize     = 0.25;
 wfs(n).npixels     = 8;
 wfs(n).extfield    = 5.;
 wfs(n).noise       = 1;
 wfs(n).ron         = 3.5;
 wfs(n).shthreshold = 0.;
 wfs(n).nintegcycles= 1;
 wfs(n).lgs_prof_amp= &float([0.6,1.2,0.9,0.9,0.5,0.2]);
 wfs(n).lgs_prof_alt= &float([92 ,94 ,96 ,98 ,100,102]*1e3);
 wfs(n).fssize      = 4.;
 wfs(n).filtertilt  = 1;
 wfs(n).correctUpTT = 1;
 wfs(n).uplinkgain  = 0.2;
 
 wfs(1).lgs_prof_amp = &float([1.0,1.0]);
 wfs(1).lgs_prof_alt = &float([90000,100000]);
 wfs(1).lgs_prof_alt = &float([90000,95000]);
 wfs(1).lgs_focus_alt=0;
 shwfs_comp_lgs_defocuses,1;
 
 func one_layer(void)
 {
   extern wfs;
   wfs(1).lgs_prof_amp = &float([1.0]);
   wfs(1).lgs_prof_alt = &float([94000]);
   wfs(1).lgs_focus_alt=94000;
   shwfs_comp_lgs_defocuses,1;
 }
 
 func all_layers(void)
 {
   wfs(1).lgs_prof_amp= &float([0.6,1.2,0.9,0.9,0.5,0.2]);
   wfs(1).lgs_prof_alt= &float([92 ,94 ,96 ,98 ,100,102]*1e3);
   wfs(1).lgs_prof_amp= &float(makegaussian(21,10)(11,));
   (*wfs(1).lgs_prof_amp)(3) *=2 ;
   // this will put two points separated by 10km, for calibrations of the method:
   //~ *wfs(1).lgs_prof_amp *=0;
   //~ (*wfs(1).lgs_prof_amp)(3) = 2;
   //~ (*wfs(1).lgs_prof_amp)(8) = 3;
   wfs(1).lgs_prof_alt= &float((89+indgen(21)*1)*1e3); // that should be fwhm=10km
   wfs(1).lgs_focus_alt = 0.; // will be set by shwfs_comp_lgs_defocuses()
   shwfs_comp_lgs_defocuses,1;
 }
 
 func all_layers2(ns,npt,fwhm)
 {
   extern wfs;
   wfs(ns).lgs_prof_amp= &float(makegaussian(npt,npt/2*fwhm/10.)(npt/2+1,));
   (*wfs(ns).lgs_prof_amp)(3) *=2 ;
   wfs(ns).lgs_prof_alt= &float(span(90,110,npt)*1e3); // that should be fwhm=10km
   wfs(ns).lgs_focus_alt = 0.; // will be set by shwfs_comp_lgs_defocuses()
   shwfs_comp_lgs_defocuses,ns;
 }
 
 func ubc_profile(bin2)
 {
   extern wfs;
   amp = [0.00125154,0.00143618,0.00161906,0.0481773,0.043927,0.0533849,0.0932741,
       0.0816419,0.0849489,0.155098,0.146013,0.130336,0.096709,0.022861,0.0130669,
       0.00831713,0.00523775,0.0045743,0.0048842,0.00324208];
   alt = [90,91.3158,92.6316,93.9474,95.2632,96.5789,97.8947,99.2105,100.526,101.842,
         103.158,104.474,105.789,107.105,108.421,109.737,111.053,112.368,113.684,115]*1e3;
   if (bin2) {
     amp = (amp+roll(amp,1))(indgen(10)*2);
     alt = (alt+roll(alt,1))(indgen(10)*2)/2.;
   }
   for (i=1;i<=6;i++) {
     wfs(i).lgs_prof_amp= &float(amp);
     wfs(i).lgs_prof_alt= &float(alt);
     wfs(i).lgs_focus_alt = 0.; // will be set by shwfs_comp_lgs_defocuses()
     shwfs_comp_lgs_defocuses,i;
   }
 }
 
 
 
 
 all_layers2,1,11,10.;
 
 n   = 2;
 wfs(n).subsystem   = 2;
 wfs(n).type        = "hartmann";
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsmag       = 7.;
 wfs(n).shmethod    = 1;
 wfs(n).shnxsub     = 1;
 wfs(n).noise       = 0;
 wfs(n).ron         = 3.5;
 wfs(n).shthreshold = 0.;
 wfs(n).dispzoom    = 0.0;
 //-------------------------------
 ndm                = 2;
 dm = array(dms,ndm);
 mergedms4disp = 1;
 
 n  =1;
 dm(n).subsystem    = 1;
 dm(n).type         = "stackarray";
 dm(n).iffile       = "";
 dm(n).nxact        = wfs(n).shnxsub+1;
 dm(n).pitch        = sim.pupildiam/wfs(n).shnxsub;
 dm(n).ndh          = 40;
 dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.01;
 dm(n).push4imat    = 300.;
 dm(n).elt          = 0;
 
 n  =2;
 dm(n).subsystem    = 2;
 dm(n).type         = "tiptilt";
 dm(n).iffile       = "";
 dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.0005;
 dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.method         = "mmse";
 
 //-------------------------------
 target.lambda      = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint       = 1e11;
 
 //-------------------------------
 loop.gain          = 0.6;
 loop.framedelay    = 1;
 loop.niter         = 20000;
 loop.ittime        = 2e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="LGS SH12x12, Extended WFS (11 npt profile)",pupildiam=120,
 pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,
 shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=42.44,screen=0x7fab3301bf80,layerfrac=0x7fab3301bbc8,
 layerspeed=0x7fab3301c668,layeralt=0x7fab3301b458,winddir=0x7fab3301aa60,
 _layeralt=0x7fab3301bcd8)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=3.5,
 darkcurrent=0,gspos=[0,0],gsalt=90000,gsdepth=2000,laserpower=30,gsmag=7,
 skymag=0,filtertilt=1,correctUpTT=1,uplinkgain=0.2,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,
 rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=
 0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=12,
 npixpersub=0,pixsize=0.251392,npixels=4,spotpitch=20,extfield=5.02785,
 pupoffset=[0,0],shthmethod=1,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,
 flatrmserror=0,fsname=0x0,fstop="square",fssize=4,fsoffset=[0,0],kernel=1.1,
 nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=
 0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=99606.9,lgs_prof_amp=
 0x7fab3301c448,lgs_prof_alt=0x7fab3291aeb0,nzer=0,ndh=0,ndhfiltered=0,
 _initkernels=0,_svipc_init_done=0,_svipc_subok=0x7fab32431530,_fork_subs=0x0,
 _fork_subs2=0x0,_validsubs=0x7fab324137b0,_origpixsize=0.25,_rebinfactor=3,
 _gsalt=90000,_gsdepth=2000,_nsub=112,_nsub4disp=132,_nmes=224,_sind=0x0,_nsind=
 0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x100d7b030,_masks=0x0,_fluxpersub=
 0x7fab32416120,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=
 0x7fab324151f0,_skyfluxpersub=0x7fab32414890,_nphotons=13200,_skynphotons=0,
 _tt=[-0.000323941,-0.00285329],_lastvalidtt=[-0.000323941,-0.00285329],
 _upttcommand=[-0.00382579,0.00463137],_refmes=0x7fab32633660,_tiprefv=
 0x7fab32824a30,_tiltrefv=0x7fab3286b030,_tiprefvn=0x7fab32825230,_tiltrefvn=
 0x7fab329f4230,_reordervec=0x0,_npixels=20,_npb=16,_sdim=16,_nx=60,_nx4fft=60,
 _istart=0x7fab32414d50,_jstart=0x7fab32414fa0,_binindices=0x7fab33a53c30,
 _binxy=20,_centroidw=0x7fab340a8288,_fimage=0x101340030,_fimage2=0x0,_imistart=
 0x7fab32634c70,_imjstart=0x7fab32634ec0,_imistart2=0x7fab32635110,_imjstart2=
 0x7fab32635360,_unittip=0x7fab3242f850,_unittilt=0x7fab3242e4a0,_lgs_defocuses=
 0x7fab3301c3c0,_unitdefocus=0x100e7d030,_fimnx=240,_fimny=240,_fimny2=0x0,
 _yoffset=0x0,_bias=0x101cc3030,_flat=0x100e35030,_domask=1,_submask=
 0x7fab32a12430,_kernel=0x7fab33999630,_kernels=0x1014f0030,_kerfftr=
 0x101a80030,_kerffti=0x103cbc030,_kernelconv=1,_cyclecounter=1,_dispimage=
 0x100ebe030,_x=0x7fab3286c430,_y=0x7fab32855630,_centroidgain=1,_rayleigh=
 0x7fab3380c7c0,_bckgrdcalib=0x100dfc030,_bckgrdinit=0,_bckgrdsub=1,_meashist=
 0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=2,lambda=0.65,noise=0,ron=3.5,darkcurrent=0,gspos=[0,0],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=7,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=
 0,dispzoom=0,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=1,shnxsub=1,npixpersub=0,pixsize=0.104747,npixels=2,
 spotpitch=2,extfield=0.209494,pupoffset=[0,0],shthmethod=0,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop=0x0,fssize=
 0,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,
 0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fab3380c830,lgs_prof_alt=0x7fab3284f900,nzer=0,
 ndh=0,ndhfiltered=0,_initkernels=1,_svipc_init_done=0,_svipc_subok=0x0,
 _fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fab3380bb10,_origpixsize=0.1,
 _rebinfactor=10,_gsalt=0,_gsdepth=0,_nsub=1,_nsub4disp=1,_nmes=2,_sind=0x0,
 _nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x1012cf030,_masks=0x0,_fluxpersub=
 0x7fab3380bec8,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=
 0x7fab3380d2b8,_skyfluxpersub=0x7fab3380d018,_nphotons=403509,_skynphotons=0,
 _tt=[-0.000635568,0.000322782],_lastvalidtt=[-0.000635568,0.000322782],
 _upttcommand=[0,0],_refmes=0x7fab3380bfa8,_tiprefv=0x7fab3380bd78,_tiltrefv=
 0x7fab3380c0f8,_tiprefvn=0x7fab3380d280,_tiltrefvn=0x7fab3284fa18,_reordervec=
 0x0,_npixels=2,_npb=0,_sdim=128,_nx=20,_nx4fft=20,_istart=0x7fab3284fa50,
 _jstart=0x7fab3380ce90,_binindices=0x7fab328ec230,_binxy=2,_centroidw=
 0x7fab3380c2b8,_fimage=0x7fab3380cdb0,_fimage2=0x0,_imistart=0x7fab3380b7f8,
 _imjstart=0x7fab3380d0f8,_imistart2=0x7fab3380cde8,_imjstart2=0x7fab3380caa0,
 _unittip=0x7fab3294f230,_unittilt=0x7fab329b8830,_lgs_defocuses=0x7fab34027d08,
 _unitdefocus=0x10128e030,_fimnx=2,_fimny=2,_fimny2=0x0,_yoffset=0x0,_bias=
 0x7fab3380c1a0,_flat=0x7fab3380cfa8,_domask=0,_submask=0x0,_kernel=
 0x7fab33a86a30,_kernels=0x7fab33904e30,_kerfftr=0x7fab33a86230,_kerffti=
 0x7fab33a89830,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fab3380c670,_x=
 0x7fab3380c130,_y=0x7fab3380d0c0,_centroidgain=1,_rayleigh=0x7fab3380cf70,
 _bckgrdcalib=0x7fab3380bcd0,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test7-if1.fits",pitch=10,alt=0,hyst=0,push4imat=300,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fab3380ce58,_ctrlden=0x7fab3380d520,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=13,pitchMargin=0,coupling=0.2,
 ecmatfile="test7-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=40,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fab32414540,_xlast=0x7fab3242fdb0,_ylast=[0x7fab32855c30,0x7fab32855c30,
 0x7fab32855c30],_y0=0x7fab32a82c30,_signus=0x7fab3286a230,_puppixoffset=[0,0],
 _nact=137,_def=0x103e8d030,_x=0x7fab32415440,_y=0x7fab32416370,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x7fab33908e30,_indext=0x7fab340a7838,_eiffile=
 "test7-if1-ext.fits",_edef=0x1018c8030,_ex=0x7fab340a86a8,_ey=0x7fab32811928,
 _enact=20,_n1=60,_n2=197,_pupil=0x0,_command=0x7fab324303d0,_flat_command=0x0,
 _extrapcmat=0x7fab340ada30,_eltdefsize=0,_regmatrix=0x100f7c030,_fMat=0x0),
 dm_struct(type="tiptilt",subsystem=2,virtual=0,dmfit_which=0x0,iffile=
 "test7-if2.fits",pitch=0,alt=0,hyst=0,push4imat=400,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fab3380d408,_ctrlden=0x7fab3380b788,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,
 ecmatfile="test7-ecmat2.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,regmatrix=
 0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fab3380cd40,_xlast=0x7fab3380d398,_ylast=[0x7fab3301b568,0x7fab3301b568,
 0x7fab3301b568],_y0=0x7fab3301d190,_signus=0x7fab3380bd40,_puppixoffset=[0,0],
 _nact=2,_def=0x101c8a030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test7-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=60,_n2=197,_pupil=0x0,_command=0x7fab3380c520,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x7fab3301c338,_fMat=0x0)]
 mat_struct(method="mmse",condition=0x0,sparse_MR=10000,sparse_MN=200000,
 sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test7-mat.fits",fit_simple=0,
 fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=12,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fab3380bf70,xposition=0x7fab3380bde8,yposition=
 0x7fab3284f698,dispzoom=0x7fab3380c6e0,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=22)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")
=============================
LGS SH12x12, Extended WFS (11 npt profile)
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.2514  0.0838  0.2514   1.34  1.01  5.03    4x 4    4x 4    13200.0
 2      0.1047  0.0105  0.1047   1.34  0.21  0.21    2x 2    2x 2    403508.8
 
Summary:
Mirror #1, stackarray, 137 actuators, conjugated @ 0 m
Mirror #2, tiptilt, 2 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 112 subap., offaxis (+0.0",+0.0"), noise enabled
WFS # 2, hartmann (meth. 1),  1 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 42.4; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       89.1   0.052      186.5
Field Avg  1.65                     89.1   0.052      186.5
Field rms  1.65                      0.0   0.000        0.0

Average images written in test7-imav.fits
Some other graphics in test7.ps

Original parameter file: test7.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "LGS SH12x12, Extended WFS (11 npt profile)";
 sim.pupildiam      = 120;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 42.44;  // this is r0=0.166 at 550 nm
 atm.screen         = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt       = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 tel.diam           = 12.;
 tel.cobs           = 0.1125;
 
 //-------------------------------
 nwfs               = 2; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 no_pad_simage = 1;
 n   = 1;
 wfs(n).subsystem   = 1;
 wfs(n).type        = "hartmann";
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 90000.;
 wfs(n).gsdepth     = 10000.;
 wfs(n).gsdepth     = 2000.;
 wfs(n).laserpower  = 30.;
 wfs(n).kernel      = 1.1;
 wfs(n).LLTxy       = [0.,0.];
 wfs(n).gsmag       = 7.;
 wfs(n).shmethod    = 2;
 wfs(n).shnxsub     = 12;
 wfs(n).pixsize     = 0.25;
 wfs(n).npixels     = 8;
 wfs(n).extfield    = 5.;
 wfs(n).noise       = 1;
 wfs(n).ron         = 3.5;
 wfs(n).shthreshold = 0.;
 wfs(n).nintegcycles= 1;
 wfs(n).lgs_prof_amp= &float([0.6,1.2,0.9,0.9,0.5,0.2]);
 wfs(n).lgs_prof_alt= &float([92 ,94 ,96 ,98 ,100,102]*1e3);
 wfs(n).fssize      = 4.;
 wfs(n).filtertilt  = 1;
 wfs(n).correctUpTT = 1;
 wfs(n).uplinkgain  = 0.2;
 
 wfs(1).lgs_prof_amp = &float([1.0,1.0]);
 wfs(1).lgs_prof_alt = &float([90000,100000]);
 wfs(1).lgs_prof_alt = &float([90000,95000]);
 wfs(1).lgs_focus_alt=0;
 shwfs_comp_lgs_defocuses,1;
 
 func one_layer(void)
 {
   extern wfs;
   wfs(1).lgs_prof_amp = &float([1.0]);
   wfs(1).lgs_prof_alt = &float([94000]);
   wfs(1).lgs_focus_alt=94000;
   shwfs_comp_lgs_defocuses,1;
 }
 
 func all_layers(void)
 {
   wfs(1).lgs_prof_amp= &float([0.6,1.2,0.9,0.9,0.5,0.2]);
   wfs(1).lgs_prof_alt= &float([92 ,94 ,96 ,98 ,100,102]*1e3);
   wfs(1).lgs_prof_amp= &float(makegaussian(21,10)(11,));
   (*wfs(1).lgs_prof_amp)(3) *=2 ;
   // this will put two points separated by 10km, for calibrations of the method:
   //~ *wfs(1).lgs_prof_amp *=0;
   //~ (*wfs(1).lgs_prof_amp)(3) = 2;
   //~ (*wfs(1).lgs_prof_amp)(8) = 3;
   wfs(1).lgs_prof_alt= &float((89+indgen(21)*1)*1e3); // that should be fwhm=10km
   wfs(1).lgs_focus_alt = 0.; // will be set by shwfs_comp_lgs_defocuses()
   shwfs_comp_lgs_defocuses,1;
 }
 
 func all_layers2(ns,npt,fwhm)
 {
   extern wfs;
   wfs(ns).lgs_prof_amp= &float(makegaussian(npt,npt/2*fwhm/10.)(npt/2+1,));
   (*wfs(ns).lgs_prof_amp)(3) *=2 ;
   wfs(ns).lgs_prof_alt= &float(span(90,110,npt)*1e3); // that should be fwhm=10km
   wfs(ns).lgs_focus_alt = 0.; // will be set by shwfs_comp_lgs_defocuses()
   shwfs_comp_lgs_defocuses,ns;
 }
 
 func ubc_profile(bin2)
 {
   extern wfs;
   amp = [0.00125154,0.00143618,0.00161906,0.0481773,0.043927,0.0533849,0.0932741,
       0.0816419,0.0849489,0.155098,0.146013,0.130336,0.096709,0.022861,0.0130669,
       0.00831713,0.00523775,0.0045743,0.0048842,0.00324208];
   alt = [90,91.3158,92.6316,93.9474,95.2632,96.5789,97.8947,99.2105,100.526,101.842,
         103.158,104.474,105.789,107.105,108.421,109.737,111.053,112.368,113.684,115]*1e3;
   if (bin2) {
     amp = (amp+roll(amp,1))(indgen(10)*2);
     alt = (alt+roll(alt,1))(indgen(10)*2)/2.;
   }
   for (i=1;i<=6;i++) {
     wfs(i).lgs_prof_amp= &float(amp);
     wfs(i).lgs_prof_alt= &float(alt);
     wfs(i).lgs_focus_alt = 0.; // will be set by shwfs_comp_lgs_defocuses()
     shwfs_comp_lgs_defocuses,i;
   }
 }
 
 
 
 
 all_layers2,1,11,10.;
 
 n   = 2;
 wfs(n).subsystem   = 2;
 wfs(n).type        = "hartmann";
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsmag       = 7.;
 wfs(n).shmethod    = 1;
 wfs(n).shnxsub     = 1;
 wfs(n).noise       = 0;
 wfs(n).ron         = 3.5;
 wfs(n).shthreshold = 0.;
 wfs(n).dispzoom    = 0.0;
 //-------------------------------
 ndm                = 2;
 dm = array(dms,ndm);
 mergedms4disp = 1;
 
 n  =1;
 dm(n).subsystem    = 1;
 dm(n).type         = "stackarray";
 dm(n).iffile       = "";
 dm(n).nxact        = wfs(n).shnxsub+1;
 dm(n).pitch        = sim.pupildiam/wfs(n).shnxsub;
 dm(n).ndh          = 40;
 dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.01;
 dm(n).push4imat    = 300.;
 dm(n).elt          = 0;
 
 n  =2;
 dm(n).subsystem    = 2;
 dm(n).type         = "tiptilt";
 dm(n).iffile       = "";
 dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.0005;
 dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.method         = "mmse";
 
 //-------------------------------
 target.lambda      = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint       = 1e11;
 
 //-------------------------------
 loop.gain          = 0.6;
 loop.framedelay    = 1;
 loop.niter         = 20000;
 loop.ittime        = 2e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="LGS SH12x12, Extended WFS (11 npt profile)",pupildiam=120,
 pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,
 shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=42.44,screen=0x7fa51a8d8380,layerfrac=0x7fa51a8d7fc8,
 layerspeed=0x7fa51a8d8a68,layeralt=0x7fa51a8d7858,winddir=0x7fa51a8cfe60,
 _layeralt=0x7fa51a8d80d8)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=3.5,
 darkcurrent=0,gspos=[0,0],gsalt=90000,gsdepth=2000,laserpower=30,gsmag=7,
 skymag=0,filtertilt=1,correctUpTT=1,uplinkgain=0.2,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,
 rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=
 0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=12,
 npixpersub=0,pixsize=0.251392,npixels=4,spotpitch=20,extfield=5.02785,
 pupoffset=[0,0],shthmethod=1,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,
 flatrmserror=0,fsname=0x0,fstop="square",fssize=4,fsoffset=[0,0],kernel=1.1,
 nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=
 0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=99606.9,lgs_prof_amp=
 0x7fa51a8d8848,lgs_prof_alt=0x7fa51a85feb0,nzer=0,ndh=0,ndhfiltered=0,
 _initkernels=0,_svipc_init_done=0,_svipc_subok=0x7fa518e11820,_fork_subs=0x0,
 _fork_subs2=0x0,_validsubs=0x7fa518f45990,_origpixsize=0.25,_rebinfactor=3,
 _gsalt=90000,_gsdepth=2000,_nsub=112,_nsub4disp=132,_nmes=224,_sind=0x0,_nsind=
 0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x1051f0030,_masks=0x0,_fluxpersub=
 0x7fa518f3d220,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=
 0x7fa518f414b0,_skyfluxpersub=0x7fa518f45d40,_nphotons=13200,_skynphotons=0,
 _tt=[-0.000323941,-0.00285329],_lastvalidtt=[-0.000323941,-0.00285329],
 _upttcommand=[-0.00382579,0.00463137],_refmes=0x7fa518c0a6a0,_tiprefv=
 0x7fa51a9cfa30,_tiltrefv=0x7fa51aa26030,_tiprefvn=0x7fa51a9d0230,_tiltrefvn=
 0x7fa51a9f4430,_reordervec=0x0,_npixels=20,_npb=16,_sdim=16,_nx=60,_nx4fft=60,
 _istart=0x7fa518f43280,_jstart=0x7fa518f3e2c0,_binindices=0x7fa5190dca30,
 _binxy=20,_centroidw=0x7fa51904a688,_fimage=0x105ccd030,_fimage2=0x0,_imistart=
 0x7fa518c0df30,_imjstart=0x7fa518c19570,_imistart2=0x7fa518c197c0,_imjstart2=
 0x7fa518c19a10,_unittip=0x7fa518f3d850,_unittilt=0x7fa518f3e9d0,_lgs_defocuses=
 0x7fa51a8d87c0,_unitdefocus=0x1050fe030,_fimnx=240,_fimny=240,_fimny2=0x0,
 _yoffset=0x0,_bias=0x1065b1030,_flat=0x1054ba030,_domask=1,_submask=
 0x7fa51a9d4a30,_kernel=0x7fa519864230,_kernels=0x1058ea030,_kerfftr=
 0x105abb030,_kerffti=0x107f5a030,_kernelconv=1,_cyclecounter=1,_dispimage=
 0x10636c030,_x=0x7fa51aa24a30,_y=0x7fa51a87ce30,_centroidgain=1,_rayleigh=
 0x7fa519042508,_bckgrdcalib=0x105439030,_bckgrdinit=0,_bckgrdsub=1,_meashist=
 0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=2,lambda=0.65,noise=0,ron=3.5,darkcurrent=0,gspos=[0,0],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=7,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=
 0,dispzoom=0,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=1,shnxsub=1,npixpersub=0,pixsize=0.104747,npixels=2,
 spotpitch=2,extfield=0.209494,pupoffset=[0,0],shthmethod=0,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop=0x0,fssize=
 0,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,
 0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fa51a8a2420,lgs_prof_alt=0x7fa51a8a1650,nzer=0,
 ndh=0,ndhfiltered=0,_initkernels=1,_svipc_init_done=0,_svipc_subok=0x0,
 _fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fa519042658,_origpixsize=0.1,
 _rebinfactor=10,_gsalt=0,_gsdepth=0,_nsub=1,_nsub4disp=1,_nmes=2,_sind=0x0,
 _nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x10613f030,_masks=0x0,_fluxpersub=
 0x7fa51a8a1768,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=
 0x7fa51a8a28b8,_skyfluxpersub=0x7fa51a8a15a8,_nphotons=403509,_skynphotons=0,
 _tt=[-0.000635568,0.000322782],_lastvalidtt=[-0.000635568,0.000322782],
 _upttcommand=[0,0],_refmes=0x7fa51a8a1a40,_tiprefv=0x7fa51a8a10a0,_tiltrefv=
 0x7fa51a8a2570,_tiprefvn=0x7fa51a8676a8,_tiltrefvn=0x7fa519042818,_reordervec=
 0x0,_npixels=2,_npb=0,_sdim=128,_nx=20,_nx4fft=20,_istart=0x7fa519042850,
 _jstart=0x7fa51a8a2490,_binindices=0x7fa519036430,_binxy=2,_centroidw=
 0x7fa51a8a1d50,_fimage=0x7fa51a8a2308,_fimage2=0x0,_imistart=0x7fa51a8a1ce0,
 _imjstart=0x7fa51a8a1068,_imistart2=0x7fa51a8a23e8,_imjstart2=0x7fa51a867788,
 _unittip=0x7fa519200c30,_unittilt=0x7fa51920ee30,_lgs_defocuses=0x7fa519042ab8,
 _unitdefocus=0x105c8c030,_fimnx=2,_fimny=2,_fimny2=0x0,_yoffset=0x0,_bias=
 0x7fa51a8a19d0,_flat=0x7fa51a8a17a0,_domask=0,_submask=0x0,_kernel=
 0x7fa51a01b430,_kernels=0x7fa51aa00430,_kerfftr=0x7fa51aa27230,_kerffti=
 0x7fa51aa25830,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fa51a8a1b90,_x=
 0x7fa51a8a1308,_y=0x7fa519042930,_centroidgain=1,_rayleigh=0x7fa51a8a12d0,
 _bckgrdcalib=0x7fa51a8a1c70,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test7-if1.fits",pitch=10,alt=0,hyst=0,push4imat=300,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fa51a8a2688,_ctrlden=0x7fa51a8a1618,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=13,pitchMargin=0,coupling=0.2,
 ecmatfile="test7-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=40,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fa518c19c60,_xlast=0x7fa518c09c30,_ylast=[0x7fa5190b4c30,0x7fa5190b4c30,
 0x7fa5190b4c30],_y0=0x7fa5190b4430,_signus=0x7fa51904be30,_puppixoffset=[0,0],
 _nact=137,_def=0x10812b030,_x=0x7fa518c1bee0,_y=0x7fa518c0b520,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x7fa5190f2c30,_indext=0x7fa519049c38,_eiffile=
 "test7-if1-ext.fits",_edef=0x10556c030,_ex=0x7fa51904aaa8,_ey=0x7fa519810d28,
 _enact=20,_n1=60,_n2=197,_pupil=0x0,_command=0x7fa518e0fb90,_flat_command=0x0,
 _extrapcmat=0x7fa519859830,_eltdefsize=0,_regmatrix=0x1054f3030,_fMat=0x0),
 dm_struct(type="tiptilt",subsystem=2,virtual=0,dmfit_which=0x0,iffile=
 "test7-if2.fits",pitch=0,alt=0,hyst=0,push4imat=400,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fa51a8a2650,_ctrlden=0x7fa51a8a2960,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,
 ecmatfile="test7-ecmat2.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,regmatrix=
 0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fa51a8676e0,_xlast=0x7fa519042540,_ylast=[0x7fa51a8d0328,0x7fa51a8d0328,
 0x7fa51a8d0328],_y0=0x7fa51a85ffc0,_signus=0x7fa51a8a1688,_puppixoffset=[0,0],
 _nact=2,_def=0x106578030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test7-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=60,_n2=197,_pupil=0x0,_command=0x7fa51a8a1340,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x7fa51a8d8738,_fMat=0x0)]
 mat_struct(method="mmse",condition=0x0,sparse_MR=10000,sparse_MN=200000,
 sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test7-mat.fits",fit_simple=0,
 fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=12,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fa51a8a1570,xposition=0x7fa51a8a1d88,yposition=
 0x7fa51a8a15e0,dispzoom=0x7fa51a8a1c00,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=22)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       89.1   0.052      186.5
Field Avg  1.65                     89.1   0.052      186.5
Field rms  1.65                      0.0   0.000        0.0

Average images written in test7-imav.fits
Some other graphics in test7.ps

Original parameter file: test7.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "LGS SH12x12, Extended WFS (11 npt profile)";
 sim.pupildiam      = 120;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 42.44;  // this is r0=0.166 at 550 nm
 atm.screen         = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt       = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 tel.diam           = 12.;
 tel.cobs           = 0.1125;
 
 //-------------------------------
 nwfs               = 2; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 no_pad_simage = 1;
 n   = 1;
 wfs(n).subsystem   = 1;
 wfs(n).type        = "hartmann";
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 90000.;
 wfs(n).gsdepth     = 10000.;
 wfs(n).gsdepth     = 2000.;
 wfs(n).laserpower  = 30.;
 wfs(n).kernel      = 1.1;
 wfs(n).LLTxy       = [0.,0.];
 wfs(n).gsmag       = 7.;
 wfs(n).shmethod    = 2;
 wfs(n).shnxsub     = 12;
 wfs(n).pixsize     = 0.25;
 wfs(n).npixels     = 8;
 wfs(n).extfield    = 5.;
 wfs(n).noise       = 1;
 wfs(n).ron         = 3.5;
 wfs(n).shthreshold = 0.;
 wfs(n).nintegcycles= 1;
 wfs(n).lgs_prof_amp= &float([0.6,1.2,0.9,0.9,0.5,0.2]);
 wfs(n).lgs_prof_alt= &float([92 ,94 ,96 ,98 ,100,102]*1e3);
 wfs(n).fssize      = 4.;
 wfs(n).filtertilt  = 1;
 wfs(n).correctUpTT = 1;
 wfs(n).uplinkgain  = 0.2;
 
 wfs(1).lgs_prof_amp = &float([1.0,1.0]);
 wfs(1).lgs_prof_alt = &float([90000,100000]);
 wfs(1).lgs_prof_alt = &float([90000,95000]);
 wfs(1).lgs_focus_alt=0;
 shwfs_comp_lgs_defocuses,1;
 
 func one_layer(void)
 {
   extern wfs;
   wfs(1).lgs_prof_amp = &float([1.0]);
   wfs(1).lgs_prof_alt = &float([94000]);
   wfs(1).lgs_focus_alt=94000;
   shwfs_comp_lgs_defocuses,1;
 }
 
 func all_layers(void)
 {
   wfs(1).lgs_prof_amp= &float([0.6,1.2,0.9,0.9,0.5,0.2]);
   wfs(1).lgs_prof_alt= &float([92 ,94 ,96 ,98 ,100,102]*1e3);
   wfs(1).lgs_prof_amp= &float(makegaussian(21,10)(11,));
   (*wfs(1).lgs_prof_amp)(3) *=2 ;
   // this will put two points separated by 10km, for calibrations of the method:
   //~ *wfs(1).lgs_prof_amp *=0;
   //~ (*wfs(1).lgs_prof_amp)(3) = 2;
   //~ (*wfs(1).lgs_prof_amp)(8) = 3;
   wfs(1).lgs_prof_alt= &float((89+indgen(21)*1)*1e3); // that should be fwhm=10km
   wfs(1).lgs_focus_alt = 0.; // will be set by shwfs_comp_lgs_defocuses()
   shwfs_comp_lgs_defocuses,1;
 }
 
 func all_layers2(ns,npt,fwhm)
 {
   extern wfs;
   wfs(ns).lgs_prof_amp= &float(makegaussian(npt,npt/2*fwhm/10.)(npt/2+1,));
   (*wfs(ns).lgs_prof_amp)(3) *=2 ;
   wfs(ns).lgs_prof_alt= &float(span(90,110,npt)*1e3); // that should be fwhm=10km
   wfs(ns).lgs_focus_alt = 0.; // will be set by shwfs_comp_lgs_defocuses()
   shwfs_comp_lgs_defocuses,ns;
 }
 
 func ubc_profile(bin2)
 {
   extern wfs;
   amp = [0.00125154,0.00143618,0.00161906,0.0481773,0.043927,0.0533849,0.0932741,
       0.0816419,0.0849489,0.155098,0.146013,0.130336,0.096709,0.022861,0.0130669,
       0.00831713,0.00523775,0.0045743,0.0048842,0.00324208];
   alt = [90,91.3158,92.6316,93.9474,95.2632,96.5789,97.8947,99.2105,100.526,101.842,
         103.158,104.474,105.789,107.105,108.421,109.737,111.053,112.368,113.684,115]*1e3;
   if (bin2) {
     amp = (amp+roll(amp,1))(indgen(10)*2);
     alt = (alt+roll(alt,1))(indgen(10)*2)/2.;
   }
   for (i=1;i<=6;i++) {
     wfs(i).lgs_prof_amp= &float(amp);
     wfs(i).lgs_prof_alt= &float(alt);
     wfs(i).lgs_focus_alt = 0.; // will be set by shwfs_comp_lgs_defocuses()
     shwfs_comp_lgs_defocuses,i;
   }
 }
 
 
 
 
 all_layers2,1,11,10.;
 
 n   = 2;
 wfs(n).subsystem   = 2;
 wfs(n).type        = "hartmann";
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsmag       = 7.;
 wfs(n).shmethod    = 1;
 wfs(n).shnxsub     = 1;
 wfs(n).noise       = 0;
 wfs(n).ron         = 3.5;
 wfs(n).shthreshold = 0.;
 wfs(n).dispzoom    = 0.0;
 //-------------------------------
 ndm                = 2;
 dm = array(dms,ndm);
 mergedms4disp = 1;
 
 n  =1;
 dm(n).subsystem    = 1;
 dm(n).type         = "stackarray";
 dm(n).iffile       = "";
 dm(n).nxact        = wfs(n).shnxsub+1;
 dm(n).pitch        = sim.pupildiam/wfs(n).shnxsub;
 dm(n).ndh          = 40;
 dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.01;
 dm(n).push4imat    = 300.;
 dm(n).elt          = 0;
 
 n  =2;
 dm(n).subsystem    = 2;
 dm(n).type         = "tiptilt";
 dm(n).iffile       = "";
 dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.0005;
 dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.method         = "mmse";
 
 //-------------------------------
 target.lambda      = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint       = 1e11;
 
 //-------------------------------
 loop.gain          = 0.6;
 loop.framedelay    = 1;
 loop.niter         = 20000;
 loop.ittime        = 2e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="LGS SH12x12, Extended WFS (11 npt profile)",pupildiam=120,
 pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,
 shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=42.44,screen=0x7fa51a8d8380,layerfrac=0x7fa51a8d7fc8,
 layerspeed=0x7fa51a8d8a68,layeralt=0x7fa51a8d7858,winddir=0x7fa51a8cfe60,
 _layeralt=0x7fa51a8d80d8)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=3.5,
 darkcurrent=0,gspos=[0,0],gsalt=90000,gsdepth=2000,laserpower=30,gsmag=7,
 skymag=0,filtertilt=1,correctUpTT=1,uplinkgain=0.2,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,
 rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=
 0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=12,
 npixpersub=0,pixsize=0.251392,npixels=4,spotpitch=20,extfield=5.02785,
 pupoffset=[0,0],shthmethod=1,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,
 flatrmserror=0,fsname=0x0,fstop="square",fssize=4,fsoffset=[0,0],kernel=1.1,
 nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=
 0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=99606.9,lgs_prof_amp=
 0x7fa51a8d8848,lgs_prof_alt=0x7fa51a85feb0,nzer=0,ndh=0,ndhfiltered=0,
 _initkernels=0,_svipc_init_done=0,_svipc_subok=0x7fa518f410a0,_fork_subs=0x0,
 _fork_subs2=0x0,_validsubs=0x7fa518f45990,_origpixsize=0.25,_rebinfactor=3,
 _gsalt=90000,_gsdepth=2000,_nsub=112,_nsub4disp=132,_nmes=224,_sind=0x0,_nsind=
 0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x1051f0030,_masks=0x0,_fluxpersub=
 0x7fa518f3d220,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=
 0x7fa518f414b0,_skyfluxpersub=0x7fa518f45d40,_nphotons=13200,_skynphotons=0,
 _tt=[-0.000323941,-0.00285329],_lastvalidtt=[-0.000323941,-0.00285329],
 _upttcommand=[-0.00382579,0.00463137],_refmes=0x7fa518c0a6a0,_tiprefv=
 0x7fa51a9cfa30,_tiltrefv=0x7fa51aa26030,_tiprefvn=0x7fa51a9d0230,_tiltrefvn=
 0x7fa51a9f4430,_reordervec=0x0,_npixels=20,_npb=16,_sdim=16,_nx=60,_nx4fft=60,
 _istart=0x7fa518f43280,_jstart=0x7fa518f3e2c0,_binindices=0x7fa5190dca30,
 _binxy=20,_centroidw=0x7fa51904a688,_fimage=0x105ccd030,_fimage2=0x0,_imistart=
 0x7fa518c0df30,_imjstart=0x7fa518c19570,_imistart2=0x7fa518c197c0,_imjstart2=
 0x7fa518c19a10,_unittip=0x7fa518f3d850,_unittilt=0x7fa518f3e9d0,_lgs_defocuses=
 0x7fa51a8d87c0,_unitdefocus=0x1050fe030,_fimnx=240,_fimny=240,_fimny2=0x0,
 _yoffset=0x0,_bias=0x1065b1030,_flat=0x1054ba030,_domask=1,_submask=
 0x7fa51a9d4a30,_kernel=0x7fa5190ec030,_kernels=0x1058ea030,_kerfftr=
 0x105abb030,_kerffti=0x107f5a030,_kernelconv=1,_cyclecounter=1,_dispimage=
 0x105271030,_x=0x7fa51aa24a30,_y=0x7fa51a87ce30,_centroidgain=1,_rayleigh=
 0x7fa519042508,_bckgrdcalib=0x105439030,_bckgrdinit=0,_bckgrdsub=1,_meashist=
 0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=2,lambda=0.65,noise=0,ron=3.5,darkcurrent=0,gspos=[0,0],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=7,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=
 0,dispzoom=0,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=1,shnxsub=1,npixpersub=0,pixsize=0.104747,npixels=2,
 spotpitch=2,extfield=0.209494,pupoffset=[0,0],shthmethod=0,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop=0x0,fssize=
 0,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,
 0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7fa51a8a2420,lgs_prof_alt=0x7fa51a8a1650,nzer=0,
 ndh=0,ndhfiltered=0,_initkernels=1,_svipc_init_done=0,_svipc_subok=0x0,
 _fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7fa519042658,_origpixsize=0.1,
 _rebinfactor=10,_gsalt=0,_gsdepth=0,_nsub=1,_nsub4disp=1,_nmes=2,_sind=0x0,
 _nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x10613f030,_masks=0x0,_fluxpersub=
 0x7fa51a8a1768,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=
 0x7fa51a8a28b8,_skyfluxpersub=0x7fa51a8a15a8,_nphotons=403509,_skynphotons=0,
 _tt=[-0.000635568,0.000322782],_lastvalidtt=[-0.000635568,0.000322782],
 _upttcommand=[0,0],_refmes=0x7fa51a8a1a40,_tiprefv=0x7fa51a8a10a0,_tiltrefv=
 0x7fa51a8a2570,_tiprefvn=0x7fa51a8676a8,_tiltrefvn=0x7fa519042818,_reordervec=
 0x0,_npixels=2,_npb=0,_sdim=128,_nx=20,_nx4fft=20,_istart=0x7fa519042850,
 _jstart=0x7fa51a8a2490,_binindices=0x7fa519036430,_binxy=2,_centroidw=
 0x7fa51a8a1d50,_fimage=0x7fa51a8a2308,_fimage2=0x0,_imistart=0x7fa51a8a1ce0,
 _imjstart=0x7fa51a8a1068,_imistart2=0x7fa51a8a23e8,_imjstart2=0x7fa51a867788,
 _unittip=0x7fa519200c30,_unittilt=0x7fa51920ee30,_lgs_defocuses=0x7fa519042ab8,
 _unitdefocus=0x105c8c030,_fimnx=2,_fimny=2,_fimny2=0x0,_yoffset=0x0,_bias=
 0x7fa51a8a19d0,_flat=0x7fa51a8a17a0,_domask=0,_submask=0x0,_kernel=
 0x7fa51904dc30,_kernels=0x7fa51aa00430,_kerfftr=0x7fa51aa27230,_kerffti=
 0x7fa51aa25830,_kernelconv=0,_cyclecounter=1,_dispimage=0x7fa51a8a2650,_x=
 0x7fa51a8a1308,_y=0x7fa519042930,_centroidgain=1,_rayleigh=0x7fa51a8a12d0,
 _bckgrdcalib=0x7fa51a8a1c70,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test7-if1.fits",pitch=10,alt=0,hyst=0,push4imat=300,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fa51a8a2b20,_ctrlden=0x7fa51a8a2500,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=13,pitchMargin=0,coupling=0.2,
 ecmatfile="test7-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=40,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fa518f474d0,_xlast=0x7fa518f478f0,_ylast=[0x7fa51aa2b430,0x7fa51aa2b430,
 0x7fa51aa2b430],_y0=0x7fa51aa02230,_signus=0x7fa51a9f6a30,_puppixoffset=[0,0],
 _nact=137,_def=0x10812b030,_x=0x7fa518c1bee0,_y=0x7fa518c0b520,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x7fa5190f2c30,_indext=0x7fa519049c38,_eiffile=
 "test7-if1-ext.fits",_edef=0x10556c030,_ex=0x7fa51904aaa8,_ey=0x7fa519810d28,
 _enact=20,_n1=60,_n2=197,_pupil=0x0,_command=0x7fa518c1a4c0,_flat_command=0x0,
 _extrapcmat=0x7fa519859830,_eltdefsize=0,_regmatrix=0x1054f3030,_fMat=0x0),
 dm_struct(type="tiptilt",subsystem=2,virtual=0,dmfit_which=0x0,iffile=
 "test7-if2.fits",pitch=0,alt=0,hyst=0,push4imat=400,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7fa51a8a26c0,_ctrlden=0x7fa51a8a2538,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,
 ecmatfile="test7-ecmat2.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,regmatrix=
 0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7fa51a8a2688,_xlast=0x7fa51a8a2960,_ylast=[0x7fa51a8d7968,0x7fa51a8d7968,
 0x7fa51a8d7968],_y0=0x7fa51a8d9590,_signus=0x7fa51a8676e0,_puppixoffset=[0,0],
 _nact=2,_def=0x106578030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test7-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=60,_n2=197,_pupil=0x0,_command=0x7fa51a8a1b90,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x7fa51a8d8738,_fMat=0x0)]
 mat_struct(method="mmse",condition=0x0,sparse_MR=10000,sparse_MN=200000,
 sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test7-mat.fits",fit_simple=0,
 fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=12,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7fa51a8a1570,xposition=0x7fa51a8a1d88,yposition=
 0x7fa51a8a15e0,dispzoom=0x7fa51a8a1c00,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=22)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")
=============================
LGS SH12x12, Extended WFS (11 npt profile)
 
WFS# |     Pixel sizes        | Subaperture size | Numb of pixels | #photons
      | Desired Quantum Actual | Max  Actual Extd | Desired Actual | /sub/iter
 1      0.2514  0.0838  0.2514   1.34  1.01  5.03    4x 4    4x 4    13200.0
 2      0.1047  0.0105  0.1047   1.34  0.21  0.21    2x 2    2x 2    403508.8
 
Summary:
Mirror #1, stackarray, 137 actuators, conjugated @ 0 m
Mirror #2, tiptilt, 2 actuators, conjugated @ 0 m
WFS # 1, hartmann (meth. 2), 112 subap., offaxis (+0.0",+0.0"), noise enabled
WFS # 2, hartmann (meth. 1),  1 subap., offaxis (+0.0",+0.0"), noise disabled
D/r0 (500nm) = 42.4; 500 iterations

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       89.1   0.052      186.5
Field Avg  1.65                     89.1   0.052      186.5
Field rms  1.65                      0.0   0.000        0.0

Average images written in test7-imav.fits
Some other graphics in test7.ps

Original parameter file: test7.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "LGS SH12x12, Extended WFS (11 npt profile)";
 sim.pupildiam      = 120;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 42.44;  // this is r0=0.166 at 550 nm
 atm.screen         = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt       = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 tel.diam           = 12.;
 tel.cobs           = 0.1125;
 
 //-------------------------------
 nwfs               = 2; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 no_pad_simage = 1;
 n   = 1;
 wfs(n).subsystem   = 1;
 wfs(n).type        = "hartmann";
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 90000.;
 wfs(n).gsdepth     = 10000.;
 wfs(n).gsdepth     = 2000.;
 wfs(n).laserpower  = 30.;
 wfs(n).kernel      = 1.1;
 wfs(n).LLTxy       = [0.,0.];
 wfs(n).gsmag       = 7.;
 wfs(n).shmethod    = 2;
 wfs(n).shnxsub     = 12;
 wfs(n).pixsize     = 0.25;
 wfs(n).npixels     = 8;
 wfs(n).extfield    = 5.;
 wfs(n).noise       = 1;
 wfs(n).ron         = 3.5;
 wfs(n).shthreshold = 0.;
 wfs(n).nintegcycles= 1;
 wfs(n).lgs_prof_amp= &float([0.6,1.2,0.9,0.9,0.5,0.2]);
 wfs(n).lgs_prof_alt= &float([92 ,94 ,96 ,98 ,100,102]*1e3);
 wfs(n).fssize      = 4.;
 wfs(n).filtertilt  = 1;
 wfs(n).correctUpTT = 1;
 wfs(n).uplinkgain  = 0.2;
 
 wfs(1).lgs_prof_amp = &float([1.0,1.0]);
 wfs(1).lgs_prof_alt = &float([90000,100000]);
 wfs(1).lgs_prof_alt = &float([90000,95000]);
 wfs(1).lgs_focus_alt=0;
 shwfs_comp_lgs_defocuses,1;
 
 func one_layer(void)
 {
   extern wfs;
   wfs(1).lgs_prof_amp = &float([1.0]);
   wfs(1).lgs_prof_alt = &float([94000]);
   wfs(1).lgs_focus_alt=94000;
   shwfs_comp_lgs_defocuses,1;
 }
 
 func all_layers(void)
 {
   wfs(1).lgs_prof_amp= &float([0.6,1.2,0.9,0.9,0.5,0.2]);
   wfs(1).lgs_prof_alt= &float([92 ,94 ,96 ,98 ,100,102]*1e3);
   wfs(1).lgs_prof_amp= &float(makegaussian(21,10)(11,));
   (*wfs(1).lgs_prof_amp)(3) *=2 ;
   // this will put two points separated by 10km, for calibrations of the method:
   //~ *wfs(1).lgs_prof_amp *=0;
   //~ (*wfs(1).lgs_prof_amp)(3) = 2;
   //~ (*wfs(1).lgs_prof_amp)(8) = 3;
   wfs(1).lgs_prof_alt= &float((89+indgen(21)*1)*1e3); // that should be fwhm=10km
   wfs(1).lgs_focus_alt = 0.; // will be set by shwfs_comp_lgs_defocuses()
   shwfs_comp_lgs_defocuses,1;
 }
 
 func all_layers2(ns,npt,fwhm)
 {
   extern wfs;
   wfs(ns).lgs_prof_amp= &float(makegaussian(npt,npt/2*fwhm/10.)(npt/2+1,));
   (*wfs(ns).lgs_prof_amp)(3) *=2 ;
   wfs(ns).lgs_prof_alt= &float(span(90,110,npt)*1e3); // that should be fwhm=10km
   wfs(ns).lgs_focus_alt = 0.; // will be set by shwfs_comp_lgs_defocuses()
   shwfs_comp_lgs_defocuses,ns;
 }
 
 func ubc_profile(bin2)
 {
   extern wfs;
   amp = [0.00125154,0.00143618,0.00161906,0.0481773,0.043927,0.0533849,0.0932741,
       0.0816419,0.0849489,0.155098,0.146013,0.130336,0.096709,0.022861,0.0130669,
       0.00831713,0.00523775,0.0045743,0.0048842,0.00324208];
   alt = [90,91.3158,92.6316,93.9474,95.2632,96.5789,97.8947,99.2105,100.526,101.842,
         103.158,104.474,105.789,107.105,108.421,109.737,111.053,112.368,113.684,115]*1e3;
   if (bin2) {
     amp = (amp+roll(amp,1))(indgen(10)*2);
     alt = (alt+roll(alt,1))(indgen(10)*2)/2.;
   }
   for (i=1;i<=6;i++) {
     wfs(i).lgs_prof_amp= &float(amp);
     wfs(i).lgs_prof_alt= &float(alt);
     wfs(i).lgs_focus_alt = 0.; // will be set by shwfs_comp_lgs_defocuses()
     shwfs_comp_lgs_defocuses,i;
   }
 }
 
 
 
 
 all_layers2,1,11,10.;
 
 n   = 2;
 wfs(n).subsystem   = 2;
 wfs(n).type        = "hartmann";
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsmag       = 7.;
 wfs(n).shmethod    = 1;
 wfs(n).shnxsub     = 1;
 wfs(n).noise       = 0;
 wfs(n).ron         = 3.5;
 wfs(n).shthreshold = 0.;
 wfs(n).dispzoom    = 0.0;
 //-------------------------------
 ndm                = 2;
 dm = array(dms,ndm);
 mergedms4disp = 1;
 
 n  =1;
 dm(n).subsystem    = 1;
 dm(n).type         = "stackarray";
 dm(n).iffile       = "";
 dm(n).nxact        = wfs(n).shnxsub+1;
 dm(n).pitch        = sim.pupildiam/wfs(n).shnxsub;
 dm(n).ndh          = 40;
 dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.01;
 dm(n).push4imat    = 300.;
 dm(n).elt          = 0;
 
 n  =2;
 dm(n).subsystem    = 2;
 dm(n).type         = "tiptilt";
 dm(n).iffile       = "";
 dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.0005;
 dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.method         = "mmse";
 
 //-------------------------------
 target.lambda      = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint       = 1e11;
 
 //-------------------------------
 loop.gain          = 0.6;
 loop.framedelay    = 1;
 loop.niter         = 20000;
 loop.ittime        = 2e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="LGS SH12x12, Extended WFS (11 npt profile)",pupildiam=120,
 pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,
 shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=42.44,screen=0x7faf8a0c5b80,layerfrac=0x7faf8a0c57c8,
 layerspeed=0x7faf8a0c6268,layeralt=0x7faf8a0c5058,winddir=0x7faf8a0c4660,
 _layeralt=0x7faf8a0c58d8)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=3.5,
 darkcurrent=0,gspos=[0,0],gsalt=90000,gsdepth=2000,laserpower=30,gsmag=7,
 skymag=0,filtertilt=1,correctUpTT=1,uplinkgain=0.2,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,
 rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=
 0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=12,
 npixpersub=0,pixsize=0.251392,npixels=4,spotpitch=20,extfield=5.02785,
 pupoffset=[0,0],shthmethod=1,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,
 flatrmserror=0,fsname=0x0,fstop="square",fssize=4,fsoffset=[0,0],kernel=1.1,
 nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=
 0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=99606.9,lgs_prof_amp=
 0x7faf8a0c6048,lgs_prof_alt=0x7faf8b0c68b0,nzer=0,ndh=0,ndhfiltered=0,
 _initkernels=0,_svipc_init_done=0,_svipc_subok=0x7faf89c1cfa0,_fork_subs=0x0,
 _fork_subs2=0x0,_validsubs=0x7faf89c1bae0,_origpixsize=0.25,_rebinfactor=3,
 _gsalt=90000,_gsdepth=2000,_nsub=112,_nsub4disp=132,_nmes=224,_sind=0x0,_nsind=
 0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x107f58030,_masks=0x0,_fluxpersub=
 0x7faf89d0b2c0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=
 0x7faf89d0b510,_skyfluxpersub=0x7faf89c1e130,_nphotons=13200,_skynphotons=0,
 _tt=[-0.000323941,-0.00285329],_lastvalidtt=[-0.000323941,-0.00285329],
 _upttcommand=[-0.00382579,0.00463137],_refmes=0x7faf89e2fc10,_tiprefv=
 0x7faf8b189e30,_tiltrefv=0x7faf8b189630,_tiprefvn=0x7faf8b01fe30,_tiltrefvn=
 0x7faf8b27e830,_reordervec=0x0,_npixels=20,_npb=16,_sdim=16,_nx=60,_nx4fft=60,
 _istart=0x7faf89c1dc90,_jstart=0x7faf89c1dee0,_binindices=0x7faf8a1f3830,
 _binxy=20,_centroidw=0x7faf8b12f088,_fimage=0x108a35030,_fimage2=0x0,_imistart=
 0x7faf89c1e5d0,_imjstart=0x7faf89c1e820,_imistart2=0x7faf89c1c1a0,_imjstart2=
 0x7faf89c1c3f0,_unittip=0x7faf89c0ad10,_unittilt=0x7faf89c1dac0,_lgs_defocuses=
 0x7faf8a0c5fc0,_unitdefocus=0x107e66030,_fimnx=240,_fimny=240,_fimny2=0x0,
 _yoffset=0x0,_bias=0x109319030,_flat=0x108222030,_domask=1,_submask=
 0x7faf8a1aa830,_kernel=0x7faf8b16d230,_kernels=0x108652030,_kerfftr=
 0x108823030,_kerffti=0x10acc2030,_kernelconv=1,_cyclecounter=1,_dispimage=
 0x1090d4030,_x=0x7faf8a050430,_y=0x7faf8a0e4c30,_centroidgain=1,_rayleigh=
 0x7faf8b01dd08,_bckgrdcalib=0x1081a1030,_bckgrdinit=0,_bckgrdsub=1,_meashist=
 0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=2,lambda=0.65,noise=0,ron=3.5,darkcurrent=0,gspos=[0,0],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=7,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=
 0,dispzoom=0,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=1,shnxsub=1,npixpersub=0,pixsize=0.104747,npixels=2,
 spotpitch=2,extfield=0.209494,pupoffset=[0,0],shthmethod=0,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop=0x0,fssize=
 0,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,
 0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7faf8b01de20,lgs_prof_alt=0x7faf8b01e2b8,nzer=0,
 ndh=0,ndhfiltered=0,_initkernels=1,_svipc_init_done=0,_svipc_subok=0x0,
 _fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7faf8a09a628,_origpixsize=0.1,
 _rebinfactor=10,_gsalt=0,_gsdepth=0,_nsub=1,_nsub4disp=1,_nmes=2,_sind=0x0,
 _nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x108ea7030,_masks=0x0,_fluxpersub=
 0x7faf8a09a660,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=
 0x7faf8a09acb8,_skyfluxpersub=0x7faf8a09aba0,_nphotons=403509,_skynphotons=0,
 _tt=[-0.000635568,0.000322782],_lastvalidtt=[-0.000635568,0.000322782],
 _upttcommand=[0,0],_refmes=0x7faf8a07c6e0,_tiprefv=0x7faf8a099740,_tiltrefv=
 0x7faf8a09a778,_tiprefvn=0x7faf8a09ac10,_tiltrefvn=0x7faf8b01e018,_reordervec=
 0x0,_npixels=2,_npb=0,_sdim=128,_nx=20,_nx4fft=20,_istart=0x7faf8b01e050,
 _jstart=0x7faf8a09a890,_binindices=0x7faf8a845030,_binxy=2,_centroidw=
 0x7faf8a09a580,_fimage=0x7faf8a09a1f8,_fimage2=0x0,_imistart=0x7faf8a09a740,
 _imjstart=0x7faf8a09a4d8,_imistart2=0x7faf8a09a970,_imjstart2=0x7faf8a09a7e8,
 _unittip=0x7faf8a904c30,_unittilt=0x7faf8a912e30,_lgs_defocuses=0x7faf8a099e08,
 _unitdefocus=0x1089f4030,_fimnx=2,_fimny=2,_fimny2=0x0,_yoffset=0x0,_bias=
 0x7faf8a0996d0,_flat=0x7faf8a099ba0,_domask=0,_submask=0x0,_kernel=
 0x7faf8b170c30,_kernels=0x7faf8b176230,_kerfftr=0x7faf8b175030,_kerffti=
 0x7faf8b01f630,_kernelconv=0,_cyclecounter=1,_dispimage=0x7faf8b01daa0,_x=
 0x7faf8b01dde8,_y=0x7faf8b01e088,_centroidgain=1,_rayleigh=0x7faf8a0998c8,
 _bckgrdcalib=0x7faf8a09aa88,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test7-if1.fits",pitch=10,alt=0,hyst=0,push4imat=300,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7faf8a099a18,_ctrlden=0x7faf8a09a5f0,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=13,pitchMargin=0,coupling=0.2,
 ecmatfile="test7-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=40,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf89d0b760,_xlast=0x7faf89d0b9d0,_ylast=[0x7faf8a84e030,0x7faf8a84e030,
 0x7faf8a84e030],_y0=0x7faf8a84d830,_signus=0x7faf8a83a430,_puppixoffset=[0,0],
 _nact=137,_def=0x10ae93030,_x=0x7faf89e33300,_y=0x7faf89e2e180,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x7faf8b169a30,_indext=0x7faf8b12e638,_eiffile=
 "test7-if1-ext.fits",_edef=0x1082d4030,_ex=0x7faf8b12f4a8,_ey=0x7faf8b81c108,
 _enact=20,_n1=60,_n2=197,_pupil=0x0,_command=0x7faf89e2e840,_flat_command=0x0,
 _extrapcmat=0x7faf8a0f7030,_eltdefsize=0,_regmatrix=0x10825b030,_fMat=0x0),
 dm_struct(type="tiptilt",subsystem=2,virtual=0,dmfit_which=0x0,iffile=
 "test7-if2.fits",pitch=0,alt=0,hyst=0,push4imat=400,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7faf8a09a8c8,_ctrlden=0x7faf8a09ad60,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,
 ecmatfile="test7-ecmat2.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,regmatrix=
 0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf8a09ab30,_xlast=0x7faf8b01dd40,_ylast=[0x7faf8a0c4b28,0x7faf8a0c4b28,
 0x7faf8a0c4b28],_y0=0x7faf8b0c69c0,_signus=0x7faf8a09a6d0,_puppixoffset=[0,0],
 _nact=2,_def=0x1092e0030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test7-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=60,_n2=197,_pupil=0x0,_command=0x7faf8a099e78,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x7faf8a0c5f38,_fMat=0x0)]
 mat_struct(method="mmse",condition=0x0,sparse_MR=10000,sparse_MN=200000,
 sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test7-mat.fits",fit_simple=0,
 fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=12,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7faf8a09a4a0,xposition=0x7faf8a07c6a8,yposition=
 0x7faf8b01dfe0,dispzoom=0x7faf8a099510,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=22)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")

         lambda   XPos   YPos  FWHM[mas]  Strehl  E50d[mas]
Star# 1     1.65    0.0   0.0       89.1   0.052      186.5
Field Avg  1.65                     89.1   0.052      186.5
Field rms  1.65                      0.0   0.000        0.0

Average images written in test7-imav.fits
Some other graphics in test7.ps

Original parameter file: test7.par:
 // YAO parameter file
 //-------------------------------
 sim.name           = "LGS SH12x12, Extended WFS (11 npt profile)";
 sim.pupildiam      = 120;
 sim.debug          = 0;
 sim.verbose        = 1;
 
 //-------------------------------
 atm.dr0at05mic     = 42.44;  // this is r0=0.166 at 550 nm
 atm.screen         = &(Y_USER+"data/screen"+["1","2","3","4"]+".fits");
 atm.layerfrac      = &([0.4,0.2,0.3,0.1]);
 atm.layerspeed     = &([11.,20,29,35]);
 atm.layeralt       = &([0.,400,6000,9000]);
 atm.winddir        = &([0,0,0,0]);
 
 //-------------------------------
 tel.diam           = 12.;
 tel.cobs           = 0.1125;
 
 //-------------------------------
 nwfs               = 2; // number of WFSs (>1 if e.g. mcao)
 wfs = array(wfss,nwfs);
 
 no_pad_simage = 1;
 n   = 1;
 wfs(n).subsystem   = 1;
 wfs(n).type        = "hartmann";
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsalt       = 90000.;
 wfs(n).gsdepth     = 10000.;
 wfs(n).gsdepth     = 2000.;
 wfs(n).laserpower  = 30.;
 wfs(n).kernel      = 1.1;
 wfs(n).LLTxy       = [0.,0.];
 wfs(n).gsmag       = 7.;
 wfs(n).shmethod    = 2;
 wfs(n).shnxsub     = 12;
 wfs(n).pixsize     = 0.25;
 wfs(n).npixels     = 8;
 wfs(n).extfield    = 5.;
 wfs(n).noise       = 1;
 wfs(n).ron         = 3.5;
 wfs(n).shthreshold = 0.;
 wfs(n).nintegcycles= 1;
 wfs(n).lgs_prof_amp= &float([0.6,1.2,0.9,0.9,0.5,0.2]);
 wfs(n).lgs_prof_alt= &float([92 ,94 ,96 ,98 ,100,102]*1e3);
 wfs(n).fssize      = 4.;
 wfs(n).filtertilt  = 1;
 wfs(n).correctUpTT = 1;
 wfs(n).uplinkgain  = 0.2;
 
 wfs(1).lgs_prof_amp = &float([1.0,1.0]);
 wfs(1).lgs_prof_alt = &float([90000,100000]);
 wfs(1).lgs_prof_alt = &float([90000,95000]);
 wfs(1).lgs_focus_alt=0;
 shwfs_comp_lgs_defocuses,1;
 
 func one_layer(void)
 {
   extern wfs;
   wfs(1).lgs_prof_amp = &float([1.0]);
   wfs(1).lgs_prof_alt = &float([94000]);
   wfs(1).lgs_focus_alt=94000;
   shwfs_comp_lgs_defocuses,1;
 }
 
 func all_layers(void)
 {
   wfs(1).lgs_prof_amp= &float([0.6,1.2,0.9,0.9,0.5,0.2]);
   wfs(1).lgs_prof_alt= &float([92 ,94 ,96 ,98 ,100,102]*1e3);
   wfs(1).lgs_prof_amp= &float(makegaussian(21,10)(11,));
   (*wfs(1).lgs_prof_amp)(3) *=2 ;
   // this will put two points separated by 10km, for calibrations of the method:
   //~ *wfs(1).lgs_prof_amp *=0;
   //~ (*wfs(1).lgs_prof_amp)(3) = 2;
   //~ (*wfs(1).lgs_prof_amp)(8) = 3;
   wfs(1).lgs_prof_alt= &float((89+indgen(21)*1)*1e3); // that should be fwhm=10km
   wfs(1).lgs_focus_alt = 0.; // will be set by shwfs_comp_lgs_defocuses()
   shwfs_comp_lgs_defocuses,1;
 }
 
 func all_layers2(ns,npt,fwhm)
 {
   extern wfs;
   wfs(ns).lgs_prof_amp= &float(makegaussian(npt,npt/2*fwhm/10.)(npt/2+1,));
   (*wfs(ns).lgs_prof_amp)(3) *=2 ;
   wfs(ns).lgs_prof_alt= &float(span(90,110,npt)*1e3); // that should be fwhm=10km
   wfs(ns).lgs_focus_alt = 0.; // will be set by shwfs_comp_lgs_defocuses()
   shwfs_comp_lgs_defocuses,ns;
 }
 
 func ubc_profile(bin2)
 {
   extern wfs;
   amp = [0.00125154,0.00143618,0.00161906,0.0481773,0.043927,0.0533849,0.0932741,
       0.0816419,0.0849489,0.155098,0.146013,0.130336,0.096709,0.022861,0.0130669,
       0.00831713,0.00523775,0.0045743,0.0048842,0.00324208];
   alt = [90,91.3158,92.6316,93.9474,95.2632,96.5789,97.8947,99.2105,100.526,101.842,
         103.158,104.474,105.789,107.105,108.421,109.737,111.053,112.368,113.684,115]*1e3;
   if (bin2) {
     amp = (amp+roll(amp,1))(indgen(10)*2);
     alt = (alt+roll(alt,1))(indgen(10)*2)/2.;
   }
   for (i=1;i<=6;i++) {
     wfs(i).lgs_prof_amp= &float(amp);
     wfs(i).lgs_prof_alt= &float(alt);
     wfs(i).lgs_focus_alt = 0.; // will be set by shwfs_comp_lgs_defocuses()
     shwfs_comp_lgs_defocuses,i;
   }
 }
 
 
 
 
 all_layers2,1,11,10.;
 
 n   = 2;
 wfs(n).subsystem   = 2;
 wfs(n).type        = "hartmann";
 wfs(n).lambda      = 0.65;
 wfs(n).gspos       = [0.,0.];
 wfs(n).gsmag       = 7.;
 wfs(n).shmethod    = 1;
 wfs(n).shnxsub     = 1;
 wfs(n).noise       = 0;
 wfs(n).ron         = 3.5;
 wfs(n).shthreshold = 0.;
 wfs(n).dispzoom    = 0.0;
 //-------------------------------
 ndm                = 2;
 dm = array(dms,ndm);
 mergedms4disp = 1;
 
 n  =1;
 dm(n).subsystem    = 1;
 dm(n).type         = "stackarray";
 dm(n).iffile       = "";
 dm(n).nxact        = wfs(n).shnxsub+1;
 dm(n).pitch        = sim.pupildiam/wfs(n).shnxsub;
 dm(n).ndh          = 40;
 dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.01;
 dm(n).push4imat    = 300.;
 dm(n).elt          = 0;
 
 n  =2;
 dm(n).subsystem    = 2;
 dm(n).type         = "tiptilt";
 dm(n).iffile       = "";
 dm(n).alt          = 0.;
 dm(n).unitpervolt  = 0.0005;
 dm(n).push4imat    = 400;
 
 //-------------------------------
 mat.method         = "mmse";
 
 //-------------------------------
 target.lambda      = &([1.65]);
 target.xposition   = &([0.]);
 target.yposition   = &([0]);
 target.dispzoom    = &([1.]);
 
 //-------------------------------
 gs.zeropoint       = 1e11;
 
 //-------------------------------
 loop.gain          = 0.6;
 loop.framedelay    = 1;
 loop.niter         = 20000;
 loop.ittime        = 2e-3;
 loop.startskip     = 10;
 loop.skipevery     = 10000;
 loop.skipby        = 10000;
 
 //-------------------------------
 
==== dump of structures ====
 sim_struct(name="LGS SH12x12, Extended WFS (11 npt profile)",pupildiam=120,
 pupilapod=0,debug=0,verbose=1,svipc=0,svipc_wfs_nfork=0,svipc_wfs_forknb=0x0,
 shmkey=0,semkey=0,_size=256,_cent=128.5)
 atm_struct(dr0at05mic=42.44,screen=0x7faf8a0c5b80,layerfrac=0x7faf8a0c57c8,
 layerspeed=0x7faf8a0c6268,layeralt=0x7faf8a0c5058,winddir=0x7faf8a0c4660,
 _layeralt=0x7faf8a0c58d8)
 [wfs_struct(type="hartmann",subsystem=1,lambda=0.65,noise=1,ron=3.5,
 darkcurrent=0,gspos=[0,0],gsalt=90000,gsdepth=2000,laserpower=30,gsmag=7,
 skymag=0,filtertilt=1,correctUpTT=1,uplinkgain=0.2,dispzoom=1,optthroughput=1,
 disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,nsubperring=0x0,angleoffset=0x0,l=0,
 rint=0x0,rout=0x0,fieldstopdiam=0,pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=
 0x0,pyr_padding=0,pyr_mod_loc=0x0,pyr_denom=0x0,shmethod=2,shnxsub=12,
 npixpersub=0,pixsize=0.251392,npixels=4,spotpitch=20,extfield=5.02785,
 pupoffset=[0,0],shthmethod=1,shthreshold=0,shcalibseeing=0.667,biasrmserror=0,
 flatrmserror=0,fsname=0x0,fstop="square",fssize=4,fsoffset=[0,0],kernel=1.1,
 nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,0],LLT_uplink_turb=0,LLTr0=
 0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,lgs_focus_alt=99606.9,lgs_prof_amp=
 0x7faf8a0c6048,lgs_prof_alt=0x7faf8b0c68b0,nzer=0,ndh=0,ndhfiltered=0,
 _initkernels=0,_svipc_init_done=0,_svipc_subok=0x7faf89e2eff0,_fork_subs=0x0,
 _fork_subs2=0x0,_validsubs=0x7faf89c1bae0,_origpixsize=0.25,_rebinfactor=3,
 _gsalt=90000,_gsdepth=2000,_nsub=112,_nsub4disp=132,_nmes=224,_sind=0x0,_nsind=
 0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x107f58030,_masks=0x0,_fluxpersub=
 0x7faf89d0b2c0,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=
 0x7faf89d0b510,_skyfluxpersub=0x7faf89c1e130,_nphotons=13200,_skynphotons=0,
 _tt=[-0.000323941,-0.00285329],_lastvalidtt=[-0.000323941,-0.00285329],
 _upttcommand=[-0.00382579,0.00463137],_refmes=0x7faf89e2fc10,_tiprefv=
 0x7faf8b189e30,_tiltrefv=0x7faf8b189630,_tiprefvn=0x7faf8b01fe30,_tiltrefvn=
 0x7faf8b27e830,_reordervec=0x0,_npixels=20,_npb=16,_sdim=16,_nx=60,_nx4fft=60,
 _istart=0x7faf89c1dc90,_jstart=0x7faf89c1dee0,_binindices=0x7faf8a1f3830,
 _binxy=20,_centroidw=0x7faf8b12f088,_fimage=0x108a35030,_fimage2=0x0,_imistart=
 0x7faf89c1e5d0,_imjstart=0x7faf89c1e820,_imistart2=0x7faf89c1c1a0,_imjstart2=
 0x7faf89c1c3f0,_unittip=0x7faf89c0ad10,_unittilt=0x7faf89c1dac0,_lgs_defocuses=
 0x7faf8a0c5fc0,_unitdefocus=0x107e66030,_fimnx=240,_fimny=240,_fimny2=0x0,
 _yoffset=0x0,_bias=0x109319030,_flat=0x108222030,_domask=1,_submask=
 0x7faf8a1aa830,_kernel=0x7faf8b866030,_kernels=0x108652030,_kerfftr=
 0x108823030,_kerffti=0x10acc2030,_kernelconv=1,_cyclecounter=1,_dispimage=
 0x107fd9030,_x=0x7faf8a050430,_y=0x7faf8a0e4c30,_centroidgain=1,_rayleigh=
 0x7faf8b01dd08,_bckgrdcalib=0x1081a1030,_bckgrdinit=0,_bckgrdsub=1,_meashist=
 0x0,_zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1),wfs_struct(type="hartmann",
 subsystem=2,lambda=0.65,noise=0,ron=3.5,darkcurrent=0,gspos=[0,0],gsalt=0,
 gsdepth=0,laserpower=0,gsmag=7,skymag=0,filtertilt=0,correctUpTT=0,uplinkgain=
 0,dispzoom=0,optthroughput=1,disjointpup=0,svipc=0,zeropoint=0,ncpdm=0,
 nsubperring=0x0,angleoffset=0x0,l=0,rint=0x0,rout=0x0,fieldstopdiam=0,
 pyr_mod_ampl=0,pyr_mod_npts=0,pyr_mod_pos=0x0,pyr_padding=0,pyr_mod_loc=0x0,
 pyr_denom=0x0,shmethod=1,shnxsub=1,npixpersub=0,pixsize=0.104747,npixels=2,
 spotpitch=2,extfield=0.209494,pupoffset=[0,0],shthmethod=0,shthreshold=0,
 shcalibseeing=0.667,biasrmserror=0,flatrmserror=0,fsname=0x0,fstop=0x0,fssize=
 0,fsoffset=[0,0],kernel=0,nintegcycles=1,fracIllum=0.5,centGainOpt=0,LLTxy=[0,
 0],LLT_uplink_turb=0,LLTr0=0,LLTdiam=0,LLT1overe2diam=0,rayleighflag=0,
 lgs_focus_alt=0,lgs_prof_amp=0x7faf8b01de20,lgs_prof_alt=0x7faf8b01e2b8,nzer=0,
 ndh=0,ndhfiltered=0,_initkernels=1,_svipc_init_done=0,_svipc_subok=0x0,
 _fork_subs=0x0,_fork_subs2=0x0,_validsubs=0x7faf8a09a628,_origpixsize=0.1,
 _rebinfactor=10,_gsalt=0,_gsdepth=0,_nsub=1,_nsub4disp=1,_nmes=2,_sind=0x0,
 _nsind=0x0,_cxdef=0x0,_sxdef=0x0,_tiltsh=0x108ea7030,_masks=0x0,_fluxpersub=
 0x7faf8a09a660,_rayleighflux=0x0,_sodiumflux=0x0,_raylfluxpersub=
 0x7faf8a09acb8,_skyfluxpersub=0x7faf8a09aba0,_nphotons=403509,_skynphotons=0,
 _tt=[-0.000635568,0.000322782],_lastvalidtt=[-0.000635568,0.000322782],
 _upttcommand=[0,0],_refmes=0x7faf8a07c6e0,_tiprefv=0x7faf8a099740,_tiltrefv=
 0x7faf8a09a778,_tiprefvn=0x7faf8a09ac10,_tiltrefvn=0x7faf8b01e018,_reordervec=
 0x0,_npixels=2,_npb=0,_sdim=128,_nx=20,_nx4fft=20,_istart=0x7faf8b01e050,
 _jstart=0x7faf8a09a890,_binindices=0x7faf8a845030,_binxy=2,_centroidw=
 0x7faf8a09a580,_fimage=0x7faf8a09a1f8,_fimage2=0x0,_imistart=0x7faf8a09a740,
 _imjstart=0x7faf8a09a4d8,_imistart2=0x7faf8a09a970,_imjstart2=0x7faf8a09a7e8,
 _unittip=0x7faf8a904c30,_unittilt=0x7faf8a912e30,_lgs_defocuses=0x7faf8a099e08,
 _unitdefocus=0x1089f4030,_fimnx=2,_fimny=2,_fimny2=0x0,_yoffset=0x0,_bias=
 0x7faf8a0996d0,_flat=0x7faf8a099ba0,_domask=0,_submask=0x0,_kernel=
 0x7faf8b82aa30,_kernels=0x7faf8b176230,_kerfftr=0x7faf8b175030,_kerffti=
 0x7faf8b01f630,_kernelconv=0,_cyclecounter=1,_dispimage=0x7faf8a09a8c8,_x=
 0x7faf8b01dde8,_y=0x7faf8b01e088,_centroidgain=1,_rayleigh=0x7faf8a0998c8,
 _bckgrdcalib=0x7faf8a09aa88,_bckgrdinit=0,_bckgrdsub=1,_meashist=0x0,
 _zeropoint=1e+11,_pha2dhc=0x0,_wpha2dhc=0x0,_n12=[0,0],_LLT_use=0,
 _LLT_pscreen_name=0x0,_LLT_pscreen=0x0,_LLT_pos=[0,0],_LLT_pupil=0x0,
 _LLT_phase=0x0,_LLT_kernel=0x0,_nkernels=1)]
 [dm_struct(type="stackarray",subsystem=1,virtual=0,dmfit_which=0x0,iffile=
 "test7-if1.fits",pitch=10,alt=0,hyst=0,push4imat=300,thresholdresp=0.3,
 unitpervolt=0.01,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7faf8a099b68,_ctrlden=0x7faf8a09aa18,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=13,pitchMargin=0,coupling=0.2,
 ecmatfile="test7-ecmat1.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=40,nkl=0,nxseg=0,fradius=0,regparam=1e-05,regtype=0x0,
 regmatrix=0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf89f1c530,_xlast=0x7faf89f1c7a0,_ylast=[0x7faf8b832430,0x7faf8b832430,
 0x7faf8b832430],_y0=0x7faf8b831c30,_signus=0x7faf8b806c30,_puppixoffset=[0,0],
 _nact=137,_def=0x10ae93030,_x=0x7faf89e33300,_y=0x7faf89e2e180,_i1=0x0,_j1=0x0,
 _ei1=0x0,_ej1=0x0,_indval=0x7faf8b169a30,_indext=0x7faf8b12e638,_eiffile=
 "test7-if1-ext.fits",_edef=0x1082d4030,_ex=0x7faf8b12f4a8,_ey=0x7faf8b81c108,
 _enact=20,_n1=60,_n2=197,_pupil=0x0,_command=0x7faf89f1d950,_flat_command=0x0,
 _extrapcmat=0x7faf8a0f7030,_eltdefsize=0,_regmatrix=0x10825b030,_fMat=0x0),
 dm_struct(type="tiptilt",subsystem=2,virtual=0,dmfit_which=0x0,iffile=
 "test7-if2.fits",pitch=0,alt=0,hyst=0,push4imat=400,thresholdresp=0.3,
 unitpervolt=0.0005,maxvolt=0,gain=1,ctrlnum=0x0,ctrlden=0x0,_ctrlnum=
 0x7faf8b01dfa8,_ctrlden=0x7faf8b01dd40,misreg=[0,0],xflip=0,yflip=0,pupoffset=
 [0,0],disjointpup=0,pegged=0x0,epegged=0x0,ncp=0,ncpfit_type=0x0,ncpfit_which=
 0,use_def_of=0,ifunrot=0,xscale=0,nelperring=0x0,angleoffset=0x0,rint=0x0,rout=
 0x0,supportRadius=0,supportOffset=0,nxact=0,pitchMargin=0,coupling=0.2,
 ecmatfile="test7-ecmat2.fits",noextrap=0,elt=0,irexp=0,irfact=0,filtertilt=0,
 nzer=0,minzer=1,ndh=0,nkl=0,nxseg=0,fradius=0,regparam=0,regtype=0x0,regmatrix=
 0x0,_alpha=[0.01,0.2,4],_beta=[0.4,0.63,0.89],_w=[0.2,0.35,0.45],_x0=
 0x7faf8a099a18,_xlast=0x7faf8a09ad60,_ylast=[0x7faf8a0c5168,0x7faf8a0c5168,
 0x7faf8a0c5168],_y0=0x7faf8a0c6d90,_signus=0x7faf8a09ab30,_puppixoffset=[0,0],
 _nact=2,_def=0x1092e0030,_x=0x0,_y=0x0,_i1=0x0,_j1=0x0,_ei1=0x0,_ej1=0x0,
 _indval=0x0,_indext=0x0,_eiffile="test7-if2-ext.fits",_edef=0x0,_ex=0x0,_ey=
 0x0,_enact=0,_n1=60,_n2=197,_pupil=0x0,_command=0x7faf8b01daa0,_flat_command=
 0x0,_extrapcmat=0x0,_eltdefsize=0,_regmatrix=0x7faf8a0c5f38,_fMat=0x0)]
 mat_struct(method="mmse",condition=0x0,sparse_MR=10000,sparse_MN=200000,
 sparse_thresh=1e-08,sparse_pcgtol=1e-06,file="test7-mat.fits",fit_simple=0,
 fit_subsamp=1,fit_type="target",fit_which=1,fit_minval=0.01)
 tel_struct(diam=12,cobs=0.1125,tipvib_white_rms=0,tipvib_1overf_rms=0,
 tipvib_peaks=0x0,tipvib_peaks_rms=0x0,tipvib_peaks_width=0x0,tiltvib_white_rms=
 0,tiltvib_1overf_rms=0,tiltvib_peaks=0x0,tiltvib_peaks_rms=0x0,
 tiltvib_peaks_width=0x0)
 target_struct(lambda=0x7faf8a09a4a0,xposition=0x7faf8a07c6a8,yposition=
 0x7faf8b01dfe0,dispzoom=0x7faf8a099510,ncpdm=0x0,_ntarget=1,_nlambda=1)
 gs_struct(zeropoint=1e+11,zenithangle=0,lgsreturnperwatt=22)
 loop_struct(gain=0.6,leak=0,gainho=0x0,leakho=0x0,framedelay=1,niter=500,
 ittime=0.002,startskip=10,skipevery=10000,skipby=10000,stats_every=4,
 jumps2swapscreen=0,modalgainfile="",method="closed-loop")
