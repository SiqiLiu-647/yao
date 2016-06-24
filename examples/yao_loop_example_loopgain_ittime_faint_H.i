require,"yao.i";
write,"CREATING PHASE SCREENS";
if (!open(Y_USER+"data/screen1.fits","r",1)) {
  create_phase_screens,1024,256,prefix=YUSER+"data/screen";
 }

window,1,wait=1;

// read out parfile
aoread,"sh12x12.par";
target.lambda    = &([1.65]);

// define vector on which we want to loop and final strehl array
gsmagv = [16.0];
wfs(1).gsmag=gsmagv(1);

gainv  = [0.2,0.25,0.3,0.35,0.4,0.45];
ittimev = [3e-3,4e-3,5e-3,6e-3];//added 5ms and 10ms for the 16 mag star
strehlarray = array(0.,[2,numberof(ittimev),numberof(gainv)]);

loop.niter=1000;
for (ii=1;ii<=numberof(ittimev);ii++) {
  for (jj=1;jj<=numberof(gainv);jj++) {
    loop.ittime = ittimev(ii);
    loop.gain=gainv(jj);
    //print, wfs(1).gsmag;
    print, loop.gain;
    aoinit,disp=1,clean=1;
    aoloop,disp=10;
    go, all=1;
    strehlarray(ii,jj) = strehllp(0); // fill in result array
  }
 }

 //---------------------Plotting--------------------------------
window,1;
fma;
for (ll=1;ll<=numberof(ittimev);ll++) {
  plg,strehlarray(ll,),gainv,color=-ll-4;
  plmk,strehlarray(ll,),gainv,color=-ll-4,marker=ll;
}
limits, 0.08, 0.48;
//range,0.0,0.6; //for mag 11 star
range,0.0,0.04; f//for 16 mag star
//range, 0.50, 0.70; //for 2.2 microns
//range, 0.3, 0.55; //for 1.65 microns, SHWFS
//logxy,0,0;
xytitles,"Loop Gain",swrite(format="Strehl @ %.2fmicrons",(*target.lambda)(0));
pltitle, "Strehl Ratio in SHWFS for mag 16 star";
window,0;
