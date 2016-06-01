require,"yao.i";
write,"CREATING PHASE SCREENS";
if (!open(Y_USER+"data/screen1.fits","r",1)) {
  create_phase_screens,1024,256,prefix=YUSER+"data/screen";
 }

window,1,wait=1;

// read out parfile
aoread,"sh12x12_pyr_24.par";

// define vector on which we want to loop and final strehl array
modulation_ampv = [0.05,0.1,0.2,0.3,0.4,0.5];
modulation_nptsv  = [4,12,16,24,28,32,36];
strehlarray = array(0.,[2,numberof(modulation_nptsv),numberof(modulation_ampv)]);

loop.gain=0.5;
loop.ittime=1e-3;
loop.niter=1000;
target.lambda    = &([1.65]);

for (ii=1;ii<=numberof(modulation_nptsv);ii++) {
  for (jj=1;jj<=numberof(modulation_ampv);jj++) {
    wfs(1).pyr_mod_ampl=modulation_ampv(jj);
    wfs(1).pyr_mod_npts=modulation_nptsv(ii);
    print, wfs(1).pyr_mod_ampl;
    print, wfs(1).pyr_mod_npts;
    aoinit, disp=1,clean=1;
    aoloop, disp=10;
    go, all=1;
    strehlarray(ii,jj) = strehllp(0); // fill in result array
  }
 }

window,1;//switch to window n
fma;//frame advance-next plot command will clear picture
for (ll=1;ll<=numberof(modulation_nptsv);ll++) {
  plg,strehlarray(ll,),modulation_ampv,color=-ll-4,legend="Modulation amplitude";//plots 1d array
  plmk,strehlarray(ll,),modulation_ampv,color=-ll-4,marker=1;
  limits, 0.0, 0.55;//x limits
  range, 0.0, 0.3;//y limits for 1.65 microns
  //range, 0.1,0.8;//y limits for 2.2 microns
} 
logxy,0,0;
xytitles,"Modulation Amplitude",swrite(format="Strehl @ %.2fmicrons",(*target.lambda)(0));
pltitle, "Pyramid WFS for 24 pixels setup"
window,0;