//Strehl ratio versus the magnitude
require,"yao.i";
write,"CREATING PHASE SCREENS";
if (!open(Y_USER+"data/screen1.fits","r",1)) {
  create_phase_screens,1024,256,prefix=YUSER+"data/screen";
 }

window,4,wait=1;

//-------------------------PYR-----------------------------------------
aoread,"sh12x12_pyr_24.par";
sim.svipc=0;

gsmagv = [1.0,6.0,8.0,10.0,12.0,13.0,14.0,15.0,16.0];
gainv = [0.6];
targetlambdav = &([1.6,2.2]);
strehlarray = array(0.,[3,2,numberof(gainv),numberof(gsmagv)]);// 3 is the dimension of the arrays

loop.niter = 1000;
loop.ittime = 1e-3;
wfs(1).pyr_mod_npts=16;
wfs(1).pyr_mod_ampl=0.1;
target.lambda = targetlambdav(1);

for (ii=1;ii<=numberof(gainv);ii++) {
  for (jj=1;jj<=numberof(gsmagv);jj++) {
    wfs(1).gsmag=gsmagv(jj);
    loop.gain=gainv(ii);
    aoinit,disp=1,clean=1;
    aoloop,disp=10;
    go, all=1;
    strehlarray(1,ii,jj) = strehllp(0); // fill in result array
    print, strehllp(0);
    print, strehllp(1);
    print, numberof(strehllp);
	}
}
//---------------------------SH-----------------------------------------------
aoread,"sh12x12.par";

loop.niter = 1000;
loop.ittime = 1e-3;
target.lambda = targetlambdav(1);
gainv = [0.3];

for (ii=1;ii<=numberof(gainv);ii++) {
  for (jj=1;jj<=numberof(gsmagv);jj++) {
    wfs(1).gsmag=gsmagv(jj);
    loop.gain=gainv(ii);
    aoinit,disp=1,clean=1;
    aoloop,disp=10;
    go, all=1;
    strehlarray(2,ii,jj) = strehllp(0); // fill in result array
    print, strehllp(0);
    print, strehllp(1);
    print, numberof(strehllp);
  }
 }
 
 //---------------------Plotting------------------------------------------------
 window,4;
 fma;
 for (ll=1;ll<=numberof(gainv);ll++) {
   plg,strehlarray(1,ll,),gsmagv,color=-ll-4;
   plmk,strehlarray(1,ll,),gsmagv,color=-ll-4,marker=1;
   plg,strehlarray(2,ll,),gsmagv,color=-ll-4;
   plmk,strehlarray(2,ll,),gsmagv,color=-ll-4,marker=3;
   print,gsmagv
   print,strehlarray(1,ll,)
   print,strehlarray(2,ll,)
   limits, 0.5, 16.5;
   range, 0.0, 0.8;
 }
 window,0;
 
 logxy,0,0;
 xytitles,"Guide Star Magnitude","Strehl Ratio";
 pltitle, "Strehl Ratio SH/PYWFS in 1.6 microns with Star magnitude";
