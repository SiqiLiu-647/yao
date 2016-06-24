require,"yao.i";
write,"CREATING PHASE SCREENS";
if (!open(Y_USER+"data/screen1.fits","r",1)) {
  create_phase_screens,1024,256,prefix=YUSER+"data/screen";
 }

window,1,wait=1;

//------------------------------------SH------------------------------------
aoread,"sh12x12.par";
sim.svipc=0;// no paralization

// define vector on which we want to loop and final strehl array
gsmagv          = [1.0,6.0,9.0,10.0, 11.0, 12.0, 13.0,14.0,15.0,16.0];
targetlambdav   = &([2.2]);//J:1.25um; H:1.65um; K:2.2um
framedelayv     = [1, 2,3,4];
strehlarray     = array(float,[2,numberof(framedelayv),numberof(gsmagv)]);
loop.gain	    = 0.2;
loop.niter      = 1000;
loop.ittime     = 1e-3;

target.lambda = targetlambdav(1);
for (ii=1; ii <= numberof(gsmagv);ii++) {
for (jj=1; jj<= numberof(framedelayv);jj++){
  loop.framedelay    = framedelayv(jj);
  wfs(1).gsmag = gsmagv(ii);
  aoinit,disp=1,clean=1;
  aoloop,disp=10;
  go, all=1;
  strehlarray(jj,ii) = strehllp(0); // fill in result array
}
}
//------------------Plotting------------------------------------------
window,1;
fma;
for (ii=1; ii<= numberof(framedelayv); ii++){
plg,strehlarray(ii,),gsmagv,color=-ii-4;
plmk,strehlarray(ii,),gsmagv,color=-ii-4,marker=ii;
}
limits, 0.5, 16.5;//x-axis
range, 0.0, 0.75;//y-axis

logxy,0,0;
xytitles,"Magnitude",swrite(format="Strehl @ %.2fmicrons",(*target.lambda)(0));
pltitle, "SHWFS in K band with different framedelays";
