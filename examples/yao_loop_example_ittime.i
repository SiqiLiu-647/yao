require,"yao.i";
write,"CREATING PHASE SCREENS";
if (!open(Y_USER+"data/screen1.fits","r",1)) {
  create_phase_screens,1024,256,prefix=YUSER+"data/screen";
 }

window,4,wait=1;

// read out parfile
aoread,"sh12x12.par";
atm.dr0at05mic = 35; // be more gentle

// define vector on which we want to loop and final strehl array
gsmagv = [6.,9,15];//star magnitude vector
ittimev = [1e-3, 2e-3, 5e-3, 8e-3];
strehlarray = array(0.,[2,numberof(gsmagv),numberof(ittimev)]);//a combination of the magnitude of the star and the loopgain.

// loop on gsmag and gain, index start from one
for (ii=1;ii<=numberof(gsmagv);ii++) {
  //for (jj=1;jj<=numberof(gainv);jj++) {
    for(kk=1;kk<=numberof(ittimev);kk++){
    wfs(1).gsmag=gsmagv(ii);
    //loop.gain=gainv(jj);
    loop.ittime=ittimev(kk);
    loop.niter = 500;
    aoinit,disp=1;
    aoloop,disp=1;
    go, all=1;
    // after_loop is now called automatically at last it of go()
    //after_loop;  // to wrap up the analysis and print out results
    strehlarray(ii,kk) = strehllp(0); // fill in result array
    // and display results as we go:
    window,4;
    fma;//First, if the current display list has changed, Yorick re-walks it, ensuring that your screen is up to date. Afterwards, fma clears the display list.
    for (ll=1;ll<=ii;ll++) {
        //x axis is the loop.gain
        //y axis is the strehl-ratio
      plg,strehlarray(ll,),ittimev,color=-ll-4;// plots a graph of Y versus X.
      limits, 0.0005, 0.01;
      range, 0.0, 0.7;//yaxis range
      //plt,swrite(format="gsmag=%d",gsmagv(ll)),0.011,ymax-yspace*(ll-1), \
        //justify="LT",tosys=1,color=-ll-4;
    }
    logxy,1,0;
    xytitles,"Loop Ittime",swrite(format="Strehl @ %.2fmicrons",(*target.lambda)(0));
    window,1;
   }
  //}
 }
