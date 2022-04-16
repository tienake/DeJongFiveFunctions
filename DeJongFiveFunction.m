

%set up sampling points
samples =40;

%setup sampling integer
x1int = 0:1:samples;
x2int = 0:1:samples;


%f1
%remap
 x1f1=(-5.12)+((5.12-(-5.12))/(samples)).*(x1int);
 x2f1=(-5.12)+((5.12-(-5.12))/(samples)).*(x2int);
 %setup grid
[x1,x2] = meshgrid(x1f1,x2f1);
%DaJong's function 1
z1= x1.^2 + x2.^2;

%f2
%remap
x1f2=(-2.048)+((2.048-(-2.048))/(samples)).*(x1int);
x2f2=(-2.048)+((2.048-(-2.048))/(samples)).*(x2int);
%setup grid
[x1,x2] = meshgrid(x1f2,x2f2);
%DaJong's function 2
z2= 100*(x1.^2-x2).^2+(1-x1).^2;

%f3
%remap
 x1f3=(-5.12)+((5.12-(-5.12))/(samples)).*(x1int);
 x2f3=(-5.12)+((5.12-(-5.12))/(samples)).*(x2int);
 %setup grid
[x1,x2] = meshgrid(x1f3,x2f3);
%DaJong's function 3
z3= floor(x1)+floor(x2);

%f4
%remap
 x1f4=(-1.28)+((1.28-(-1.28))/(samples)).*(x1int);
 x2f4=(-1.28)+((1.28-(-1.28))/(samples)).*(x2int);
%setup grid
[x1,x2] = meshgrid(x1f4,x2f4);
%DaJong's function 4
z4= (1*x1.^4)+(2*x2.^4)+normpdf(0,1);

%f5
%remap
 x1f5=(-65.536)+((65.536-(-65.536))/(samples)).*(x1int);
 x2f5=(-65.536)+((65.536-(-65.536))/(samples)).*(x2int);
 %setup grid
[x1,x2] = meshgrid(x1f5,x2f5);
%DaJong's function 5
a=[-32 -16 0 16 32 ...
   -32 -16 0 16 32 ...
   -32 -16 0 16 32 ...
   -32 -16 0 16 32 ...
   -32 -16 0 16 32; ...
   -32 -32 -32 -32 -32 ...
   -16 -16 -16 -16 -16 ...
   0 0 0 0 0 ... 
   16 16 16 16 16 ...
   32 32 32 32 32 ...
   ];
%setup initial variable for cumulation
x1i = 0;
x2i = 0;
sum0  = 0;
for i=1:25    
x1i=(x1-a(1,i)).^6;
x2i=(x2-a(2,i)).^6;
sum0=sum0+1./(i+x1i+x2i);
end
z5= (0.002+sum0).^-1;



%Plotting

figure(1)
surf(x1,x2,z1);
set(gca, 'ZDir','reverse')


figure(2)
surf(x1,x2,z2);
set(gca, 'ZDir','reverse')

figure(3)
surf(x1,x2,z3);
set(gca, 'ZDir','reverse')

figure(4)
surf(x1,x2,z4);
set(gca, 'ZDir','reverse')


figure(5)
surf(x1,x2,z5);
set(gca, 'ZDir','reverse')


