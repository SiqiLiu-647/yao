require,"yao.i";
write,"CREATING PHASE SCREENS";
if (!open(Y_USER+"data/screen1.fits","r",1)) {
  create_phase_screens,1024,256,prefix=YUSER+"data/screen";
 }

window,1,wait=1;

// read out parfile
aoread,"sh16x16_pyr.par";
target.lambda    = &([1.25]);

// define vector on which we want to loop and final strehl array
gsmagv = [6.0];
wfs(1).gsmag=gsmagv(1);

ittimev = [1e-3, 1.5e-3,2e-3];
gainv  = [0.2, 0.3,0.4,0.5,0.55,0.6,0.7];
strehlarray = array(0.,[2,numberof(ittimev),numberof(gainv)]);

loop.niter=1000;
for (ii=1;ii<=numberof(ittimev);ii++) {
  for (jj=1;jj<=numberof(gainv);jj++) {
    loop.ittime = ittimev(ii);
    loop.gain=gainv(jj);
    print, loop.gain;
    aoinit,disp=1,clean=1;
    aoloop,disp=10;
    go, all=1;
    strehlarray(ii,jj) = strehllp(0); // fill in result array
  }
 }

//----------------------------Plotting-------------------------------
window,1;
fma;
for (ll=1;ll<=numberof(ittimev);ll++) {
  plg,strehlarray(ll,),gainv,color=-ll-4;
  plmk,strehlarray(ll,),gainv,color=-ll-4,marker=1;
}
limits, 0.25, 0.72;
//range,0.0,0.05;//for mag 16 star
range, 0.10, 1.0; //for 2.2 microns
//range, 0.1, 0.75; //for 1.65 microns.
//logxy,0,0;
xytitles,"Loop Gain",swrite(format="Strehl @ %.2fmicrons",(*target.lambda)(0));
pltitle, "Strehl Ratio in PYWFS for mag 6 star 16x16";
window,0;