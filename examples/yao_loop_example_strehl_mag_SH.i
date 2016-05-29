require,"yao.i";
write,"CREATING PHASE SCREENS";
if (!open(Y_USER+"data/screen1.fits","r",1)) {
  create_phase_screens,1024,256,prefix=YUSER+"data/screen";
 }

window,1,wait=1;

// read out parfile
aoread,"sh12x12.par";

// define vector on which we want to loop and final strehl array
gsmagv          = [1.0,6.0,9.0,14.0,15.0];
targetlambdav   = &([1.65]);// here is some problem dealing with this array.
strehlarray     = array(float,[2,numberof(targetlambdav),numberof(gsmagv)]);

target.lambda = targetlambdav(1);
loop.niter=1000;
for (jj=1; jj <= numberof(gsmagv); jj++) {
  wfs(1).gsmag = gsmagv(jj);
  print, wfs(1).gsmag;
  aoinit,disp=1,clean=1;
  aoloop,disp=10;
  go, all=1;
  strehlarray(1,jj) = strehllp(0); // fill in result array
 }
window,1;
fma;
plg,strehlarray(ll,),gsmagv;
limits, 0.5, 15.0;//x-axis
range, 0.0, 0.7;//y-axis
xytitles,"Magnitude","Strehl Ratio";//swrite(format="Strehl @ %.2fmicrons",(*target.lambda)(0));
window,0;
