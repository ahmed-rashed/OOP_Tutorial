clc
clearvars

% Problem 1.2-e
test_cCmAr
clc

cSym_CompositeArea_cvec={@(a,b,c,d,e) (cCmAr_Sym_y(a,b,c,d,e)),@(a,b,c,d,e) (cCmAr_Sym_z(a,b,c,d,e)),@(a,b,c,d,e) (cCmAr_Sym_yz_simple(a,b,c,d,e)),@(a,b,c,d,e) (cCmAr_Sym_yz(a,b,c,d,e)),@(a,b,c,d,e,f) (cCmAr_ASym_z(a,b,c,d,e,f))};
className_str_vec=["cCmAr_Sym_y","cCmAr_Sym_z","cCmAr_Sym_yz_simple","cCmAr_Sym_yz","cCmAr_ASym_z"];
indSym_cVec={1:4,            ... Y Sym
             [1,2,4,6,5],    ... Z Sym
             [1,2,4],        ... YZ Sym
             [1,2,4]         ... YZ Sym
             [1,2,4,6]};     % Z Anti Sym

% Symmetric classes
for ii=1:length(indSym_cVec)-1
    disp(["Testing class "+className_str_vec(ii);"==========================================="])
    ind_vec=indSym_cVec{ii};
    A_sym_vec=A_vec(ind_vec);
    Iy_sym_vec=Iy_vec(ind_vec);
    Iz_sym_vec=Iz_vec(ind_vec);
    y_sym_hat_vec=y_hat_vec(ind_vec);
    z_sym_hat_vec=z_hat_vec(ind_vec);
    oSec_Sy=cSym_CompositeArea_cvec{ii}(A_sym_vec,Iy_sym_vec,Iz_sym_vec,y_sym_hat_vec,z_sym_hat_vec);
    
    A_err=oSec1.A-oSec_Sy.A %#ok<*NOPTS>
    Qy_hat_err=oSec1.calc_Qy_hat-oSec_Sy.calc_Qy_hat
    Qz_hat_err=oSec1.calc_Qz_hat-oSec_Sy.calc_Qz_hat
    y_bar_err=oSec1.y_bar-oSec_Sy.y_bar
    z_bar_err=oSec1.z_bar-oSec_Sy.z_bar
    Iy_hat_err=oSec1.calc_Iy_hat-oSec_Sy.calc_Iy_hat
    Iz_hat_err=oSec1.calc_Iz_hat-oSec_Sy.calc_Iz_hat
    Iyz_hat_err=oSec1.calc_Iyz_hat-oSec_Sy.calc_Iyz_hat
    Iy_err=oSec1.Iy-oSec_Sy.Iy
    Iz_err=oSec1.Iz-oSec_Sy.Iz
    Iyz_err=oSec1.Iyz-oSec_Sy.Iyz
end

% Anti-Symmetric classes
for ii=length(indSym_cVec)
    disp(["Testing class "+className_str_vec(ii);"==========================================="])
    ind_vec=indSym_cVec{ii};
    A_A_sym_vec=A_vec(ind_vec);
    Iy_A_sym_vec=Iy_vec(ind_vec);
    Iz_A_sym_vec=Iz_vec(ind_vec);
    Iyz_A_sym_vec=Iyz_vec(ind_vec);
    y_A_sym_hat_vec=y_hat_vec(ind_vec);
    z_A_sym_hat_vec=z_hat_vec(ind_vec);
    oSec_A_Sy=cSym_CompositeArea_cvec{ii}(A_A_sym_vec,Iy_A_sym_vec,Iz_A_sym_vec,Iyz_A_sym_vec,y_A_sym_hat_vec,z_A_sym_hat_vec);
    
    A_err=oSec2.A-oSec_A_Sy.A %#ok<*NOPTS>
    Qy_hat_err=oSec2.calc_Qy_hat-oSec_A_Sy.calc_Qy_hat
    Qz_hat_err=oSec2.calc_Qz_hat-oSec_A_Sy.calc_Qz_hat
    y_bar_err=oSec2.y_bar-oSec_A_Sy.y_bar
    z_bar_err=oSec2.z_bar-oSec_A_Sy.z_bar
    Iy_hat_err=oSec2.calc_Iy_hat-oSec_A_Sy.calc_Iy_hat
    Iz_hat_err=oSec2.calc_Iz_hat-oSec_A_Sy.calc_Iz_hat
    Iyz_hat_err=oSec2.calc_Iyz_hat-oSec_A_Sy.calc_Iyz_hat
    Iy_err=oSec2.Iy-oSec_A_Sy.Iy
    Iz_err=oSec2.Iz-oSec_A_Sy.Iz
    Iyz_err=oSec2.Iyz-oSec_A_Sy.Iyz
end