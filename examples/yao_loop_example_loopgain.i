 require,"yao.i";
write,"CREATING PHASE SCREENS";
if (!open(Y_USER+"data/screen1.fits","r",1)) {
  create_phase_screens,1024,256,prefix=YUSER+"data/screen";
 }

window,33,wait=1;

// read out parfile
aoread,"sh12x12.par";

// define vector on which we want to loop and final strehl array
gsmagv = [6.0,9.0,14.0];
gainv  = [0.01,0.1,0.2,0.3,0.35,0.4,0.5,0.9];
strehlarray = array(0.,[2,numberof(gsmagv),numberof(gainv)]);

loop.niter=1000;
//loop.gain=0.1
for (ii=1;ii<=numberof(gsmagv);ii++) {
  for (jj=1;jj<=numberof(gainv);jj++) {
    wfs(1).gsmag=gsmagv(ii);
    loop.gain=gainv(jj);
    print, wfs(1).gsmag;
    print, loop.gain;
    aoinit,disp=1,clean=1;
    aoloop,disp=10;
    go, all=1;
    strehlarray(ii,jj) = strehllp(0); // fill in result array
    window,33;
    fma;
    for (ll=1;ll<=ii;ll++) {
      plg,strehlarray(ll,),gainv,color=-ll-4;
      limits, 0.0, 1.0;
      range, 0.0, 0.7;
    }
    logxy,0,0;
    xytitles,"Loop Gain",swrite(format="Strehl @ %.2fmicrons",(*target.lambda)(0));
    pltitle, "Strehl Ratio in SHWFS testting best loopgain";
    window,0;
  }
 }
