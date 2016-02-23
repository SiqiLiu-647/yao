require,"yao.i";
write,"CREATING PHASE SCREENS";
if (!open(Y_USER+"data/screen1.fits","r",1)) {
  create_phase_screens,1024,256,prefix=YUSER+"data/screen";
 }

window,4,wait=1;

// read out parfile
aoread,"sh12x12.par";
atm.dr0at05mic = 40; // be more gentle

// define vector on which we want to loop and final strehl array
// we want to estimate performance for 3 values of the guide star 
// magnitude and 4 values of the loop gain (for instance)
gsmagv = [6,9,12,20];//star magnitude vector
gainv  = [0.01,0.1,0.5,1.0];//loop.gain magnitude vector
ittimev = [1e-3, 2e-3, 5e-3];
strehlarray = array(0.,[2,numberof(gsmagv),numberof(gainv)];//,numberof(ittimev)]);//a combination of the magnitude of the star and the loopgain.

// loop on gsmag and gain, index start from one
for (ii=1;ii<=numberof(gsmagv);ii++) {
  for (jj=1;jj<=numberof(gainv);jj++) {
      //for(kk=1;kk<numberof(ittimev);kk++){
    wfs(1).gsmag=gsmagv(ii);
    loop.gain=gainv(jj);
   // loop.ittime=ittimev(kk);
    // it's safer, but not always necessary, to call again
    // aoinit (here for gsmag). some parameters do not need it.
    aoinit,disp=1;
    aoloop,disp=1;
    go, all=1;
    // after_loop is now called automatically at last it of go()
    //after_loop;  // to wrap up the analysis and print out results
    strehlarray(ii,jj) = strehllp(0); // fill in result array
    // and display results as we go:
    window,4;
    fma;//First, if the current display list has changed, Yorick re-walks it, ensuring that your screen is up to date. Afterwards, fma clears the display list.
    for (ll=1;ll<=ii;ll++) {
        //x axis is the loop.gain
        //y axis is the strehl-ratio
      plg,strehlarray(ll,),gainv,color=-ll-4;// plots a graph of Y versus X.
      //plf,strehlarray(ll,),gainv,symbol=4,size=0.6,color=-ll-4;
      ylims=limits()(3:4);
      ymax=ylims(2);
      yspace=(ylims(2)-ylims(1))/15.;
      plt,swrite(format="gsmag=%d",gsmagv(ll)),0.011,ymax-yspace*(ll-1), \
        justify="LT",tosys=1,color=-ll-4;
      //plt,swrite(format="loop.ittime=%d",ittme(ll)),0.011,ymax-yspace*(ll-1), \
        //justify="RT",tosys=1,color=-ll-4;
    }
    logxy,1,0;
    xytitles,"Loop Gain",swrite(format="Strehl @ %.2fmicrons",(*target.lambda)(0));
    window,0;
     // }
  }
 }
