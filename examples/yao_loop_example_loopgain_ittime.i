require,"yao.i";
write,"CREATING PHASE SCREENS";
if (!open(Y_USER+"data/screen1.fits","r",1)) {
  create_phase_screens,1024,256,prefix=YUSER+"data/screen";
 }

window,33,wait=1;

// read out parfile
aoread,"sh12x12.par";
target.lambda    = &([1.65]);

// define vector on which we want to loop and final strehl array
gsmagv = [5.0];
wfs(1).gsmag=gsmagv(1);

gainv  = [0.15,0.2,0.25,0.3,0.33,0.35,0.4,0.45];
ittimev = [0.5e-3, 1e-3, 1.5e-3,2e-3,2.5e-3, 5e-3, 8e-3];
strehlarray = array(0.,[2,numberof(ittimev),numberof(gainv)]);

loop.niter=1000;
//loop.gain=0.1
for (ii=1;ii<=numberof(ittimev);ii++) {
  for (jj=1;jj<=numberof(gainv);jj++) {
    //wfs(1).gsmag=gsmagv(ii);
    loop.ittime = ittimev(ii);
    loop.gain=gainv(jj);
    //print, wfs(1).gsmag;
    print, loop.gain;
    aoinit,disp=1,clean=1;
    aoloop,disp=10;
    go, all=1;
    strehlarray(ii,jj) = strehllp(0); // fill in result array
    window,33;
    fma;
    for (ll=1;ll<=ii;ll++) {
      plg,strehlarray(ll,),gainv,color=-ll-4;
      limits, 0.12, 0.48;
      //range, 0.50, 0.70; for 2.2 microns
      range, 0.3, 0.55; //for 1.65 microns, SHWFS
    }
    logxy,0,0;
    xytitles,"Loop Gain",swrite(format="Strehl @ %.2fmicrons",(*target.lambda)(0));
    pltitle, "Strehl Ratio in SHWFS for mag 5 star";
    window,0;
  }
 }
