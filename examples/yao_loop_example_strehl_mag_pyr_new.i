require,"yao.i";
write,"CREATING PHASE SCREENS";
if (!open(Y_USER+"data/screen1.fits","r",1)) {
  create_phase_screens,1024,256,prefix=YUSER+"data/screen";
 }

window,4,wait=1;

// read out parfile
aoread,"sh12x12_pyr_24.par";

// define vector on which we want to loop and final strehl array
gsmagv = [1.0,6.0,9.0,14.0,15.0];
targetlambdav = &([2.2]);
//print, numberof(targetlambdav);
strehlarray = array(0.,[2,numberof(targetlambdav),numberof(gsmagv)]);

loop.niter = 1000;
loop.gain  = 0.6;
loop.ittime = 1e-3;
wfs(1).pyr_mod_npts =32;
for (ii=1;ii<=numberof(targetlambdav);ii++) {
  for (jj=1;jj<=numberof(gsmagv);jj++) {
    wfs(1).gsmag=gsmagv(jj);
    target.lambda=targetlambdav(ii);
    aoinit,disp=1,clean=1;
    aoloop,disp=10;
    go, all=1;
    strehlarray(1,jj) = strehllp(0); // fill in result array
    print, strehllp(0);
    print, strehllp(1);
    print, numberof(strehllp);
    window,4;
    fma;
    for (ll=1;ll<=ii;ll++) {
      plg,strehlarray(ll,),gsmagv,color=-ll-4;
      limits, 0.5, 15.0;
      range, 0.0, 0.8;
    }
    logxy,0,0;
    xytitles,"Guide Star Magnitude","Strehl Ratio";
    pltitle, "Strehl Ratio PYWFS in 2.2 microns with Star magnitude";
    window,0;
  }
 }
