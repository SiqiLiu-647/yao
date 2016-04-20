require,"yao.i";
write,"CREATING PHASE SCREENS";
if (!open(Y_USER+"data/screen1.fits","r",1)) {
  create_phase_screens,1024,256,prefix=YUSER+"data/screen";
 }

window,33,wait=1;

// read out parfile
aoread,"sh12x12.par";

// define vector on which we want to loop and final strehl array
gsmagv          = [1.0,6.0,9.0,14.0,15.0];
targetlambdav   = &([1.65]);// here is some problem dealing with this array.
strehlarray     = array(float,[2,numberof(gsmagv),numberof(targetlambdav)]);

loop.niter=1000;
for (jj=1; jj <= numberof(gsmagv); jj++) {
  wfs(1).gsmag = gsmagv(jj);
  print,targetlambdav(1);
  target.lambda = targetlambdav(1);
  aoinit,disp=1,clean=1;
  aoloop,disp=10;
  go, all=1;
  strehlarray(jj) = strehllp(0); // fill in result array
  window,33;
  fma;
  for (ll=1;ll<=jj;ll++) {
    plg,strehlarray(jj),gsmagv,color=-ll-4;
    limits, 0.5, 15.0;//x-axis
    range, 0.0, 0.7;//y-axis
  }
  logxy,0,0;
  xytitles,"Magnitude","Strehl Ratio";//swrite(format="Strehl @ %.2fmicrons",(*target.lambda)(0));
  window,0;
 }

targetlambdav   = &([2.2]);// here is some problem dealing with this array.
strehlarray     = array(float,[1,numberof(gsmagv)]);

loop.niter=1000;
for (jj=1; jj <= numberof(gsmagv); jj++) {
  wfs(1).gsmag = gsmagv(jj);
  print,targetlambdav(ii);
  target.lambda = targetlambdav(ii);
  aoinit,disp=1,clean=1;
  aoloop,disp=10;
  go, all=1;
  strehlarray(ii,jj) = strehllp(0); // fill in result array
  window,33;
  fma;
  for (ll=1;ll<=ii;ll++) {
    plg,strehlarray(ll,),gsmagv,color=-ll-4;
    limits, 0.5, 15.0;//x-axis
    range, 0.0, 0.7;//y-axis
  }
  logxy,0,0;
  xytitles,"Magnitude","Strehl Ratio";//swrite(format="Strehl @ %.2fmicrons",(*target.lambda)(0));
  window,0;
 }
