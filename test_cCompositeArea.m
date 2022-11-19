clc
clear all %#ok<*CLALL>

% Problem 1.2-e
A_vec=[1450;2610;1450;4810;1450;2610;1450]*1e-6;
Iy_vec=[0.278;0.633;0.278;51.2;0.278;0.633;0.278]*1e-6;
Iz_vec=[0.799;15;0.799;2.8;0.799;15;0.799]*1e-6;
Iyz_1=-tan(2*(atan(.413)+pi/2))*(Iy_vec(1)-Iz_vec(1))/2;
Iyz_vec=[Iyz_1;0;-Iyz_1;0;-Iyz_1;0;Iyz_1];

y1=203e-3/2+27.4e-3;
z1=254e-3/2+7.7e-3-14.7e-3;
z2=254e-3/2+7.7e-3-14.1e-3;
y_hat_vec=[y1;0;-y1;0;y1;0;-y1];
z_hat_vec=[z1;z2;z1;0;-z1;-z2;-z1];

oSec1=cCompositeArea(A_vec,Iy_vec,Iz_vec,Iyz_vec,y_hat_vec,z_hat_vec) %#ok<*NOPTS>

A=oSec1.A
y_bar=oSec1.y_bar
z_bar=oSec1.z_bar
Iy=oSec1.Iy
Iz=oSec1.Iz
Iyz=oSec1.Iyz