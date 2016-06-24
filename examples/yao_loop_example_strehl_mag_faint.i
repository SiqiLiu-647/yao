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
gsmagv          = [10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0];
targetlambdav   = &([2.2]);//J:1.25um; H:1.65um; K:2.2um
strehlarray     = array(float,[2,2,numberof(gsmagv)]);
loop.niter      = 1000;

target.lambda = targetlambdav(1);

for (ii=1;ii<=3;ii++){
	loop.gain       = 0.2;
	loop.ittime     = 1e-3;
	wfs(1).gsmag = gsmagv(ii);
	aoinit,disp=1,clean=1;
	aoloop,disp=10;
	go, all=1;
	strehlarray(1,ii) = strehllp(0); // fill in result array
}

loop.gain       = 0.2;
loop.ittime     = 1e-3;
wfs(1).gsmag = gsmagv(4);
aoinit,disp=1,clean=1;
aoloop,disp=10;
go, all=1;
strehlarray(1,4) = strehllp(0); // fill in result array

loop.gain       = 0.25;
loop.ittime     = 2e-3;
wfs(1).gsmag = gsmagv(5);
aoinit,disp=1,clean=1;
aoloop,disp=10;
go, all=1;
strehlarray(1,5) = strehllp(0); // fill in result array

loop.gain       = 0.25;
loop.ittime     = 3e-3;
wfs(1).gsmag = gsmagv(6);
aoinit,disp=1,clean=1;
aoloop,disp=10;
go, all=1;
strehlarray(1,6) = strehllp(0); // fill in result array

loop.gain       = 0.25;
loop.ittime     = 4e-3;
wfs(1).gsmag = gsmagv(7);
aoinit,disp=1,clean=1;
aoloop,disp=10;
go, all=1;
strehlarray(1,7) = strehllp(0); // fill in result array

//-------------------------PYR-----------------------------------------
aoread,"sh12x12_pyr_24.par";
sim.svipc=0;

wfs(1).pyr_mod_npts = 36;
wfs(1).pyr_mod_ampl = 0.1;
target.lambda       = targetlambdav(1);

for (ii=1;ii<=3;ii++) {
  loop.gain           = 0.6;
  loop.ittime         = 1e-3;
  wfs(1).gsmag=gsmagv(ii);
  aoinit,disp=1,clean=1;
  aoloop,disp=10;
  go, all=1;
  strehlarray(2,ii) = strehllp(0); // fill in result array
}

loop.ittime=2e-3;
loop.gain=0.6;
wfs(1).gsmag=gsmagv(4);
aoinit,disp=1,clean=1;
aoloop,disp=10
go, all=1;
strehlarray(2,4)=strehllp(0);

loop.gain=0.6
loop.ittime=2e-3;
wfs(1).gsmag=gsmagv(5);
aoinit,disp=1,clean=1;
aoloop,disp=10
go, all=1;
strehlarray(2,5)=strehllp(0);

loop.gain=0.6
loop.ittime=5e-3;
wfs(1).gsmag=gsmagv(6);
aoinit,disp=1,clean=1;
aoloop,disp=10
go, all=1;
strehlarray(2,6)=strehllp(0);


loop.gain=0.7
loop.ittime=5e-3;
wfs(1).gsmag=gsmagv(7);
aoinit,disp=1,clean=1;
aoloop,disp=10
go, all=1;
strehlarray(2,7)=strehllp(0);


//------------------Plotting------------------------------------------
window,1;
fma;

plg,strehlarray(1,),gsmagv,color=-5;
plmk,strehlarray(1,),gsmagv,color=-5,marker=1;
plg,strehlarray(2,),gsmagv,color=-7;
plmk,strehlarray(2,),gsmagv,color=-7,marker=3;
limits, 9.5, 16.5;//x-axis
range, 0.0, 0.75;//y-axis

logxy,0,0;
xytitles,"Magnitude",swrite(format="Strehl @ %.2fmicrons",(*target.lambda)(0));
pltitle, "Strehl Ratio with the faint objects in J band";
