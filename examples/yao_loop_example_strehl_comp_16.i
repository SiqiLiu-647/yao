require,"yao.i";
write,"CREATING PHASE SCREENS";
if (!open(Y_USER+"data/screen1.fits","r",1)) {
  create_phase_screens,1024,256,prefix=YUSER+"data/screen";
 }

window,1,wait=1;

//------------------------------------SH------------------------------------
aoread,"sh16x16_new.par";
sim.svipc=0;// no paralization

// define vector on which we want to loop and final strehl array
gsmagv          = [1.0,6.0,9.0,10.0,14.0,15.0,16.0];
targetlambdav   = &([2.2]);//J:1.25um; H:1.65um; K:2.2um
strehlarray     = array(float,[2,2,numberof(gsmagv)]);
loop.gain       = 0.3;
loop.niter      = 1000;

target.lambda = targetlambdav(1);
for (ii=1; ii<=numberof(gsmagv)-3;ii++) {
  wfs(1).gsmag = gsmagv(ii);
  aoinit,disp=1,clean=1;
  aoloop,disp=10;
  go, all=1;
  strehlarray(1,ii) = strehllp(0); // fill in result array
}

//--faint star...
loop.ittime     = 10e-3;
for (ii=5; ii <= numberof(gsmagv); ii++){
  wfs(1).gsmag = gsmagv(ii);
  aoinit,disp=1,clean=1;
  aoloop,disp=10
  go, all=1;
  strehlarray(1,ii)=strehllp(0);
}


//-------------------------PYR-----------------------------------------
aoread,"sh16x16_pyr.par";
sim.svipc=0;

loop.gain           = 0.4;
loop.ittime         = 1e-3;
wfs(1).pyr_mod_npts = 24;
wfs(1).pyr_mod_ampl = 0.02;
target.lambda       = targetlambdav(1);

for (ii=1;ii<=numberof(gsmagv)-3;ii++) {
  wfs(1).gsmag=gsmagv(ii);
  aoinit,disp=1,clean=1;
  aoloop,disp=10;
  go, all=1;
  strehlarray(2,ii) = strehllp(0); // fill in result array
}

//--faint star...
loop.ittime     = 2e-3;
loop.gain       = 0.4;

for (ii=5; ii <= numberof(gsmagv)-1; ii++){
  wfs(1).gsmag=gsmagv(ii);
  aoinit,disp=1,clean=1;
  aoloop,disp=10
  go, all=1;
  strehlarray(2,ii)=strehllp(0);
}


loop.ittime=5e-3;
wfs(1).gsmag=gsmagv(7);
aoinit,disp=1,clean=1;
aoloop,disp=10
go, all=1;
strehlarray(2,7)=strehllp(0);

//------------------Plotting------------------------------------------
window,1;
fma;

plg,strehlarray(1,),gsmagv,color=-5;
plmk,strehlarray(1,),gsmagv,color=-5,marker=1;
plg,strehlarray(2,),gsmagv,color=-7;
plmk,strehlarray(2,),gsmagv,color=-7,marker=3;
limits, 0.5, 16.5;//x-axis
range, 0.3, 1.0;//y-axis

logxy,0,0;
xytitles,"Magnitude",swrite(format="Strehl @ %.2fmicrons",(*target.lambda)(0));
pltitle, "Strehl Ratio with the magnitude 16x16 pixel";
