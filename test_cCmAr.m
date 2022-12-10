clc
clearvars

% All properties are in mm

% Problem 1.2-e
A1=1450;Iy1=0.278;Iz1=0.799;Iyz1=-tan(2*(atan(.413)+pi/2))*(Iy1-Iz1)/2;y1=(203/2+27.4);z1=(254/2+7.7-14.7);
A2=2610;Iy2=0.633;Iz2=15;Iyz2=0;y2=0;z2=254/2+7.7-14.1;
A4=4810;Iy4=51.2;Iz4=2.8;Iyz4=0;y4=0;z4=0;

A_vec=[A1,A2,A1,A4,A1,A2,A1];
Iy_vec=[Iy1,Iy2,Iy1,Iy4,Iy1,Iy2,Iy1];
Iz_vec=[Iz1,Iz2,Iz1,Iz4,Iz1,Iz2,Iz1];
Iyz_vec=[Iyz1,Iyz2,-Iyz1,Iyz4,-Iyz1,-Iyz2,Iyz1];
y_hat_vec=[y1,y2,-y1,y4,y1,-y2,-y1];
z_hat_vec=[z1,z2,z1,z4,-z1,-z2,-z1];

oSec1=cCmAr(A_vec,Iy_vec,Iz_vec,Iyz_vec,y_hat_vec,z_hat_vec);

A=oSec1.A %#ok<*NASGU,*NOPTS> 
y_bar=oSec1.y_bar
z_bar=oSec1.z_bar
Iy=oSec1.Iy
Iz=oSec1.Iz
Iyz=oSec1.Iyz


% Problem 1.2-f
% Dimensions are in mm
ind_vec=[1,2,4,6,7];
A_vec1=A_vec(ind_vec);
Iy_vec1=Iy_vec(ind_vec);
Iz_vec1=Iz_vec(ind_vec);
Iyz_vec1=Iyz_vec(ind_vec);
y_hat_vec1=y_hat_vec(ind_vec);
z_hat_vec1=z_hat_vec(ind_vec);
oSec2=cCmAr(A_vec1,Iy_vec1,Iz_vec1,Iyz_vec1,y_hat_vec1,z_hat_vec1);

A=oSec2.A %#ok<*NOPTS> 
y_bar=oSec2.y_bar
z_bar=oSec2.z_bar
Iy=oSec2.Iy
Iz=oSec2.Iz
Iyz=oSec2.Iyz
