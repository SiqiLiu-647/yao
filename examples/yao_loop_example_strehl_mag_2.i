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
targetlambdav = &([1.65]);
print, numberof(targetlambdav);
strehlarray = array(0.,[2,numberof(targetlambdav),numberof(gsmagv)]);

loop.niter = 1000;
loop.gain  = 0.1;
for (ii=1;ii<=numberof(targetlambdav);ii++) {
  for (jj=1;jj<=numberof(gsmagv);jj++) {
    wfs(1).gsmag=gsmagv(jj);
    target.lambda=targetlambdav(ii);
    //print, wfs(1).gsmag;
    //print, loop.gain;
    aoinit,disp=1,clean=1;
    aoloop,disp=10;
    go, all=1;
    strehlarray(1,jj) = strehllp(0); // fill in result array
    print, strehllp(0);
    print, strehllp(1);
    print, numberof(strehllp);
    window,33;
    fma;
    for (ll=1;ll<=ii;ll++) {
      plg,strehlarray(ll,),gsmagv,color=-ll-4;
      //plg,strehlarray(ll,),gsmagv,color=-ll-4;
      limits, 5.0, 15.0;
      range, 0.0, 0.7;
    }
    logxy,0,0;
    xytitles,"Guide Star Magnitude","Strehl Ratio";
    window,0;
  }
 }

targetlambdav = &([2.2]);
//print, numberof(targetlambdav);
strehlarray2 = array(0.,[2,numberof(targetlambdav),numberof(gsmagv)]);

for (ii=1;ii<=numberof(targetlambdav);ii++) {
  for (jj=1;jj<=numberof(gsmagv);jj++) {
    wfs(1).gsmag=gsmagv(jj);
    target.lambda=targetlambdav(ii);
    aoinit,disp=1,clean=1;
    aoloop,disp=10;
    go, all=1;
    strehlarray2(1,jj) = strehllp(0); // fill in result array
    window,33;
    //fma;
    for (ll=1;ll<=ii;ll++) {
      plg,strehlarray2(ll,),gsmagv,color=-ll-5;
    }
    logxy,0,0;
    xytitles,"Guide Star Magnitude","Strehl Ratio";
   // window,0;
  }
 }
