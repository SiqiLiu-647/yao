require,"yao.i";
write,"CREATING PHASE SCREENS";
if (!open(Y_USER+"data/screen1.fits","r",1)) {
  create_phase_screens,1024,256,prefix=YUSER+"data/screen";
 }

window,1,wait=1;

//------------------------------------SH------------------------------------
aoread,"sh12x12.par";
sim.svipc=0;// no paralization

// define vector on which we want to loop and final strehl array
gsmagv          = [1.0,6.0,9.0,10.0,14.0,15.0,16.0];
targetlambdav   = &([2.2]);// here is some problem dealing with this array.
strehlarray     = array(float,[2,2,numberof(gsmagv)]);
loop.gain	    = 0.3;
loop.niter      = 1000;

target.lambda = targetlambdav(1);
for (ii=1; ii<=numberof(gsmagv);ii++) {
  wfs(1).gsmag = gsmagv(ii);
  aoinit,disp=1,clean=1;
  aoloop,disp=10;
  go, all=1;
  strehlarray(1,ii) = strehllp(0); // fill in result array
}

//-------------------------PYR-----------------------------------------
aoread,"sh12x12_pyr_24.par";
sim.svipc=0;

loop.gain           = 0.6;
wfs(1).pyr_mod_npts = 16;
wfs(1).pyr_mod_ampl = 0.1;

for (ii=1;ii<=numberof(gsmagv);ii++) {
	wfs(1).gsmag=gsmagv(ii);
    aoinit,disp=1,clean=1;
    aoloop,disp=10;
    go, all=1;
    strehlarray(2,ii) = strehllp(0); // fill in result array
}

//------------------Plotting------------------------------------------
window,1;
fma;

plg,strehlarray(1,),gsmagv,color=-5;
plmk,strehlarray(1,),gsmagv,color=-5,marker=1;
plg,strehlarray(2,),gsmagv,color=-7;
plmk,strehlarray(2,),gsmagv,color=-7,marker=3;
limits, 0.5, 16.5;//x-axis
range, 0.0, 0.75
;//y-axis

logxy,0,0;
xytitles,"Magnitude","Strehl Ratio @ 2.2 microns";//swrite(format="Strehl @ %.2fmicrons",(*target.lambda)(0));
