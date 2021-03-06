require,"yao.i";
write,"CREATING PHASE SCREENS";
if (!open(Y_USER+"data/screen1.fits","r",1)) {
  create_phase_screens,1024,256,prefix=YUSER+"data/screen";
 }

window,33,wait=1;

// read out parfile
aoread,"sh12x12_pyr.par";

// define vector on which we want to loop and final strehl array
modulation_ampv = [0.1,0.2,0.3,0.4,0.5];
modulation_nptsv  = [24,28,32,36,40];
strehlarray = array(0.,[2,numberof(modulation_nptsv),numberof(modulation_ampv)]);

loop.niter=500;
for (ii=1;ii<=numberof(modulation_nptsv);ii++) {
  for (jj=1;jj<=numberof(modulation_ampv);jj++) {
    wfs(1).pyr_mod_ampl=modulation_ampv(jj);
    wfs(1).pyr_mod_npts=modulation_nptsv(ii);
    print, wfs(1).pyr_mod_ampl;
    print, wfs(1).pyr_mod_npts;
    aoinit,disp=1,clean=1;
    aoloop,disp=10;
    go, all=1;
    strehlarray(ii,jj) = strehllp(0); // fill in result array
    window,33;
    fma;
    for (ll=1;ll<=ii;ll++) {
      plg,strehlarray(ll,),modulation_ampv,color=-ll-4,legend="Modulation amplitude";
      plt,strehlarray(ll,),modulation_ampv,color=-ll-4,symbol=4,size=0.6;
      limits, 0.0, 0.6;
      range, 0.3, 0.7;
      print,ll;
      pltitle, "Strehl Ratio in Pyramid WFS for setup."
      //plt,swrite(format="npts=%d",modulation_nptsv(jj)),0.011,ymax-yspace*(ll-1), \
        //justify="LT",tosys=1,color=-ll-4; //there is something wrong with this sentence...
    }
    logxy,0,0;
    xytitles,"Modulation Amplitude",swrite(format="Strehl @ %.2fmicrons",(*target.lambda)(0));
    window,0;
  }
 }
