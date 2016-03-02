require,"yao.i";
write,"CREATING PHASE SCREENS";
if (!open(Y_USER+"data/screen1.fits","r",1)) {
  create_phase_screens,1024,256,prefix=YUSER+"data/screen";
 }

window,4,wait=1;

// read out parfile
aoread,"sh12x12.par";
// atm.dr0at05mic = 35; // be more gentle

// define vector on which we want to loop and final strehl array
gsmagv = [6.,9,14];//star magnitude vector, because we only want to analysis the situation where the strehl will be above the 0.1
ittimev = [1e-3, 2e-3, 5e-3, 8e-3];
strehlarray = array(0.,[2,numberof(gsmagv),numberof(ittimev)]);//a combination of the magnitude of the star and the loopgain.

// loop on gsmag and iteration time, index start from one
loop.niter = 1000;
for (ii=1;ii<=numberof(gsmagv);ii++) {
    for(kk=1;kk<=numberof(ittimev);kk++){
    wfs(1).gsmag=gsmagv(ii);
    loop.ittime=ittimev(kk);
    aoinit,disp=1,clean=1;
    aoloop,disp=10; //disp=10 in the call means "do your displays every 10 iterations". 
    go, all=1;//go: do all loop.niter
    strehlarray(ii,kk) = strehllp(0); // fill in result array
    window,4;
    fma;//First, if the current display list has changed, Yorick re-walks it, ensuring that your screen is up to date. Afterwards, fma clears the display list.
    for (ll=1;ll<=ii;ll++) {  //x axis is the loop.gain
        //y axis is the strehl-ratio
      plg,strehlarray(ll,),ittimev,color=-ll-4; // plots a graph of Y versus X.
      limits, 0.0005, 0.01;
      range, 0.0, 0.45; //yaxis range
    }
    logxy,1,0;
    xytitles,"Loop Ittime",swrite(format="Strehl @ %.2fmicrons",(*target.lambda)(0));
    window,0;
   }
  //}
 }
