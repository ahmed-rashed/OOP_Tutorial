clearvars

% All properties are in mm

%% Example 5 (double symmetric cross-section)
A1=1450;Iy1=0.278;Iz1=0.799;Iyz1=-tan(2*(atan(.413)+pi/2))*(Iy1-Iz1)/2;y1=(203/2+27.4);z1=(254/2+7.7-14.7);
A2=2610;Iy2=0.633;Iz2=15;Iyz2=0;y2=0;z2=254/2+7.7-14.1;
A4=4810;Iy4=51.2;Iz4=2.8;Iyz4=0;y4=0;z4=0;

%%
% <<../CompositeSection_sol.svg>>

y22=0;z22=254/2+7.7-14.1;
A5=4740;Iy5=37.9;Iz5=1.39;Iyz5=0;y5=-(73.4/2-15.7);z5=0;

A0_vec=[A2,A5,A2];
Iy0_vec=[Iy2,Iy5,Iy2];
Iz0_vec=[Iz2,Iz5,Iz2];
Iyz0_vec=[Iyz2,Iyz5,-Iyz2];
y_hat0_vec=[y22,y5,y22];
z_hat0_vec=[z22,z5,-z22];

oSec0=cCmAr(A0_vec,y_hat0_vec,z_hat0_vec,Iy0_vec,Iz0_vec,Iyz0_vec) %#ok<*NOPTS>

%%
% <<../DoubleSymm-sol.svg>>

A_vec=[A1,A2,A1,A4,A1,A2,A1];
Iy_vec=[Iy1,Iy2,Iy1,Iy4,Iy1,Iy2,Iy1];
Iz_vec=[Iz1,Iz2,Iz1,Iz4,Iz1,Iz2,Iz1];
Iyz_vec=[Iyz1,Iyz2,-Iyz1,Iyz4,Iyz1,-Iyz2,-Iyz1];
y_hat_vec=[y1,y2,-y1,y4,-y1,y2,y1];
z_hat_vec=[z1,z2,z1,z4,-z1,-z2,-z1];

oSec1=cCmAr(A_vec,y_hat_vec,z_hat_vec,Iy_vec,Iz_vec,Iyz_vec) %#ok<*NOPTS>

%%
% <<../AntiSymm.svg>>

ind_vec=[1,2,4,5,6];
A_vec1=A_vec(ind_vec);
Iy_vec1=Iy_vec(ind_vec);
Iz_vec1=Iz_vec(ind_vec);
Iyz_vec1=Iyz_vec(ind_vec);
y_hat_vec1=y_hat_vec(ind_vec);
z_hat_vec1=z_hat_vec(ind_vec);
oSec2=cCmAr(A_vec1,y_hat_vec1,z_hat_vec1,Iy_vec1,Iz_vec1,Iyz_vec1)