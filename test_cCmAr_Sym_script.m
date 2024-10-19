clc
clearvars

test_cCmAr_script   % oSec1 and oSec2

clc

%% cCmAr_Sym_y
% <<../CompositeSection_sol.svg>>

disp(["Testing class cCmAr_Sym_y";"==========================================="])
ind_vec=1:2;
oSec_Sym=cCmAr_Sym_y(A0_vec(ind_vec),y_hat0_vec(ind_vec),z_hat0_vec(ind_vec),Iy0_vec(ind_vec),Iz0_vec(ind_vec),Iyz0_vec(ind_vec));

A_err=oSec0.A-oSec_Sym.A %#ok<*NASGU,*NOPTS>
Qy_hat_err=oSec0.calc_Qy_hat-oSec_Sym.calc_Qy_hat
Qz_hat_err=oSec0.calc_Qz_hat-oSec_Sym.calc_Qz_hat
y_bar_err=oSec0.y_bar-oSec_Sym.y_bar
z_bar_err=oSec0.z_bar-oSec_Sym.z_bar
Iy_hat_err=oSec0.calc_Iy_hat-oSec_Sym.calc_Iy_hat
Iz_hat_err=oSec0.calc_Iz_hat-oSec_Sym.calc_Iz_hat
Iyz_hat_err=oSec0.calc_Iyz_hat-oSec_Sym.calc_Iyz_hat
Iy_err=oSec0.Iy-oSec_Sym.Iy
Iz_err=oSec0.Iz-oSec_Sym.Iz
Iyz_err=oSec0.Iyz-oSec_Sym.Iyz

%% Symmetric classes
% <<../DoubleSymm-sol.svg>>

cSym_CompositeArea_cvec={@(a,b,c,d,e,f) (cCmAr_Sym_y(a,b,c,d,e,f)),@(a,b,c,d,e,f) (cCmAr_Sym_z(a,b,c,d,e,f)),@(a,b,c,d,e,f) (cCmAr_Sym_yz_simple(a,b,c,d,e,f)),@(a,b,c,d,e,f) (cCmAr_Sym_yz(a,b,c,d,e,f)),@(a,b,c,d,e,f) (cCmAr_ASym_z(a,b,c,d,e,f))};
className_str_vec=["cCmAr_Sym_y","cCmAr_Sym_z","cCmAr_Sym_yz_simple","cCmAr_Sym_yz","cCmAr_ASym_z"];
indSym_cVec={1:4,            ... Y Sym
             [1,2,4,6,7],    ... Z Sym
             [1,2,4],        ... YZ Sym
             [1,2,4]         ... YZ Sym
             [1,2,4,6]};     % Z Anti Sym

for ii=1:length(indSym_cVec)-1
    disp(["Testing class "+className_str_vec(ii);"==========================================="])
    ind_vec=indSym_cVec{ii};
    oSec_Sym=cSym_CompositeArea_cvec{ii}(A_vec(ind_vec),y_hat_vec(ind_vec),z_hat_vec(ind_vec),Iy_vec(ind_vec),Iz_vec(ind_vec),Iyz_vec(ind_vec));
    
    A_err=oSec1.A-oSec_Sym.A %#ok<*NASGU,*NOPTS>
    Qy_hat_err=oSec1.calc_Qy_hat-oSec_Sym.calc_Qy_hat
    Qz_hat_err=oSec1.calc_Qz_hat-oSec_Sym.calc_Qz_hat
    y_bar_err=oSec1.y_bar-oSec_Sym.y_bar
    z_bar_err=oSec1.z_bar-oSec_Sym.z_bar
    Iy_hat_err=oSec1.calc_Iy_hat-oSec_Sym.calc_Iy_hat
    Iz_hat_err=oSec1.calc_Iz_hat-oSec_Sym.calc_Iz_hat
    Iyz_hat_err=oSec1.calc_Iyz_hat-oSec_Sym.calc_Iyz_hat
    Iy_err=oSec1.Iy-oSec_Sym.Iy
    Iz_err=oSec1.Iz-oSec_Sym.Iz
    Iyz_err=oSec1.Iyz-oSec_Sym.Iyz
end

%% Anti-Symmetric classes
% <<../AntiSymm.svg>>

ii=length(indSym_cVec);
disp(["Testing class "+className_str_vec(ii);"==========================================="])
ind_vec=indSym_cVec{ii};
oSec_A_Sym=cSym_CompositeArea_cvec{ii}(A_vec(ind_vec),y_hat_vec(ind_vec),z_hat_vec(ind_vec),Iy_vec(ind_vec),Iz_vec(ind_vec),Iyz_vec(ind_vec));

A_err=oSec2.A-oSec_A_Sym.A
Qy_hat_err=oSec2.calc_Qy_hat-oSec_A_Sym.calc_Qy_hat
Qz_hat_err=oSec2.calc_Qz_hat-oSec_A_Sym.calc_Qz_hat
y_bar_err=oSec2.y_bar-oSec_A_Sym.y_bar
z_bar_err=oSec2.z_bar-oSec_A_Sym.z_bar
Iy_hat_err=oSec2.calc_Iy_hat-oSec_A_Sym.calc_Iy_hat
Iz_hat_err=oSec2.calc_Iz_hat-oSec_A_Sym.calc_Iz_hat
Iyz_hat_err=oSec2.calc_Iyz_hat-oSec_A_Sym.calc_Iyz_hat
Iy_err=oSec2.Iy-oSec_A_Sym.Iy
Iz_err=oSec2.Iz-oSec_A_Sym.Iz
Iyz_err=oSec2.Iyz-oSec_A_Sym.Iyz
